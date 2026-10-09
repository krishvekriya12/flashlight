part of '../setting.dart';

class _Personalization extends StatelessWidget {
  const _Personalization({super.key});

  @override
  Widget build(BuildContext context) {
    final isTurnOnFlash = context.select<SettingProvider, bool>(
      (value) => value.isTurnOnFlash,
    );
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
            context.navigator.pushNamed(
              LanguageSelectionScreen.routeName,
              arguments: true,
            );
          },
          child: Row(
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.language_rounded,
                  color: context.colorScheme.primary,
                  size: 22,
                ),
              ),
              Gap(Spacing.medium),
              Expanded(
                child: Text(
                  context.l10n.language,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: context.colorScheme.onSurfaceVariant.withColorOpacity(
                  0.7,
                ),
                size: 22,
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
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.light_mode_rounded,
                  color: context.colorScheme.primary,
                  size: 22,
                ),
              ),
              Gap(Spacing.medium),
              Expanded(
                child: Text(
                  context.l10n.appMode,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: context.colorScheme.onSurfaceVariant.withColorOpacity(
                  0.7,
                ),
                size: 22,
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
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.flashlight_on_rounded,
                  color: context.colorScheme.primary,
                  size: 22,
                ),
              ),
              Gap(Spacing.medium),
              Expanded(
                child: Text(
                  context.l10n.turnFlashlightOn,
                  textAlign: TextAlign.start,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                isTurnOnFlash
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank_rounded,
                color: isTurnOnFlash
                    ? context.colorScheme.primary
                    : context.colorScheme.onSurfaceVariant,
                size: 22,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
