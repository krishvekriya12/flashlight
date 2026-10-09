part of 'flash_alert.dart';

class FlashAlertScreen extends StatelessWidget {
  const FlashAlertScreen({super.key});

  static const String routeName = '/flash_alert';

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FlashAlertProvider(context: context),
      child: FlashAlertScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(),
      appBar: FlashLightAppBar(
        showBackButton: false,
        title: context.l10n.tabFlashAlert,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Spacing.normal),
            child: Row(
              children: [
                CommonButton.cupertino(
                  onTap: () {
                    context.navigator.pushNamed(ScreenLightScreen.routeName);
                  },
                  child: Tooltip(
                    message: context.l10n.screenLight,
                    child: const Icon(Icons.palette_rounded),
                  ),
                ),
                Gap(Spacing.medium),
                CommonButton.cupertino(
                  onTap: () {
                    context.navigator.pushNamed(SettingScreen.routeName);
                  },
                  child: Tooltip(
                    message: context.l10n.settings,
                    child: const Icon(Icons.settings_rounded),
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
    return AppContent(
      child: Column(
        spacing: Spacing.xLarge,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_FlashOn(), _TestFlash(), _NotificationEnableFor()],
      ),
    );
  }
}
