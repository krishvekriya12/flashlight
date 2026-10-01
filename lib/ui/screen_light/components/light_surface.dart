part of '../screen_light.dart';

class _LightSurface extends StatelessWidget {
  const _LightSurface();

  @override
  Widget build(BuildContext context) {
    final color = context.select<ScreenLightProvider, int>((provider) => provider.color);

    final isBlinkVisible = context.select<ScreenLightProvider, bool>((provider) => provider.isBlinkVisible);

    return Positioned.fill(child: ColoredBox(color: isBlinkVisible ? Color(color) : context.colorScheme.scrim));
  }
}
