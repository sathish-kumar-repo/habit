import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCupertinoActionSheetForTracking extends StatelessWidget {
  const MyCupertinoActionSheetForTracking(
      {super.key, required this.title, required this.message});
  final String title;
  final String message;
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 15.0,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      message: Text(
        message,
        style: GoogleFonts.poppins(
          fontSize: 16.0,
          color: Colors.grey,
        ),
      ),
      cancelButton: TextButton(
        child: Text(
          'Okay',
          style: GoogleFonts.poppins(
            fontSize: 16.0,
            color: Colors.blueAccent,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
