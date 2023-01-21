part of focus_mask;

class FocusMaskRectanglePainter extends CustomPainter {
  final Offset? point;
  final double width;
  final double height;
  final Color color;

  FocusMaskRectanglePainter({
    Color? color,
    this.point,
    double? width = 50.0,
    double? height = 50.0,
  })  : color = color ?? const Color.fromRGBO(0, 0, 0, .6),
        width = width ?? 50.0,
        height = height ?? 50.0;

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
            ..addRRect(RRect.fromLTRBR(point!.dx - width / 2, point!.dy - height / 2, point!.dx + width / 2, point!.dy + height / 2, Radius.circular(0)))
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
