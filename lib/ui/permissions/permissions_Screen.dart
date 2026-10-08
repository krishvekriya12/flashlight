part of 'permissions.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  static const String routeName = '/permissions';

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PermissionsProvider(context: context),
      child: PermissionsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _Body(),
      appBar: FlashLightAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Spacing.normal),
            child: CommonButton.cupertino(
              onTap: () {
                _PermissionDialog.show(context: context);
              },
              child: Container(
                padding: EdgeInsets.all(Spacing.xSmall),
                height: 20,
                width: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.colorScheme.onSurface.withColorOpacity(.70),
                  borderRadius: ShapeBorderRadius.small,
                ),
                child: Assets.icons.icInfo.svg(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Assets.images.svgviewerPngOutput.image(),
        Positioned(
          left: Spacing.normal,
          right: Spacing.normal,
          bottom: context.padding.bottom + Spacing.xxxLarge,
          child: Column(
            children: [
              Text(
                context.l10n.appName,
                style: context.textTheme.displaySmall?.copyWith(
                  color: context.colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.3,
                ),
              ),
              Gap(Spacing.small),
              Text(
                context.l10n.permissionText3,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              Gap(Spacing.xLarge),
              ShimmerButton(
                onTap: () {
                  context.read<PermissionsProvider>().requestPermissions();
                },
                title: context.l10n.permissionButtonText,
              ),
              Gap(Spacing.normal),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.permissionNoteText,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Gap(Spacing.xSmall),
                    CommonButton.cupertino(
                      onTap: () {
                        context.navigator.pushNamed(
                          PrivacyPolicyScreen.routeName,
                        );
                      },
                      child: Text(
                        context.l10n.privacyPolicy,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: context.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
