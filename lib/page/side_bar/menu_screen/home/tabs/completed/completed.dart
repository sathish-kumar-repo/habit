import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit/data/habit_clr_list.dart';

import 'package:habit/model/habit.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../utils/boxes.dart';
import '../../../../../../utils/is_habit_completed.dart';
import '../../../../../../widgets/my_default_message.dart';

import 'components/view_all.dart';
import 'components/custom_habit_completed_components.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({
    super.key,
  });

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  bool anyCompletedHabits = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Boxes.getHabit().listenable(),
        builder: (context, box, child) {
          final habitLst = box.values.toList().cast<Habit>();
          for (var habit in habitLst) {
            if (isHabitFullyCompleted(habit.track)) {
              anyCompletedHabits = true;
              break;
            }
          }
          return ViewAllContainer(
            child: anyCompletedHabits
                ? ListView.builder(
                    itemCount: habitLst.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (isHabitFullyCompleted(habitLst[index].track)) {
                        return GestureDetector(
                          // onTap: () => widget.onAnalytics(
                          //   habitLst[index].track,
                          //   habitLst[index],
                          // ),
                          child: CustomHabitCompletedComponents(
                            size: size,
                            habit: habitLst[index].habit,
                            // completedDays: habitLst[index].totalDays,
                            clr: habitClrLst[habitLst[index].selectedClrIndex],
                            iconData: Icons.wallet,
                            // iconData:
                            //     groupedIcons[habitLst[index].selectedGroup]![
                            //         habitLst[index].selectedIconIndex],
                            // onDelete: () => widget.onDelete(habitLst[index]),
                            onDelete: () {},
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  )
                : const MyDefaultMessage(
                    'Keep up the good work! Complete your habits to achieve your goals.',
                    iconData: CupertinoIcons.rocket,
                  ),
          );
        },
      ),
    );
  }
}
