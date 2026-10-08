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

  static Future<void> stopRunningStrobe() async {
    if (isStroboscopeRunning) {
      await activeInstance?.stopStrobe();
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
    unawaited(AppWakeLock.release(this));

    _torchChannel.invokeMethod('turnOff').catchError((e) {
      debugPrint('Stroboscope dispose error: $e');
    });

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

    await FlashLightSosProvider.stopRunningSos();

    isFlashOn = true;
    isStroboscopeRunning = true;
    unawaited(AppWakeLock.acquire(this));
    if (context.mounted) notifyListeners();
    _runStrobeLoop();
  }

  Future<void> stopStrobe() async {
    if (!isFlashOn) {
      return;
    }
    _session++;
    isFlashOn = false;
    isStroboscopeRunning = false;
    unawaited(AppWakeLock.release(this));

    try {
      await _torchChannel.invokeMethod('turnOff');
    } catch (e) {
      debugPrint('Stroboscope stop error: $e');
    }

    if (context.mounted) notifyListeners();
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
          unawaited(AppWakeLock.release(this));
          if (context.mounted) notifyListeners();
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
