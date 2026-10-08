part of 'flash_alert.dart';

final class FlashAlertProvider extends BaseProvider with WidgetsBindingObserver {
  FlashAlertProvider({required super.context}) {
    enableForRing = preference.enableForRing;
    enableForVibrate = preference.enableForVibrate;
    enableForSilent = preference.enableForSilent;

    WidgetsBinding.instance.addObserver(this);

    _loadFlashAlertSettings();
  }
  bool incomingCall = false;
  bool incomingSms = false;
  bool shakeToToggle = false;
  bool notifications = false;

  static const MethodChannel _torchChannel = MethodChannel('flashlight/torch');
  static const MethodChannel _settingsChannel = MethodChannel('flashlight/settings');

  bool _flashlightOn = false;

  Future<void> toggleIncomingCall(bool value) async {
    debugPrint('CALL TOGGLE: $value');

    if (value) {
      final status = await Permission.phone.request();

      debugPrint('CALL PERMISSION: $status');
      debugPrint('CALL GRANTED: ${status.isGranted}');
      debugPrint('CALL DENIED: ${status.isDenied}');
      debugPrint('CALL PERMANENTLY DENIED: ${status.isPermanentlyDenied}');

      if (!status.isGranted) {
        if (status.isPermanentlyDenied) {
          await openAppSettings();
        }
        return;
      }
    }

    await _settingsChannel.invokeMethod('setCallEnabled', {'enabled': value});
    incomingCall = value;
    notifyListeners();
  }

  Future<void> toggleIncomingSms(bool value) async {
    debugPrint('SMS TOGGLE: $value');

    if (value) {
      final status = await Permission.sms.request();

      debugPrint('SMS PERMISSION: $status');
      debugPrint('SMS GRANTED: ${status.isGranted}');
      debugPrint('SMS DENIED: ${status.isDenied}');
      debugPrint(
        'SMS PERMANENTLY DENIED: ${status.isPermanentlyDenied}',
      );

      if (!status.isGranted) {
        if (status.isPermanentlyDenied) {
          await openAppSettings();
        }
        return;
      }
    }

    try {
      await _settingsChannel.invokeMethod(
        'setSmsEnabled',
        {'enabled': value},
      );

      incomingSms = value;
      notifyListeners();

      debugPrint(
        'SMS FEATURE ${value ? 'ENABLED' : 'DISABLED'}',
      );
    } on PlatformException catch (e) {
      debugPrint(
        'SMS SETTING ERROR: ${e.code} - ${e.message}',
      );
    } catch (e) {
      debugPrint(
        'SMS SETTING ERROR: $e',
      );
    }
  }

  Future<void> toggleShakeToToggle(bool value) async {
    try {
      await _settingsChannel.invokeMethod('setShakeEnabled', {'enabled': value});
    } catch (e) {
      debugPrint('SHAKE SETTING ERROR: $e');
      return;
    }

    shakeToToggle = value;

    if (!value && _flashlightOn) {
      await _setFlashlight(false);
    }
    notifyListeners();
  }
  Future<void> _loadFlashAlertSettings() async {
    try {
      final settings =
      await _settingsChannel.invokeMapMethod<String, dynamic>(
        'getFlashAlertSettings',
      );

      if (settings == null) {
        return;
      }
      if (!context.mounted) return;

      incomingCall = settings['call'] as bool? ?? false;
      incomingSms = settings['sms'] as bool? ?? false;
      shakeToToggle = settings['shake'] as bool? ?? false;
      notifications = settings['notification'] as bool? ?? false;

      enableForRing = settings['ring'] as bool? ?? true;
      enableForVibrate = settings['vibrate'] as bool? ?? true;
      enableForSilent = settings['silent'] as bool? ?? true;

      onLength = settings['onLength'] as int? ?? 300;
      offLength = settings['offLength'] as int? ?? 300;

      notifyListeners();

      checkNotificationAccess();
    } catch (e) {
      debugPrint('LOAD FLASH ALERT SETTINGS ERROR: $e');
    }
  }
  void chooseApps() {
    if (!notifications) {
      return;
    }

    _settingsChannel.invokeMethod('openNotificationAccessSettings');
  }

  Future<void> toggleNotifications(bool value) async {
    debugPrint('NOTIFICATION TOGGLE: $value');

    if (!value) {
      notifications = false;
      notifyListeners();

      await _settingsChannel.invokeMethod(
        'setNotificationEnabled',
        {'enabled': false},
      );

      debugPrint('NOTIFICATION FEATURE DISABLED');
      return;
    }

    final hasAccess = await _ensureNotificationAccess();

    if (!hasAccess) {
      return;
    }

    await _enableNotifications();
  }
  Future<void> _enableNotifications() async {
    try {
      await _settingsChannel.invokeMethod(
        'setNotificationEnabled',
        {'enabled': true},
      );

      notifications = true;
      notifyListeners();

      debugPrint('NOTIFICATION FEATURE ENABLED');
    } on PlatformException catch (e) {
      debugPrint(
        'NOTIFICATION ENABLE ERROR: ${e.code} - ${e.message}',
      );
    } catch (e) {
      debugPrint('NOTIFICATION ENABLE ERROR: $e');
    }
  }

