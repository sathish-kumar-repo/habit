import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyLinearPercentIndicatorText extends StatelessWidget {
  const MyLinearPercentIndicatorText({
    super.key,
    required this.percent,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '${((percent) * 100).toInt()}%',
            style: GoogleFonts.poppins(),
          ),
          Text(
            ' achieved',
            style: GoogleFonts.poppins(),
          ),
        ],
      ),
    );
  }
}

class MyLinearPercentIndicator extends StatelessWidget {
  const MyLinearPercentIndicator({
    super.key,
    required this.percent,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      animation: true,
      animationDuration: 1000,
      barRadius: const Radius.circular(20),
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
      percent: percent,
      lineHeight: 10,
      progressColor: Theme.of(context).colorScheme.primary,
    );
  }
}
