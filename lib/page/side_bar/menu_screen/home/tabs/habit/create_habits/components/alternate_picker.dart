import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlternatePicker extends StatelessWidget {
  const AlternatePicker({
    super.key,
    required this.onAction,
    required this.onRest,
    required this.selectedActionDays,
    required this.selectedRestDays,
  });
  final VoidCallback onAction;
  final VoidCallback onRest;
  final int selectedActionDays;
  final int selectedRestDays;
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onAction,
            child: Container(
              width: 80,
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
                    selectedActionDays == 0
                        ? 'Action'
                        : selectedActionDays.toString(),
                    key: ValueKey(selectedActionDays),
                    style: GoogleFonts.poppins(
                      color: selectedActionDays == 0
                          ? Colors.grey
                          : Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            'x',
            style: GoogleFonts.poppins(
              color: Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: onRest,
            child: Container(
              width: 80,
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
                    selectedRestDays == 0
                        ? 'Rest'
                        : selectedRestDays.toString(),
                    key: ValueKey(selectedRestDays),
                    style: GoogleFonts.poppins(
                      color: selectedRestDays == 0
                          ? Colors.grey
                          : Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
