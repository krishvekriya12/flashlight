part of 'overlay_permission.dart';

final class OverlayPermissionProvider extends BaseProvider with WidgetsBindingObserver {
  OverlayPermissionProvider({required super.context});

  static final MethodChannel _settingsChannel = MethodChannel('flashlight/settings');

  bool _settingsOpened = false;

  Future<void> requestPermissions() async {
    WidgetsBinding.instance.addObserver(this);
    _settingsOpened = true;
    try {
      await _settingsChannel.invokeMethod('openOverlaySettings');
      await _settingsChannel.invokeMethod('showOverlayGuide');
    } catch (e) {
      debugPrint('Overlay permission request error: $e');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_settingsOpened) return;

    if (state == AppLifecycleState.resumed) {
      _settingsOpened = false;

      _handleSettingsReturn();
    }
  }

  Future<void> _handleSettingsReturn() async {
    if (!context.mounted) return;
    context.navigator.pushNamedAndRemoveUntil(DashboardScreen.routeName, (route) => false);
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
