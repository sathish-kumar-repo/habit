import 'package:flutter/material.dart';
import 'package:habit/provider/create_habit_provider.dart';
import 'package:habit/utils/enum_fn.dart';
import 'package:habit/utils/get_clr.dart';

import 'package:habit/utils/tracking_map.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';
import 'package:provider/provider.dart';

import '../../../../../../data/icon_list.dart';
import '../../../../../../model/habit.dart';
import '../../../../../../model/my_enum_for_model.dart';
import '../../../../../../utils/boxes.dart';
import '../../../../../../utils/date.dart';
import '../../../../../../utils/ask_confirmation.dart';

import '../../../../../../widgets/my_default_message.dart';
import 'components/habit_card.dart';
import 'components/my_habit_container.dart';

class HabitScreen extends StatefulWidget {
  const HabitScreen({
    super.key,
  });

  @override
  State<HabitScreen> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  bool isDouble = false;
  late List incompleteHabits;
  late DateTime now;
  // bool isShow = true;
  // late String formattedDate;
  @override
  void initState() {
    now = DateTime.now();
    // formattedDate = getFormattedDate(now);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = getCurrentDate(context);

    return ValueListenableBuilder<Box<Habit>>(
      valueListenable: Boxes.getHabit().listenable(),
      builder: (context, box, child) {
        final List<Habit> originalList = box.values.toList().cast<Habit>();

        List<Habit> habitLst = originalList
            .where((habitModel) => habitModel.track.containsKey(formattedDate))
            .toList();

        var habitDoItAtStringToEnum = getDoItAtStringToEnum(
            context.read<CreateHabit>().rollingIndexHabit);

        if (habitDoItAtStringToEnum != null) {
          habitLst = habitLst.where(
            (habitModel) {
              return habitModel.doItAt == habitDoItAtStringToEnum;
            },
          ).toList();
        }
        int length = habitLst.length;
        // incompleteHabits = originalList
        //     .where((habit) => !isHabitFullyCompleted(habit.track))
        //     .toList();

        habitLst
          ..sort((a, b) {
            int priorityA = a.priority;
            int priorityB = b.priority;
            return priorityA.compareTo(priorityB);
          })
          ..sort((a, b) => (a.track[formattedDate]![0] == true ||
                  a.track[formattedDate]![0] == 'off')
              ? 1
              : -1);

        return HabitContainer(
          habitCount: length,
          habitLst: habitLst,
          child: (habitLst.isEmpty || isPeroidEmpty(habitLst, formattedDate))
              ? const MyDefaultMessage(
                  'Begin building habits now \nfor a better life!',
                  iconData: Icons.calendar_month,
                )
              : ImplicitlyAnimatedList<Habit>(
                  padding:
                      const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                  items: habitLst,
                  areItemsTheSame: (Habit oldItem, Habit newItem) =>
                      newItem.track[formattedDate]![0] as bool ? true : false,
                  itemBuilder: (context, animation, item, index) {
                    Habit habitModel = item;
                    String habit = habitModel.habit;
                    String selectedIconGroup = habitModel.selectedIconGroup;
                    int selectedIconIndex = habitModel.selectedIconIndex;
                    int selectedClrIndex = habitModel.selectedClrIndex;
                    // int totalDays = habitModel.totalDays;
                    // int howManyDays = habitModel.totalDays;

                    return isShowCard(habitModel, formattedDate)
                        ? SizeFadeTransition(
                            sizeFraction: 0.7,
                            curve: Curves.easeInOut,
                            animation: animation,
                            child: Container(
                              margin: index + 1 == habitLst.length
                                  ? const EdgeInsets.only(bottom: 25)
                                  : const EdgeInsets.only(bottom: 5),
                              child: HabitCard(
                                habit: habit,
                                icon: groupedIcons[selectedIconGroup]![
                                    selectedIconIndex],
                                habitCardClr: getClr(selectedClrIndex, context),
                                completedDays: habitModel.track.values
                                    .where((element) => element[0] == true)
                                    .length,
                                todayCompletedTask:
                                    habitModel.track[formattedDate]?[0] == true,
                                // Function
                                onDelete: () => delete(habitModel),
                                onEdit: onEdit,
                                onAnalytics: onAnalytics,
                                onPriority: () => onPriority(
                                  formattedDate,
                                  habitModel,
                                ),
                                onResetEntry: () => onResetEntry(
                                  formattedDate,
                                  habitModel,
                                ),
                                onSkip: () => onSkip(
                                  formattedDate,
                                  habitModel,
                                ),
                                onChangeTrack: () => onChangeTrack(
                                  formattedDate,
                                  habitModel,
                                ),
                                date: context.watch<CreateHabit>().selectedDate,
                                habitModel: habitModel,
                                myKey: formattedDate,
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  }),
        );
      },
    );
  }

  bool isPeroidEmpty(List<Habit> habitList, String formattedDate) {
    List temp = habitList.where((habitModel) {
      if (habitModel.track[formattedDate]?[0] == true) {
        return true;
      } else {
        return checkItShow(
          periodFrequency: habitModel.periodFrequency!,
          periodFrequencyDay: habitModel.periodFrequencyDay!,
          startDate: context.watch<CreateHabit>().selectedDate,
          trackingMap: habitModel.track,
        );
      }
    }).toList();

    return temp.isEmpty;
  }

  bool isShowCard(Habit habitModel, String formattedDate) {
    if ((habitModel.frequency != Frequency.periodically)) {
      return true;
    } else {
      if (habitModel.track[formattedDate]?[0] == true) {
        return true;
      } else {
        return checkItShow(
          periodFrequency: habitModel.periodFrequency!,
          periodFrequencyDay: habitModel.periodFrequencyDay!,
          startDate: context.watch<CreateHabit>().selectedDate,
          trackingMap: habitModel.track,
        );
      }
    }
  }

  // Delete
  Future<void> delete(Habit habitModel) async {
    bool? confirmDelete = await showDeleteConfirmationDialog(context);
    if (confirmDelete != null && confirmDelete) {
      deleteHabitModel(habitModel);
    }
  }

  void deleteHabitModel(Habit habitModel) {
    context.read<CreateHabit>().delete(habitModel);
  }

  void onChangeTrack(String formattedDate, Habit habitModel) {
    context.read<CreateHabit>().updateTrack(formattedDate, habitModel, context);
  }

  void onResetEntry(String formattedDate, Habit habitModel) {
    context.read<CreateHabit>().resetEntry(habitModel, formattedDate, context);
  }

  void onPriority(String formattedDate, Habit habitModel) {
    context
        .read<CreateHabit>()
        .onPriorityChange(habitModel, formattedDate, context);
  }

  void onSkip(String formattedDate, Habit habitModel) {}
  void onEdit() {}

  void onAnalytics() {}
}
