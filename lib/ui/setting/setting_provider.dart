part of 'setting.dart';

final class SettingProvider extends BaseProvider {
  bool isTurnOnFlash = false;
  String appVersion = '1.0.0';

  static const String turnOnFlashKey = 'turn_on_flashlight';
  SettingProvider({required super.context}) {
    _loadSetting();
  }

  Future<void> _loadSetting() async {
    final prefs = await SharedPreferences.getInstance();
    isTurnOnFlash = prefs.getBool(turnOnFlashKey) ?? false;
    try {
      final info = await PackageInfo.fromPlatform();
      appVersion = info.version;
    } catch (_) {}
    notifyListeners();
  }

  Future<void> toggleTurnOnFlash() async {
    isTurnOnFlash = !isTurnOnFlash;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
      turnOnFlashKey,
      isTurnOnFlash,
    );
  }
}