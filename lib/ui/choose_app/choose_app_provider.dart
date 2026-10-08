part of 'choose_app.dart';

final class ChooseAppProvider extends BaseProvider {
  ChooseAppProvider({
    required super.context,
  }) {
    loadApps();
  }

  static final MethodChannel _settingsChannel =
  MethodChannel('flashlight/settings');

  final List<AppInfo> _apps = <AppInfo>[];

  Set<String> _selectedPackages = <String>{};

  bool isLoading = true;

  List<AppInfo> get apps {
    final selected = <AppInfo>[];
    final unselected = <AppInfo>[];

    for (final app in _apps) {
      if (_selectedPackages.contains(app.packageName)) {
        selected.add(app);
      } else {
        unselected.add(app);
      }
    }

    return [
      ...selected,
      ...unselected,
    ];
  }

  bool get allSelected {
    return _apps.isNotEmpty &&
        _selectedPackages.length == _apps.length;
  }

  bool isSelected(String packageName) {
    return _selectedPackages.contains(packageName);
  }

  Future<void> loadApps() async {
    try {
      isLoading = true;
      notifyListeners();

      final selected =
      await _settingsChannel.invokeMethod<List<dynamic>>(
        'getSelectedNotificationApps',
      );

      _selectedPackages = (selected ?? <dynamic>[])
          .map((packageName) => packageName.toString())
          .toSet();

      final installedApps =
      await InstalledApps.getInstalledApps(
        excludeSystemApps: true,
        excludeNonLaunchableApps: true,
        withIcon: true,
      );

      _apps
        ..clear()
        ..addAll(installedApps);

      final installedPackages = _apps
          .map((app) => app.packageName)
          .toSet();

      _selectedPackages =
          _selectedPackages.intersection(installedPackages);
    } catch (e) {
      debugPrint('LOAD APPS ERROR: $e');
    } finally {
      isLoading = false;
      if (context.mounted) notifyListeners();
    }
  }

  Future<void> toggleApp(String packageName) async {
    // Change UI state FIRST.
    if (_selectedPackages.contains(packageName)) {
      _selectedPackages.remove(packageName);
    } else {
      _selectedPackages.add(packageName);
    }

    // Instant UI update.
    notifyListeners();

    // Save AFTER UI update.
    try {
      await _settingsChannel.invokeMethod(
        'setSelectedNotificationApps',
        {
          'packages': _selectedPackages.toList(),
        },
      );
    } catch (e) {
      debugPrint('SAVE APP ERROR: $e');
    }
  }

  Future<void> toggleSelectAll() async {
    // Change UI state FIRST.
    if (allSelected) {
      _selectedPackages.clear();
    } else {
      _selectedPackages = _apps
          .map((app) => app.packageName)
          .toSet();
    }

    // Instant UI update.
    notifyListeners();

    // Save AFTER UI update.
    try {
      await _settingsChannel.invokeMethod(
        'setSelectedNotificationApps',
        {
          'packages': _selectedPackages.toList(),
        },
      );
    } catch (e) {
      debugPrint('SAVE ALL APPS ERROR: $e');
    }
  }
}
