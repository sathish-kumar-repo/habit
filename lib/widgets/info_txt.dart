import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoText extends StatelessWidget {
  const InfoText(
    this.txt, {
    super.key,
    required this.clr,
    this.fontSize = 11,
  });
  final Color clr;
  final String txt;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: clr.withOpacity(theme == Brightness.dark ? 0.3 : 0.1),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        txt,
        style: GoogleFonts.poppins(
          color: clr,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
