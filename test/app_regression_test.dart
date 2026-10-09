import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flashlight/core/core.dart';
import 'package:flashlight/data/preference/preference.dart';
import 'package:flashlight/generated/l10n.dart';
import 'package:flashlight/resource/resource.dart';
import 'package:flashlight/ui/app_mode/app_mode.dart';
import 'package:flashlight/ui/choose_app/choose_app.dart';
import 'package:flashlight/ui/dashboard/dashboard.dart';
import 'package:flashlight/ui/flash_alert/flash_alert.dart';
import 'package:flashlight/ui/flash_light_sos/flash_light_sos.dart';
import 'package:flashlight/ui/language_selection/language_selection.dart';
import 'package:flashlight/ui/more_apps/more_apps.dart';
import 'package:flashlight/ui/overlay_permission/overlay_permission.dart';
import 'package:flashlight/ui/permissions/permissions.dart';
import 'package:flashlight/ui/privacy_policy/privacy_policy_screen.dart';
import 'package:flashlight/ui/screen_light/screen_light.dart';
import 'package:flashlight/ui/setting/setting.dart';
import 'package:flashlight/ui/splash/splash.dart';
import 'package:flashlight/ui/stroboscope/stroboscope.dart';
import 'package:flashlight/utils/enums.dart';

final capturedCalls = <MethodCall>[];
const captureKey = ValueKey('screen-capture');
final binding = TestWidgetsFlutterBinding.ensureInitialized();

Future<void> mount(
  WidgetTester tester,
  WidgetBuilder screen, {
  Size size = const Size(390, 844),
  double scale = 1,
  Brightness brightness = Brightness.light,
  bool rtl = false,
}) async {
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = size;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  await tester.pumpWidget(
    RepaintBoundary(
      key: captureKey,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LocalizationProvider()),
          ChangeNotifierProvider(
            create: (context) => AppModeProvider(context: context),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: expressiveTheme(brightness: brightness),
          locale: const Locale('en'),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(scale),
              disableAnimations: true,
            ),
            child: Directionality(
              textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
              child: child!,
            ),
          ),
          routes: {
            PermissionsScreen.routeName: (_) =>
                const Scaffold(body: Text('Permissions destination')),
          },
          home: Builder(builder: screen),
        ),
      ),
    ),
  );
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 800));
  await tester.runAsync(() async {
    await Future<void>.delayed(const Duration(milliseconds: 20));
  });
  await tester.pumpAndSettle();
}

Future<void> capture(WidgetTester tester, String name) async {
  final boundary = tester.renderObject<RenderRepaintBoundary>(
    find.byKey(captureKey),
  );
  await tester.runAsync(() async {
    final image = await boundary.toImage(pixelRatio: 1);
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    final directory = Directory('.gsd/screenshots');
    await directory.create(recursive: true);
    await File(
      '${directory.path}/$name.png',
    ).writeAsBytes(bytes!.buffer.asUint8List());
    image.dispose();
  });
}

