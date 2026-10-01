import 'package:flutter/material.dart';

class AppSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final double min;
  final double max;
  final int? divisions;
  final double? trackHeight;
  final double? thumbRadius;
  final EdgeInsetsGeometry padding;

  const AppSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 1,
    this.divisions,
    this.trackHeight,
    this.thumbRadius,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    final sliderTheme = SliderTheme.of(context);
    return SliderTheme(
      data: sliderTheme.copyWith(
        trackHeight: trackHeight ?? sliderTheme.trackHeight,
        thumbShape: thumbRadius == null
            ? sliderTheme.thumbShape
            : RoundSliderThumbShape(enabledThumbRadius: thumbRadius!),
      ),

      child: Slider(value: value, min: min, max: max, divisions: divisions, padding: padding, onChanged: onChanged),
    );
  }
}
