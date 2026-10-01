part of 'flash_light_sos.dart';

class FlashLightSosScreen extends StatelessWidget {
  const FlashLightSosScreen({super.key});

  static const String routeName = '/flash_light_sos';

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FlashLightSosProvider(context: context),
      child: FlashLightSosScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(),
      appBar: FlashLightAppBar(
        showBackButton: false,
        title: context.l10n.tabFlashLight,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Spacing.normal),
            child: Row(
              children: [
                CommonButton.cupertino(
                  onTap: () {
                    context.navigator.pushNamed(ScreenLightScreen.routeName);
                  },
                  child: Assets.icons.icScreenColor.image(height: 24),
                ),
                Gap(Spacing.medium),
                CommonButton.cupertino(
                  onTap: () {
                    context.navigator.pushNamed(SettingScreen.routeName);
                  },
                  child: Assets.icons.icSetting.svg(
                    colorFilter: ColorFilter.mode(context.colorScheme.onSurface, BlendMode.srcIn),
                    height: 24,
                  ),
                ),
              ],
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
    final isFlashOn = context.select<FlashLightSosProvider, bool>((value) => value.isFlashOn);
    final isSosRunning = context.select<FlashLightSosProvider, bool>((value) => value.isSosRunning);
    final provider = context.read<FlashLightSosProvider>();
    return Padding(
      padding: EdgeInsets.all(Spacing.normal),
      child: SizedBox(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonButton.cupertino(
              onTap: provider.toggleFlash,
              child: isFlashOn
                  ? Assets.icons.icFlashBtnEnable.svg(height: 200)
                  : Assets.icons.icFlashBtnDisable.svg(height: 200),
            ),
            Gap(Spacing.xxxLarge),
            CommonButton.cupertino(
              onTap: provider.toggleSos,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: Spacing.medium, horizontal: Spacing.xLarge),
                decoration: BoxDecoration(
                  color: isSosRunning ? context.colorScheme.error : context.colorScheme.secondary.withColorOpacity(.04),
                  border: Border.all(
                    color: isSosRunning ? context.colorScheme.error : context.colorScheme.onSurfaceVariant,
                  ),
                  borderRadius: BorderRadius.circular(Spacing.normal),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.wb_twilight_rounded, color: context.colorScheme.onSurface),
                    Gap(Spacing.medium),
                    Text(
                      "SOS",
                      style: context.textTheme.headlineMedium?.copyWith(
                        color: context.colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
