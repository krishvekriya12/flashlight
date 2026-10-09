part of '../flash_alert.dart';

class _TestFlashButton extends StatelessWidget {
  const _TestFlashButton({
    required this.text,
    required this.isSelected,
    required this.isLoading,
    required this.onTap,
  });
  final String text;
  final bool isSelected;
  final bool isLoading;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Semantics(
    selected: isSelected,
    child: CommonButton.cupertino(
      onTap: isLoading ? null : onTap,
      child: ExpressiveSurface(
        selected: isSelected,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected && isLoading)
              const ExpressiveLoader(size: AppDesign.iconSize),
            Text(
              text,
              textAlign: TextAlign.center,
              style: context.textTheme.labelLarge,
            ),
          ],
        ),
      ),
    ),
  );
}
