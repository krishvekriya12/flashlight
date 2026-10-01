part of '../screen_light.dart';
class _TapHint extends StatelessWidget {
  const _TapHint();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Spacing.medium, vertical: Spacing.small),
        decoration: BoxDecoration(
          color: context.colorScheme.surface.withColorOpacity(0.8),
          borderRadius: ShapeBorderRadius.large,
        ),
        child: Text(
          context.l10n.tapScreenToHideControls,
          style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurface),
        ),
      ),
    );
  }
}
