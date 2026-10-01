part of 'app_mode.dart';

final class AppModeProvider extends BaseProvider {
  ThemeMode themeMode = ThemeMode.system;
  ThemeMode selectedMode = ThemeMode.system;

  AppModeProvider({required super.context}) {
    themeMode = preference.themeMode;
    selectedMode = themeMode;
  }

  void selectTheme(ThemeMode mode) {
    selectedMode = mode;
    notifyListeners();
  }

  void applyTheme() {
    themeMode = selectedMode;
    preference.themeMode = themeMode;
    notifyListeners();
  }
}