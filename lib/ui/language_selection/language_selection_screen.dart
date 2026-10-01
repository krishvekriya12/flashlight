part of 'language_selection.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final bool? isSetting;

  const LanguageSelectionScreen({super.key, this.isSetting});

  static const String routeName = '/language_selection';

  static Widget builder(BuildContext context) {
    final isSetting = context.args as bool?;

    return ChangeNotifierProvider(
      create: (context) => LanguageSelectionProvider(context: context, isSetting: isSetting),
      child: LanguageSelectionScreen(isSetting: isSetting),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedLanguage = context.select<LanguageSelectionProvider, AppLanguage?>(
      (provider) => provider.selectedLanguage,
    );

    final isLoading = context.select<LanguageSelectionProvider, bool>((provider) => provider.isLoading);

    return Scaffold(
      appBar: FlashLightAppBar(
        title: "Languages",
        actions: [
          if (selectedLanguage != null)
            CommonButton.cupertino(
              onTap: context.read<LanguageSelectionProvider>().continueNavigation,
              child: Padding(
                padding: EdgeInsets.only(right: Spacing.normal),
                child: isLoading
                    ? SizedBox(
                        height: 36,
                        width: 44,
                        child: Center(
                          child: SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(strokeWidth: 2, color: context.colorScheme.primary),
                          ),
                        ),
                      )
                    : isSetting == true
                    ? Container(
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
                      )
                    : Assets.lotties.lottieNavigate.lottie(height: 38),
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
    final languages = context.select<LanguageSelectionProvider, List<AppLanguage>>((provider) => provider.languages);

    final selectedLanguage = context.select<LanguageSelectionProvider, AppLanguage?>(
      (provider) => provider.selectedLanguage,
    );

    final provider = context.read<LanguageSelectionProvider>();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: Spacing.medium, horizontal: Spacing.normal),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: languages.length,
        itemBuilder: (context, index) {
          final language = languages[index];

          return Stack(
            clipBehavior: Clip.none,
            children: [
              _LanguageCell(
                onTap: () {
                  provider.selectLanguage(language);
                },
                isSelected: selectedLanguage == language,
                showHighlight: index == 0 && selectedLanguage == null,
                icon: language.image(),
                title: language.label,
              ),
              if (index == 0 && selectedLanguage == null)
                Positioned(
                  right: 30,
                  top: -5,
                  child: Transform.rotate(
                    angle: 100 * 3.14159 / 55,
                    child: Assets.lotties.lottieClick.lottie(width: 60, height: 60),
                  ),
                ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Gap(Spacing.small);
        },
      ),
    );
  }
}
