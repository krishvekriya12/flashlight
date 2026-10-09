part of '../screen_light.dart';

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: context.navigator.pop,
      icon: const Icon(Icons.arrow_back_rounded, size: AppDesign.iconSize),
    );
  }
}
