import 'dart:math' as math;
import 'package:flashlight/core/core.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({super.key, this.loadingMessage});

  final String? loadingMessage;

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _DualLoader(),

          if (widget.loadingMessage?.isNotEmpty ?? false) ...[
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: context.width * 0.8),
              child: Text(
                widget.loadingMessage ?? "",
                textAlign: TextAlign.center,
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.colorScheme.surface,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _DualLoader extends StatefulWidget {
  const _DualLoader({this.size = 64});

  final double size;

  @override
  State<_DualLoader> createState() => _DualLoaderState();
}

class _DualLoaderState extends State<_DualLoader> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: 800.milliseconds)..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, widget) {
          return CustomPaint(
            painter: _LoaderPainter(
              progress: _controller.value,
              color: context.colorScheme.primary,
              innerColor: context.colorScheme.primary.withColorOpacity(0.4),
            ),
          );
        },
      ),
    );
  }
}

class _LoaderPainter extends CustomPainter {
  const _LoaderPainter({required this.progress, required this.color, required this.innerColor});

  final double progress;
  final Color color;
  final Color innerColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);

    const strokeWidth = 3.3;

    final outerRadius = size.width * 0.42;
    final innerRadius = outerRadius * 0.76;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final innerPaint = Paint()
      ..color = innerColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    const sweepAngle = math.pi * 1.5;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: outerRadius),
      progress * 2 * math.pi,
      sweepAngle,
      false,
      paint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerRadius),
      -(progress * 2 * math.pi),
      sweepAngle,
      false,
      innerPaint,
    );
  }

  @override
  bool shouldRepaint(_LoaderPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}

class GradientCircularProgressIndicator extends StatefulWidget {
  final double radius;
  final double strokeWidth;

  const GradientCircularProgressIndicator({super.key, this.radius = 28, this.strokeWidth = 10.0});

  @override
  State<GradientCircularProgressIndicator> createState() => _GradientCircularProgressIndicatorState();
}

class _GradientCircularProgressIndicatorState extends State<GradientCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1))..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.radius * 2,
      height: widget.radius * 2,
      child: RotationTransition(
        turns: _animationController,
        child: CustomPaint(
          painter: _GradientCircularProgressPainter(
            radius: widget.radius,
            gradientColors: context.isDarkMode
                ? [context.colorScheme.primaryFixed, context.colorScheme.onSurfaceVariant.withColorOpacity(0)]
                : [context.colorScheme.primaryFixed, context.colorScheme.onPrimary],
            strokeWidth: widget.strokeWidth,
          ),
        ),
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter({required this.radius, required this.gradientColors, required this.strokeWidth});

  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  double _degreeToRad(double degree) => degree * math.pi / 180;

  @override
  void paint(Canvas canvas, Size size) {
    double centerPoint = size.height / 2;

    Paint paint = Paint()
      ..color = gradientColors.first
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    paint.shader = SweepGradient(
      colors: gradientColors.reversed.toList(),
      tileMode: TileMode.repeated,
      startAngle: _degreeToRad(270),
      endAngle: _degreeToRad(270 + 360.0),
    ).createShader(Rect.fromCircle(center: Offset(centerPoint, centerPoint), radius: 0));

    var scapSize = strokeWidth * 0.70;
    double scapToDegree = scapSize / centerPoint;

    double startAngle = _degreeToRad(270) + scapToDegree;
    double sweepAngle = _degreeToRad(360) - (2 * scapToDegree);

    canvas.drawArc(
      Offset(0.0, 0.0) & Size(size.width, size.width),
      startAngle,
      sweepAngle,
      false,
      paint..color = gradientColors.first,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
