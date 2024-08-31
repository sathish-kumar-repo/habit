import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/my_switch.dart';

class FieldSwitch extends StatelessWidget {
  const FieldSwitch({
    super.key,
    required this.txt,
    required this.onChanged,
    required this.value,
    this.fontSize = 17,
  });

  final String txt;
  final void Function(bool value) onChanged;
  final bool value;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              txt,
              style: GoogleFonts.poppins(
                fontSize: fontSize,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
          MySwitch(
            onChanged: onChanged,
            value: value,
          )
        ],
      ),
    );
  }
}
