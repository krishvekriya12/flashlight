part of 'overlay_permission.dart';

class OverlayPermissionScreen extends StatelessWidget {
  const OverlayPermissionScreen({super.key});
  static const routeName = '/overlay_permission';
  static Widget builder(BuildContext context) => ChangeNotifierProvider(
    create: (context) => OverlayPermissionProvider(context: context),
    child: const OverlayPermissionScreen(),
  );
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: AppContent(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(Spacing.xxLarge),
            ExpressiveSurface(
              hero: true,
              selected: true,
              padding: const EdgeInsets.all(Spacing.xxLarge),
              child: Icon(
                Icons.layers_rounded,
                size: AppDesign.heroSize / 2,
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),
            const Gap(Spacing.xxLarge),
            Text(
              context.l10n.permissionOverlayTitle,
              style: context.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const Gap(Spacing.normal),
            Text(
              context.l10n.permissionOverlayText2,
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const Gap(Spacing.xxLarge),
            ShimmerButton(
              onTap: context
                  .read<OverlayPermissionProvider>()
                  .requestPermissions,
              title: context.l10n.allowPermissionCallend,
            ),
            const Gap(Spacing.normal),
            TextButton(
              onPressed: () => showAppModal(
                context: context,
                builder: (context) => SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(Spacing.xLarge),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          context.l10n.permissionOverlayDialogText,
                          style: context.textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(Spacing.normal),
                        Text(
                          context.l10n.permissionOverlayDialogText4,
                          style: context.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(Spacing.xLarge),
                        FilledButton(
                          onPressed: () => context.navigator.pop(),
                          child: Text(
                            MaterialLocalizations.of(context).okButtonLabel,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              child: Text(
                context.l10n.permissionOverlayDialogText,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
