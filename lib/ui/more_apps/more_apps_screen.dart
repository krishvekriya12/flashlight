part of 'more_apps.dart';

class MoreAppsScreen extends StatelessWidget {
  static const String routeName = '/more_apps';

  static Widget builder(BuildContext context) {
    return const MoreAppsScreen();
  }

  const MoreAppsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlashLightAppBar(
        title: context.l10n.otherApps,
        showBackButton: true,
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  List<_AppModel> _getApps(BuildContext context) {
    return [
      _AppModel(
        name: 'SafeTap',
        description: context.l10n.safetapDesc,
        url:
            'https://play.google.com/store/apps/details?id=com.nexaserve.checkinapps&hl=en_IN',
        assetPath: 'assets/images/other_apps/ic_safetap.png',
        iconUrl:
            'https://play-lh.googleusercontent.com/1_dLrN8JLFKLQH3EeLTRbXB26bQpoqzvtP4FPyqDRGIpifk1myineCKIqnikFx0avaabv7kz1lWdTCWUhBgI=s256',
      ),
      _AppModel(
        name: 'Spendly',
        description: context.l10n.spendlyDesc,
        url:
            'https://play.google.com/store/apps/details?id=com.setubandhTech.cashflow&hl=en_IN',
        assetPath: 'assets/images/other_apps/ic_spendly.png',
        iconUrl:
            'https://play-lh.googleusercontent.com/0cG36BcGCOKrhPcZafInVz79rlfhi31qTYlyOPQOS1Y1frTN-MGifDmEcuSRuerAZF1uu-wD3i2vp_j7xgU3yA=s256',
      ),
      _AppModel(
        name: 'Water Reminder',
        description: context.l10n.waterReminderDesc,
        url:
            'https://play.google.com/store/apps/details?id=com.setubandhtech.water_reminder&hl=en_IN',
        assetPath: 'assets/images/other_apps/ic_water_reminder.png',
        iconUrl:
            'https://play-lh.googleusercontent.com/7xiCKGRen23B2eE6WPehJdHsfRbn0HU5V6fAo72TadgxhxpRR7amv6la-gSaO-7Vt4CWWIA78ccUDC2EhipXsg=s256',
      ),
      _AppModel(
        name: 'TipSplit',
        description: context.l10n.tipsplitDesc,
        url:
            'https://play.google.com/store/apps/details?id=com.setubandhTech.tip_split&hl=en_IN',
        assetPath: 'assets/images/other_apps/ic_tipsplit.png',
        iconUrl:
            'https://play-lh.googleusercontent.com/Xv490obWEgOt8fRHdDTR-TeSBTyhqVECQ6FJytWkHS_90dlxNo57vDvgABHxEeRGFZ-4yfqhU_r-zt6VLvh8=s256',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final apps = _getApps(context);

    return AppContent(
      child: Column(
        children: apps
            .map(
              (app) => Padding(
                key: ValueKey(app.url),
                padding: const EdgeInsets.only(bottom: Spacing.normal),
                child: CommonButton.cupertino(
                  onTap: () => CommonFunctions.openUrl(url: app.url),
                  child: ExpressiveSurface(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: ShapeBorderRadius.normal,
                              child: Image.network(
                                app.iconUrl,
                                width: AppDesign.touchTarget,
                                height: AppDesign.touchTarget,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stack) =>
                                    Image.asset(
                                      app.assetPath,
                                      width: AppDesign.touchTarget,
                                      height: AppDesign.touchTarget,
                                    ),
                                loadingBuilder: (context, child, progress) =>
                                    progress == null
                                    ? child
                                    : Image.asset(
                                        app.assetPath,
                                        width: AppDesign.touchTarget,
                                        height: AppDesign.touchTarget,
                                      ),
                              ),
                            ),
                            const Gap(Spacing.normal),
                            Expanded(
                              child: Text(
                                app.name,
                                style: context.textTheme.titleLarge,
                              ),
                            ),
                          ],
                        ),
                        const Gap(Spacing.normal),
                        Text(
                          app.description,
                          style: context.textTheme.bodyLarge,
                        ),
                        const Gap(Spacing.normal),
                        Row(
                          children: [
                            Text(
                              context.l10n.installApp,
                              style: context.textTheme.labelLarge?.copyWith(
                                color: context.colorScheme.primary,
                              ),
                            ),
                            const Gap(Spacing.small),
                            Icon(
                              Icons.arrow_outward_rounded,
                              color: context.colorScheme.primary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _AppModel {
  final String name;
  final String description;
  final String url;
  final String assetPath;
  final String iconUrl;

  const _AppModel({
    required this.name,
    required this.description,
    required this.url,
    required this.assetPath,
    required this.iconUrl,
  });
}
