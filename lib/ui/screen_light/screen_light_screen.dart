part of 'screen_light.dart';

class ScreenLightScreen extends StatelessWidget {
  const ScreenLightScreen({super.key});
  static const routeName = '/screen-light';
  static Widget builder(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ScreenLightProvider(context: context),
    child: const ScreenLightScreen(),
  );
  @override
  Widget build(BuildContext context) {
    final index = context.select<ScreenLightProvider, int>(
      (p) => p.selectedIndex,
    );
    final show = context.select<ScreenLightProvider, bool>(
      (p) => p.showBottomNav,
    );
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(
              index: index,
              children: const [_ColorTab(), _ScreenLightTab()],
            ),
          ),
          if (show)
            PositionedDirectional(
              start: Spacing.normal,
              end: Spacing.normal,
              bottom: MediaQuery.paddingOf(context).bottom + Spacing.small,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: AppDesign.contentWidth,
                  ),
                  child: Material(
                    color: context.colorScheme.surfaceContainerLow,
                    borderRadius: ShapeBorderRadius.xxLarge,
                    child: ExpressiveNavigation(
                      labels: [
                        context.l10n.chooseColor,
                        context.l10n.screenLight,
                      ],
                      icons: const [
                        Icons.palette_rounded,
                        Icons.light_mode_rounded,
                      ],
                      selectedIndex: index,
                      onSelected: context.read<ScreenLightProvider>().selectTab,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