void main() {
  setUpAll(() async {
    final font = FontLoader('Roboto')
      ..addFont(rootBundle.load('assets/fonts/roboto/Roboto-Regular.ttf'));
    await font.load();
    final icons = FontLoader('MaterialIcons')
      ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'));
    await icons.load();
  });
  setUp(() async {
    capturedCalls.clear();
    SharedPreferences.setMockInitialValues({});
    await Preference().init();
    PackageInfo.setMockInitialValues(
      appName: 'Flashlight',
      packageName: 'com.setubandhTech.flashlight',
      version: '1.0.0',
      buildNumber: '1',
      buildSignature: '',
    );
    binding.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('flashlight/settings'),
      (call) async {
        capturedCalls.add(call);
        if (call.method == 'getFlashAlertSettings') {
          return <String, Object>{
            'call': false,
            'sms': false,
            'shake': false,
            'notification': false,
            'ring': true,
            'vibrate': true,
            'silent': true,
            'onLength': 300,
            'offLength': 300,
          };
        }
        if (call.method == 'getSelectedNotificationApps') return <String>[];
        if (call.method == 'isNotificationAccessEnabled') return true;
        return null;
      },
    );
    binding.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('flashlight/torch'),
      (call) async {
        capturedCalls.add(call);
        return null;
      },
    );
    binding.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('github.com/aaassseee/screen_brightness'),
      (_) async => null,
    );
    binding.defaultBinaryMessenger.setMockMessageHandler(
      'dev.flutter.pigeon.wakelock_plus_platform_interface.WakelockPlusApi.toggle',
      (_) async => const StandardMessageCodec().encodeMessage(<Object?>[null]),
    );
    binding.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('installed_apps'),
      (_) async => <Object>[
        {
          'name': 'Messages',
          'package_name': 'test.messages',
          'platform_type': 'android',
        },
        {
          'name': 'Calendar',
          'package_name': 'test.calendar',
          'platform_type': 'android',
        },
      ],
    );
  });

  testWidgets(
    'language preview does not complete first run; Continue persists it',
    (tester) async {
      await mount(
        tester,
        (context) => ChangeNotifierProvider(
          create: (context) => LanguageSelectionProvider(context: context),
          child: const LanguageSelectionScreen(),
        ),
      );
      final provider = tester
          .element(find.byType(LanguageSelectionScreen))
          .read<LanguageSelectionProvider>();
      provider.selectLanguage(AppLanguage.values.first);
      await tester.pump();
      expect(Preference().languageSelected, false);
      await tester.pumpWidget(const SizedBox());
      await Preference().init();
      expect(
        Preference().languageSelected,
        false,
        reason: 'Closing after selection must not skip onboarding',
      );
      await mount(
        tester,
        (context) => ChangeNotifierProvider(
          create: (context) => LanguageSelectionProvider(context: context),
          child: const LanguageSelectionScreen(),
        ),
      );
      final reopened = tester
          .element(find.byType(LanguageSelectionScreen))
          .read<LanguageSelectionProvider>();
      reopened.selectLanguage(AppLanguage.values.first);
      await tester.pump();
      await tester.tap(find.widgetWithText(FilledButton, 'Continue'));
      await tester.pumpAndSettle();
      expect(Preference().languageSelected, true);
      expect(find.text('Permissions destination'), findsOneWidget);
      await Preference().init();
      expect(Preference().languageSelected, true);
    },
  );

  testWidgets('dashboard navigation preserves SOS and strobe cancellation', (
    tester,
  ) async {
    await mount(tester, DashboardScreen.builder);
    final context = tester.element(find.byType(DashboardScreen));
    final dashboard = context.read<DashboardProvider>();
    await dashboard.selectTab(1);
    await tester.pump();
    final torch = tester
        .element(find.byType(FlashLightSosScreen))
        .read<FlashLightSosProvider>();
    await torch.toggleFlash();
    expect(capturedCalls.any((call) => call.method == 'turnOn'), true);
    await torch.startSos();
    await tester.pump(const Duration(milliseconds: 200));
    expect(torch.isSosRunning, true);
    await dashboard.selectTab(2);
    await tester.pump();
    expect(torch.isSosRunning, false);
    final strobe = tester
        .element(find.byType(StroboscopeScreen))
        .read<StroboscopeProvider>();
    await strobe.startStrobe();
    await tester.pump(const Duration(milliseconds: 10));
    expect(StroboscopeProvider.isStroboscopeRunning, true);
    await dashboard.selectTab(0);
    expect(StroboscopeProvider.isStroboscopeRunning, false);
    await tester.pump(const Duration(milliseconds: 600));
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(milliseconds: 600));
  });

  testWidgets(
    'notification application selection keeps the native settings contract',
    (tester) async {
      await mount(tester, ChooseAppScreen.builder);
      await tester.tap(find.text('Messages'));
      await tester.pump();
      final write = capturedCalls.lastWhere(
        (call) => call.method == 'setSelectedNotificationApps',
      );
      expect((write.arguments as Map)['packages'], contains('test.messages'));
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('app selection error and retry render distinct states', (
    tester,
  ) async {
    binding.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('flashlight/settings'),
      (_) async => throw PlatformException(code: 'unavailable'),
    );
    await mount(tester, ChooseAppScreen.builder);
    expect(find.byIcon(Icons.error_outline_rounded), findsOneWidget);
    binding.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('installed_apps'),
      (_) async => <Object>[],
    );
    binding.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('flashlight/settings'),
      (_) async => <String>[],
    );
    await tester.tap(find.byIcon(Icons.refresh_rounded));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 800));
    await tester.pumpAndSettle();
    expect(find.text('No app found.'), findsOneWidget);
  });

  final screens = <String, WidgetBuilder>{
    'splash': SplashScreen.builder,
    'alerts': FlashAlertScreen.builder,
    'torch': FlashLightSosScreen.builder,
    'strobe': StroboscopeScreen.builder,
    'languages': (context) => ChangeNotifierProvider(
      create: (context) => LanguageSelectionProvider(context: context),
      child: const LanguageSelectionScreen(),
    ),
    'permissions': PermissionsScreen.builder,
    'overlay': OverlayPermissionScreen.builder,
    'settings': SettingScreen.builder,
    'theme': AppModeScreen.builder,
    'applications': ChooseAppScreen.builder,
    'more_apps': MoreAppsScreen.builder,
    'policy': (_) => const PrivacyPolicyScreen(),
    'screen_light': ScreenLightScreen.builder,
    'dashboard': DashboardScreen.builder,
  };
  for (final entry in screens.entries) {
    for (final large in [false, true]) {
      testWidgets(
        '${entry.key} layout ${large ? 'dark 200% RTL' : 'light compact'}',
        (tester) async {
          await mount(
            tester,
            entry.value,
            size: const Size(390, 844),
            scale: large ? 2 : 1,
            brightness: large ? Brightness.dark : Brightness.light,
            rtl: large,
          );
          expect(tester.takeException(), isNull);
          await capture(
            tester,
            '${entry.key}_${large ? 'dark_large' : 'light'}',
          );
          await tester.pumpWidget(const SizedBox());
          await tester.pump(
            Duration(milliseconds: entry.key == 'splash' ? 3000 : 800),
          );
        },
      );
    }
  }
  testWidgets(
    'dashboard expanded layout uses a rail and keeps controls reachable',
    (tester) async {
      await mount(
        tester,
        DashboardScreen.builder,
        size: const Size(1024, 768),
        scale: 2,
      );
      final nav = tester.widget<ExpressiveNavigation>(
        find.byType(ExpressiveNavigation),
      );
      expect(nav.vertical, true);
      expect(nav.expanded, true);
      expect(tester.takeException(), isNull);
      await capture(tester, 'dashboard_tablet');
    },
  );

  testWidgets(
    'screen color and brightness controls remain usable with large text',
    (tester) async {
      await mount(
        tester,
        ScreenLightScreen.builder,
        size: const Size(320, 640),
        scale: 2,
      );
      final p = tester
          .element(find.byType(ScreenLightScreen))
          .read<ScreenLightProvider>();
      p.onToggleControls();
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await capture(tester, 'screen_color_controls_large');
      p.onSelectPreset(0);
      expect(p.presetIndex, 0);
      p.onBrightnessChanged(.65);
      expect(p.brightness, .65);
      await tester.pumpWidget(const SizedBox());
      await tester.pump();
    },
  );

  testWidgets('permission dialog remains scrollable at 200 percent text', (
    tester,
  ) async {
    await mount(
      tester,
      PermissionsScreen.builder,
      size: const Size(320, 640),
      scale: 2,
    );
    await tester.tap(find.byIcon(Icons.info_outline_rounded));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.byType(Dialog), findsOneWidget);
    await capture(tester, 'permission_dialog_large');
  });

  testWidgets(
    'spring motion reaches its destination and honors reduced motion',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(disableAnimations: false),
            child: SpringValue(
              value: 1,
              initialValue: .8,
              builder: (context, value, _) => Text(value.toStringAsFixed(2)),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('1.00'), findsOneWidget);
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(disableAnimations: true),
            child: SpringValue(
              value: .5,
              initialValue: .8,
              builder: (context, value, _) => Text(value.toStringAsFixed(2)),
            ),
          ),
        ),
      );
      expect(find.text('0.50'), findsOneWidget);
    },
  );

  test(
    'semantic theme colors retain readable contrast with different seeds',
    () {
      for (final seed in [
        Colors.teal,
        Colors.purple,
        Colors.orange,
        Colors.blue,
      ]) {
        for (final brightness in Brightness.values) {
          final c = expressiveTheme(
            brightness: brightness,
            seed: seed,
          ).colorScheme;
          for (final pair in [
            (c.primary, c.onPrimary),
            (c.surface, c.onSurface),
            (c.primaryContainer, c.onPrimaryContainer),
          ]) {
            final a = pair.$1.computeLuminance();
            final b = pair.$2.computeLuminance();
            final ratio =
                (a > b ? a + .05 : b + .05) / (a > b ? b + .05 : a + .05);
            expect(ratio, greaterThanOrEqualTo(4.5));
          }
        }
      }
    },
  );
}
