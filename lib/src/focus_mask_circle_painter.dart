part of focus_mask;

class FocusMaskCirclePainter extends CustomPainter {
  final Offset? point;
  final double radius;
  final Color color;

  FocusMaskCirclePainter({
    Color? color,
    this.point,
    double? radius = 50.0,
  })  : color = color ?? const Color.fromRGBO(0, 0, 0, .6),
        radius = radius ?? 50;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    if (point != null) {
      canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRRect(RRect.fromLTRBR(0, 0, size.width, size.height, const Radius.circular(0))),
          Path()
            ..addOval(Rect.fromCircle(center: point!, radius: radius))
            ..close(),
        ),
        paint,
      );
    } else {
      canvas.drawPath(
        Path()..addRRect(RRect.fromLTRBR(0, 0, size.width, size.height, const Radius.circular(0))),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
