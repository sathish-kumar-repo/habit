import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EgText extends StatelessWidget {
  const EgText({
    super.key,
    required this.evaluationMethodIndex,
  });

  final int evaluationMethodIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      child: (evaluationMethodIndex == 1 || evaluationMethodIndex == 2)
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  evaluationMethodIndex == 1
                      ? 'eg. Limit coffee intake to less than 10 cups per day.'
                      : 'eg. Exercise at least 40 minutes a day',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
