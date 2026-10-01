part of '../flash_alert.dart';

class _FlashOnCell extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isSelected;
  final Widget? child;

  const _FlashOnCell({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.isSelected,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.medium,
        vertical: Spacing.medium,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? context.colorScheme.onInverseSurface
            : context.colorScheme.primaryContainer,
        borderRadius: ShapeBorderRadius.medium,
        border: Border.all(
          color: isSelected
              ? context.colorScheme.primary
              : Colors.transparent,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.colorScheme.surface.withColorOpacity(.70),
                  borderRadius: ShapeBorderRadius.small,
                ),
                child: Icon(
                  icon,
                  color: isSelected
                      ? context.colorScheme.primary
                      : context.colorScheme.onSurface.withColorOpacity(.50),
                  size: 24,
                ),
              ),

              Gap(Spacing.medium),

              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: context.colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Transform.scale(
                scale: 0.85,
                child: CupertinoSwitch(
                  applyTheme: true,
                  inactiveTrackColor:
                  context.colorScheme.onSurface.withColorOpacity(.20),
                  value: value,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),

          if (child != null) ...[
            Gap(Spacing.medium),
            child!,
          ],
        ],
      ),
    );
  }
}