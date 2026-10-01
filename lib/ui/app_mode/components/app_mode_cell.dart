part of '../app_mode.dart';

class _AppModeCell extends StatelessWidget {
  final Widget icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _AppModeCell({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton.cupertino(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Spacing.medium,
          vertical: Spacing.medium,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.primaryContainer,
          borderRadius: ShapeBorderRadius.medium,
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary
                : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            icon,
            Gap(Spacing.medium),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check,
                color: context.colorScheme.primary,
                fontWeight: FontWeight.w500,
                size: 34,
              ),
          ],
        ),
      ),
    );
  }
}
