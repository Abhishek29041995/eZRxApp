//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CurvedRectangleWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double? height;
  final double width;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final int semiCircleCount;
  final double semiCircleRadius;
  const CurvedRectangleWidget({
    super.key,
    required this.child,
    required this.padding,
    this.height,
    required this.width,
    this.backgroundColor = ZPColors.lightBgYellow,
    this.borderColor = ZPColors.lightBorderYellow,
    this.borderWidth = 1,
    required this.semiCircleCount,
    required this.semiCircleRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(semiCircleRadius),
          color: backgroundColor,
        ),
        child: CustomPaint(
          foregroundPainter: _CurvedRectangle(
            borderColor: borderColor,
            semiCircleCount: semiCircleCount,
            semiCircleRadius: semiCircleRadius,
            borderWidth: borderWidth,
          ),
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}

class _CurvedRectangle extends CustomPainter {
  final Color borderColor;
  final int semiCircleCount;
  final double semiCircleRadius;
  final double borderWidth;
  _CurvedRectangle({
    required this.borderColor,
    required this.semiCircleCount,
    required this.semiCircleRadius,
    required this.borderWidth,
  });

  void _paintSemiCircle(Canvas canvas, Size size, bool isLeft, Paint paint) {
    final height = size.height;
    final cornerEdge = semiCircleRadius / 4;
    final width = isLeft ? 0.0 : size.width;
    final spacing = isLeft ? cornerEdge : width - cornerEdge;
    final smallSemiCircle = height / semiCircleCount;

    final arc = Path();
    arc.moveTo(spacing, 0);
    var smallQuarterCircle = smallSemiCircle / 2;
    arc.arcToPoint(
      Offset(width, smallQuarterCircle),
      radius: Radius.circular(height / (semiCircleRadius * 2)),
      clockwise: isLeft,
    );
    canvas.drawPath(arc, paint);
    arc.moveTo(width, smallQuarterCircle);
    for (var i = 1; i <= semiCircleCount; i++) {
      arc.arcToPoint(
        Offset(width, smallQuarterCircle),
        radius: Radius.circular(height / semiCircleRadius),
        clockwise: isLeft,
      );
      canvas.drawPath(arc, paint);
      arc.moveTo(width, smallQuarterCircle);
      smallQuarterCircle = smallQuarterCircle + smallSemiCircle;
    }
    arc.arcToPoint(
      Offset(spacing, smallQuarterCircle - smallSemiCircle / 2),
      radius: Radius.circular(height / (semiCircleRadius * 2)),
      clockwise: isLeft,
    );
    canvas.drawPath(arc, paint);
    arc.close();
  }

  void _paintCurvedRectangle(Canvas canvas, Size size, Paint paint) {
    final cornerEdge = semiCircleRadius / 4;
    final topLeftOffset = Offset(cornerEdge, 0);
    final topRightOffset = Offset(size.width - cornerEdge, 0);
    final bottomLeftOffset = Offset(cornerEdge, size.height);
    final bottomRightOffset =
        Offset(size.width - semiCircleRadius / 4, size.height);

    _paintSemiCircle(canvas, size, true, paint);
    _paintSemiCircle(canvas, size, false, paint);
    canvas.drawLine(
      topLeftOffset,
      topRightOffset,
      paint..strokeWidth = paint.strokeWidth + size.height / 200,
    );
    canvas.drawLine(bottomLeftOffset, bottomRightOffset, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    _paintCurvedRectangle(canvas, size, paint);
    final newPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    _paintCurvedRectangle(canvas, size, newPaint);
  }

  //ignore: code-duplication
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
