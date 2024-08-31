import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectorContianer extends StatelessWidget {
  const SelectorContianer({
    super.key,
    required this.txt,
    required this.isSelected,
    required this.onTap,
  });
  final String txt;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Center(
          child: Text(
            txt,
            style: GoogleFonts.poppins(
              color: isSelected ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}
