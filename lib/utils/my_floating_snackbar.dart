import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SnackBar myFloatinSnackBar(text, context) {
  return SnackBar(
    content: Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Theme.of(context).colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
