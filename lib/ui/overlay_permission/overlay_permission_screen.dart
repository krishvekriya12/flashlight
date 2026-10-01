part of 'overlay_permission.dart';
class OverlayPermissionScreen extends StatelessWidget {
  const OverlayPermissionScreen({super.key});
  static const String routeName = '/overlay_permission';

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OverlayPermissionProvider(context: context),
      child: OverlayPermissionScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _Body(),);
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Assets.icons.icPermissionDailog.image(),
        Positioned(
          left: Spacing.normal,
          right: Spacing.normal,
          bottom: context.padding.bottom + Spacing.xxxLarge,
          child: Column(
            children: [
              Text(
                context.l10n.permissionOverlayTitle,
                style: context.textTheme.displaySmall?.copyWith(
                  color: context.colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.3,
                ),
              ),
              Gap(Spacing.small),
              Text(
                context.l10n.permissionOverlayText2,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              Gap(Spacing.normal),
              ShimmerButton(
                onTap: () {
                  context.read<OverlayPermissionProvider>().requestPermissions();
                },
                title: context.l10n.allowPermissionCallend,
              ),
             Gap(Spacing.medium),
             CommonButton.cupertino(
                  onTap: () {
                    showAppModal(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.all(Spacing.normal),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                context.l10n.permissionOverlayDialogText,
                                style: context.textTheme.headlineSmall?.copyWith(
                                  color: context.colorScheme.onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Gap(Spacing.medium),
                              Text(
                                context.l10n.permissionOverlayDialogText4,
                                textAlign: TextAlign.center,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: context.colorScheme.onSurfaceVariant,
                                ),
                              ),
                              Gap(Spacing.large),
                              CommonButton.cupertino(
                                onTap: () => context.navigator.pop(),
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                    color: context.colorScheme.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    context.l10n.permissionOverlayDialogText,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: context.colorScheme.primary,
                    ),
                  ),
                ),

            ],
          ),
        ),
      ],
    );
  }
}