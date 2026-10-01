part of 'dashboard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const String routeName = '/dashboard';

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashboardProvider(context: context),
      child: DashboardScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _Body());
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select<DashboardProvider, int>(
      (values) => values.selectedIndex,
    );
    return Padding(
      padding: EdgeInsets.only(bottom: context.padding.bottom),
      child: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: [
                FlashAlertScreen.builder(context),
                FlashLightSosScreen.builder(context),
                StroboscopeScreen.builder(context),
              ],
            ),
          ),
          Container(
            height: 90,
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer,
              borderRadius: BorderRadius.only(
                topRight: RadiusValues.xLarge,
                topLeft: RadiusValues.xLarge,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _TabButton(
                    title: context.l10n.tabFlashAlert,
                    selected: selectedIndex == 0,
                    onTap: () => context.read<DashboardProvider>().selectTab(0),
                    icon: selectedIndex == 0
                        ? Icon(Icons.call,color: context.colorScheme.primary,size: 28,)
                        : Icon(Icons.call,color: context.colorScheme.onSurface.withColorOpacity(.60),size: 28,)
                  ),
                ),
                Expanded(
                  child: _TabButton(
                    title: context.l10n.tabFlashLight,
                    selected: selectedIndex == 1,
                    onTap: () => context.read<DashboardProvider>().selectTab(1),
                    icon: selectedIndex == 1
                        ? Assets.icons.icFlashlightEnable.svg(height: 30)
                        : Assets.icons.icFlashlightDisable.svg(height: 30),
                  ),
                ),
                Expanded(
                  child: _TabButton(
                    title: context.l10n.tabStroboscope,
                    selected: selectedIndex == 2,
                    onTap: () => context.read<DashboardProvider>().selectTab(2),
                    icon: selectedIndex == 2
                        ? Icon(Icons.flash_on_rounded, color: context.colorScheme.primary, size: 28)
                        : Icon(Icons.flash_on_rounded, color: context.colorScheme.onSurface.withColorOpacity(.60), size: 28),
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

class _TabButton extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;
  final Widget icon;

  const _TabButton({
    required this.title,
    required this.selected,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton.cupertino(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Gap(Spacing.xSmall),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.labelMedium?.copyWith(
              color: selected
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurfaceVariant,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}


