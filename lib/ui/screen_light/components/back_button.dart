part of '../screen_light.dart';
class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    final color = context.select<ScreenLightProvider, int>((provider) => provider.color);
    final fillColor = Color(color);
    final luminance = (0.299 * fillColor.r) + (0.587 * fillColor.g) + (0.114 * fillColor.b);
    return CommonButton.icon(
      onTap: context.navigator.pop,
      child: Icon(
       Icons.chevron_left,size: 32,
        color: (1 - luminance) < 0.3 ? context.colorScheme.scrim : context.colorScheme.onSurface,
      ),
    );
  }
}

