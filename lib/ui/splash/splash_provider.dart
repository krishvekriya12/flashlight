part of 'splash.dart';

final class SplashProvider extends BaseProvider {
  SplashProvider({required super.context});

  final MethodChannel _settingsChannel = const MethodChannel('flashlight/settings');

  bool isLoading = true;
  String appVersion = '1.0.0';

  @override
  void initState() {
    super.initState();
    _loadAppInfo();
    navigate();
  }

  Future<void> _loadAppInfo() async {
    try {
      final info = await PackageInfo.fromPlatform();
      appVersion = info.version;
      notifyListeners();
    } catch (_) {}
  }

  Future<bool> hasOverlayPermission() async {
    final result = await _settingsChannel.invokeMethod<bool>('hasOverlayPermission');
    debugPrint('Native overlay permission: $result');
    return result ?? false;
  }

  Future<void> navigate() async {
    await Future.delayed(const Duration(milliseconds: 2400));
    isLoading = false;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 300));

    if (!Preference().languageSelected) {
      if (!context.mounted) return;
      context.navigator.pushNamedAndRemoveUntil(LanguageSelectionScreen.routeName, (route) => false);
      return;
    }

    if (!context.mounted) return;
    context.navigator.pushNamedAndRemoveUntil(DashboardScreen.routeName, (route) => false);
  }
}
