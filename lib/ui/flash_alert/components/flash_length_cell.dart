part of '../flash_alert.dart';

class _FlashLengthCell extends StatelessWidget {
  const _FlashLengthCell({
    required this.title,
    required this.value,
    required this.sliderValue,
    required this.onChanged,
  });
  final String title;
  final int value;
  final double sliderValue;
  final ValueChanged<double> onChanged;
  @override
  Widget build(BuildContext context) => ExpressiveSurface(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textTheme.titleMedium),
        const Gap(Spacing.small),
        Text(
          '${value}ms',
          style: context.textTheme.headlineSmall?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
        Semantics(
          label: title,
          child: AppSlider(
            min: 0,
            max: 4,
            divisions: 4,
            value: sliderValue,
            onChanged: onChanged,
          ),
        ),
      ],
    ),
  );
}
