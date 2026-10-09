import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:flashlight/resource/resource.dart';

/// Shared physics animation; accessibility requests bypass the simulation.
class SpringValue extends StatefulWidget {
  const SpringValue({
    super.key,
    required this.value,
    required this.builder,
    this.child,
    this.effects = false,
    this.initialValue,
  });
  final double value;
  final double? initialValue;
  final bool effects;
  final Widget? child;
  final Widget Function(BuildContext, double, Widget?) builder;
  @override
  State<SpringValue> createState() => _SpringValueState();
}

class _SpringValueState extends State<SpringValue>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController.unbounded(
    vsync: this,
    value: widget.initialValue ?? widget.value,
  );
  void _update() {
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.value = widget.value;
    } else if (_controller.value != widget.value) {
      _controller.animateWith(
        SpringSimulation(
          widget.effects ? AppMotion.effects : AppMotion.spatial,
          _controller.value,
          widget.value,
          _controller.velocity,
          snapToEnd: true,
        ),
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _update();
  }

  @override
  void didUpdateWidget(SpringValue oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) _update();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _controller,
    child: widget.child,
    builder: (context, child) =>
        widget.builder(context, _controller.value, child),
  );
}

class AppPress extends StatefulWidget {
  const AppPress({
    super.key,
    required this.child,
    required this.onTap,
    this.padding = EdgeInsets.zero,
    this.radius = AppDesign.selectedRadius,
  });
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final double radius;
  @override
  State<AppPress> createState() => _AppPressState();
}

class _AppPressState extends State<AppPress> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) => SpringValue(
    value: _pressed && widget.onTap != null ? AppDesign.pressedScale : 1,
    builder: (context, scale, child) =>
        Transform.scale(scale: scale, child: child),
    child: Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(widget.radius),
        onTap: widget.onTap,
        onHighlightChanged: (value) => setState(() => _pressed = value),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: AppDesign.touchTarget,
            minHeight: AppDesign.touchTarget,
          ),
          child: Padding(padding: widget.padding, child: widget.child),
        ),
      ),
    ),
  );
}

class ExpressiveSurface extends StatelessWidget {
  const ExpressiveSurface({
    super.key,
    required this.child,
    this.selected = false,
    this.padding = const EdgeInsets.all(Spacing.normal),
    this.hero = false,
  });
  final Widget child;
  final bool selected;
  final bool hero;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SpringValue(
      value: selected ? 1 : 0,
      child: child,
      builder: (context, value, child) => SpringValue(
        value: selected ? 1 : 0,
        effects: true,
        child: child,
        builder: (context, tint, child) => Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Color.lerp(
              colors.surfaceContainerLow,
              colors.primaryContainer,
              tint.clamp(0, 1),
            ),
            borderRadius: BorderRadius.circular(
              hero
                  ? AppDesign.heroRadius
                  : AppDesign.idleRadius +
                        (AppDesign.selectedRadius - AppDesign.idleRadius) *
                            value,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class AppContent extends StatelessWidget {
  const AppContent({
    super.key,
    required this.child,
    this.scroll = true,
    this.padding = const EdgeInsets.all(Spacing.normal),
  });
  final Widget child;
  final bool scroll;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) => SafeArea(
    top: false,
    child: Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppDesign.contentWidth),
        child: scroll
            ? SingleChildScrollView(padding: padding, child: child)
            : Padding(padding: padding, child: child),
      ),
    ),
  );
}

class LightToggle extends StatelessWidget {
  const LightToggle({
    super.key,
    required this.label,
    required this.active,
    required this.icon,
    required this.onTap,
  });
  final String label;
  final bool active;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Semantics(
      label: label,
      toggled: active,
      button: true,
      onTap: onTap,
      child: ExcludeSemantics(
        child: AppPress(
          onTap: () {
            HapticFeedback.selectionClick();
            onTap();
          },
          child: SpringValue(
            value: active ? 1 : 0,
            builder: (context, value, _) => Container(
              width: AppDesign.heroSize,
              height: AppDesign.heroSize,
              decoration: BoxDecoration(
                color: Color.lerp(
                  colors.secondaryContainer,
                  colors.primary,
                  value.clamp(0, 1),
                ),
                borderRadius: BorderRadius.circular(
                  AppDesign.heroSize / 2 +
                      (AppDesign.heroRadius - AppDesign.heroSize / 2) * value,
                ),
              ),
              child: Icon(
                icon,
                size: AppDesign.heroSize / 2.5,
                color: Color.lerp(
                  colors.onSecondaryContainer,
                  colors.onPrimary,
                  value.clamp(0, 1),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpressiveLoader extends StatefulWidget {
  const ExpressiveLoader({super.key, this.size = AppDesign.touchTarget});
  final double size;
  @override
  State<ExpressiveLoader> createState() => _ExpressiveLoaderState();
}

class ExpressiveNavigation extends StatelessWidget {
  const ExpressiveNavigation({
    super.key,
    required this.labels,
    required this.icons,
    required this.selectedIndex,
    required this.onSelected,
    this.vertical = false,
    this.expanded = false,
  });
  final List<String> labels;
  final List<IconData> icons;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final bool vertical;
  final bool expanded;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final destinations = List.generate(labels.length, (index) {
      final selected = index == selectedIndex;
      final foreground = selected
          ? colors.onPrimaryContainer
          : colors.onSurfaceVariant;
      final label = Text(
        labels[index],
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: foreground,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
        ),
      );
      final icon = Icon(
        icons[index],
        color: foreground,
        size: AppDesign.iconSize,
      );
      return Semantics(
        selected: selected,
        button: true,
        label: labels[index],
        onTap: () => onSelected(index),
        child: ExcludeSemantics(
          child: AppPress(
            onTap: () {
              if (!selected) HapticFeedback.selectionClick();
              onSelected(index);
            },
            child: ExpressiveSurface(
              selected: selected,
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.small,
                vertical: Spacing.medium,
              ),
              child: expanded
                  ? Row(
                      children: [
                        icon,
                        const SizedBox(width: Spacing.small),
                        Expanded(child: label),
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        icon,
                        const SizedBox(height: Spacing.small),
                        label,
                      ],
                    ),
            ),
          ),
        ),
      );
    });
    return Padding(
      padding: const EdgeInsets.all(Spacing.small),
      child: vertical
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: destinations
                  .map(
                    (child) => Padding(
                      padding: const EdgeInsets.only(bottom: Spacing.small),
                      child: child,
                    ),
                  )
                  .toList(),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: destinations
                  .map(
                    (child) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.xSmall,
                        ),
                        child: child,
                      ),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}

class _ExpressiveLoaderState extends State<ExpressiveLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: AppMotion.ambientDuration,
  );
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.stop();
    } else {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _controller,
    builder: (context, _) => Transform.rotate(
      angle: _controller.value * math.pi * 2,
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: Stack(
          alignment: Alignment.center,
          children: List.generate(
            4,
            (index) => Transform.rotate(
              angle: index * math.pi / 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: widget.size / 3,
                  height: widget.size / 3,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(widget.size / 6),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
