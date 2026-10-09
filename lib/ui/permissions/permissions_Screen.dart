part of 'permissions.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});
  static const routeName = '/permissions';
  static Widget builder(BuildContext context) => ChangeNotifierProvider(
    create: (context) => PermissionsProvider(context: context),
    child: const PermissionsScreen(),
  );
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: FlashLightAppBar(
      title: context.l10n.appName,
      actions: [
        IconButton.filledTonal(
          tooltip: context.l10n.permissionButtonText,
          onPressed: () => _PermissionDialog.show(context: context),
          icon: const Icon(Icons.info_outline_rounded),
        ),
        const SizedBox(width: Spacing.small),
      ],
    ),
    body: AppContent(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Gap(Spacing.xxLarge),
          ExpressiveSurface(
            hero: true,
            selected: true,
            padding: const EdgeInsets.all(Spacing.xxLarge),
            child: Icon(
              Icons.flashlight_on_rounded,
              size: AppDesign.heroSize / 2,
              color: context.colorScheme.onPrimaryContainer,
            ),
          ),
          const Gap(Spacing.xxLarge),
          Text(
            context.l10n.permissionButtonText,
            style: context.textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const Gap(Spacing.normal),
          Text(
            context.l10n.permissionText3,
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const Gap(Spacing.xxLarge),
          ShimmerButton(
            onTap: context.read<PermissionsProvider>().requestPermissions,
            title: context.l10n.permissionButtonText,
          ),
          const Gap(Spacing.normal),
          Text(
            context.l10n.permissionNoteText,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          TextButton.icon(
            onPressed: () =>
                context.navigator.pushNamed(PrivacyPolicyScreen.routeName),
            icon: const Icon(Icons.privacy_tip_outlined),
            label: Text(context.l10n.privacyPolicy),
          ),
        ],
      ),
    ),
  );
}