  Future<bool> _ensureNotificationAccess() async {
    final accessEnabled =
        await _settingsChannel.invokeMethod<bool>(
          'hasNotificationAccess',
        ) ??
            false;

    if (accessEnabled) {
      return true;
    }

    if (!context.mounted) return false;

    await _NotificationPermissionDialog.show(
      context: context,
    );

    return false;
  }
  Future<void> checkNotificationAccess() async {
    try {
      final enabled =
          await _settingsChannel.invokeMethod<bool>(
            'hasNotificationAccess',
          ) ??
              false;

      debugPrint(
        'NOTIFICATION ACCESS FROM ANDROID: $enabled',
      );

      if (!enabled) {
        if (notifications) {
          notifications = false;

          await _settingsChannel.invokeMethod(
            'setNotificationEnabled',
            {'enabled': false},
          );

          notifyListeners();
        }

        return;
      }

      debugPrint('NOTIFICATION ACCESS GRANTED');
    } catch (e) {
      debugPrint(
        'NOTIFICATION ACCESS ERROR: $e',
      );
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      debugPrint('APP RESUMED - CHECKING NOTIFICATION ACCESS');
      checkNotificationAccess();
    }
  }

  //Manual flashlight
  Future<void> _setFlashlight(bool value) async {
    try {
      await _torchChannel.invokeMethod<void>(value ? 'turnOn' : 'turnOff');
      _flashlightOn = value;
      debugPrint('FLASHLIGHT: ${value ? 'ON' : 'OFF'}');
    } on PlatformException catch (e) {
      debugPrint('FLASHLIGHT ERROR: ${e.code} - ${e.message}');
    } catch (e) {
      debugPrint('FLASHLIGHT ERROR: $e');
    }
  }

  static const List<int> flashLengthValues = <int>[300, 600, 900, 1200, 1500];

  int onLength = 300;
  int offLength = 300;

  bool _isTestingFlash = false;

  bool get isTestingFlash => _isTestingFlash;

  //on length
  int get onLengthIndex {
    final index = flashLengthValues.indexOf(onLength);
    return index == -1 ? 1 : index;
  }

  void setOnLength(double value) {
    final index = value.round().clamp(0, flashLengthValues.length - 1);

    final selectedValue = flashLengthValues[index];

    if (onLength == selectedValue) {
      return;
    }

    onLength = selectedValue;
    notifyListeners();
    _saveFlashLengths();
  }

  //off length
  int get offLengthIndex {
    final index = flashLengthValues.indexOf(offLength);
    return index == -1 ? 0 : index;
  }

  void setOffLength(double value) {
    final index = value.round().clamp(0, flashLengthValues.length - 1);

    final selectedValue = flashLengthValues[index];

    if (offLength == selectedValue) {
      return;
    }

    offLength = selectedValue;
    notifyListeners();
    _saveFlashLengths();
  }

  Future<void> _saveFlashLengths() async {
    try {
      await _settingsChannel.invokeMethod('setFlashLength', {
        'onLength': onLength,
        'offLength': offLength,
      });
    } catch (e) {
      debugPrint('SAVE FLASH LENGTHS ERROR: $e');
    }
  }

  Future<void> testFlashOn() async {
    if (_isTestingFlash) {
      return;
    }
    _isTestingFlash = true;
    notifyListeners();
    try {
      await _setFlashlight(true);
      await Future.delayed(Duration(milliseconds: onLength));
      await _setFlashlight(false);
    } finally {
      _isTestingFlash = false;
      if (context.mounted) notifyListeners();
    }
  }

  Future<void> testFlashOff() async {
    if (_isTestingFlash) {
      return;
    }
    _isTestingFlash = true;
    notifyListeners();
    try {
      await _setFlashlight(true);
      await Future.delayed(Duration(milliseconds: onLength));
      await _setFlashlight(false);
      await Future.delayed(Duration(milliseconds: offLength));
      await _setFlashlight(true);
      await Future.delayed(Duration(milliseconds: onLength));
      await _setFlashlight(false);
    } finally {
      _isTestingFlash = false;
      if (context.mounted) notifyListeners();
    }
  }

  bool? isTestOnSelected;

  void selectTestOn(bool value) {
    isTestOnSelected = value;
    notifyListeners();
  }

  //enable for
  bool enableForRing = true;
  bool enableForVibrate = true;
  bool enableForSilent = true;

  Future<void> toggleEnableForRing(bool value) async {
    enableForRing = value;
    preference.enableForRing = value;
    notifyListeners();

    await _settingsChannel.invokeMethod('setCallFlashMode', {'mode': 'ring', 'enabled': value});
  }

  Future<void> toggleEnableForVibrate(bool value) async {
    enableForVibrate = value;
    preference.enableForVibrate = value;
    notifyListeners();

    await _settingsChannel.invokeMethod('setCallFlashMode', {'mode': 'vibrate', 'enabled': value});
  }

  Future<void> toggleEnableForSilent(bool value) async {
    enableForSilent = value;
    preference.enableForSilent = value;
    notifyListeners();

    await _settingsChannel.invokeMethod('setCallFlashMode', {'mode': 'silent', 'enabled': value});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
