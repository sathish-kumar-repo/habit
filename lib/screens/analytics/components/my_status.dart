import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Status extends StatelessWidget {
  const Status({
    super.key,
    required this.entry,
  });

  final MapEntry<String, List<Object>> entry;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Status',
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: entry.value[0] == true
              ? const Icon(
                  CupertinoIcons.checkmark_alt,
                  color: Colors.green,
                  size: 20,
                )
              : const Icon(
                  CupertinoIcons.xmark,
                  color: Colors.red,
                  size: 20,
                ),
        )
      ],
    );
  }
}
