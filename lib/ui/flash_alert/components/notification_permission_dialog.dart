part of '../flash_alert.dart';

class _NotificationPermissionDialog extends StatelessWidget {
  const _NotificationPermissionDialog({super.key});

  static Future show({required BuildContext context}) {
    return showAppDialog(
      context: context,
      builder: (context) {
        return ChangeNotifierProvider(
          create: (context) => _PermissionDialogProvider(context: context),
          child: const _NotificationPermissionDialog(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<_PermissionDialogProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.normal),
          child: Center(
            child: Text(
              context.l10n.enableNotificationAccess,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        Gap(Spacing.medium),

        Divider(color: context.colorScheme.outline),

        Gap(Spacing.medium),

        Text(
          context.l10n.notificationRequired,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w400,
          ),
        ),

        Gap(Spacing.xLarge),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: Spacing.normal),
          child: Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    context.navigator.pop();
                  },
                  child: Text(context.l10n.later),
                ),
              ),

              Gap(Spacing.medium),

              Expanded(
                child: FilledButton(
                  onPressed: () async {
                    context.navigator.pop();

                    await provider.openNotificationSettings();
                  },
                  child: Text(context.l10n.enable),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

final class _PermissionDialogProvider extends BaseProvider {
  _PermissionDialogProvider({required super.context});

  static const MethodChannel _settingsChannel = MethodChannel(
    'flashlight/settings',
  );

  Future<void> openNotificationSettings() async {
    await _settingsChannel.invokeMethod('openNotificationAccessSettings');
  }
}
