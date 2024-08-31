import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit/model/habit.dart';
import 'package:habit/provider/theme_provider.dart';
import 'package:habit/screens/habit_tracker/components/my_cupertino_action_sheet_for_tracking.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../utils/date.dart';
import 'components/custom_counting_days.dart';
import 'components/custom_track_habit_field.dart';
import 'components/my_today_container.dart';

class HabitTracker extends StatefulWidget {
  const HabitTracker({
    super.key,
    required this.howManyDays,
    required this.habit,
    required this.iconData,
    required this.des,
    required this.myMap,
    required this.onChangeTrack,
    required this.habitModel,
    required this.clr,
    required this.onMessage,
  });

  final int howManyDays;
  final String habit;
  final IconData iconData;
  final String des;
  final Map<String, List<Object>> myMap;
  final void Function(String key, Habit habitModel) onChangeTrack;
  final void Function(String key, Habit habitModel, String message) onMessage;
  final Habit habitModel;
  final Color clr;
  @override
  State<HabitTracker> createState() => _HabitTrackerState();
}

class _HabitTrackerState extends State<HabitTracker> {
  final TextEditingController messageController = TextEditingController();
  int? count;

  late List keyLst;

  late DateTime now;
  late String formattedDate;

  late List useAllowedToClick;

  late int howManyDays;
  @override
  void initState() {
    now = DateTime.now();
    formattedDate = "${now.year}-${now.month}-${now.day}";

    keyLst = widget.myMap.keys.toList();

    useAllowedToClick = keyLst.sublist(0, keyLst.indexOf(formattedDate) + 1);

    howManyDays = widget.howManyDays;
    countDays();
    super.initState();
  }

  bool isBool(key) {
    return useAllowedToClick.contains(key);
  }

  void countDays() {
    setState(() {
      count = widget.myMap.values.where((element) => element[0] == true).length;
    });
  }

  void f() {}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 30,
            left: 25,
            right: 25,
          ),
          child: Column(
            children: [
              CustomTrackHabitField(
                  size: size, widget: widget, clr: widget.clr),
              CustomCountingDays(count: count, widget: widget),
              const SizedBox(height: 20),
              Text(
                'Long press to write Habit Journal.',
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ResponsiveGridList(
                  minItemWidth: 100,
                  horizontalGridSpacing: 0,
                  verticalGridSpacing: 5,
                  children: List.generate(widget.howManyDays, (index) {
                    var key = keyLst[index];

                    return GestureDetector(
                      onTap: () {
                        if (isBool(key)) {
                          widget.onChangeTrack(key, widget.habitModel);
                          countDays();
                          if (keyLst.length != (index + 1)) {
                            if (widget.myMap[key]![0] == true) {
                              // showCustomAnimatedTopSnackBar();
                            }
                          } else {
                            // showMessageForCompletingHabit('Congratulation!',
                            //     'Habit completed successfully.');
                          }
                        } else {
                          showAlertDialogForTrackingTommorow();
                        }
                      },
                      // onLongPress: isBool(key)
                      //     ? () => writeSomethingOnToday(
                      //         key, widget.habitModel, context)
                      //     : null,
                      onLongPress: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => const MyTextEditor(),
                        // ));
                      },
                      child: Column(
                        children: [
                          MyTodayContainer(
                            index: index,
                            isVisible: widget.myMap[key]![0] == false,
                            howManyDays: howManyDays,
                          ),
                          Text(
                            key == formattedDate
                                ? 'Today'
                                : DateFormat('MMM dd').format(
                                    widget.myMap[key]![2] as DateTime,
                                  ),
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void writeSomethingOnToday(
      String key, Habit habitModel, BuildContext context) {
    messageController.text = '';
    String txt = habitModel.track[key]![1] as String;
    if (txt != '') {
      messageController.text = txt;
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            elevation: 4,
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt == ''
                      ? 'Write Habit Journal for today:'
                      : "Edit your Habit Journal",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 5),
                Consumer(
                  builder: (context, MyProvider notifier, child) {
                    return Text(
                      decideDateMethod(
                        habitModel.track[key]![2] as DateTime,
                        notifier.dateTimeIndex,
                      ),
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ],
            ),
            content: Container(
              margin: const EdgeInsets.all(5),
              child: TextField(
                controller: messageController,
                maxLength: 500,
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Cancel',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  'Done',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  final String message = messageController.text;
                  if (message.isNotEmpty) {
                    widget.onMessage(key, habitModel, message);
                  }
                },
              ),
            ]);
      },
    );
  }

  void showAlertDialogForTrackingTommorow() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return const MyCupertinoActionSheetForTracking(
          title: 'Update Reminder',
          message: 'Oops! You can only update tracking for today.',
        );
      },
    );
  }

  // void showCustomAnimatedTopSnackBar() {
  //   int randomIndex = Random().nextInt(congratulatorySentences.length);
  //   String randomSentence = congratulatorySentences[randomIndex];
  //   showTopSnackBar(
  //     Overlay.of(context),
  //     CustomSnackBar.success(
  //       message: randomSentence,
  //       backgroundColor: Theme.of(context).colorScheme.primary,
  //       icon: Icon(
  //         Icons.sentiment_very_satisfied,
  //         color: Colors.white.withOpacity(0.3),
  //         size: 120,
  //       ),
  //       textStyle: GoogleFonts.poppins(color: Colors.white),
  //     ),
  //   );
  // }

  // void showMessageForCompletingHabit(String title, String message) {
  //   Navigator.pop(context);
  //   final snackBar = SnackBar(
  //     elevation: 0,
  //     behavior: SnackBarBehavior.floating,
  //     backgroundColor: Colors.transparent,
  //     content: AwesomeSnackbarContent(
  //       color: Theme.of(context).colorScheme.primary,
  //       title: title,
  //       message: message,
  //       contentType: ContentType.success,
  //     ),
  //   );

  //   ScaffoldMessenger.of(context)
  //     ..hideCurrentSnackBar()
  //     ..showSnackBar(snackBar);
  // }
}
