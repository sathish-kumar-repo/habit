import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/theme_provider.dart';

class HomeHeading extends StatelessWidget {
  const HomeHeading({
    super.key,

    // required this.widget,
  });

  // final MyHomeContainer widget;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Today,',
          style: GoogleFonts.roboto(
            fontSize: size.width / 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 10),
        Consumer(
          builder: (context, MyProvider notifier, child) {
            return Text(
              DateFormat('dd MMM').format(DateTime.now()),
              style: GoogleFonts.poppins(
                fontSize: size.width / 20,
                fontWeight: FontWeight.w500,
              ),
            );
          },
        ),
      ],
    );
  }
}
