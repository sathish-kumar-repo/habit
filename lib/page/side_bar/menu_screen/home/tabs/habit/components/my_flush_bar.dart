import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class CustomFlushbarWidget {
  static Flushbar build({required bool isEdit, required BuildContext context}) {
    return Flushbar(
      duration: const Duration(seconds: 1),
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
        size: 32,
      ),
      margin: const EdgeInsets.all(10),
      shouldIconPulse: true,
      message: isEdit ? 'Habit Edit Successfully' : 'Habit Added Successfully',
      borderRadius: BorderRadius.circular(16),
      barBlur: 10,
      backgroundColor: Theme.of(context).colorScheme.primary,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      boxShadows: const [
        BoxShadow(
          offset: Offset(2, 2),
          blurRadius: 1,
        ),
      ],
    );
  }
}
