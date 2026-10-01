import 'package:flashlight/core/core.dart';
import 'package:flashlight/resource/resource.dart';
import 'package:flashlight/routes/routes.dart';
import 'package:flashlight/ui/app_mode/app_mode.dart';
import 'package:flashlight/utils/common_func.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRoutes appRoutes = AppRoutes();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LocalizationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppModeProvider(context: context),
        ),
      ],
      builder: (context, child) {
        final local = context.select<LocalizationProvider, Locale?>(
              (provider) => provider.local,
        );

        final themeMode = context.select<AppModeProvider, ThemeMode>(
              (provider) => provider.themeMode,
        );

        return GestureDetector(
          onTap: CommonFunctions.closeKeyboard,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            locale: local,

            supportedLocales: S.delegate.supportedLocales,

            localizationsDelegates:  [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            builder: (context, child) {
              final mediaQuery = MediaQuery.of(context);
              return MediaQuery(
                data: mediaQuery.copyWith(
                  textScaler: mediaQuery.textScaler.clamp(
                    minScaleFactor: 0.8,
                    maxScaleFactor: 1.15,
                  ),
                ),
                child: child!,
              );
            },
            initialRoute: appRoutes.initRoute,
            onGenerateRoute: appRoutes.onGenerateRoute,
            navigatorKey: navigatorKey,
          ),
        );
      },
    );
  }
}

