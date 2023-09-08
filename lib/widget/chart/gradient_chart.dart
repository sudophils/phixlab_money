import 'package:flutter/material.dart';

import 'curved_chart_painter_widget.dart';

class GradientChartWidget extends StatelessWidget {
  const GradientChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFF63E02).withOpacity(0.45),
            Colors.white.withOpacity(0.0),
          ],
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: CustomPaint(
        painter: GradientChartPainter(
          xValues: [
            0.5,
            1.6,
            1.6,
            1.3,
            0.1,
            0.5,
          ],
          yValues: [
            0.0,
            1.0,
            2.0,
            3.0,
            4.0,
          ],
          strokeWidth: 3.0,
          color: Colors.red,
        ),
      ),
    );
    ;
  }
}
