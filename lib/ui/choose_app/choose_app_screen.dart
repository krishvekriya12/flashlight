part of 'choose_app.dart';

class ChooseAppScreen extends StatelessWidget {
  const ChooseAppScreen({super.key});
  static const routeName = '/choose_app';
  static Widget builder(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ChooseAppProvider(context: context),
    child: const ChooseAppScreen(),
  );
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ChooseAppProvider>();
    final apps = provider.apps;
    return Scaffold(
      appBar: FlashLightAppBar(
        title: context.l10n.chooseApp,
        actions: [
          IconButton.filledTonal(
            tooltip: context.l10n.chooseApp,
            onPressed: provider.toggleSelectAll,
            icon: Icon(
              provider.allSelected
                  ? Icons.deselect_rounded
                  : Icons.select_all_rounded,
            ),
          ),
          const SizedBox(width: Spacing.small),
        ],
      ),
      body: provider.isLoading
          ? const Center(child: ExpressiveLoader())
          : provider.loadFailed
          ? AppContent(
              child: ExpressiveSurface(
                child: Column(
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: AppDesign.touchTarget,
                      color: context.colorScheme.error,
                    ),
                    const Gap(Spacing.normal),
                    Text(
                      context.l10n.chooseApp,
                      style: context.textTheme.titleLarge,
                    ),
                    IconButton.filledTonal(
                      tooltip: MaterialLocalizations.of(
                        context,
                      ).refreshIndicatorSemanticLabel,
                      onPressed: provider.loadApps,
                      icon: const Icon(Icons.refresh_rounded),
                    ),
                  ],
                ),
              ),
            )
          : apps.isEmpty
          ? AppContent(
              child: ExpressiveSurface(
                child: Column(
                  children: [
                    const Icon(Icons.apps_rounded, size: AppDesign.touchTarget),
                    const Gap(Spacing.normal),
                    Text(
                      context.l10n.noAppFound,
                      style: context.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            )
          : AppContent(
              scroll: false,
              padding: EdgeInsets.zero,
              child: ListView.separated(
                padding: const EdgeInsets.all(Spacing.normal),
                itemCount: apps.length,
                separatorBuilder: (_, _) => const Gap(Spacing.small),
                itemBuilder: (context, index) {
                  final app = apps[index];
                  return Semantics(
                    key: ValueKey(app.packageName),
                    selected: provider.isSelected(app.packageName),
                    child: CommonButton.cupertino(
                      onTap: () => provider.toggleApp(app.packageName),
                      child: ExpressiveSurface(
                        selected: provider.isSelected(app.packageName),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: ShapeBorderRadius.normal,
                              child: app.icon == null
                                  ? const SizedBox(
                                      width: AppDesign.touchTarget,
                                      height: AppDesign.touchTarget,
                                      child: Icon(Icons.apps_rounded),
                                    )
                                  : Image.memory(
                                      app.icon!,
                                      width: AppDesign.touchTarget,
                                      height: AppDesign.touchTarget,
                                    ),
                            ),
                            const Gap(Spacing.normal),
                            Expanded(
                              child: Text(
                                app.name,
                                style: context.textTheme.titleMedium,
                              ),
                            ),
                            const Gap(Spacing.small),
                            Icon(
                              provider.isSelected(app.packageName)
                                  ? Icons.check_circle_rounded
                                  : Icons.radio_button_unchecked_rounded,
                              color: context.colorScheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
