part of '../flash_alert.dart';

class _NotificationEnableFor extends StatelessWidget {
  const _NotificationEnableFor({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<FlashAlertProvider>();
    final enableForRing = context.select<FlashAlertProvider, bool>((value) => value.enableForRing);
    final enableForVibrate = context.select<FlashAlertProvider, bool>((value) => value.enableForVibrate);
    final enableForSilent = context.select<FlashAlertProvider, bool>((value) => value.enableForSilent);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.enableFor,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
        Gap(Spacing.small),
        Divider(color: context.colorScheme.onSurfaceVariant.withColorOpacity(.70)),
        Gap(Spacing.medium),
        Row(
          children: [
            Expanded(
              child: _EnableCell(
                isSelected: enableForRing,
                icon: CupertinoIcons.volume_up,
                title: context.l10n.ring,
                onTap: () {
                  provider.toggleEnableForRing(!enableForRing);
                },
              ),
            ),
            Gap(Spacing.small),
            Expanded(
              child: _EnableCell(
                isSelected: enableForVibrate,
                icon: Icons.vibration,
                title: context.l10n.vibrate,
                onTap: () {
                  provider.toggleEnableForVibrate(!enableForVibrate);
                },
              ),
            ),
            Gap(Spacing.small),
            Expanded(
              child: _EnableCell(
                isSelected: enableForSilent,
                icon: CupertinoIcons.volume_off,
                title: context.l10n.silent,
                onTap: () {
                  provider.toggleEnableForSilent(!enableForSilent);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _EnableCell extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const _EnableCell({super.key, required this.isSelected, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CommonButton.cupertino(
      onTap: onTap,
      child: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(vertical: Spacing.large),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colorScheme.onInverseSurface
              : context.colorScheme.primaryContainer,
          borderRadius: ShapeBorderRadius.medium,
          border: isSelected ? Border.all(color: context.colorScheme.primary) : null,
        ),
        child: Column(
          children: [
            Container(
              height: 44,
              width: 44,
              padding: EdgeInsets.all(Spacing.xSmall),
              decoration: BoxDecoration(
                color: context.colorScheme.surface.withColorOpacity(.70),
                borderRadius: ShapeBorderRadius.small,
              ),
              child: Icon(
                icon,
                color: isSelected ? context.colorScheme.primary : context.colorScheme.onSurface.withColorOpacity(.50),
                size: 24,
              ),
            ),
            Gap(Spacing.medium),
            Text(
              title,
              style: context.textTheme.titleSmall?.copyWith(
                color: context.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
