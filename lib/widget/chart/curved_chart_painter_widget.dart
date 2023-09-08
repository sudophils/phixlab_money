import 'package:flutter/cupertino.dart';

class GradientChartPainter extends CustomPainter {
  final List<double> xValues;
  final List<double> yValues;
  final Color color;
  final double strokeWidth;

  GradientChartPainter({
    required this.xValues,
    required this.yValues,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;

    var path = Path();
    if (xValues.length > 1 && yValues.isNotEmpty) {
      final maxValue = yValues.last;
      final firstValueHeight = size.height * (xValues.first / maxValue);
      path.moveTo(0.0, size.height - firstValueHeight);

      final itemXDistance = size.width / (xValues.length - 1);
      for (var i = 1; i < xValues.length; i++) {
        final x = itemXDistance * i;
        final valueHeight = size.height -
            strokeWidth -
            ((size.height - strokeWidth) * (xValues[i] / maxValue));
        final previousValueHeight = size.height -
            strokeWidth -
            ((size.height - strokeWidth) * (xValues[i - 1] / maxValue));

        path.quadraticBezierTo(
          x - (itemXDistance / 2) - (itemXDistance / 8),
          previousValueHeight,
          x - (itemXDistance / 2),
          valueHeight + ((previousValueHeight - valueHeight) / 2),
        );
        path.quadraticBezierTo(
          x - (itemXDistance / 2) + (itemXDistance / 8),
          valueHeight,
          x,
          valueHeight,
        );
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
