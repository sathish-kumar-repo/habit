import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyAnalytics extends StatelessWidget {
  const MyAnalytics({
    super.key,
    required this.maxX,
    required this.flSpot,
  });

  final double maxX;
  final List<FlSpot> flSpot;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 250,
        padding: const EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
          bottom: 15,
          
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.tertiary,
        ),
        child: LineChart(
          LineChartData(
            minY: 0,
            maxY: maxX,
            maxX: maxX,
            borderData: FlBorderData(
              border: Border.all(
                color: Colors.transparent,
              ),
            ),
            titlesData: const FlTitlesData(
              show: false,
            ),
            lineTouchData: const LineTouchData(enabled: false),
            gridData: const FlGridData(show: false),
            // gridData: FlGridData(
            //   show: true,
            //   getDrawingHorizontalLine: (value) {
            //     return FlLine(
            //       color: const Color(0xff37434d).withOpacity(0.5),
            //       strokeWidth: 1,
            //     );
            //   },
            //   drawVerticalLine: true,
            //   getDrawingVerticalLine: (value) {
            //     return FlLine(
            //       color: const Color(0xff37434d).withOpacity(0.5),
            //       strokeWidth: 1,
            //     );
            //   },
            // ),
            lineBarsData: [
              LineChartBarData(
                spots: flSpot,
                color: Theme.of(context).colorScheme.primary,
                barWidth: 3,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                    show: true,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3)
                    // gradient: LinearGradient(
                    //   colors: gradientColors
                    //       .map((color) => color.withOpacity(0.3))
                    //       .toList(),
                    // ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
