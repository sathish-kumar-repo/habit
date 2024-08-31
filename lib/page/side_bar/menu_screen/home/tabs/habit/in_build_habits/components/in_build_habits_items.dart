import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit/data/habit_clr_list.dart';

import '../../../../../../../../data/icon_list.dart';
import '../../../../../../../../model/habit.dart';
import '../../create_habits/add_habits.dart';

class InBuildHabitsItems extends StatelessWidget {
  const InBuildHabitsItems({
    super.key,
    required this.size,
    required this.lst,
    required this.habit,
    required this.onSave,
    this.habitModel,
  });

  final Size size;
  final List lst;
  final String habit;
  final Habit? habitModel;
  final void Function(
    String habit,
    String description,
    int howManyDays,
    int daysComplete,
    String selectedGroup,
    int selectedIconIndex,
    int selectedClrIndex,
    bool isEdit,
    int editIndex,
    Habit? habitModel,
  )? onSave;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => AddHabits(
              habit: habit,
              des: lst[0],
              selectedIconIndex: lst[1],
              days: lst[2],
              selectedClrIndex: lst[3],
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
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
                    color: habitClrLst[lst[3]],
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Icon(
                    groupedIcons['All']![lst[1]],
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        habit,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        lst[0],
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 2),
                  child: const Icon(
                    CupertinoIcons.forward,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
