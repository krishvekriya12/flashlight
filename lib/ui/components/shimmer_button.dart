import 'dart:ui';
import 'package:flashlight/core/core.dart';
import 'package:flashlight/resource/resource.dart';
import 'package:flutter/material.dart';

class ShimmerButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String title;

  const ShimmerButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  State<ShimmerButton> createState() => _ShimmerButtonState();
}

class _ShimmerButtonState extends State<ShimmerButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
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
      builder: (_, _) {
        return ClipRect(
          child: Stack(
            children: [
              SizedBox(
                width: context.width,
                height: 48,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    fixedSize: Size(context.width, 48),
                  ),
                  onPressed: widget.onTap,
                  child: Text(
                    widget.title,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: ShapeBorderRadius.medium,
                  child: IgnorePointer(
                    child: CustomPaint(
                      painter: PermissionShimmerPainter(
                        progress: Curves.easeInOutCubic.transform(
                          _controller.value,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PermissionShimmerPainter extends CustomPainter {
  final double progress;

  const PermissionShimmerPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = lerpDouble(
      -size.width * .05,
      size.width * 1.45,
      progress,
    )!;

    _drawShimmer(
      canvas,
      size,
      centerX,
      widthScale: .07,
    );

    _drawShimmer(
      canvas,
      size,
      centerX - size.width * .055,
      widthScale: .035,
    );
  }

  void _drawShimmer(
      Canvas canvas,
      Size size,
      double centerX, {
        required double widthScale,
      }) {
    final rect = Rect.fromCenter(
      center: Offset(
        centerX,
        size.height / 2,
      ),
      width: size.width * .30,
      height: size.height * 4,
    );

    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.white.withColorOpacity(.30),
          Colors.white.withColorOpacity(.30),
          Colors.white.withColorOpacity(.30),
          Colors.white.withColorOpacity(.30),
          Colors.white.withColorOpacity(.30),
          Colors.white.withColorOpacity(.30),
          Colors.white.withColorOpacity(.30),
        ],
        stops: const [
          0.0,
          .18,
          .36,
          .50,
          .64,
          .82,
          1.0,
        ],
      ).createShader(rect);

    canvas.save();

    canvas.translate(
      centerX,
      size.height / 2,
    );

    canvas.rotate(0.45);

    canvas.scale(
      widthScale,
      3.0,
    );

    final path = Path();

    path.moveTo(-100, -120);

    path.cubicTo(
      -30,
      -140,
      30,
      -120,
      90,
      -45,
    );

    path.cubicTo(
      120,
      0,
      105,
      55,
      45,
      105,
    );

    path.cubicTo(
      -15,
      135,
      -85,
      115,
      -115,
      50,
    );

    path.cubicTo(
      -140,
      -15,
      -130,
      -90,
      -100,
      -120,
    );

    path.close();

    canvas.drawPath(
      path,
      paint,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(
      covariant PermissionShimmerPainter oldDelegate,
      ) {
    return oldDelegate.progress != progress;
  }
}
