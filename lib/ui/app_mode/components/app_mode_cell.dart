part of '../app_mode.dart';

class _AppModeCell extends StatelessWidget {
  const _AppModeCell({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final Widget icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Semantics(
    selected: isSelected,
    child: CommonButton.cupertino(
      onTap: onTap,
      child: ExpressiveSurface(
        selected: isSelected,
        child: Row(
          children: [
            SizedBox(
              width: AppDesign.touchTarget,
              height: AppDesign.touchTarget,
              child: icon,
            ),
            const Gap(Spacing.normal),
            Expanded(child: Text(title, style: context.textTheme.titleMedium)),
            const Gap(Spacing.small),
            Icon(
              isSelected
                  ? Icons.check_circle_rounded
                  : Icons.radio_button_unchecked_rounded,
              color: isSelected
                  ? context.colorScheme.primary
                  : context.colorScheme.outline,
            ),
          ],
        ),
      ),
    ),
  );
}
