part of 'flash_light_sos.dart';

class FlashLightSosScreen extends StatelessWidget {
  const FlashLightSosScreen({super.key});
  static const routeName = '/flash_light_sos';
  static Widget builder(BuildContext context) => ChangeNotifierProvider(
    create: (context) => FlashLightSosProvider(context: context),
    child: const FlashLightSosScreen(),
  );
  @override
  Widget build(BuildContext context) {
    final on = context.select<FlashLightSosProvider, bool>((p) => p.isFlashOn);
    final sos = context.select<FlashLightSosProvider, bool>(
      (p) => p.isSosRunning,
    );
    final provider = context.read<FlashLightSosProvider>();
    return Scaffold(
      appBar: FlashLightAppBar(
        showBackButton: false,
        title: context.l10n.tabFlashLight,
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
                  context.l10n.tabFlashLight,
                  style: context.textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                const Gap(Spacing.xxLarge),
                LightToggle(
                  label: context.l10n.tabFlashLight,
                  active: on,
                  icon: on
                      ? Icons.flashlight_on_rounded
                      : Icons.flashlight_off_rounded,
                  onTap: provider.toggleFlash,
                ),
                const Gap(Spacing.xxLarge),
                Semantics(
                  toggled: sos,
                  child: FilledButton.tonalIcon(
                    onPressed: provider.toggleSos,
                    style: FilledButton.styleFrom(
                      backgroundColor: sos
                          ? context.colorScheme.errorContainer
                          : context.colorScheme.tertiaryContainer,
                      foregroundColor: sos
                          ? context.colorScheme.onErrorContainer
                          : context.colorScheme.onTertiaryContainer,
                    ),
                    icon: Icon(
                      sos ? Icons.stop_rounded : Icons.emergency_rounded,
                    ),
                    label: Text('SOS', style: context.textTheme.titleLarge),
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
