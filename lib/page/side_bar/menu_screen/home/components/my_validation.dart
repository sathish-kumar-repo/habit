import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyValidation extends StatelessWidget {
  const MyValidation({
    super.key,
    required this.txt,
  });
  final String txt;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        'Invalid Data',
        style: TextStyle(
          letterSpacing: 1,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          txt,
          style: GoogleFonts.poppins(
            fontSize: 18.0,
            color: Colors.grey,
          ),
        ),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Okay',
            style: TextStyle(
              fontSize: 18.0,
              color: CupertinoColors.systemBlue,
            ),
          ),
        ),
      ],
    );
  }
}
