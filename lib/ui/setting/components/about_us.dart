part of '../setting.dart';

class _AboutUS extends StatelessWidget {
  const _AboutUS({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.aboutUs,
          style: context.textTheme.titleSmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
        Gap(Spacing.medium),
        _SettingCell(
          onTap: () async {
            await SharePlus.instance.share(
              ShareParams(
                text:
                    "Download Flashlight App: https://play.google.com/store/apps/details?id=com.flashlight.flashlight",
              ),
            );
          },
          child: Row(
            children: [
              Icon(Icons.share, color: context.colorScheme.primary, size: 24),
              Gap(Spacing.medium),
              Text(
                context.l10n.shareApp,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Gap(Spacing.medium),
        _SettingCell(
          onTap: () {
            CommonFunctions.openUrl(
              url:
                  "https://play.google.com/store/apps/details?id=com.flashlight.flashlight",
            );
          },
          child: Row(
            children: [
              Icon(
                Icons.star_rate_rounded,
                color: context.colorScheme.primary,
                size: 24,
              ),
              Gap(Spacing.medium),
              Text(
                context.l10n.rateUs,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Gap(Spacing.medium),
        _SettingCell(
          onTap: () {
            context.navigator.pushNamed(PrivacyPolicyScreen.routeName);
          },
          child: Row(
            children: [
              Icon(
                Icons.privacy_tip,
                color: context.colorScheme.primary,
                size: 22,
              ),
              Gap(Spacing.medium),
              Text(
                context.l10n.privacyPolicy,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Gap(Spacing.medium),
        _SettingCell(
          onTap: () {
            context.navigator.pushNamed(MoreAppsScreen.routeName);
          },
          child: Row(
            children: [
              Icon(
                Icons.apps_rounded,
                color: context.colorScheme.primary,
                size: 24,
              ),
              Gap(Spacing.medium),
              Expanded(
                child: Text(
                  context.l10n.otherApps,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: context.colorScheme.onSurfaceVariant,
                size: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
