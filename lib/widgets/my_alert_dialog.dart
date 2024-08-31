import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/theme_provider.dart';

class MyCustomAlertDialog extends StatelessWidget {
  const MyCustomAlertDialog({
    super.key,
    required this.title,
    required this.action,
    required this.content,
  });
  final Widget content;
  final String title;
  final String action;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      content: content,
      actions: <Widget>[
        TextButton(
          child: Text(
            'Cancel',
            style: GoogleFonts.poppins(
              color: Colors.grey,
            ),
          ),
          onPressed: () {
            MyProvider().playButtonClickSound('coo');
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: Text(
            action,
            style: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          onPressed: () {
            MyProvider().playButtonClickSound('coo');
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
