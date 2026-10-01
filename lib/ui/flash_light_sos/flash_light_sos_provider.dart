part of 'flash_light_sos.dart';

final class FlashLightSosProvider extends BaseProvider {
  FlashLightSosProvider({required super.context});

  static const MethodChannel _torchChannel = MethodChannel('flashlight/torch');
  static FlashLightSosProvider? activeInstance;

  bool isFlashOn = false;
  bool isSosRunning = false;
  Timer? _sosTimer;
  bool _ignoreTorchCallback = false;

  @override
  void initState() {
    super.initState();
    activeInstance = this;

    _torchChannel.setMethodCallHandler((call) async {
      if (call.method != 'torchStateChanged') {
        return;
      }
      if (_ignoreTorchCallback) {
        return;
      }
      if (StroboscopeProvider.isStroboscopeRunning) {
        return;
      }
      isFlashOn = call.arguments == true;
      notifyListeners();
    });
  }

  static void stopRunningSos() {
    if (activeInstance?.isSosRunning ?? false) {
      activeInstance?.stopSos();
    }
  }

  Future<void> toggleFlash() async {
    if (isSosRunning) {
      await stopSos();
    }
    if (StroboscopeProvider.isStroboscopeRunning) {
      StroboscopeProvider.stopRunningStrobe();
    }
    try {
      if (isFlashOn) {
        await _torchChannel.invokeMethod('turnOff');
      } else {
        await _torchChannel.invokeMethod('turnOn');
      }
    } catch (e) {
      debugPrint('Flashlight error: $e');
    }
  }

  Future<void> toggleSos() async {
    if (isSosRunning) {
      await stopSos();
    } else {
      await startSos();
    }
  }

  Future<void> startSos() async {
    if (isSosRunning) {
      return;
    }
    if (StroboscopeProvider.isStroboscopeRunning) {
      StroboscopeProvider.stopRunningStrobe();
    }

    _sosTimer?.cancel();
    _sosTimer = null;

    isSosRunning = true;
    _ignoreTorchCallback = true;
    WakelockPlus.enable();

    notifyListeners();

    const pattern = <bool>[
      true,
      false,
      true,
      false,
      true,
      false,

      false,
      false,

      true,
      true,
      true,
      false,
      true,
      true,
      true,
      false,
      true,
      true,
      true,

      false,
      false,

      true,
      false,
      true,
      false,
      true,
      false,

      false,
      false,
    ];

    int index = 0;
    bool? currentTorchOn;

    _sosTimer = Timer.periodic(const Duration(milliseconds: 200), (timer) async {
      if (!isSosRunning) {
        timer.cancel();
        return;
      }

      if (index >= pattern.length) {
        index = 0;
      }

      final shouldFlash = pattern[index];

      if (shouldFlash != currentTorchOn) {
        currentTorchOn = shouldFlash;
        try {
          await _torchChannel.invokeMethod(shouldFlash ? 'turnOn' : 'turnOff');
        } catch (e) {
          debugPrint('SOS flashlight error: $e');
        }
      }

      index++;
    });
  }

  Future<void> stopSos() async {
    if (!isSosRunning) {
      return;
    }

    isSosRunning = false;
    _sosTimer?.cancel();
    _sosTimer = null;
    WakelockPlus.disable();
    notifyListeners();
    _ignoreTorchCallback = true;

    try {
      await _torchChannel.invokeMethod('turnOff');
    } catch (e) {
      debugPrint('SOS stop flashlight error: $e');
    }
    _ignoreTorchCallback = false;
    isFlashOn = false;
    notifyListeners();
  }

  @override
  void dispose() {
    if (activeInstance == this) {
      activeInstance = null;
    }
    _sosTimer?.cancel();
    _sosTimer = null;
    if (isSosRunning) {
      WakelockPlus.disable();
    }
    if (isFlashOn || isSosRunning) {
      _torchChannel.invokeMethod('turnOff');
    }
    super.dispose();
  }
}
