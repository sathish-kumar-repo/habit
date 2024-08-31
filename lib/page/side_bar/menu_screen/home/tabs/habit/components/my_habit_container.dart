import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit/model/habit.dart';
import 'package:habit/provider/create_habit_provider.dart';
import 'package:habit/utils/calender.dart';
import 'package:habit/utils/tracking_map.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../utils/date.dart';
import '../../../../../../../utils/padding.dart';
import '../../../components/rolling_switch.dart';
import '../../../components/today_heading.dart';
import 'my_indicator.dart';

class HabitContainer extends StatefulWidget {
  const HabitContainer({
    super.key,
    required this.child,
    required this.habitLst,
    required this.habitCount,
  });
  final Widget child;

  final List<Habit> habitLst;
  final int habitCount;
  @override
  State<HabitContainer> createState() => _HabitContainerState();
}

class _HabitContainerState extends State<HabitContainer> {
  final DateTime now = DateTime.now();

  bool congratulationShown = false;
  bool flag = true;

  @override
  void initState() {
    super.initState();

    // checkCongratulationStatus();
  }

  // void checkCongratulationStatus() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool shown = prefs.getBool('congratulationShown') ?? false;
  //   setState(() {
  //     congratulationShown = shown;
  //   });
  // }

  // void markCongratulationAsShown(bool value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('congratulationShown', value);
  // }

  @override
  Widget build(BuildContext context) {
    // int howFinishedToday = 0;

    // if (howFinishedToday < habitList.length) {
    //   markCongratulationAsShown(false);
    // }
    // for (Habit habitModel in widget.originalHabitLst) {
    //   if (!isHabitFullyCompleted(habitModel.track)) {
    //     habitList.add(habitModel);
    //   }
    // }
    // for (HabitModel habitModel in habitList) {
    //   if (habitModel.track[formattedTodayKey]![0] == true) {
    //     howFinishedToday++;
    //   }
    // }

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (!congratulationShown && howFinishedToday == habitList.length) {
    //     showCongradulationMessage();
    //     markCongratulationAsShown(true); // Mark congratulation as shown
    //     checkCongratulationStatus();
    //   }
    // });
    String formattedTodayKey = getCurrentDate(context);
    List<Habit> modifiedHabitTodayList = widget.habitLst
        .where(
          (habitModel) => habitModel.track.containsKey(formattedTodayKey),
        )
        .toList();
    // Completed list for today
    List<Habit> modifiedHabitTodayCompletedList = modifiedHabitTodayList
        .where(
          (habitModel) => habitModel.track[formattedTodayKey]![0] == true,
        )
        .toList();

    double percent = modifiedHabitTodayCompletedList.length /
        (modifiedHabitTodayList.isEmpty ? 1 : modifiedHabitTodayList.length);
    return Consumer<CreateHabit>(
      builder: (context, CreateHabit createHabitNotifier, child) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              padding: homePadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeading(),
                  const SizedBox(height: 25),
                  HorizontalWeekCalendar(
                    weekStartFrom: WeekStartFrom.Sunday,
                    onDateChange: (newSelectedDate) =>
                        createHabitNotifier.changeSelectedDate(newSelectedDate),
                  ),
                  const SizedBox(height: 20),
                  if (modifiedHabitTodayList.isNotEmpty)
                    MyLinearPercentIndicator(percent: percent),
                  if (modifiedHabitTodayList.isNotEmpty)
                    MyLinearPercentIndicatorText(percent: percent),
                  const SizedBox(height: 10),
                  RollingSwitch(
                    value: createHabitNotifier.rollingIndexHabit,
                    onChanged: (val) =>
                        createHabitNotifier.changeRollingIndexHabit(val),
                  ),
                  const SizedBox(height: 10),
                  AnimatedSwitcherTranslation.left(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      key: ValueKey(createHabitNotifier.rollingIndexHabit),
                      '${createHabitNotifier.rollingIndexHabit} (${widget.habitCount})',
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: widget.child,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showCongradulationMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text("Congratulations!"),
          content: const Text("You've achieved a great milestone!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
