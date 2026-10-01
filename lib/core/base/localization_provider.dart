part of '../core.dart';

final class LocalizationProvider extends ChangeNotifier {
  LocalizationProvider() {
    local = Locale(preference.appLanguage.value);
  }

  final preference = Preference();

  Locale? local;

  void changeLanguage(AppLanguage language) {
    preference.appLanguage = language;

    local = Locale(language.value);

    notifyListeners();
  }
}
