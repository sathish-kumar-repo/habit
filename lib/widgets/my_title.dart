import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText1 extends StatelessWidget {
  const MyText1({
    super.key,
    required this.txt,
  });
  final String txt;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      txt,
      style: GoogleFonts.poppins(
        fontSize: size.width / 13,
        color: Colors.grey,
      ),
    );
  }
}

class MyText2 extends StatelessWidget {
  const MyText2({
    super.key,
    required this.txt,
  });

  final String txt;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      txt,
      style: GoogleFonts.poppins(
        fontSize: size.width / 10,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
