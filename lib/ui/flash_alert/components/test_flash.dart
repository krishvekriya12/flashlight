part of '../flash_alert.dart';
class _TestFlash extends StatelessWidget {
  const _TestFlash({super.key});

  @override
  Widget build(BuildContext context) {
    final isTestOnSelected = context.select<FlashAlertProvider, bool?>(
          (value) => value.isTestOnSelected,
    );
    final isTestingFlash = context.select<FlashAlertProvider, bool>(
          (value) => value.isTestingFlash,
    );
    final onLength = context.select<FlashAlertProvider, int>(
          (value) => value.onLength,
    );
    final onLengthIndex = context.select<FlashAlertProvider, int>(
          (value) => value.onLengthIndex,
    );
    final offLength = context.select<FlashAlertProvider, int>(
          (value) => value.offLength,
    );
    final offLengthIndex = context.select<FlashAlertProvider, int>(
          (value) => value.offLengthIndex,
    );
    final provider = context.read<FlashAlertProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.testFlash,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
        Gap(Spacing.small),
        Divider(
          color: context.colorScheme.onSurfaceVariant.withColorOpacity(.70),
        ),
        Gap(Spacing.medium),
        _FlashLengthCell(
          title: context.l10n.onLength,
          value: onLength,
          sliderValue: onLengthIndex.toDouble(),
          onChanged: provider.setOnLength,
        ),
        Gap(Spacing.medium),
        _FlashLengthCell(
          title: context.l10n.offLength,
          value: offLength,
          sliderValue: offLengthIndex.toDouble(),
          onChanged: provider.setOffLength,
        ),
        Gap(Spacing.medium),
        Row(
          children: [
            Expanded(
              child: _TestFlashButton(
                text: context.l10n.testOn,
                isSelected: isTestOnSelected == true,
                isLoading: isTestingFlash,
                onTap: () {
                  provider.selectTestOn(true);
                  provider.testFlashOn();
                },
              ),
            ),
            Gap(Spacing.large),
            Expanded(
              child: _TestFlashButton(
                text: context.l10n.testOff,
                isSelected: isTestOnSelected == false,
                isLoading: isTestingFlash,
                onTap: () {
                  provider.selectTestOn(false);
                  provider.testFlashOff();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
