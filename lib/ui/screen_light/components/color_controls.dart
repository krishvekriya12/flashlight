part of '../screen_light.dart';

class _ColorControls extends StatelessWidget {
  const _ColorControls();

  @override
  Widget build(BuildContext context) {
    final showControls = context.select<ScreenLightProvider, bool>((value) => value.showControls);
    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: showControls ? 1 : 0,
        duration: 300.milliseconds,
        child: IgnorePointer(
          ignoring: !showControls,
          child: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: Spacing.normal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _BackButton(),
                Expanded(
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _TapHint(),
                        Gap(Spacing.small),
                        GestureDetector(behavior: HitTestBehavior.opaque, onTap: () {}, child: _LightControls()),
                        Gap(Spacing.normal),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
