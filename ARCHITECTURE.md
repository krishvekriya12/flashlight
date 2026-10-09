# Project architecture

Reviewed on 2026-10-08. This document maps the current working tree, including existing uncommitted changes. Feature presence is based on source inspection; device behavior has not been verified.

## Overview

Flutter flashlight application with Android Kotlin integrations. The UI contains flash alerts, torch/SOS, stroboscope, screen light, language selection, permissions, theme settings, and links to other applications.

## Startup and data flow

`lib/main.dart` -> `bootstrap.dart` initializes system UI and shared preferences -> `MyApp` provides localization and theme state -> named routes -> splash -> language/permission onboarding or dashboard.

The dashboard retains FlashAlert, FlashLightSos, and Stroboscope screens in an IndexedStack. Providers coordinate SOS/strobe cancellation when changing modes. Flutter invokes native operations using `flashlight/torch` and `flashlight/settings`. Android persists alert settings separately and dispatches phone, SMS, notification, and accelerometer events to its torch controller. Torch callbacks update Flutter state.

## Source map

| Location | Responsibility |
| --- | --- |
| `lib/core` | Base ChangeNotifier provider, localization, context extensions, alerts/loading helpers |
| `lib/ui` | Feature libraries, providers, screens, and components |
| `lib/routes` | Named-route selection and screen/provider creation |
| `lib/data/preference` | SharedPreferences wrapper and keys |
| `lib/resource` | Colors, spacing, themes, status colors |
| `lib/utils` | Common buttons, URLs, language enums, constants |
| `lib/generated`, `lib/l10n` | Generated asset/font/localization bindings and 25 ARB locale files |
| `assets` | SVG/PNG icons, fonts, Lottie animation, promotional images |
| `android/app/src/main/kotlin/com/setubandhTech/flashlight` | Method channels, torch control, call/SMS receivers, notification listener, shake and overlay services |
| `ios/Runner` | Flutter host; no equivalent custom torch/settings channels found |
| `.agent`, `.agents`, `.gsd`, `adapters`, `scripts` | GSD workflow scaffolding, templates, and validation utilities |

## Patterns and integrations

- Feature libraries use `part` files for screen/provider/components.
- State management uses Provider and ChangeNotifier; BaseProvider calls initState during construction.
- Local settings use Dart shared preferences and Android FlashAlertPreferences.
- Screen light manages application brightness and blinking; torch features reference a shared wake-lock helper.
- No application backend, account system, or remote database was found in the inspected source.
- External URLs include Play Store application/share links, promotional icon images, and a Google Sites privacy policy.
- Android uses optional camera/flash hardware, phone/SMS permissions, notification access, overlays, and special-use foreground services.

## Update and verification boundaries

1. Restored the missing shared wake-lock helper and in-app privacy-policy screen/asset.
2. First-run language completion is persisted after Continue; selection still previews the locale.
3. Shared expressive Flutter components provide spring motion, reduced-motion support, semantic colors, accessible controls, and adaptive navigation. Android 12+ supplies a system accent seed through the existing settings channel.
4. Package identifier is `com.setubandhTech.flashlight`; existing native services and feature timing remain in place.
5. iOS AppDelegate only registers plugins; custom Android method-channel implementations still have no iOS counterpart in the inspected Runner source. iOS compilation was not available on Windows.
6. Added 37 regression and layout checks plus 31 captured UI screenshots. Device/background behavior and release signing remain unverified because no Android device was connected.
7. Google Sites privacy policy published on 2026-10-09: https://sites.google.com/view/setubandh-flashlight-privacy. The in-app policy is also available offline.

## Analysis evidence

Initial analysis found 18 errors and 2 warnings related to missing source/assets. After this update, `flutter analyze --no-pub` reports `No issues found!`; `flutter test --no-pub --reporter expanded` reports `+35: All tests passed!`. Android debug APK builds successfully. APK badging confirms the new application ID and MainActivity. See `.gsd/JOURNAL.md` for evidence and screenshot paths.
