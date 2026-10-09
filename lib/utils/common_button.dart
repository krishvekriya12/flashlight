import 'package:flutter/material.dart';
import 'package:flashlight/resource/resource.dart';

enum ClickType { icon, material, cupertino }

/// Existing callbacks are preserved while controls share spring feedback.
class CommonButton extends StatelessWidget {
  const CommonButton.icon({
    super.key,
    required this.onTap,
    required this.child,
    this.padding,
    this.radius,
    this.pressedOpacity,
  }) : clickType = ClickType.icon;
  const CommonButton.material({
    super.key,
    required this.onTap,
    required this.child,
    this.padding,
    this.radius,
    this.pressedOpacity,
  }) : clickType = ClickType.material;
  const CommonButton.cupertino({
    super.key,
    required this.onTap,
    required this.child,
    this.padding,
    this.radius,
    this.pressedOpacity,
  }) : clickType = ClickType.cupertino;
  final VoidCallback? onTap;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final double? pressedOpacity;
  final ClickType clickType;
  @override
  Widget build(BuildContext context) => AppPress(
    onTap: onTap,
    padding: padding ?? EdgeInsets.zero,
    radius: radius ?? AppDesign.selectedRadius,
    child: child,
  );
}
