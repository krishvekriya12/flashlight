part of 'screen_light.dart';

class ScreenLightScreen extends StatelessWidget {
  static const String routeName = '/screen-light';

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<ScreenLightProvider>(
      create: (context) => ScreenLightProvider(context: context),
      child: const ScreenLightScreen(),
    );
  }

  const ScreenLightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select<ScreenLightProvider, int>(
          (provider) => provider.selectedIndex,
    );

    final showBottomNav = context.select<ScreenLightProvider, bool>(
          (provider) => provider.showBottomNav,
    );

    final provider = context.read<ScreenLightProvider>();

    return Stack(
      children: [
        Positioned.fill(
          child: IndexedStack(
            index: selectedIndex,
            children:  [
              _ColorTab(),
              _ScreenLightTab(),
            ],
          ),
        ),
        if (showBottomNav)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 80 + context.padding.bottom,
              padding: EdgeInsets.only(
                bottom: context.padding.bottom,
              ),
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(48),
                  topRight: Radius.circular(48),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _TabButton(
                      title: context.l10n.chooseColor,
                      selected: selectedIndex == 0,
                      onTap: () => provider.selectTab(0),
                      icon: Assets.icons.icScreenColor.image(
                        height: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    child: _TabButton(
                      title: context.l10n.screenLight,
                      selected: selectedIndex == 1,
                      onTap: () => provider.selectTab(1),
                      icon: selectedIndex == 1
                          ? Assets.icons.icFlashlightEnable.svg(
                        height: 30,
                      )
                          : Assets.icons.icFlashlightDisable.svg(
                        height: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}


