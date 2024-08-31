import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List doItAtDescription = [
  'Take mindful pauses throughout the day to breathe, stretch, and appreciate the present moment.',
  'Begin with exercise, meditation, and planning to energize and set intentions for the day.',
  'Recharge with hydration, a brisk walk, and reflection to boost productivity and clarity.',
  'Wind down with reading, connecting with loved ones, and relaxation to ease into restful sleep.',
  'Prepare for rest with journaling, meditation, and practicing gratitude for a peaceful mind and body.',
];

class DoItAtText extends StatelessWidget {
  const DoItAtText({
    super.key,
    required this.doItAtIndex,
  });

  final int doItAtIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedSwitcherPlus.zoomIn(
        duration: const Duration(milliseconds: 600),
        child: Text(
          doItAtDescription[doItAtIndex],
          key: ValueKey(doItAtIndex),
          style: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
