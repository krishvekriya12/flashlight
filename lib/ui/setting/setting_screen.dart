part of 'setting.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  static const routeName = '/setting';
  static Widget builder(BuildContext context) => ChangeNotifierProvider(
    create: (context) => SettingProvider(context: context),
    child: const SettingScreen(),
  );
  @override
  Widget build(BuildContext context) {
    final version = context.select<SettingProvider, String>(
      (p) => p.appVersion,
    );
    return Scaffold(
      appBar: FlashLightAppBar(
        title: context.l10n.settings,
        showBackButton: true,
      ),
      body: AppContent(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ExpressiveSurface(
              hero: true,
              selected: true,
              child: Column(
                children: [
                  Icon(
                    Icons.tune_rounded,
                    size: AppDesign.touchTarget,
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                  const Gap(Spacing.normal),
                  Text(
                    context.l10n.settings,
                    style: context.textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            const Gap(Spacing.xLarge),
            const _Personalization(),
            const Gap(Spacing.xLarge),
            const _AboutUS(),
            const Gap(Spacing.xxLarge),
            Text(
              context.l10n.appVersion(version),
              style: context.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingCell extends StatelessWidget {
  const _SettingCell({super.key, required this.onTap, required this.child});
  final VoidCallback onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) => CommonButton.cupertino(
    onTap: onTap,
    child: ExpressiveSurface(child: child),
  );
}
