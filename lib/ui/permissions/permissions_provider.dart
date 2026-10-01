part of 'permissions.dart';

final class PermissionsProvider extends BaseProvider with WidgetsBindingObserver {
  PermissionsProvider({required super.context});

  bool _settingsOpened = false;

  Future<void> requestPermissions() async {
    final notificationStatus = await Permission.notification.request();
    final phoneStatus = await Permission.phone.request();
    final overlayStatus = await Permission.systemAlertWindow.request();

    if (notificationStatus.isPermanentlyDenied ||
        phoneStatus.isPermanentlyDenied ||
        overlayStatus.isPermanentlyDenied) {
      WidgetsBinding.instance.addObserver(this);

      _settingsOpened = true;

      await openAppSettings();

      return;
    }

    if (!context.mounted) return;
    context.navigator.pushNamedAndRemoveUntil(DashboardScreen.routeName, (route) => false);
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
