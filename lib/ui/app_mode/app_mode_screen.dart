part of 'app_mode.dart';

class AppModeScreen extends StatelessWidget {
  const AppModeScreen({super.key});

  static const String routeName = '/app_mode';

  static Widget builder(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppModeProvider>().syncSelection();
    });
    return const AppModeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlashLightAppBar(
        title: context.l10n.appMode,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Spacing.normal),
            child: CommonButton.cupertino(
              onTap: () {
                context.read<AppModeProvider>().applyTheme();
                context.navigator.pop();
              },
              child: Container(
                height: 36,
                width: 44,
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.check,
                  size: 28,
                  color: context.colorScheme.onPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final selectedMode = context.select<AppModeProvider, ThemeMode>(
      (provider) => provider.selectedMode,
    );

    return AppContent(
      padding: EdgeInsets.all(Spacing.normal),
      child: Column(
        children: [
          _AppModeCell(
            icon: Icon(
              Icons.brightness_auto_rounded,
              color: context.colorScheme.primary,
              size: 28,
            ),
            title: context.l10n.systemDefault,
            isSelected: selectedMode == ThemeMode.system,
            onTap: () {
              context.read<AppModeProvider>().selectTheme(ThemeMode.system);
            },
          ),
          Gap(Spacing.medium),
          _AppModeCell(
            icon: Icon(
              Icons.light_mode_rounded,
              color: context.colorScheme.primary,
              size: 28,
            ),
            title: context.l10n.lightMode,
            isSelected: selectedMode == ThemeMode.light,
            onTap: () {
              context.read<AppModeProvider>().selectTheme(ThemeMode.light);
            },
          ),
          Gap(Spacing.medium),
          _AppModeCell(
            icon: Icon(
              Icons.dark_mode_rounded,
              color: context.colorScheme.primary,
              size: 28,
            ),
            title: context.l10n.darkMode,
            isSelected: selectedMode == ThemeMode.dark,
            onTap: () {
              context.read<AppModeProvider>().selectTheme(ThemeMode.dark);
            },
          ),
        ],
      ),
    );
  }
}
