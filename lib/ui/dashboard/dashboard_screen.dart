part of 'dashboard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static const routeName = '/dashboard';
  static Widget builder(BuildContext context) => ChangeNotifierProvider(
    create: (context) => DashboardProvider(context: context),
    child: const DashboardScreen(),
  );
  @override
  Widget build(BuildContext context) {
    final selected = context.select<DashboardProvider, int>(
      (p) => p.selectedIndex,
    );
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, bounds) {
          final rail = bounds.maxWidth >= AppDesign.railBreakpoint;
          final wide = bounds.maxWidth >= AppDesign.expandedBreakpoint;
          final content = IndexedStack(
            index: selected,
            children: [
              FlashAlertScreen.builder(context),
              FlashLightSosScreen.builder(context),
              StroboscopeScreen.builder(context),
            ],
          );
          final navigation = ExpressiveNavigation(
            labels: [
              context.l10n.tabFlashAlert,
              context.l10n.tabFlashLight,
              context.l10n.tabStroboscope,
            ],
            icons: const [
              Icons.notifications_active_rounded,
              Icons.flashlight_on_rounded,
              Icons.flash_on_rounded,
            ],
            selectedIndex: selected,
            onSelected: context.read<DashboardProvider>().selectTab,
            vertical: rail,
            expanded: wide,
          );
          if (rail) {
            return Row(
              children: [
                SafeArea(
                  child: SizedBox(
                    width: wide ? AppDesign.wideRailWidth : AppDesign.railWidth,
                    child: SingleChildScrollView(child: navigation),
                  ),
                ),
                Expanded(child: content),
              ],
            );
          }
          return Column(
            children: [
              Expanded(child: content),
              SafeArea(top: false, child: navigation),
            ],
          );
        },
      ),
    );
  }
}
