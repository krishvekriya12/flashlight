part of '../screen_light.dart';

class _ScreenLightTab extends StatelessWidget {
  const _ScreenLightTab();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ScreenLightProvider>();

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: provider.onToggleControls,
      child: Stack(children: [_LightSurface(), _ScreenLightControls()]),
    );
  }
}
