part of '../language_selection.dart';

class _LanguageCell extends StatefulWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final bool showHighlight;
  final String icon;
  final String title;

  const _LanguageCell({
    required this.onTap,
    required this.isSelected,
    required this.showHighlight,
    required this.icon,
    required this.title,
  });

  @override
  State<_LanguageCell> createState() => _LanguageCellState();
}

class _LanguageCellState extends State<_LanguageCell> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: 700.milliseconds);

    if (widget.showHighlight) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant _LanguageCell oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.showHighlight) {
      _controller.repeat(reverse: true);
    } else {
      _controller.stop();
      _controller.value = 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(scale: widget.showHighlight ? 1.0 - (_controller.value * 0.05) : 1.0, child: child);
      },
      child: CommonButton.cupertino(
        onTap: widget.onTap,
        child: Container(
          width: context.width,
          padding: EdgeInsets.symmetric(horizontal: Spacing.normal, vertical: Spacing.medium),
          decoration: BoxDecoration(
            color: widget.isSelected ? context.colorScheme.onInverseSurface : context.colorScheme.primaryContainer,
            borderRadius: ShapeBorderRadius.normal,
            border: Border.all(color: widget.isSelected ? context.colorScheme.primary : Colors.transparent),
          ),
          child: Row(
            children: [
              Container(
                height: 38,
                width: 38,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: ShapeBorderRadius.small,
                  ),
                child: SvgPicture.asset(widget.icon, fit: BoxFit.cover),
              ),
              Gap(Spacing.normal),
              Expanded(
                child: Text(
                  widget.title,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (widget.isSelected) Icon(Icons.check, size: 30, color: context.colorScheme.primary),
            ],
          ),
        ),
      ),
    );
  }
}
