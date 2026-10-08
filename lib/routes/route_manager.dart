part of 'routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  String get initRoute => SplashScreen.routeName;

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    debugPrint("Current Route : ${settings.name}");

    if (_authRoutes.containsKey(settings.name)) {
      return MaterialPageRoute(
        builder: _authRoutes[settings.name]!,
        settings: settings,
      );
    }

    return _mainRoutes(settings);
  }

  Map<String, WidgetBuilder> get _authRoutes {
    return {};
  }

  Route<dynamic>? _mainRoutes(RouteSettings settings) {
    WidgetBuilder? builder;

    switch (settings.name) {
      case SplashScreen.routeName:
        builder = SplashScreen.builder;
        break;

      case LanguageSelectionScreen.routeName:
        builder = LanguageSelectionScreen.builder;
        break;

      case PermissionsScreen.routeName:
        builder = PermissionsScreen.builder;
        break;
      case PrivacyPolicyScreen.routeName:
        builder = (_) => const PrivacyPolicyScreen();
        break;
      case DashboardScreen.routeName:
        builder = DashboardScreen.builder;
        break;
      case FlashAlertScreen.routeName:
        builder = FlashAlertScreen.builder;
        break;
      case FlashLightSosScreen.routeName:
        builder = FlashLightSosScreen.builder;
        break;
      case StroboscopeScreen.routeName:
        builder = StroboscopeScreen.builder;
        break;
      case SettingScreen.routeName:
        builder = SettingScreen.builder;
        break;
      case ScreenLightScreen.routeName:
        builder = ScreenLightScreen.builder;
        break;
      case AppModeScreen.routeName:
        builder = AppModeScreen.builder;
        break;
      case OverlayPermissionScreen.routeName:
        builder = OverlayPermissionScreen.builder;
        break;
      case ChooseAppScreen.routeName:
        builder = ChooseAppScreen.builder;
        break;
      case MoreAppsScreen.routeName:
        builder = MoreAppsScreen.builder;
        break;
      default:
        return null;
    }

    return MaterialPageRoute(
      builder: (context) => builder!(context),
      settings: settings,
    );
  }
}
