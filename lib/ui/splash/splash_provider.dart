part of 'splash.dart';

final class SplashProvider extends BaseProvider {
  SplashProvider({required super.context});

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
