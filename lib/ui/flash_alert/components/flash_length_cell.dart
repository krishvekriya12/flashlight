part of '../flash_alert.dart';

class _FlashLengthCell extends StatelessWidget {
  final String title;
  final int value;
  final double sliderValue;
  final ValueChanged<double> onChanged;

  const _FlashLengthCell({
    required this.title,
    required this.value,
    required this.sliderValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.only(left: Spacing.medium, right: Spacing.medium, top: Spacing.large, bottom: Spacing.small),
      decoration: BoxDecoration(color: context.colorScheme.primaryContainer, borderRadius: ShapeBorderRadius.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '${value}ms',
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
            child: Slider(
              thumbColor: context.colorScheme.primary,
              secondaryActiveColor: context.colorScheme.onSurface,
              padding: EdgeInsets.zero,
              value: sliderValue,
              min: 0,
              max: 4,
              divisions: 4,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
