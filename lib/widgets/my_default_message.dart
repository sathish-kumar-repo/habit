import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDefaultMessage extends StatelessWidget {
  const MyDefaultMessage(
    this.txt, {
    super.key,
    required this.iconData,
  });
  final String txt;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: size.width / 5,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 5),
          Text(
            txt,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
