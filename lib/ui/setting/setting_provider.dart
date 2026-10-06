part of 'setting.dart';

final class SettingProvider extends BaseProvider {
  bool isTurnOnFlash = false;
  String appVersion = '1.0.0';

  static const String turnOnFlashKey = 'turn_on_flashlight';
  SettingProvider({required super.context}) {
    _loadSetting();
  }

  Future<void> _loadSetting() async {
    isTurnOnFlash = preference.prefs?.getBool(turnOnFlashKey) ?? false;
    try {
      final info = await PackageInfo.fromPlatform();
      appVersion = info.version;
    } catch (_) {}
    notifyListeners();
  }

  void toggleTurnOnFlash() {
    isTurnOnFlash = !isTurnOnFlash;
    notifyListeners();
    preference.prefs?.setBool(turnOnFlashKey, isTurnOnFlash);
  }
}