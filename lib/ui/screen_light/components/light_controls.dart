part of '../screen_light.dart';

class _LightControls extends StatelessWidget {
  const _LightControls();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ScreenLightProvider>();
    return Container(
      padding: EdgeInsets.only(top: context.padding.top + Spacing.normal),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: ShapeBorderRadius.large,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: CommonButton.cupertino(
              padding: EdgeInsets.only(right: Spacing.normal),
              onTap: provider.onToggleControls,
              child: Icon(Icons.close, color: context.colorScheme.onSurface),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Spacing.normal) +
                EdgeInsets.only(top: context.padding.top + Spacing.xLarge),
            child: _PresetSwatches(),
          ),
          Gap(Spacing.normal),
          Divider(color: context.colorScheme.surface),
          Gap(Spacing.normal),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.normal),
            child: _ColorPicker(),
          ),
          Padding(
            padding: EdgeInsets.all(Spacing.normal),
            child: _BrightnessSlider(),
          ),
        ],
      ),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [_ColorArea(), Gap(Spacing.normal), _ColorSlider()],
    );
  }
}

class _ColorArea extends StatelessWidget {
  const _ColorArea();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ScreenLightProvider>();
    final color = context.select<ScreenLightProvider, int>(
      (value) => value.color,
    );
    final hsvColor = HSVColor.fromColor(Color(color));
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxWidth * 0.6);
        return GestureDetector(
          onPanDown: (details) => provider.onColorChanged(
            _colorAt(details.localPosition, size, hsvColor),
          ),
          onPanUpdate: (details) => provider.onColorChanged(
            _colorAt(details.localPosition, size, hsvColor),
          ),
          child: ClipRRect(
            borderRadius: ShapeBorderRadius.medium,
            child: CustomPaint(
              size: size,
              painter: _ColorAreaPainter(
                hsvColor: hsvColor,
                pointerColor: context.colorScheme.onPrimary,
              ),
            ),
          ),
        );
      },
    );
  }

  Color _colorAt(Offset position, Size size, HSVColor hsvColor) {
    final hue = (position.dx / size.width).clamp(0.0, 1.0) * 360;
    final saturation = (position.dy / size.height).clamp(0.0, 1.0);
    return hsvColor
        .withHue(hue)
        .withSaturation(saturation)
        .withValue(1)
        .toColor();
  }
}

class _ColorSlider extends StatelessWidget {
  const _ColorSlider();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ScreenLightProvider>();
    final color = context.select<ScreenLightProvider, int>(
      (value) => value.color,
    );
    final hsvColor = HSVColor.fromColor(Color(color));
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: Spacing.xxLarge,
        trackShape: _ColorSliderTrackShape(hsvColor: hsvColor),
        thumbShape: _ColorSliderThumbShape(color: Color(color)),
        thumbSize: WidgetStatePropertyAll(Size(38, 38)),
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: Slider(
        value: 1 - hsvColor.saturation,
        onChanged: (value) => provider.onColorChanged(
          hsvColor.withSaturation(1 - value).withValue(1).toColor(),
        ),
      ),
    );
  }
}

class _ColorAreaPainter extends CustomPainter {
  final HSVColor hsvColor;
  final Color pointerColor;

  const _ColorAreaPainter({required this.hsvColor, required this.pointerColor});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final tintColor = HSVColor.fromAHSV(1, 0, 0, 1).toColor();
    final hueGradient = LinearGradient(
      colors: List.generate(
        7,
        (index) => HSVColor.fromAHSV(1, index * 60, 1, 1).toColor(),
      ),
    );
    final tintGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [tintColor, tintColor.withColorOpacity(0)],
    );
    canvas.drawRect(rect, Paint()..shader = hueGradient.createShader(rect));
    canvas.drawRect(rect, Paint()..shader = tintGradient.createShader(rect));
    canvas.drawCircle(
      Offset(
        size.width * hsvColor.hue / 360,
        size.height * hsvColor.saturation,
      ),
      9,
      Paint()
        ..color = pointerColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3,
    );
  }

  @override
  bool shouldRepaint(covariant _ColorAreaPainter oldDelegate) {
    return oldDelegate.hsvColor != hsvColor ||
        oldDelegate.pointerColor != pointerColor;
  }
}

class _ColorSliderTrackShape extends RoundedRectSliderTrackShape {
  final HSVColor hsvColor;

  const _ColorSliderTrackShape({required this.hsvColor});

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isDiscrete = false,
    bool isEnabled = true,
    double additionalActiveTrackHeight = 0,
  }) {
    final preferredRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    final trackRect = Rect.fromLTRB(
      offset.dx,
      preferredRect.top,
      offset.dx + parentBox.size.width,
      preferredRect.bottom,
    );
    final trackGradient = LinearGradient(
      colors: [
        hsvColor.withSaturation(1).withValue(1).toColor(),
        hsvColor.withSaturation(0).withValue(1).toColor(),
      ],
    );
    context.canvas.drawRRect(
      RRect.fromRectAndRadius(trackRect, Radius.circular(trackRect.height / 2)),
      Paint()..shader = trackGradient.createShader(trackRect),
    );
  }
}

class _ColorSliderThumbShape extends SliderComponentShape {
  final Color color;

  const _ColorSliderThumbShape({required this.color});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(28, 28);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter? labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final outerPaint = Paint()
      ..color = sliderTheme.thumbColor ?? color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 15, outerPaint);
    final innerPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 8, innerPaint);
  }
}

class _BrightnessSlider extends StatelessWidget {
  const _BrightnessSlider();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ScreenLightProvider>();
    final brightness = context.select<ScreenLightProvider, double>(
      (value) => value.brightness,
    );
    return Row(
      children: [
        Icon(Icons.sunny, color: context.colorScheme.onSurface),
        Gap(Spacing.normal),
        Expanded(
          child: Slider(
            value: brightness,
            onChanged: provider.onBrightnessChanged,
          ),
        ),
      ],
    );
  }
}
