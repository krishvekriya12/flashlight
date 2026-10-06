part of 'dashboard.dart';

final class DashboardProvider extends BaseProvider {
  DashboardProvider({required super.context});

  int selectedIndex = 0;

  bool _startupFlashUsed = false;

  @override
  void initState() {
    super.initState();
    _handleStartupFlash();
  }

  Future<void> selectTab(int index) async {
    if (selectedIndex == 2 && index != 2) {
      StroboscopeProvider.stopRunningStrobe();
    }
    if (selectedIndex == 1 && index != 1) {
      FlashLightSosProvider.stopRunningSos();
    }

    selectedIndex = index;
    notifyListeners();

    if (index == 1) {
      await _handleStartupFlash();
    }
  }

  Future<void> _handleStartupFlash() async {
    if (_startupFlashUsed) {
      return;
    }
    final turnOnAtStartup = preference.prefs?.getBool('turn_on_flashlight') ?? false;

    if (!turnOnAtStartup) {
      return;
    }
    _startupFlashUsed = true;
    selectedIndex = 1;
    notifyListeners();

    try {
      const channel = MethodChannel('flashlight/torch');
      await channel.invokeMethod('turnOn');
      debugPrint('Startup flashlight turned ON');
    } catch (e) {
      debugPrint('Startup flashlight error: $e');
    }
  }
}