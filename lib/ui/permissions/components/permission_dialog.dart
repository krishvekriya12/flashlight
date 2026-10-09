part of '../permissions.dart';

class _PermissionDialog extends StatelessWidget {
  const _PermissionDialog({super.key});

  static Future show({required BuildContext context}) {
    return showAppDialog(
      context: context,
      builder: (context) {
        return ChangeNotifierProvider(
          create: (context) => _PermissionDialogProvider(context: context),
          child: _PermissionDialog(),
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
        Center(
          child: Text(
            context.l10n.permissionDialogTitle3,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineSmall?.copyWith(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Gap(Spacing.xLarge),
        _PermissionsCell(
          title: context.l10n.notifications,
          subtitle: context.l10n.permissionDialogNotificationText2,
          onTap: () {
            provider.requestNotificationPermission();
          },
        ),
        Gap(Spacing.large),
        _PermissionsCell(
          title: context.l10n.permissionDialogPhoneStateTitle,
          subtitle: context.l10n.permissionDialogPhoneStateText4,
          onTap: () {
            provider.requestPhonePermission();
          },
        ),
        Gap(Spacing.large),
        _PermissionsCell(
          title: context.l10n.permissionDialogOverlayTitle,
          subtitle: context.l10n.permissionDialogOverlayText2,
          onTap: () {
            provider.requestOverlayPermission();
          },
        ),
        Gap(Spacing.xLarge),
        ShimmerButton(
          onTap: provider.requestPermissions,
          title: context.l10n.permissionDialogButtonText,
        ),
      ],
    );
  }
}

class _PermissionsCell extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _PermissionsCell({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton.cupertino(
      onTap: onTap,
      child: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(
          horizontal: Spacing.normal,
          vertical: Spacing.medium,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainer,
          borderRadius: ShapeBorderRadius.xxLarge,
          border: Border.all(
            color: context.colorScheme.outlineVariant.withColorOpacity(0.5),
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(Spacing.xSmall),
                  Text(
                    subtitle,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Gap(Spacing.small),
            Icon(
              Icons.chevron_right_rounded,
              color: context.colorScheme.onSurfaceVariant.withColorOpacity(0.7),
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}

final class _PermissionDialogProvider extends BaseProvider {
  _PermissionDialogProvider({required super.context});

  Future<void> requestNotificationPermission() async {
    final status = await Permission.notification.request();

    if (status.isPermanentlyDenied) {
      if (!context.mounted) return;
      await openAppSettings();
    }
  }

  Future<void> requestPhonePermission() async {
    final status = await Permission.phone.request();

    if (status.isPermanentlyDenied) {
      if (!context.mounted) return;
      await openAppSettings();
    }
  }

  Future<void> requestOverlayPermission() async {
    final status = await Permission.systemAlertWindow.request();

    if (!status.isGranted) {
      if (!context.mounted) return;
      await openAppSettings();
    }
  }

  Future<void> requestPermissions() async {
    final notificationStatus = await Permission.notification.request();

    final phoneStatus = await Permission.phone.request();

    if (notificationStatus.isPermanentlyDenied ||
        phoneStatus.isPermanentlyDenied) {
      if (!context.mounted) return;

      await openAppSettings();
      return;
    }

    final overlayGranted = await Permission.systemAlertWindow.isGranted;
    if (!overlayGranted) {
      await Permission.systemAlertWindow.request();

      final grantedAfterRequest = await Permission.systemAlertWindow.isGranted;

      if (!grantedAfterRequest) {
        if (!context.mounted) return;

        await openAppSettings();
        return;
      }
    }

    final notificationGranted = await Permission.notification.isGranted;

    final phoneGranted = await Permission.phone.isGranted;

    final finalOverlayGranted = await Permission.systemAlertWindow.isGranted;

    if (notificationGranted && phoneGranted && finalOverlayGranted) {
      if (!context.mounted) return;

      context.navigator.pushNamedAndRemoveUntil(
        DashboardScreen.routeName,
        (route) => false,
      );

      return;
    }

    debugPrint('Required permissions were not granted.');
  }
}
