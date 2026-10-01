// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `About us`
  String get aboutUs {
    return Intl.message('About us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Afrikaans`
  String get afrikaans {
    return Intl.message('Afrikaans', name: 'afrikaans', desc: '', args: []);
  }

  /// `After call feature`
  String get afterCallFunction {
    return Intl.message(
      'After call feature',
      name: 'afterCallFunction',
      desc: '',
      args: [],
    );
  }

  /// `After call option`
  String get afterCallOption {
    return Intl.message(
      'After call option',
      name: 'afterCallOption',
      desc: '',
      args: [],
    );
  }

  /// `After any call, you'll see options to call back, message, or save the contact.`
  String get afterCallOptionSubText {
    return Intl.message(
      'After any call, you\'ll see options to call back, message, or save the contact.',
      name: 'afterCallOptionSubText',
      desc: '',
      args: [],
    );
  }

  /// `After a call, get options to call back, message, or save the contact.`
  String get afterCallSubText {
    return Intl.message(
      'After a call, get options to call back, message, or save the contact.',
      name: 'afterCallSubText',
      desc: '',
      args: [],
    );
  }

  /// `Allow`
  String get allow {
    return Intl.message('Allow', name: 'allow', desc: '', args: []);
  }

  /// `Allow Permission`
  String get allowPermissionCallend {
    return Intl.message(
      'Allow Permission',
      name: 'allowPermissionCallend',
      desc: '',
      args: [],
    );
  }

  /// `App mode`
  String get appMode {
    return Intl.message('App mode', name: 'appMode', desc: '', args: []);
  }

  /// `Flashlight`
  String get appName {
    return Intl.message('Flashlight', name: 'appName', desc: '', args: []);
  }

  /// `Version {version}`
  String appVersion(String version) {
    return Intl.message(
      'Version $version',
      name: 'appVersion',
      desc: '',
      args: [version],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Are you sure?`
  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `You won’t be able to see any call information`
  String get areYouSureSubText {
    return Intl.message(
      'You won’t be able to see any call information',
      name: 'areYouSureSubText',
      desc: '',
      args: [],
    );
  }

  /// `Auto Start Access`
  String get autoStartAccess {
    return Intl.message(
      'Auto Start Access',
      name: 'autoStartAccess',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get calendar {
    return Intl.message('Calendar', name: 'calendar', desc: '', args: []);
  }

  /// `I'll Call you later`
  String get callLater {
    return Intl.message(
      'I\'ll Call you later',
      name: 'callLater',
      desc: '',
      args: [],
    );
  }

  /// `We need access to your camera to keep the flashlight on even when the app is closed or running in the background. Without this, the flashlight will only work while you’re using the app.`
  String get cameraPermissionFirstDenialDesc {
    return Intl.message(
      'We need access to your camera to keep the flashlight on even when the app is closed or running in the background. Without this, the flashlight will only work while you’re using the app.',
      name: 'cameraPermissionFirstDenialDesc',
      desc: '',
      args: [],
    );
  }

  /// `Camera Access Needed`
  String get cameraPermissionTitle {
    return Intl.message(
      'Camera Access Needed',
      name: 'cameraPermissionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Can't talk right now`
  String get cantTalkNow {
    return Intl.message(
      'Can\'t talk right now',
      name: 'cantTalkNow',
      desc: '',
      args: [],
    );
  }

  /// `Chinese`
  String get chinese {
    return Intl.message('Chinese', name: 'chinese', desc: '', args: []);
  }

  /// `Choose App`
  String get chooseApp {
    return Intl.message('Choose App', name: 'chooseApp', desc: '', args: []);
  }

  /// `Choose Color`
  String get chooseColor {
    return Intl.message(
      'Choose Color',
      name: 'chooseColor',
      desc: '',
      args: [],
    );
  }

  /// `Close button`
  String get closeButton {
    return Intl.message(
      'Close button',
      name: 'closeButton',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message('Contact', name: 'contact', desc: '', args: []);
  }

  /// `Create new reminder`
  String get createReminder {
    return Intl.message(
      'Create new reminder',
      name: 'createReminder',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `The app will only function if the Display Over Other Apps permission is granted.`
  String get dialogBackPressOverlayPermissionDescription {
    return Intl.message(
      'The app will only function if the Display Over Other Apps permission is granted.',
      name: 'dialogBackPressOverlayPermissionDescription',
      desc: '',
      args: [],
    );
  }

  /// `The app function can't work without {permission} permission.`
  String dialogBackPressPhoneNotificationPermissionDescription(
    String permission,
  ) {
    return Intl.message(
      'The app function can\'t work without $permission permission.',
      name: 'dialogBackPressPhoneNotificationPermissionDescription',
      desc: '',
      args: [permission],
    );
  }

  /// `Dismiss`
  String get dismiss {
    return Intl.message('Dismiss', name: 'dismiss', desc: '', args: []);
  }

  /// `Duration:`
  String get duration {
    return Intl.message('Duration:', name: 'duration', desc: '', args: []);
  }

  /// `Enable`
  String get enable {
    return Intl.message('Enable', name: 'enable', desc: '', args: []);
  }

  /// `Enable Display Permission`
  String get enableDisplayPermission {
    return Intl.message(
      'Enable Display Permission',
      name: 'enableDisplayPermission',
      desc: '',
      args: [],
    );
  }

  /// `ENABLE FOR`
  String get enableFor {
    return Intl.message('ENABLE FOR', name: 'enableFor', desc: '', args: []);
  }

  /// `Enable Notification Access`
  String get enableNotificationAccess {
    return Intl.message(
      'Enable Notification Access',
      name: 'enableNotificationAccess',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Write personal message`
  String get enterMessage {
    return Intl.message(
      'Write personal message',
      name: 'enterMessage',
      desc: '',
      args: [],
    );
  }

  /// `Fill the content of the reminder`
  String get enterReminderText {
    return Intl.message(
      'Fill the content of the reminder',
      name: 'enterReminderText',
      desc: '',
      args: [],
    );
  }

  /// `Filipino`
  String get fillipino {
    return Intl.message('Filipino', name: 'fillipino', desc: '', args: []);
  }

  /// `FLASH ON`
  String get flashOn {
    return Intl.message('FLASH ON', name: 'flashOn', desc: '', args: []);
  }

  /// `French`
  String get french {
    return Intl.message('French', name: 'french', desc: '', args: []);
  }

  /// `German`
  String get german {
    return Intl.message('German', name: 'german', desc: '', args: []);
  }

  /// `Hindi`
  String get hindi {
    return Intl.message('Hindi', name: 'hindi', desc: '', args: []);
  }

  /// `Hungarian`
  String get hungarian {
    return Intl.message('Hungarian', name: 'hungarian', desc: '', args: []);
  }

  /// `I'm on my way`
  String get imOnWay {
    return Intl.message('I\'m on my way', name: 'imOnWay', desc: '', args: []);
  }

  /// `Incoming`
  String get incoming {
    return Intl.message('Incoming', name: 'incoming', desc: '', args: []);
  }

  /// `Incoming Call`
  String get incomingCall {
    return Intl.message(
      'Incoming Call',
      name: 'incomingCall',
      desc: '',
      args: [],
    );
  }

  /// `Incoming SMS`
  String get incomingSms {
    return Intl.message(
      'Incoming SMS',
      name: 'incomingSms',
      desc: '',
      args: [],
    );
  }

  /// `Indonesian`
  String get indonesian {
    return Intl.message('Indonesian', name: 'indonesian', desc: '', args: []);
  }

  /// `Italian`
  String get italian {
    return Intl.message('Italian', name: 'italian', desc: '', args: []);
  }

  /// `Japanese`
  String get japan {
    return Intl.message('Japanese', name: 'japan', desc: '', args: []);
  }

  /// `Keep it`
  String get keepIt {
    return Intl.message('Keep it', name: 'keepIt', desc: '', args: []);
  }

  /// `Korean`
  String get korean {
    return Intl.message('Korean', name: 'korean', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Languages`
  String get languages {
    return Intl.message('Languages', name: 'languages', desc: '', args: []);
  }

  /// `Later`
  String get later {
    return Intl.message('Later', name: 'later', desc: '', args: []);
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message('Light Mode', name: 'lightMode', desc: '', args: []);
  }

  /// `Mail`
  String get mail {
    return Intl.message('Mail', name: 'mail', desc: '', args: []);
  }

  /// `Messages`
  String get message {
    return Intl.message('Messages', name: 'message', desc: '', args: []);
  }

  /// `Missed call`
  String get missedCall {
    return Intl.message('Missed call', name: 'missedCall', desc: '', args: []);
  }

  /// `No app found.`
  String get noAppFound {
    return Intl.message(
      'No app found.',
      name: 'noAppFound',
      desc: '',
      args: [],
    );
  }

  /// `No reminders`
  String get noReminders {
    return Intl.message(
      'No reminders',
      name: 'noReminders',
      desc: '',
      args: [],
    );
  }

  /// `Not set`
  String get notSet {
    return Intl.message('Not set', name: 'notSet', desc: '', args: []);
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Please allow notification access in settings to get flash alerts.`
  String get notificationPermissionSettingsDesc {
    return Intl.message(
      'Please allow notification access in settings to get flash alerts.',
      name: 'notificationPermissionSettingsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Enable Notifications`
  String get notificationPermissionSettingsTitle {
    return Intl.message(
      'Enable Notifications',
      name: 'notificationPermissionSettingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notification and Phone`
  String get notificationPhone {
    return Intl.message(
      'Notification and Phone',
      name: 'notificationPhone',
      desc: '',
      args: [],
    );
  }

  /// `To enjoy flash on incoming SMS, please grant notification access. This allows to detect messages and illuminate your flash for instant notifications. Enable it now?`
  String get notificationRequired {
    return Intl.message(
      'To enjoy flash on incoming SMS, please grant notification access. This allows to detect messages and illuminate your flash for instant notifications. Enable it now?',
      name: 'notificationRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enable this setting, otherwise the flashlight may not blinking when receiving incoming call or sms.`
  String get notificationRequired2 {
    return Intl.message(
      'Enable this setting, otherwise the flashlight may not blinking when receiving incoming call or sms.',
      name: 'notificationRequired2',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Off Length`
  String get offLength {
    return Intl.message('Off Length', name: 'offLength', desc: '', args: []);
  }

  /// `On Length`
  String get onLength {
    return Intl.message('On Length', name: 'onLength', desc: '', args: []);
  }

  /// `Outgoing`
  String get outgoing {
    return Intl.message('Outgoing', name: 'outgoing', desc: '', args: []);
  }

  /// `Enable`
  String get overlayPermissionMaintextOne {
    return Intl.message(
      'Enable',
      name: 'overlayPermissionMaintextOne',
      desc: '',
      args: [],
    );
  }

  /// `permission. Some devices may name it differently. Use one of the methods above.`
  String get overlayPermissionMaintextThree {
    return Intl.message(
      'permission. Some devices may name it differently. Use one of the methods above.',
      name: 'overlayPermissionMaintextThree',
      desc: '',
      args: [],
    );
  }

  /// `‘Display over other apps (Appear on top)’`
  String get overlayPermissionMaintextTwo {
    return Intl.message(
      '‘Display over other apps (Appear on top)’',
      name: 'overlayPermissionMaintextTwo',
      desc: '',
      args: [],
    );
  }

  /// `Allow & Continue`
  String get permissionButtonText {
    return Intl.message(
      'Allow & Continue',
      name: 'permissionButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Please enable auto-start to keep the app running smoothly.`
  String get permissionDialogAutoStartText4 {
    return Intl.message(
      'Please enable auto-start to keep the app running smoothly.',
      name: 'permissionDialogAutoStartText4',
      desc: '',
      args: [],
    );
  }

  /// `Auto Start`
  String get permissionDialogAutoStartTitle {
    return Intl.message(
      'Auto Start',
      name: 'permissionDialogAutoStartTitle',
      desc: '',
      args: [],
    );
  }

  /// `Allow`
  String get permissionDialogButtonText {
    return Intl.message(
      'Allow',
      name: 'permissionDialogButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Stay updated with alerts, reminders, and important information.`
  String get permissionDialogNotificationText2 {
    return Intl.message(
      'Stay updated with alerts, reminders, and important information.',
      name: 'permissionDialogNotificationText2',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get permissionDialogNotificationTitle {
    return Intl.message(
      'Notifications',
      name: 'permissionDialogNotificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enables quick after call actions without interrupting your workflow.`
  String get permissionDialogOverlayText2 {
    return Intl.message(
      'Enables quick after call actions without interrupting your workflow.',
      name: 'permissionDialogOverlayText2',
      desc: '',
      args: [],
    );
  }

  /// `Display Overlay`
  String get permissionDialogOverlayTitle {
    return Intl.message(
      'Display Overlay',
      name: 'permissionDialogOverlayTitle',
      desc: '',
      args: [],
    );
  }

  /// `Helps us know call completion to enable after-call features.`
  String get permissionDialogPhoneStateText4 {
    return Intl.message(
      'Helps us know call completion to enable after-call features.',
      name: 'permissionDialogPhoneStateText4',
      desc: '',
      args: [],
    );
  }

  /// `Phone State`
  String get permissionDialogPhoneStateTitle {
    return Intl.message(
      'Phone State',
      name: 'permissionDialogPhoneStateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get permissionDialogSettings {
    return Intl.message(
      'Settings',
      name: 'permissionDialogSettings',
      desc: '',
      args: [],
    );
  }

  /// `We only ask for permissions required to make your experience smooth.`
  String get permissionDialogText3 {
    return Intl.message(
      'We only ask for permissions required to make your experience smooth.',
      name: 'permissionDialogText3',
      desc: '',
      args: [],
    );
  }

  /// `Permissions Needed`
  String get permissionDialogTitle3 {
    return Intl.message(
      'Permissions Needed',
      name: 'permissionDialogTitle3',
      desc: '',
      args: [],
    );
  }

  /// `By allow & continue, you read our`
  String get permissionNoteText {
    return Intl.message(
      'By allow & continue, you read our',
      name: 'permissionNoteText',
      desc: '',
      args: [],
    );
  }

  /// `Allow Permission`
  String get permissionOverlayButtonText {
    return Intl.message(
      'Allow Permission',
      name: 'permissionOverlayButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Allow`
  String get permissionOverlayDialogButtonText {
    return Intl.message(
      'Allow',
      name: 'permissionOverlayDialogButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Why need?`
  String get permissionOverlayDialogText {
    return Intl.message(
      'Why need?',
      name: 'permissionOverlayDialogText',
      desc: '',
      args: [],
    );
  }

  /// `Give quick access to overlay for instant caller insights, smart reminders, and easy follow-ups after calls.\n\nDon't worry — your personal data stays completely private and secure with us.`
  String get permissionOverlayDialogText4 {
    return Intl.message(
      'Give quick access to overlay for instant caller insights, smart reminders, and easy follow-ups after calls.\n\nDon\'t worry — your personal data stays completely private and secure with us.',
      name: 'permissionOverlayDialogText4',
      desc: '',
      args: [],
    );
  }

  /// `Why need this permission?`
  String get permissionOverlayDialogTitle {
    return Intl.message(
      'Why need this permission?',
      name: 'permissionOverlayDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lets the app show helpful tools without stopping what you’re doing.`
  String get permissionOverlayText2 {
    return Intl.message(
      'Lets the app show helpful tools without stopping what you’re doing.',
      name: 'permissionOverlayText2',
      desc: '',
      args: [],
    );
  }

  /// `Overlay Permission`
  String get permissionOverlayTitle {
    return Intl.message(
      'Overlay Permission',
      name: 'permissionOverlayTitle',
      desc: '',
      args: [],
    );
  }

  /// `To continue using this feature, please allow the required permission in your phone’s settings.`
  String get permissionSettingsDesc {
    return Intl.message(
      'To continue using this feature, please allow the required permission in your phone’s settings.',
      name: 'permissionSettingsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Permission Required`
  String get permissionSettingsTitle {
    return Intl.message(
      'Permission Required',
      name: 'permissionSettingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Allow the following permissions for a seamless app experience.`
  String get permissionText3 {
    return Intl.message(
      'Allow the following permissions for a seamless app experience.',
      name: 'permissionText3',
      desc: '',
      args: [],
    );
  }

  /// `Personalization`
  String get personalization {
    return Intl.message(
      'Personalization',
      name: 'personalization',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `To blink the flashlight for incoming calls, we need access to your phone state. This lets the app detect when you are receiving a call so the flash can alert you.`
  String get phoneStatePermissionFirstDenialDesc {
    return Intl.message(
      'To blink the flashlight for incoming calls, we need access to your phone state. This lets the app detect when you are receiving a call so the flash can alert you.',
      name: 'phoneStatePermissionFirstDenialDesc',
      desc: '',
      args: [],
    );
  }

  /// `Phone State Access Needed`
  String get phoneStatePermissionTitle {
    return Intl.message(
      'Phone State Access Needed',
      name: 'phoneStatePermissionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please select a future time`
  String get pleaseSelectFuturTime {
    return Intl.message(
      'Please select a future time',
      name: 'pleaseSelectFuturTime',
      desc: '',
      args: [],
    );
  }

  /// `Polish`
  String get polish {
    return Intl.message('Polish', name: 'polish', desc: '', args: []);
  }

  /// `Portuguese`
  String get portuguese {
    return Intl.message('Portuguese', name: 'portuguese', desc: '', args: []);
  }

  /// `Press back again to exit`
  String get pressBackAgainToExit {
    return Intl.message(
      'Press back again to exit',
      name: 'pressBackAgainToExit',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicyPermission {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicyPermission',
      desc: '',
      args: [],
    );
  }

  /// `Private Number`
  String get privateNumber {
    return Intl.message(
      'Private Number',
      name: 'privateNumber',
      desc: '',
      args: [],
    );
  }

  /// `Proceed`
  String get proceed {
    return Intl.message('Proceed', name: 'proceed', desc: '', args: []);
  }

  /// `Rate us`
  String get rateUs {
    return Intl.message('Rate us', name: 'rateUs', desc: '', args: []);
  }

  /// `Reminder Alert!`
  String get reminderAlert {
    return Intl.message(
      'Reminder Alert!',
      name: 'reminderAlert',
      desc: '',
      args: [],
    );
  }

  /// `Reminder deleted!`
  String get reminderDeleted {
    return Intl.message(
      'Reminder deleted!',
      name: 'reminderDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Reminder set successfully!`
  String get reminderSetSuccessfully {
    return Intl.message(
      'Reminder set successfully!',
      name: 'reminderSetSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Result not found.`
  String get resultNotFound {
    return Intl.message(
      'Result not found.',
      name: 'resultNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Ring`
  String get ring {
    return Intl.message('Ring', name: 'ring', desc: '', args: []);
  }

  /// `Romanian`
  String get romanian {
    return Intl.message('Romanian', name: 'romanian', desc: '', args: []);
  }

  /// `Russian`
  String get russian {
    return Intl.message('Russian', name: 'russian', desc: '', args: []);
  }

  /// `Screen Light`
  String get screenLight {
    return Intl.message(
      'Screen Light',
      name: 'screenLight',
      desc: '',
      args: [],
    );
  }

  /// `Search apps…`
  String get searchApps {
    return Intl.message('Search apps…', name: 'searchApps', desc: '', args: []);
  }

  /// `See Call Information`
  String get seeCallInformation {
    return Intl.message(
      'See Call Information',
      name: 'seeCallInformation',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Shake your device to turn the flashlight on or off`
  String get shakeNotificationText {
    return Intl.message(
      'Shake your device to turn the flashlight on or off',
      name: 'shakeNotificationText',
      desc: '',
      args: [],
    );
  }

  /// `Shake to toggle flashlight is on`
  String get shakeNotificationTitle {
    return Intl.message(
      'Shake to toggle flashlight is on',
      name: 'shakeNotificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `To use Shake to Flash, please allow notification permission so the shake service can run in the background.`
  String get shakePermissionDialogDescription {
    return Intl.message(
      'To use Shake to Flash, please allow notification permission so the shake service can run in the background.',
      name: 'shakePermissionDialogDescription',
      desc: '',
      args: [],
    );
  }

  /// `Shake to Flash Permission`
  String get shakePermissionDialogTitle {
    return Intl.message(
      'Shake to Flash Permission',
      name: 'shakePermissionDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notification permission is required to run the Shake to Flash service. Please allow notifications in Settings.`
  String get shakePermissionSettingsDescription {
    return Intl.message(
      'Notification permission is required to run the Shake to Flash service. Please allow notifications in Settings.',
      name: 'shakePermissionSettingsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enable Notification Permission`
  String get shakePermissionSettingsTitle {
    return Intl.message(
      'Enable Notification Permission',
      name: 'shakePermissionSettingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Shake to Toggle Flashlight`
  String get shakeToToggleFlashlight {
    return Intl.message(
      'Shake to Toggle Flashlight',
      name: 'shakeToToggleFlashlight',
      desc: '',
      args: [],
    );
  }

  /// `Share app`
  String get shareApp {
    return Intl.message('Share app', name: 'shareApp', desc: '', args: []);
  }

  /// `Silent`
  String get silent {
    return Intl.message('Silent', name: 'silent', desc: '', args: []);
  }

  /// `Spanish`
  String get spanish {
    return Intl.message('Spanish', name: 'spanish', desc: '', args: []);
  }

  /// `Allow following permission to use app without interruption.`
  String get subtextPermissionDailoge {
    return Intl.message(
      'Allow following permission to use app without interruption.',
      name: 'subtextPermissionDailoge',
      desc: '',
      args: [],
    );
  }

  /// `Allow following permission to use app without interruption.`
  String get subtextPermissionDialog {
    return Intl.message(
      'Allow following permission to use app without interruption.',
      name: 'subtextPermissionDialog',
      desc: '',
      args: [],
    );
  }

  /// `System Default`
  String get systemDefault {
    return Intl.message(
      'System Default',
      name: 'systemDefault',
      desc: '',
      args: [],
    );
  }

  /// `Flash Alert`
  String get tabFlashAlert {
    return Intl.message(
      'Flash Alert',
      name: 'tabFlashAlert',
      desc: '',
      args: [],
    );
  }

  /// `Flash Light`
  String get tabFlashLight {
    return Intl.message(
      'Flash Light',
      name: 'tabFlashLight',
      desc: '',
      args: [],
    );
  }

  /// `Stroboscope`
  String get tabStroboscope {
    return Intl.message(
      'Stroboscope',
      name: 'tabStroboscope',
      desc: '',
      args: [],
    );
  }

  /// `Tap screen to hide controls`
  String get tapScreenToHideControls {
    return Intl.message(
      'Tap screen to hide controls',
      name: 'tapScreenToHideControls',
      desc: '',
      args: [],
    );
  }

  /// `TEST FLASH`
  String get testFlash {
    return Intl.message('TEST FLASH', name: 'testFlash', desc: '', args: []);
  }

  /// `Test Off`
  String get testOff {
    return Intl.message('Test Off', name: 'testOff', desc: '', args: []);
  }

  /// `Test On`
  String get testOn {
    return Intl.message('Test On', name: 'testOn', desc: '', args: []);
  }

  /// `Thai`
  String get thai {
    return Intl.message('Thai', name: 'thai', desc: '', args: []);
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `Tomorrow`
  String get tomorrow {
    return Intl.message('Tomorrow', name: 'tomorrow', desc: '', args: []);
  }

  /// `Torch turned on`
  String get torchTurnedOn {
    return Intl.message(
      'Torch turned on',
      name: 'torchTurnedOn',
      desc: '',
      args: [],
    );
  }

  /// `Turkish`
  String get turkish {
    return Intl.message('Turkish', name: 'turkish', desc: '', args: []);
  }

  /// `Turn flashlight on at startup`
  String get turnFlashlightOn {
    return Intl.message(
      'Turn flashlight on at startup',
      name: 'turnFlashlightOn',
      desc: '',
      args: [],
    );
  }

  /// `Turn Off`
  String get turnOff {
    return Intl.message('Turn Off', name: 'turnOff', desc: '', args: []);
  }

  /// `Ukrainian`
  String get ukrainian {
    return Intl.message('Ukrainian', name: 'ukrainian', desc: '', args: []);
  }

  /// `Enable to unlock features`
  String get unableToUnlockFeatures {
    return Intl.message(
      'Enable to unlock features',
      name: 'unableToUnlockFeatures',
      desc: '',
      args: [],
    );
  }

  /// `Vibrate`
  String get vibrate {
    return Intl.message('Vibrate', name: 'vibrate', desc: '', args: []);
  }

  /// `Vietnamese`
  String get vietnam {
    return Intl.message('Vietnamese', name: 'vietnam', desc: '', args: []);
  }

  /// `More Apps`
  String get otherApps {
    return Intl.message('More Apps', name: 'otherApps', desc: '', args: []);
  }

  /// `Get`
  String get installApp {
    return Intl.message('Get', name: 'installApp', desc: '', args: []);
  }

  /// `Daily Safety Check-In & Alert`
  String get safetapDesc {
    return Intl.message(
      'Daily Safety Check-In & Alert',
      name: 'safetapDesc',
      desc: '',
      args: [],
    );
  }

  /// `Expense & Budget Tracker`
  String get spendlyDesc {
    return Intl.message(
      'Expense & Budget Tracker',
      name: 'spendlyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Drink Water & Hydration Tracker`
  String get waterReminderDesc {
    return Intl.message(
      'Drink Water & Hydration Tracker',
      name: 'waterReminderDesc',
      desc: '',
      args: [],
    );
  }

  /// `Bill Splitter & Tip Calculator`
  String get tipsplitDesc {
    return Intl.message(
      'Bill Splitter & Tip Calculator',
      name: 'tipsplitDesc',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'af'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fil'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'fr', countryCode: 'CA'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'hu'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      Locale.fromSubtags(languageCode: 'ro'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'th'),
      Locale.fromSubtags(languageCode: 'tr'),
      Locale.fromSubtags(languageCode: 'uk'),
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'zh'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
