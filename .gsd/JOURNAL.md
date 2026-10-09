# Application update evidence — 2026-10-08

## Language onboarding

Reported the cause before fixing: selectLanguage previously set languageSelected=true before Continue, so an interrupted first run was treated as completed. Locale preview still updates immediately; completeLanguageSelection now awaits locale and completion persistence only on Continue.

Regression evidence from `flutter test --no-pub --reporter expanded`:

```
+0: language preview does not complete first run; Continue persists it
+1: dashboard navigation preserves SOS and strobe cancellation
+2: notification application selection keeps the native settings contract
+3: app selection error and retry render distinct states
+35: All tests passed!
```

The suite also renders 13 screens in light compact and dark 200% text/RTL configurations, a 1024x768 navigation rail, 320x640 color controls and permissions dialog, reduced-motion springs, and contrast across four seed colors in both brightness modes. Native channels are mocked in widget tests; these are not hardware tests.

## UI

Applied the supplied design guide through Flutter equivalents without adding/upgrading dependencies or migrating to Compose. Shared spring controls, state shape changes, emphasized typography, seeded semantic colors, Android 12+ accent seed, tonal sections, accessible targets, reduced motion, scrollable large-text layouts, and adaptive rail/navigation are implemented.

Actual RepaintBoundary screenshots are saved in `.gsd/screenshots/` (31 PNG files). Reviewed splash, torch, alert/dashboard, language, settings at 200% text, color controls, and permissions dialog. Final finishing removes startup-label ellipsis, adds a contrast-safe screen-light back button, replaces duplicate SOS lettering, and makes the app list lazy with stable package keys.

Two additional splash layout checks passed with `flutter test --no-pub --reporter expanded --plain-name 'splash layout'`: `+2: All tests passed!`. Total verified checks: 37 (35 regression/layout checks and 2 splash checks). Splash retains its existing navigation delay and destination behavior.

## Privacy policy

Read the existing published policy at https://sites.google.com/view/flashlight-privacy-policy. Retained its paragraphs and sections, replaced Surpax with Setubandh Tech and the contact with setubandhtech@gmail.com, and added the publisher line. Restored assets/privacy_policy.md and its routed offline screen.

Opened Google Sites for the user. The home screen showed Google Account: Setubandh Tech (setubandhtech@gmail.com), but opening Blank site redirected to password verification. No new live site has been created or published yet; browser handoff remains open for user sign-in.

## Build/configuration

`flutter analyze --no-pub` completed with exit code 0:

```
No issues found! (ran in 12.8s)
```

`flutter build apk --debug --no-pub` completed successfully:

```
Built build\app\outputs\flutter-apk\app-debug.apk
```

`aapt dump badging` confirms:

```
package: name='com.setubandhTech.flashlight' versionCode='1' versionName='1.0.0'
application-label:'Flashlight'
launchable-activity: name='com.setubandhTech.flashlight.MainActivity'
```

Android namespace/application ID, Kotlin packages/source paths, iOS project identifiers, and store/share constants use the new package. Native behavior is otherwise unchanged apart from reading the system accent seed. Restored the missing wake-lock helper used by existing features.

Final rebuild completed in 60.4 seconds. Comparing the ten native Kotlin files other than MainActivity against HEAD after normalizing the package reports `OnlyPackageChanged=True` for every file. MainActivity additionally exposes the system accent seed; the manifest enables the platform back callback.

No connected Android device/emulator was available. Physical torch, incoming calls/SMS, notification listener, shake, overlay, and brightness behavior still require device validation. iOS custom channel support was already absent and remains outside this task. Existing launcher/assets changes from the user were preserved. No release signing or store publication was performed.

## Google Sites publication — 2026-10-09

User completed sign-in to Setubandh Tech (setubandhtech@gmail.com). Created and published the policy in their blank Google Site, preserving all existing policy paragraphs with the requested publisher/contact substitutions. Added semantic headings and a readable title.

Live URL: https://sites.google.com/view/setubandh-flashlight-privacy

Editor URL: https://sites.google.com/d/1BJmCgLClKaWYHXVIyXG6s-FaGfBT66ud/p/15EDZUM3B3s9UDzey8He_RTFSkQuEzcpl/edit

Verified the published page renders the title, all collection/use/sharing/third-party/compliance/contact sections, Setubandh Tech, and setubandhtech@gmail.com. Publication uses the displayed Anyone audience. Screenshot: `.gsd/screenshots/privacy_policy_published.jpg`. The live page is kept open as a deliverable. No app feature or privacy asset wording changed during publication.
