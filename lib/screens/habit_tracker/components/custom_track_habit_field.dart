import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit/screens/habit_tracker/habit_tracker.dart';

class CustomTrackHabitField extends StatelessWidget {
  const CustomTrackHabitField({
    super.key,
    required this.size,
    required this.widget,
    required this.clr,
  });

  final Size size;
  final HabitTracker widget;
  final Color clr;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: size.width,
          height: size.width / 3.5,
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
                  color: clr,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Icon(
                  widget.iconData,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.habit,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: size.width / 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.des,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
