import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalyticsTitle extends StatelessWidget {
  const AnalyticsTitle({
    super.key,
    required this.txt,
  });
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: GoogleFonts.poppins(
        fontSize: 16,
      ),
    );
  }
}
