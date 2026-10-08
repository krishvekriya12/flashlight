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
      if (activeInstance != this) return;
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

  static Future<void> stopRunningSos() async {
    if (activeInstance?.isSosRunning ?? false) {
      await activeInstance?.stopSos();
    }
  }

  Future<void> toggleFlash() async {
    if (isSosRunning) {
      await stopSos();
    }
    if (StroboscopeProvider.isStroboscopeRunning) {
      await StroboscopeProvider.stopRunningStrobe();
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
      await StroboscopeProvider.stopRunningStrobe();
    }

    _sosTimer?.cancel();
    _sosTimer = null;

    isSosRunning = true;
    _ignoreTorchCallback = true;
    unawaited(AppWakeLock.acquire(this));

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

    _sosTimer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
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
        _torchChannel.invokeMethod(shouldFlash ? 'turnOn' : 'turnOff').catchError((e) {
          debugPrint('SOS flashlight error: $e');
        });
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
    unawaited(AppWakeLock.release(this));
    notifyListeners();
    _ignoreTorchCallback = true;

    try {
      await _torchChannel.invokeMethod('turnOff');
    } catch (e) {
      debugPrint('SOS stop flashlight error: $e');
    }
    _ignoreTorchCallback = false;
    isFlashOn = false;
    if (context.mounted) notifyListeners();
  }

  @override
  void dispose() {
    if (activeInstance == this) {
      activeInstance = null;
      _torchChannel.setMethodCallHandler(null);
    }
    _sosTimer?.cancel();
    _sosTimer = null;
    if (isSosRunning) {
      unawaited(AppWakeLock.release(this));
    }
    if (isFlashOn || isSosRunning) {
      _torchChannel.invokeMethod('turnOff').catchError((e) {
        debugPrint('Flashlight dispose error: $e');
      });
    }
    super.dispose();
  }
}
