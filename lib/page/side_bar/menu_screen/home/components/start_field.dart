import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'field_container.dart';

class StartField extends StatelessWidget {
  const StartField({
    super.key,
    required this.selectedStartDate,
    required this.onTap,
  });
  final DateTime selectedStartDate;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    return FieldContainer(
      title: 'Start Date',
      iconData: Icons.today,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
          onTap: onTap,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                DateFormat.yMMMd().format(selectedStartDate) ==
                        DateFormat.yMMMd().format(now)
                    ? 'Today'
                    : DateFormat.yMMMd().format(selectedStartDate),
                style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
