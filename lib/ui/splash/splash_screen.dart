part of 'splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const routeName = '/splash';
  static Widget builder(BuildContext context) => ChangeNotifierProvider(
    create: (context) => SplashProvider(context: context),
    child: const SplashScreen(),
  );
  @override
  Widget build(BuildContext context) {
    final loading = context.select<SplashProvider, bool>((p) => p.isLoading);
    final version = context.select<SplashProvider, String>((p) => p.appVersion);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SpringValue(
                  value: 1,
                  initialValue: .85,
                  builder: (context, value, child) =>
                      Transform.scale(scale: value, child: child),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                      const Gap(Spacing.xLarge),
                      Text(
                        context.l10n.appName,
                        style: context.textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (loading) const ExpressiveLoader(),
            const Gap(Spacing.normal),
            Text(
              context.l10n.appVersion(version),
              style: context.textTheme.bodySmall,
            ),
            const Gap(Spacing.xxLarge),
          ],
        ),
      ),
    );
  }
}
