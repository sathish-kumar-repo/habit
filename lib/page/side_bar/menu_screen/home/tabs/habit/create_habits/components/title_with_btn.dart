import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWithbtn extends StatelessWidget {
  const TitleWithbtn({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Pick at least one.',
            style: GoogleFonts.poppins(
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1.5,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                CupertinoIcons.add,
                size: 15,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
