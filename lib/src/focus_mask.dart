part of focus_mask;

/// Custom drawign mask
class FocusMask extends StatelessWidget {
  const FocusMask({
    super.key,
    this.color = const Color.fromRGBO(0, 0, 0, .6),
    this.child,
    required this.painter,
  });

  final Color color;
  final CustomPainter painter;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: painter,
      child: child ?? Container(),
    );
  }

  /// Drawing circle mask
  factory FocusMask.circle({Offset? point, double? radius, Color? color}) {
    return FocusMask(
      painter: FocusMaskCirclePainter(point: point, radius: radius, color: color),
    );
  }

  /// Drawing rectangle mask
  factory FocusMask.rectangle({Offset? point, double? width, double? height, Color? color}) {
    return FocusMask(
      painter: FocusMaskRectanglePainter(point: point, width: width, height: height, color: color),
    );
  }

  /// Drawing square mask
  factory FocusMask.square({Offset? point, double? size, Color? color}) {
    return FocusMask(
      painter: FocusMaskRectanglePainter(point: point, width: size, height: size, color: color),
    );
  }

  /// Drawing offset mask
  factory FocusMask.offset({EdgeInsets? offset, Color? color}) {
    return FocusMask(
      painter: FocusMaskOffsetPainter(offset: offset, color: color),
    );
  }
}
