part of '../setting.dart';

class _AboutUS extends StatelessWidget {
  const _AboutUS({super.key});
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(context.l10n.aboutUs, style: context.textTheme.titleLarge),
      const Gap(Spacing.normal),
      _AboutLink(
        icon: Icons.share_rounded,
        title: context.l10n.shareApp,
        onTap: () async => SharePlus.instance.share(
          ShareParams(
            text: '${context.l10n.appName}: ${AppConstant.playStoreUrl}',
          ),
        ),
      ),
      const Gap(Spacing.small),
      _AboutLink(
        icon: Icons.star_rounded,
        title: context.l10n.rateUs,
        onTap: () => CommonFunctions.openUrl(url: AppConstant.playStoreUrl),
      ),
      const Gap(Spacing.small),
      _AboutLink(
        icon: Icons.privacy_tip_outlined,
        title: context.l10n.privacyPolicy,
        onTap: () => context.navigator.pushNamed(PrivacyPolicyScreen.routeName),
      ),
      const Gap(Spacing.small),
      _AboutLink(
        icon: Icons.apps_rounded,
        title: context.l10n.otherApps,
        onTap: () => context.navigator.pushNamed(MoreAppsScreen.routeName),
      ),
    ],
  );
}

class _AboutLink extends StatelessWidget {
  const _AboutLink({
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => _SettingCell(
    onTap: onTap,
    child: Row(
      children: [
        Icon(
          icon,
          color: context.colorScheme.primary,
          size: AppDesign.iconSize,
        ),
        const Gap(Spacing.normal),
        Expanded(child: Text(title, style: context.textTheme.titleMedium)),
        const Gap(Spacing.small),
        Icon(
          Icons.chevron_right_rounded,
          color: context.colorScheme.onSurfaceVariant,
        ),
      ],
    ),
  );
}
