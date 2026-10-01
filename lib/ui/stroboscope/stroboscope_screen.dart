part of 'stroboscope.dart';

class StroboscopeScreen extends StatelessWidget {
  const StroboscopeScreen({super.key});

  static const String routeName = '/stroboscope';

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StroboscopeProvider(context: context),
      child: StroboscopeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(),
      appBar: FlashLightAppBar(
        showBackButton: false,
        title: context.l10n.tabStroboscope,
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
    final isFlashOn = context.select<StroboscopeProvider, bool>((provider) => provider.isFlashOn);
    final flashInterval = context.select<StroboscopeProvider, double>((provider) => provider.flashInterval);
    final provider = context.read<StroboscopeProvider>();

    return Padding(
      padding: EdgeInsets.all(Spacing.normal),
      child: SizedBox(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonButton.cupertino(
              onTap: provider.toggleStrobe,
              child: isFlashOn
                  ? Assets.icons.icStroboBtnEnable.svg(height: 200)
                  : Assets.icons.icStroboBtnDisable.svg(height: 200),
            ),
            Gap(Spacing.xxxLarge),
            Container(
              padding: EdgeInsets.symmetric(vertical: Spacing.normal, horizontal: Spacing.normal),
              decoration: BoxDecoration(
                color: isFlashOn ? context.colorScheme.primaryContainer : context.colorScheme.surface,
                border: Border.all(
                  color: isFlashOn ? context.colorScheme.primary : context.colorScheme.primary.withColorOpacity(.50),
                ),
                borderRadius: BorderRadius.circular(Spacing.medium),
              ),
              child: AppSlider(
                trackHeight: 5,
                min: 10,
                max: 500,
                thumbRadius: 6,
                value: 510 - flashInterval,
                onChanged: isFlashOn
                    ? (value) {
                        provider.changeFlashInterval(510 - value);
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
