part of '../flash_alert.dart';

class _TestFlashButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isLoading;
  final VoidCallback onTap;

  const _TestFlashButton({required this.text, required this.isSelected, required this.isLoading, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CommonButton.cupertino(
      onTap: isLoading ? null : onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Spacing.medium, vertical: Spacing.medium),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colorScheme.onInverseSurface
              : context.colorScheme.primaryContainer,
          borderRadius: ShapeBorderRadius.medium,
          border: isSelected ? Border.all(color: context.colorScheme.primary) : null,
        ),
        child: Center(
          child: Text(
            text,
            style: context.textTheme.titleSmall?.copyWith(
              color: isSelected ? context.colorScheme.primary : context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
