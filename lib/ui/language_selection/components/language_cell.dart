part of '../language_selection.dart';

class _LanguageCell extends StatelessWidget {
  const _LanguageCell({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.showHighlight,
    required this.icon,
    required this.title,
  });
  final VoidCallback onTap;
  final bool isSelected;
  final bool showHighlight;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) => Semantics(
    selected: isSelected,
    button: true,
    label: title,
    onTap: onTap,
    child: ExcludeSemantics(
      child: CommonButton.cupertino(
        onTap: onTap,
        child: ExpressiveSurface(
          selected: isSelected,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: ShapeBorderRadius.normal,
                child: SvgPicture.asset(
                  icon,
                  width: AppDesign.touchTarget,
                  height: AppDesign.touchTarget,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(Spacing.normal),
              Expanded(
                child: Text(title, style: context.textTheme.titleMedium),
              ),
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
    ),
  );
}
