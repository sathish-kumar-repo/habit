import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomHabitCompletedComponents extends StatelessWidget {
  const CustomHabitCompletedComponents({
    super.key,
    required this.size,
    required this.iconData,
    required this.habit,
    this.completedDays,
    required this.clr,
    required this.onDelete,
  });
  final Size size;
  final IconData iconData;
  final String habit;
  final int? completedDays;
  final Color clr;
  final void Function() onDelete;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness;
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.tertiary,
          ),
          child: Row(
            children: [
              Container(
                width: size.width / 8,
                height: size.width / 8,
                margin: const EdgeInsets.only(
                  right: 15,
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: theme == Brightness.dark
                      ? clr == Colors.black
                          ? Colors.grey
                          : clr
                      : clr,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Icon(
                  iconData,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Text(
                  habit,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 2),
                child: Text(
                  '$completedDays days',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
