part of 'setting.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  static const String routeName = '/setting';

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingProvider(context: context),
      child: SettingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(),
      appBar: FlashLightAppBar(
        title: context.l10n.settings,
        showBackButton: true,

      ),
      bottomNavigationBar: Builder(
        builder: (context) {
          final appVersion = context.select<SettingProvider, String>(
            (provider) => provider.appVersion,
          );
          return Container(
            height: 100,
            width: context.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: context.colorScheme.surface),
            child: Text(
              context.l10n.appVersion(appVersion),
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(Spacing.normal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Personalization(),
          Gap(Spacing.normal),
          _AboutUS(),
        ],
      ),
    );
  }
}

class _SettingCell extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const _SettingCell({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return CommonButton.cupertino(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Spacing.normal, horizontal: Spacing.normal),
        decoration: BoxDecoration(color: context.colorScheme.primaryContainer, borderRadius: ShapeBorderRadius.medium),
        child: child,
      ),
    );
  }
}
