import 'package:flutter/material.dart';

import '../widget/chart/gradient_chart.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [const GradientChartWidget()],
      ),
    ));
  }
}
