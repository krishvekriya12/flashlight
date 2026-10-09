# Technology stack

Reviewed on 2026-10-08. Versions below are declarations in the current pubspec.yaml, not a claim that these are the latest available versions.

## Runtime and platforms

| Component | Configuration |
| --- | --- |
| Application | flashlight, version 1.0.0+1 |
| Dart constraint | ^3.11.3 |
| Local Dart executable | 3.13.3 stable (`dart.exe --version`) |
| Lockfile SDK requirements | Dart >=3.12.0 <4.0.0; Flutter >=3.44.0 |
| Android | Kotlin host; Java 17; compileSdk 37; minSdk/targetSdk inherited from Flutter |
| Android identifier | com.setubandhTech.flashlight |
| iOS | Swift host; Xcode project deployment target 15.0 |

## Dependencies

| Area | Declared packages |
| --- | --- |
| State and storage | provider ^6.1.5+1; shared_preferences ^2.5.5 |
| Localization | flutter_localizations SDK; intl ^0.20.2 |
| UI | cupertino_icons ^1.0.9; gap ^3.0.1; flutter_svg ^2.3.0; lottie ^3.5.1; shimmer ^4.0.0; pinput ^6.0.2; table_calendar ^3.2.1; dropdown_button2 ^3.1.0; flutter_colorpicker ^1.1.0 |
| Device controls | permission_handler ^13.0.1; sensors_plus ^6.1.1; wakelock_plus ^1.8.0; screen_brightness ^2.1.11; installed_apps ^2.1.1 |
| Device/app metadata | device_info_plus ^13.2.0; package_info_plus ^10.2.1 |
| Media and links | extended_image ^10.1.0; image_picker ^1.2.3; url_launcher ^6.3.2; share_plus ^13.3.0 |
| Notifications and connectivity | flutter_local_notifications ^22.3.0; connectivity_plus ^7.3.1 |
| Update utilities | in_app_update ^5.0.0; upgrader ^13.7.0 |
| Value utilities | equatable ^2.1.0 |
| Development | flutter_test SDK; flutter_lints ^6.0.0; build_runner ^2.15.1; flutter_gen_runner ^5.15.0 |

Declared dependencies are not all necessarily used; package usage/removal requires a separate dependency audit.

## Configuration

- `pubspec.yaml`: assets, Roboto fonts, FlutterGen integration, Flutter Intl deferred generation.
- `analysis_options.yaml`: Flutter lints; generated files and platform folders excluded from Dart analysis.
- `android/app/build.gradle.kts`: optional release signing from keystore properties. Credentials were not inspected.
- `android/local.properties`: local Android SDK and Flutter locations.
- `AndroidManifest.xml`: native services/receivers and hardware/permission declarations.
- `ios/Runner/Info.plist`: iOS application configuration.

Dependency declarations were preserved during the UI update. Android debug APK builds successfully; physical-device checks and iOS compilation remain unverified. See ARCHITECTURE.md and `.gsd/JOURNAL.md` for evidence and platform boundaries.
