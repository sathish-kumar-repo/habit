import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EveryNoDayPicker extends StatelessWidget {
  const EveryNoDayPicker(
      {super.key, required this.onTap, required this.selectedEveryNoDays});
  final VoidCallback onTap;
  final int selectedEveryNoDays;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Every ',
              style: GoogleFonts.poppins(
                color: Colors.grey,
              ),
            ),
            Container(
              width: 50,
              margin: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.5,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              child: Center(
                child: AnimatedSwitcherPlus.zoomIn(
                  duration: const Duration(milliseconds: 100),
                  child: Text(
                    selectedEveryNoDays.toString(),
                    key: ValueKey(selectedEveryNoDays),
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              ' days',
              style: GoogleFonts.poppins(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
