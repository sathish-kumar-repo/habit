import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../habit_tracker.dart';

class CustomCountingDays extends StatelessWidget {
  const CustomCountingDays({
    super.key,
    required this.count,
    required this.widget,
  });

  final int? count;
  final HabitTracker widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.grey,
            ),
            children: [
              TextSpan(
                  text: '${count ?? 0}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  )),
              TextSpan(text: ' / ${widget.howManyDays} days'),
            ],
          ),
        ),
        const SizedBox(width: 6),
      ],
    );
  }
}
