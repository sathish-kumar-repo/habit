import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../provider/theme_provider.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      title: RichText(
        text: TextSpan(
          style: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 17,
          ),
          children: const [
            TextSpan(text: 'Habit'),
            TextSpan(
              text: 'Up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      subtitle: Consumer(
        builder: (context, MyProvider notifier, child) {
          return Text(
            DateFormat('dd MMM').format(DateTime.now()),
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          );
        },
      ),
    );
  }
}
