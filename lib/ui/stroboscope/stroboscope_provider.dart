part of 'stroboscope.dart';

final class StroboscopeProvider extends BaseProvider {
  StroboscopeProvider({required super.context});

  static const MethodChannel _torchChannel = MethodChannel('flashlight/torch');
  static bool isStroboscopeRunning = false;
  static StroboscopeProvider? activeInstance;

  bool isFlashOn = false;
  double flashInterval = 500;
  int _session = 0;

  @override
  void initState() {
    super.initState();
    activeInstance = this;
  }

  static void stopRunningStrobe() {
    if (isStroboscopeRunning) {
      activeInstance?.stopStrobe();
    }
  }

  @override
  void dispose() {
    if (activeInstance == this) {
      activeInstance = null;
    }
    _session++;
    isFlashOn = false;
    isStroboscopeRunning = false;
    WakelockPlus.disable();

    _torchChannel.invokeMethod('turnOff');

    super.dispose();
  }

  Future<void> toggleStrobe() async {
    if (isFlashOn) {
      await stopStrobe();
    } else {
      await startStrobe();
    }
  }

  Future<void> startStrobe() async {
    if (isFlashOn) {
      return;
    }

    FlashLightSosProvider.stopRunningSos();

    isFlashOn = true;
    isStroboscopeRunning = true;
    WakelockPlus.enable();
    notifyListeners();
    _runStrobeLoop();
  }

  Future<void> stopStrobe() async {
    if (!isFlashOn) {
      return;
    }
    _session++;
    isFlashOn = false;
    isStroboscopeRunning = false;
    WakelockPlus.disable();

    try {
      await _torchChannel.invokeMethod('turnOff');
    } catch (e) {
      debugPrint('Stroboscope stop error: $e');
    }

    notifyListeners();
  }

  void changeFlashInterval(double value) {
    flashInterval = value;
    notifyListeners();
  }

  Future<void> _runStrobeLoop() async {
    final currentSession = ++_session;
    while (isFlashOn && _session == currentSession) {
      final half = (flashInterval / 2).round().clamp(40, 250);
      try {
        await _torchChannel.invokeMethod('turnOn');
        await Future.delayed(Duration(milliseconds: half));
        if (!isFlashOn || _session != currentSession) {
          break;
        }
        await _torchChannel.invokeMethod('turnOff');
        await Future.delayed(Duration(milliseconds: half));
      } catch (e) {
        debugPrint('Stroboscope error: $e');
        if (_session == currentSession) {
          isFlashOn = false;
          isStroboscopeRunning = false;
          WakelockPlus.disable();
          notifyListeners();
        }
        break;
      }
    }
    if (_session == currentSession) {
      try {
        await _torchChannel.invokeMethod('turnOff');
      } catch (_) {}
    }
  }
}
