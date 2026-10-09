part of '../flash_alert.dart';

class _FlashOnCell extends StatelessWidget {
  const _FlashOnCell({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.isSelected,
    this.child,
  });
  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isSelected;
  final Widget? child;
  @override
  Widget build(BuildContext context) => ExpressiveSurface(
    selected: isSelected,
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: AppDesign.touchTarget,
              height: AppDesign.touchTarget,
              decoration: BoxDecoration(
                color: context.colorScheme.secondaryContainer,
                borderRadius: ShapeBorderRadius.normal,
              ),
              child: Icon(
                icon,
                color: context.colorScheme.onSecondaryContainer,
              ),
            ),
            const Gap(Spacing.medium),
            Expanded(child: Text(title, style: context.textTheme.titleMedium)),
            const Gap(Spacing.small),
            Semantics(
              label: title,
              child: Switch(
                value: value,
                onChanged: (next) {
                  HapticFeedback.selectionClick();
                  onChanged(next);
                },
              ),
            ),
          ],
        ),
        if (child != null) ...[const Gap(Spacing.normal), child!],
      ],
    ),
  );
}
