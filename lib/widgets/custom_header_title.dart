import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit/provider/theme_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'back_btn.dart';

class CustomHeaderTitleWithBack extends StatelessWidget {
  const CustomHeaderTitleWithBack({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const BackBtn(),
        const Spacer(),
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
