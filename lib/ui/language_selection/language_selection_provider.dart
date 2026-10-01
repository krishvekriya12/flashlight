part of 'language_selection.dart';

final class LanguageSelectionProvider extends BaseProvider {
  final bool? isSetting;

  LanguageSelectionProvider({required super.context, this.isSetting});

  @override
  void initState() {
    super.initState();
    languages = AppLanguage.values;
    startHintAnimation();
  }

  List<AppLanguage> languages = [];

  AppLanguage? selectedLanguage;

  bool showHintAnimation = false;
  bool isLoading = false;

  Future<void> continueNavigation() async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
    if (isSetting == true) {
      context.navigator.pop();
    } else {
      context.navigator.pushNamedAndRemoveUntil(PermissionsScreen.routeName, (route) => false);
    }
  }

  void startHintAnimation() {
    showHintAnimation = true;
    notifyListeners();
  }

  void stopHintAnimation() {
    showHintAnimation = false;
  }

  void selectLanguage(AppLanguage language) {
    selectedLanguage = language;
    showHintAnimation = false;

    Preference().appLanguage = language;
    context.read<LocalizationProvider>().changeLanguage(language);
    Preference().languageSelected = true;

    notifyListeners();
  }
}
