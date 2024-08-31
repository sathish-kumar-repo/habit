import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDayPicker extends StatelessWidget {
  const MyDayPicker({
    super.key,
    required this.onSelectedItemChanged,
    required this.value,
  });
  final void Function(int value) onSelectedItemChanged;
  final int value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: CupertinoPicker(
        backgroundColor: Theme.of(context).colorScheme.onTertiary,
        itemExtent: 40,
        useMagnifier: true,
        scrollController: FixedExtentScrollController(
          initialItem: (value - 1),
        ),
        onSelectedItemChanged: onSelectedItemChanged,
        children: List.generate(
          365,
          (index) => Text(
            (index + 1).toString(),
            style: GoogleFonts.poppins(),
          ),
        ),
      ),
    );
  }
}
