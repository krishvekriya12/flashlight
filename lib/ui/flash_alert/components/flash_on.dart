part of '../flash_alert.dart';

class _FlashOn extends StatelessWidget {
  const _FlashOn({super.key});

  @override
  Widget build(BuildContext context) {
    final incomingCall = context.select<FlashAlertProvider, bool>(
          (provider) => provider.incomingCall,
    );

    final incomingSms = context.select<FlashAlertProvider, bool>(
          (provider) => provider.incomingSms,
    );

    final shakeToToggle = context.select<FlashAlertProvider, bool>(
          (provider) => provider.shakeToToggle,
    );

    final notifications = context.select<FlashAlertProvider, bool>(
          (provider) => provider.notifications,
    );

    final provider = context.read<FlashAlertProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.flashOn,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),

        Gap(Spacing.small),

        Divider(
          color: context.colorScheme.onSurfaceVariant.withColorOpacity(.70),
        ),

        Gap(Spacing.medium),

        _FlashOnCell(
          icon: Icons.call,
          title: context.l10n.incomingCall,
          value: incomingCall,
          onChanged: provider.toggleIncomingCall,
          isSelected: incomingCall,
        ),

        Gap(Spacing.medium),

        _FlashOnCell(
          icon: Icons.sms,
          title: context.l10n.incomingSms,
          value: incomingSms,
          onChanged: provider.toggleIncomingSms,
          isSelected: incomingSms,
        ),

        Gap(Spacing.medium),

        _FlashOnCell(
          icon: Icons.crop_rotate_sharp,
          title: context.l10n.shakeNotificationTitle,
          value: shakeToToggle,
          onChanged: provider.toggleShakeToToggle,
          isSelected: shakeToToggle,
        ),

        Gap(Spacing.medium),

        _FlashOnCell(
          icon: Icons.notifications,
          title: context.l10n.notifications,
          value: notifications,
          onChanged: provider.toggleNotifications,
          isSelected: notifications,
          child: notifications
              ? _ChooseAppsCell(
            onTap: () {
              context.navigator.pushNamed(ChooseAppScreen.routeName);
            },
          )
              : null,
        ),

      ],
    );
  }
}

class _ChooseAppsCell extends StatelessWidget {
  final VoidCallback onTap;

  const _ChooseAppsCell({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton.cupertino(
      onTap: onTap,
      child: Column(
        children: [
          Divider(
            color: context.colorScheme.onSurfaceVariant,
          ),

          Gap(Spacing.normal),

          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.chooseApp,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Icon(
                Icons.chevron_right_rounded,
                color: context.colorScheme.onSurfaceVariant,
                size: 28,
              ),
            ],
          ),
        ],
      ),
    );
  }
}