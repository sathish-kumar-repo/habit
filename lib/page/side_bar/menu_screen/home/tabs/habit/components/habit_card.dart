import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:habit/model/habit.dart';
import 'package:habit/model/my_enum_for_model.dart';
import 'package:habit/utils/enum_fn.dart';
import 'package:habit/utils/get_txt.dart';
import 'package:habit/utils/sound.dart';

import 'package:habit/widgets/custom_model_bottom_sheet.dart';
import 'package:habit/widgets/info_txt.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../../../utils/date.dart';
import '../../../../../../../widgets/card_widgets.dart';

import '../../../../../../../widgets/my_drag_handle.dart';
import '../habit_journal/my_text_editor.dart';
import '../habit_journal/summary_journal.dart';
import 'my_timer.dart';

class HabitCard extends StatelessWidget {
  const HabitCard({
    super.key,
    required this.habit,
    required this.icon,
    required this.habitCardClr,
    required this.completedDays,
    required this.onEdit,
    required this.onDelete,
    required this.onAnalytics,
    required this.todayCompletedTask,
    required this.onChangeTrack,
    required this.date,
    required this.habitModel,
    required this.myKey,
    required this.onResetEntry,
    required this.onPriority,
    required this.onSkip,
  });

  final String habit;
  final IconData icon;
  final Color habitCardClr;

  final int completedDays;
  final bool todayCompletedTask;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onAnalytics;
  final VoidCallback onSkip;
  final VoidCallback onResetEntry;
  final VoidCallback onPriority;

  final VoidCallback onChangeTrack;
  final DateTime date;

  final Habit habitModel;
  final String myKey;
  @override
  Widget build(BuildContext context) {
    int? trackValue = habitModel.track[myKey]?[4] as int?;
    double percent = trackValue != null ? trackValue / habitModel.repeat : 0;

    String numericString =
        '${habitModel.track[myKey]?[3]} / ${getNumericAmountText(habitModel)}';
    String timerString = getTilteFormatDuration(
      Duration(
        seconds: habitModel.durationTimerAmount ?? 0,
      ),
    );
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: isInputDateSmallerThanOrEqualCurrentDate(date)
            ? onChangeTrack
            : null,
        onLongPress: () => customshowBottomSheet(
          context,
          trackValue,
          numericString,
          timerString,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isInputDateSmallerThanOrEqualCurrentDate(date))
              CompleteOrNot(isComplete: todayCompletedTask),
            const SizedBox(width: 7),
            Expanded(
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      LeadingIcon(clr: habitCardClr, icon: icon),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CardText(txt: habit),
                            Row(
                              children: [
                                if (habitModel.evaluationMethod ==
                                    EvaluationMethodType.numeric)
                                  CardBottomTxt(
                                    txt: numericString,
                                  ),
                                if (habitModel.evaluationMethod ==
                                    EvaluationMethodType.timer)
                                  CardBottomTxt(txt: timerString),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      CircularPercentIndicator(
                        radius: 30.0,
                        percent: percent,
                        progressColor: habitCardClr,
                        backgroundColor: habitCardClr.withOpacity(0.3),
                        animation: true,
                        animationDuration: 1000,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Text(
                          "${trackValue ?? 0}/${habitModel.repeat}",
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void customshowBottomSheet(
    BuildContext context,
    trackValue,
    numericString,
    timerString,
  ) {
    click(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CustomBottomModelSheet(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const MyDragHandle(),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardText(txt: habit),
                        if (habitModel.repeat > 1)
                          InfoText(
                            '$trackValue / ${habitModel.repeat} reps',
                            clr: habitCardClr,
                          ),
                      ],
                    ),
                  ),
                  LeadingIcon(
                    clr: habitCardClr,
                    icon: icon,
                  ),
                ],
              ),
              if (habitModel.evaluationMethod == EvaluationMethodType.yesOrNo)
                const SizedBox(height: 20),
              if (habitModel.evaluationMethod == EvaluationMethodType.numeric)
                HabitEvaluationInfo(
                  txt: numericString,
                  subTxt:
                      '${getNumericAmountString(habitModel.numericAmount!)} ${getNumericAmountText(habitModel)}',
                  clr: habitCardClr,
                ),
              if (habitModel.evaluationMethod == EvaluationMethodType.timer)
                HabitEvaluationInfo(
                  txt: timerString,
                  clr: habitCardClr,
                ),
              const MyDivider(),
              BottomSheetTile(
                clr: habitCardClr,
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => MyTextEditor(
                      habitModel: habitModel,
                      mykey: myKey,
                    ),
                  ));
                },
                title: 'Daily Habit Journal',
                iconData: Icons.assignment_turned_in_outlined,
              ),
              BottomSheetTile(
                clr: habitCardClr,
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => HabitJournalSummary(
                      habitModel: habitModel,
                    ),
                  ));
                },
                title: 'Habit Journal Summary',
                iconData: Icons.summarize_outlined,
              ),
              const MyDivider(),
              BottomSheetTile(
                clr: habitCardClr,
                onTap: () {},
                title: 'Remainder',
                iconData: Icons.notification_add,
              ),
              BottomSheetTile(
                clr: habitCardClr,
                onTap: onPriority,
                title: 'Priority',
                iconData: Icons.flag,
              ),
              const MyDivider(),
              BottomSheetTile(
                clr: habitCardClr,
                onTap: onResetEntry,
                title: 'Skip',
                iconData: Icons.local_cafe,
              ),
              BottomSheetTile(
                clr: habitCardClr,
                onTap: onResetEntry,
                title: 'Reset entry',
                iconData: Icons.refresh,
              ),
              Divider(
                color: Colors.grey.withOpacity(0.1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomSheetIcon(
                    clr: habitCardClr,
                    iconData: CupertinoIcons.chart_bar,
                    onTap: onAnalytics,
                  ),
                  BottomSheetIcon(
                    clr: habitCardClr,
                    iconData: CupertinoIcons.delete,
                    onTap: onDelete,
                  ),
                  BottomSheetIcon(
                    clr: habitCardClr,
                    iconData: CupertinoIcons.create,
                    onTap: onEdit,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class HabitEvaluationInfo extends StatelessWidget {
  const HabitEvaluationInfo({
    super.key,
    required this.txt,
    this.subTxt,
    required this.clr,
  });

  final String txt;
  final String? subTxt;
  final Color clr;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: MyIcon(clr: clr, iconData: Icons.track_changes),
      title: Text(
        txt,
      ),
      titleTextStyle: GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.onBackground,
      ),
      subtitle: subTxt != null
          ? Container(
              alignment: Alignment.centerLeft,
              child: InfoText(
                subTxt!,
                clr: clr,
              ),
            )
          : null,
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
    );
  }
}
