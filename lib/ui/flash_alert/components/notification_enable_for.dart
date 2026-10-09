part of '../flash_alert.dart';

class _NotificationEnableFor extends StatelessWidget {
  const _NotificationEnableFor({super.key});
  @override
  Widget build(BuildContext context) {
    final p = context.watch<FlashAlertProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.enableFor, style: context.textTheme.titleLarge),
        const Gap(Spacing.normal),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _EnableCell(
                isSelected: p.enableForRing,
                icon: Icons.volume_up_rounded,
                title: context.l10n.ring,
                onTap: () => p.toggleEnableForRing(!p.enableForRing),
              ),
            ),
            const Gap(Spacing.small),
            Expanded(
              child: _EnableCell(
                isSelected: p.enableForVibrate,
                icon: Icons.vibration_rounded,
                title: context.l10n.vibrate,
                onTap: () => p.toggleEnableForVibrate(!p.enableForVibrate),
              ),
            ),
            const Gap(Spacing.small),
            Expanded(
              child: _EnableCell(
                isSelected: p.enableForSilent,
                icon: Icons.volume_off_rounded,
                title: context.l10n.silent,
                onTap: () => p.toggleEnableForSilent(!p.enableForSilent),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _EnableCell extends StatelessWidget {
  const _EnableCell({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.title,
    this.onTap,
  });
  final bool isSelected;
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Semantics(
    toggled: isSelected,
    child: CommonButton.cupertino(
      onTap: onTap,
      child: ExpressiveSurface(
        selected: isSelected,
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.small,
          vertical: Spacing.normal,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? context.colorScheme.onPrimaryContainer
                  : context.colorScheme.onSurfaceVariant,
              size: AppDesign.iconSize,
            ),
            const Gap(Spacing.normal),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.textTheme.labelLarge,
            ),
          ],
        ),
      ),
    ),
  );
}
