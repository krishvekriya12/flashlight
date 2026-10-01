part of '../setting.dart';

class _Personalization extends StatelessWidget {
  const _Personalization({super.key});

  @override
  Widget build(BuildContext context) {
    final isTurnOnFlash = context.select<SettingProvider, bool>((value) => value.isTurnOnFlash);
    final provider = context.read<SettingProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.personalization,
          style: context.textTheme.titleSmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
        Gap(Spacing.medium),
        _SettingCell(
          onTap: () {
            context.navigator.pushNamed(LanguageSelectionScreen.routeName, arguments: true);
          },
          child: Row(
            children: [
              Icon(Icons.language, color: context.colorScheme.primary, size: 24),
              Gap(Spacing.medium),
              Text(
                context.l10n.language,
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
            context.navigator.pushNamed(AppModeScreen.routeName);
          },
          child: Row(
            children: [
              Icon(Icons.light_mode, color: context.colorScheme.primary, size: 24),
              Gap(Spacing.medium),
              Text(
                context.l10n.appMode,
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
            provider.toggleTurnOnFlash();
          },
          child: Row(
            children: [
              Icon(Icons.flashlight_on, color: context.colorScheme.primary, size: 24),
              Gap(Spacing.medium),
              Expanded(
                child: Text(
                  context.l10n.turnFlashlightOn,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                isTurnOnFlash ? Icons.check_box : Icons.check_box_outline_blank,
                color: isTurnOnFlash ? context.colorScheme.primary : context.colorScheme.onSurfaceVariant,
                size: 22,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


