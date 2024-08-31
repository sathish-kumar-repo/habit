import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/my_alert_dialog.dart';

Future<bool?> showDeleteConfirmationDialog(BuildContext context) {
  return showCupertinoDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return MyCustomAlertDialog(
        title: 'Confirm Deletion',
        content: Text(
          'Are you sure you want to delete this habit?',
          style: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        action: 'Delete',
      );
    },
  );
}

Future<bool?> showResetConfirmationDialog(BuildContext context) {
  return showCupertinoDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return MyCustomAlertDialog(
        title: 'Confirm Reset',
        content: Text(
          'Are you sure you want to reset all entries?',
          style: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 16,
          ),
        ),
        action: 'Reset all',
      );
    },
  );
}
