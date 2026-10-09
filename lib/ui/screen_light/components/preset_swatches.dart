part of '../screen_light.dart';

class _PresetSwatches extends StatelessWidget {
  const _PresetSwatches();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Spacing.small,
      runSpacing: Spacing.small,
      children: List.generate(
        AppConstant.screenLightPresets.length,
        (index) => _PresetSwatch(index: index),
      ),
    );
  }
}

class _PresetSwatch extends StatelessWidget {
  final int index;

  const _PresetSwatch({required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ScreenLightProvider>();
    final presetIndex = context.select<ScreenLightProvider, int>(
      (value) => value.presetIndex,
    );
    final color = context.select<ScreenLightProvider, int>(
      (value) => value.color,
    );
    final isCustom = index == AppConstant.screenLightCustomIndex;
    final swatchColor = Color(
      isCustom ? color : AppConstant.screenLightPresets[index],
    );
    final isSelected = presetIndex == index;
    return Semantics(
      selected: isSelected,
      label: '${context.l10n.chooseColor} ${index + 1}',
      child: CommonButton.cupertino(
        onTap: () => provider.onSelectPreset(index),
        child: Container(
          height: Spacing.xxLarge,
          width: Spacing.xxLarge,
          decoration: BoxDecoration(shape: BoxShape.circle, color: swatchColor),
          child: Container(
            padding: EdgeInsets.all(Spacing.xSmall),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? context.colorScheme.onPrimary : swatchColor,
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: swatchColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
