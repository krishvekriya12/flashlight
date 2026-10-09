part of '../screen_light.dart';

class _ScreenLightControls extends StatelessWidget {
  const _ScreenLightControls();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ScreenLightProvider>();

    final blinkProgress = context.select<ScreenLightProvider, int>(
      (provider) => provider.blinkProgress,
    );

    final showControls = context.select<ScreenLightProvider, bool>(
      (provider) => provider.showControls,
    );

    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: showControls ? 1 : 0,
        duration: AppMotion.duration(context),
        child: IgnorePointer(
          ignoring: !showControls,
          child: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: Spacing.normal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _BackButton(),
                Spacer(),
                Container(
                  width: context.width,
                  padding: EdgeInsets.only(
                    left: Spacing.large,
                    right: Spacing.large,
                    top: Spacing.small,
                    bottom: Spacing.large,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface.withColorOpacity(0.90),
                    borderRadius: ShapeBorderRadius.large,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.flash_off_rounded,
                            size: 28,
                            color: context.colorScheme.onSurface,
                          ),
                          Spacer(),
                          CommonButton.icon(
                            onTap: provider.onToggleControls,
                            child: Icon(
                              Icons.close_rounded,
                              size: 28,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                      Gap(Spacing.medium),
                      AppSlider(
                        min: 0,
                        max: 5,
                        divisions: 5,
                        value: blinkProgress.toDouble(),
                        onChanged: provider.onBlinkProgressChanged,
                      ),
                    ],
                  ),
                ),

                Gap(Spacing.normal),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
