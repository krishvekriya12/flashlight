part of 'stroboscope.dart';

class StroboscopeScreen extends StatelessWidget {
  const StroboscopeScreen({super.key});
  static const routeName = '/stroboscope';
  static Widget builder(BuildContext context) => ChangeNotifierProvider(
    create: (context) => StroboscopeProvider(context: context),
    child: const StroboscopeScreen(),
  );
  @override
  Widget build(BuildContext context) {
    final on = context.select<StroboscopeProvider, bool>((p) => p.isFlashOn);
    final interval = context.select<StroboscopeProvider, double>(
      (p) => p.flashInterval,
    );
    final provider = context.read<StroboscopeProvider>();
    return Scaffold(
      appBar: FlashLightAppBar(
        showBackButton: false,
        title: context.l10n.tabStroboscope,
        actions: [
          IconButton.filledTonal(
            tooltip: context.l10n.screenLight,
            onPressed: () =>
                context.navigator.pushNamed(ScreenLightScreen.routeName),
            icon: const Icon(Icons.palette_rounded),
          ),
          IconButton(
            tooltip: context.l10n.settings,
            onPressed: () =>
                context.navigator.pushNamed(SettingScreen.routeName),
            icon: const Icon(Icons.settings_rounded),
          ),
          const SizedBox(width: Spacing.small),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, bounds) => AppContent(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: (bounds.maxHeight - Spacing.xxLarge).clamp(
                0,
                double.infinity,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.tabStroboscope,
                  style: context.textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                const Gap(Spacing.xxLarge),
                LightToggle(
                  label: context.l10n.tabStroboscope,
                  active: on,
                  icon: Icons.flash_on_rounded,
                  onTap: provider.toggleStrobe,
                ),
                const Gap(Spacing.xxLarge),
                ExpressiveSurface(
                  selected: on,
                  child: Column(
                    children: [
                      Text(
                        '${(1000 / interval).toStringAsFixed(1)} Hz',
                        style: context.textTheme.headlineMedium,
                      ),
                      const Gap(Spacing.normal),
                      AppSlider(
                        min: 10,
                        max: 500,
                        value: 510 - interval,
                        onChanged: on
                            ? (value) =>
                                  provider.changeFlashInterval(510 - value)
                            : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
