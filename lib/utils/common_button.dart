import 'dart:async';
import 'package:flashlight/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
enum ClickType { icon, material, cupertino }

class CommonButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final double? pressedOpacity;
  late final ClickType clickType;

  CommonButton.icon({
    super.key,
    required this.onTap,
    required this.child,
    this.padding,
    this.radius,
    this.pressedOpacity,
  }) {
    clickType = ClickType.icon;
  }

  CommonButton.material({
    super.key,
    required this.onTap,
    required this.child,
    this.padding,
    this.radius,
    this.pressedOpacity,
  }) {
    clickType = ClickType.material;
  }

  CommonButton.cupertino({
    super.key,
    required this.onTap,
    required this.child,
    this.padding,
    this.radius,
    this.pressedOpacity,
  }) {
    clickType = ClickType.cupertino;
  }

  @override
  Widget build(BuildContext context) {
    switch (clickType) {
      case ClickType.icon:
        return _IconButton(
          onTap: onTap,
          padding: padding,
          child: child,
        );
      case ClickType.material:
        return _MaterialButton(
          onTap: onTap,
          radius: radius,
          padding: padding,
          child: child,
        );
      case ClickType.cupertino:
        return _CupertinoButton(
          onTap: onTap,
          padding: padding,
          pressedOpacity: pressedOpacity,
          child: child,
        );
    }
  }
}

class _IconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const _IconButton({required this.onTap, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: IconButton(
        // constraints: const BoxConstraints(),
        // splashRadius: 2,
          alignment: Alignment.center,
          padding: padding ?? EdgeInsets.zero,
          highlightColor: context.colorScheme.onSurfaceVariant.withValues(alpha: .1),
          onPressed: onTap,
          icon: child),
    );
  }
}

class _MaterialButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final double? radius;
  final EdgeInsetsGeometry? padding;

  const _MaterialButton(
      {required this.onTap,
        required this.child,
        this.radius,
        required this.padding});

  @override
  Widget build(BuildContext context) {
    final animationDuration = 150.milliseconds;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Stack(children: [
        child,
        Positioned.fill(
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 0)),
            padding: EdgeInsets.zero,
            animationDuration: animationDuration,
            onPressed:onTap==null?null: () {
              Timer(animationDuration, () {
                if (onTap != null) {
                  onTap!();
                }
              });
            },
          ),
        ),
      ]),
    );
  }
}

class _CupertinoButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final double? pressedOpacity;
  final EdgeInsetsGeometry? padding;

  const _CupertinoButton(
      {required this.onTap,
        required this.child,
        this.pressedOpacity,
        this.padding});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minimumSize: const Size(10, 10),
      pressedOpacity: pressedOpacity ?? .7,
      padding: padding ?? EdgeInsets.zero,
      onPressed: onTap,
      child: child,
    );
  }
}
