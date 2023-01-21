part of focus_mask;

class FocusMaskOffsetPainter extends CustomPainter {
  final EdgeInsets offset;
  final Color color;

  FocusMaskOffsetPainter({
    Color? color,
    EdgeInsets? offset,
  })  : color = color ?? const Color.fromRGBO(0, 0, 0, .6),
        offset = offset ?? const EdgeInsets.all(50.0);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRRect(RRect.fromLTRBR(0, 0, size.width, size.height, const Radius.circular(0))),
        Path()
          ..addRRect(RRect.fromLTRBR(offset.left, offset.top, size.width - offset.right, size.height - offset.bottom, const Radius.circular(0)))
          ..close(),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
