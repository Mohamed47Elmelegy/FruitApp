import 'package:flutter/material.dart';
import 'dart:math' as math;

class SkeletonWidget extends StatefulWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;
  final Duration duration;
  final bool enabled;

  const SkeletonWidget({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
    this.duration = const Duration(milliseconds: 1500),
    this.enabled = true,
  });

  @override
  State<SkeletonWidget> createState() => _SkeletonWidgetState();
}

class _SkeletonWidgetState extends State<SkeletonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    if (widget.enabled) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return _SkeletonPainter(
          animation: _animation,
          baseColor: widget.baseColor ?? Colors.grey[300]!,
          highlightColor: widget.highlightColor ?? Colors.grey[100]!,
          child: widget.child,
        );
      },
    );
  }
}

class _SkeletonPainter extends StatelessWidget {
  final Animation<double> animation;
  final Color baseColor;
  final Color highlightColor;
  final Widget child;

  const _SkeletonPainter({
    required this.animation,
    required this.baseColor,
    required this.highlightColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SkeletonPainter(
        animation: animation,
        baseColor: baseColor,
        highlightColor: highlightColor,
      ),
      child: child,
    );
  }
}

class SkeletonPainter extends CustomPainter {
  final Animation<double> animation;
  final Color baseColor;
  final Color highlightColor;

  SkeletonPainter({
    required this.animation,
    required this.baseColor,
    required this.highlightColor,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = baseColor
      ..style = PaintingStyle.fill;

    // Fill background with base color
    canvas.drawRect(Offset.zero & size, paint);

    // Create shimmer effect
    final shimmerPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          baseColor,
          highlightColor,
          baseColor,
        ],
        stops: const [
          0.0,
          0.5,
          1.0,
        ],
        transform: GradientRotation(
          animation.value * 2 * math.pi,
        ),
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Draw shimmer overlay
    canvas.drawRect(Offset.zero & size, shimmerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Extension for Sliver widgets
class SkeletonSliver extends StatelessWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;
  final Duration duration;
  final bool enabled;

  const SkeletonSliver({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
    this.duration = const Duration(milliseconds: 1500),
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SkeletonWidget(
        baseColor: baseColor,
        highlightColor: highlightColor,
        duration: duration,
        enabled: enabled,
        child: child,
      ),
    );
  }
}
