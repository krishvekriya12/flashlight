part of '../screen_light.dart';
class _ColorTab extends StatelessWidget {
  const _ColorTab();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ScreenLightProvider>();

    return CommonButton.cupertino(
      onTap: provider.onToggleControls,
      child: const Stack(children: [_LightSurface(), _ColorControls()]),
    );
  }
}
