part of 'language_selection.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key, this.isSetting});
  final bool? isSetting;
  static const routeName = '/language_selection';
  static Widget builder(BuildContext context) {
    final setting = context.args as bool?;
    return ChangeNotifierProvider(
      create: (context) =>
          LanguageSelectionProvider(context: context, isSetting: setting),
      child: LanguageSelectionScreen(isSetting: setting),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LanguageSelectionProvider>();
    return Scaffold(
      appBar: FlashLightAppBar(title: context.l10n.language),
      bottomNavigationBar: SafeArea(
        top: false,
        minimum: const EdgeInsets.all(Spacing.normal),
        child: FilledButton.icon(
          onPressed: provider.selectedLanguage == null || provider.isLoading
              ? null
              : provider.continueNavigation,
          icon: provider.isLoading
              ? const ExpressiveLoader(size: AppDesign.iconSize)
              : Icon(
                  isSetting == true
                      ? Icons.check_rounded
                      : Icons.arrow_forward_rounded,
                ),
          label: Text(
            isSetting == true
                ? MaterialLocalizations.of(context).saveButtonLabel
                : MaterialLocalizations.of(context).continueButtonLabel,
          ),
        ),
      ),
      body: AppContent(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ExpressiveSurface(
              hero: true,
              selected: true,
              child: Column(
                children: [
                  Icon(
                    Icons.translate_rounded,
                    size: AppDesign.touchTarget,
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                  const Gap(Spacing.normal),
                  Text(
                    context.l10n.language,
                    style: context.textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Gap(Spacing.xLarge),
            ...provider.languages.map(
              (language) => Padding(
                padding: const EdgeInsets.only(bottom: Spacing.small),
                child: _LanguageCell(
                  key: ValueKey(language),
                  onTap: () => provider.selectLanguage(language),
                  isSelected: provider.selectedLanguage == language,
                  showHighlight: false,
                  icon: language.image(),
                  title: language.label,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
