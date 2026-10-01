part of 'screen_light.dart';

final class ScreenLightProvider extends BaseProvider {
  ScreenLightProvider({required super.context});
  int selectedIndex = 0;

  bool showControls = false;
  bool showBottomNav = true;

  void selectTab(int index) {
    selectedIndex = index;
    showBottomNav = false;

    if (index == 0) {
      showControls = true;
      _stopBlink();
    } else {
      showControls = false;
      _startBlink();
    }

    notifyListeners();
  }

  void onToggleControls() {
    showControls = !showControls;
    showBottomNav = !showControls;

    notifyListeners();
  }
  final _screenBrightness = ScreenBrightness();

  int color = AppConstant.screenLightDefaultColor;
  int presetIndex = AppConstant.screenLightCustomIndex;
  double brightness = 1.0;

  int blinkProgress = 2;

  bool isBlinkVisible = true;

  Timer? _blinkTimer;

  @override
  void initState() {
    super.initState();
    color = preference.screenLightColor;
    presetIndex = preference.screenLightPresetIndex;
    _keepScreenOn(true);
    _applyBrightness(brightness);
  }

  // void onToggleControls() {
  //   showControls = !showControls;
  //   // Controls visible = bottom nav hidden.
  //   // Controls hidden = bottom nav visible.
  //   showBottomNav = !showControls;
  //
  //   notifyListeners();
  // }
  //
  // void selectTab(int index) {
  //   selectedIndex = index;
  //   showControls = true;
  //
  //   if (index == 1) {
  //     showBottomNav = false;
  //     _startBlink();
  //   } else {
  //     showBottomNav = true;
  //     _stopBlink();
  //   }
  //
  //   notifyListeners();
  // }

  void _stopBlink() {
    _blinkTimer?.cancel();
    _blinkTimer = null;

    isBlinkVisible = true;
  }
  void onSelectPreset(int index) {
    presetIndex = index;

    if (index != AppConstant.screenLightCustomIndex) {
      color = AppConstant.screenLightPresets[index];
    }

    _saveColor();
    _fireScreenLightChanged();

    notifyListeners();
  }

  void onColorChanged(Color value) {
    color = value.toARGB32();
    presetIndex = AppConstant.screenLightCustomIndex;

    _saveColor();
    _fireScreenLightChanged();

    notifyListeners();
  }

  void onBrightnessChanged(double value) {
    brightness = value;

    _applyBrightness(value);
    _fireScreenLightChanged();

    notifyListeners();
  }

  void onBlinkProgressChanged(double value) {
    blinkProgress = value.round();

    _startBlink();
    _fireScreenLightChanged();

    notifyListeners();
  }

  void _startBlink() {
    _blinkTimer?.cancel();

    isBlinkVisible = true;

    if (blinkProgress == 0) {
      return;
    }

    final interval = switch (blinkProgress) {
      1 => 1000.milliseconds,
      2 => 750.milliseconds,
      3 => 500.milliseconds,
      4 => 300.milliseconds,
      5 => 150.milliseconds,
      _ => 750.milliseconds,
    };

    _blinkTimer = Timer.periodic(interval, (timer) {
      isBlinkVisible = !isBlinkVisible;
      notifyListeners();
    });
  }


  void _saveColor() {
    preference.screenLightColor = color;
    preference.screenLightPresetIndex = presetIndex;
  }

  void _fireScreenLightChanged() {
    eventBus.fire(
      ScreenLightChangedEvent(
        color: color,
        presetIndex: presetIndex,
        brightness: brightness,
        blinkProgress: blinkProgress,
      ),
    );
  }

  Future<void> _applyBrightness(double brightness) async {
    try {
      await _screenBrightness.setApplicationScreenBrightness(brightness);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _resetBrightness() async {
    try {
      await _screenBrightness.resetApplicationScreenBrightness();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _keepScreenOn(bool enabled) async {
    try {
      await WakelockPlus.toggle(enable: enabled);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    _blinkTimer?.cancel();

    _keepScreenOn(false);
    _resetBrightness();

    super.dispose();
  }
}

final class ScreenLightChangedEvent {
  final int color;
  final int presetIndex;
  final double brightness;
  final int blinkProgress;

  const ScreenLightChangedEvent({
    required this.color,
    required this.presetIndex,
    required this.brightness,
    required this.blinkProgress,
  });
}

final eventBus = EventBus();
final class EventBus {
  final StreamController<Object> _controller = StreamController<Object>.broadcast();

  Stream<T> on<T>() {
    return _controller.stream.where((event) => event is T).cast<T>();
  }

  void fire(Object event) {
    if (!_controller.isClosed) {
      _controller.add(event);
    }
  }

  Future<void> dispose() async {
    await _controller.close();
  }
}
