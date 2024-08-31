import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:habit/model/sub_item.dart';
import 'package:habit/page/side_bar/menu_screen/home/tabs/habit/components/my_timer.dart';
import 'package:habit/provider/theme_provider.dart';
import 'package:habit/utils/tracking_map.dart';
import 'package:habit/widgets/info_txt.dart';
import 'package:habit/widgets/my_drag_handle.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

import 'package:toggle_switch/toggle_switch.dart';

import '../data/icon_list.dart';
import '../model/habit.dart';
import '../model/my_enum_for_model.dart';
import '../utils/ask_confirmation.dart';
import '../utils/boxes.dart';
import '../utils/date.dart';
import '../utils/enum_fn.dart';
import '../utils/get_clr.dart';
import '../utils/get_txt.dart';
import '../utils/make_dismissible.dart';
import '../utils/sound.dart';
import '../widgets/card_widgets.dart';

import '../widgets/field_btn.dart';

int getDurationToInt(Duration duration) {
  int durationInSeconds = duration.inSeconds;
  int durationInteger = durationInSeconds.toInt();

  return durationInteger;
}

Duration getIntToDuration(int durationInSeconds) {
  return Duration(seconds: durationInSeconds);
}

class CreateHabit extends ChangeNotifier {
  late Map<String, List<Object>> track;

  // To add habit in Box
  void add({
    required String habit,
    required String? des,
    required EvaluationMethodType evaluationMethod,
    required NumericAmount? numericAmount,
    required int? goalNumericAmount,
    required String? unitNumericAmount,
    required Duration? durationTimerAmount,
    required List<SubItems>? habitSubItems,
    required Frequency frequency,
    required List<WeekDays>? weekFrequency,
    required bool? isUtilizeDays,
    required List? monthFrequency1,
    required List? monthFrequency2,
    required List? annualFrequency,
    required Period? periodFrequency,
    required int? periodFrequencyDay,
    required bool? isAlernateDays,
    required int? recurringFrequency,
    required int? alernateActionDays,
    required int? alernateRestDays,
    required String selectedIconGroup,
    required int selectedIconIndex,
    required int selectedClrIndex,
    required DoItAtPeroid doItAt,
    required DateTime habitStartDate,
    required bool? isEnd,
    required DateTime? habitEndDate,
    required int repeat,
    required DateTime? remindTime,
    required int priority,
    required int howManyDays,
  }) {
    if (frequency == Frequency.daily) {
      if (isEnd == true) {
        track = generateTrackingMapForDaily(
          howManyDays: howManyDays,
          startDate: habitStartDate,
          subItems: habitSubItems ?? [],
        );
      } else {
        track = generateTrackingMapForDaily(
          howManyDays: 365,
          startDate: habitStartDate,
          subItems: habitSubItems ?? [],
        );
      }
    } else if (frequency == Frequency.weekly) {
      if (isEnd == true) {
        track = generateTrackingMapForWeekly(
          howManyDays: howManyDays,
          startDate: habitStartDate,
          weekDays: weekFrequency!,
          subItems: habitSubItems ?? [],
        );
      } else {
        track = generateTrackingMapForWeekly(
          howManyDays: 365,
          startDate: habitStartDate,
          weekDays: weekFrequency!,
          subItems: habitSubItems ?? [],
        );
      }
    } else if (frequency == Frequency.monthly) {
      if (isEnd == true) {
        if (isUtilizeDays == true) {
          track = generateTrackingMapForMonthlyUtlizeDays(
            howManyDays: howManyDays,
            startDate: habitStartDate,
            monthFrequency2: monthFrequency2 ?? [],
            subItems: habitSubItems ?? [],
          );
        } else {
          track = generateTrackingMapForMonthly(
            howManyDays: howManyDays,
            startDate: habitStartDate,
            monthFrequency1: monthFrequency1 ?? [],
            subItems: habitSubItems ?? [],
          );
        }
      } else {
        if (isUtilizeDays == true) {
          track = generateTrackingMapForMonthlyUtlizeDays(
            howManyDays: 365,
            startDate: habitStartDate,
            monthFrequency2: monthFrequency2 ?? [],
            subItems: habitSubItems ?? [],
          );
        } else {
          track = generateTrackingMapForMonthly(
            howManyDays: 365,
            startDate: habitStartDate,
            monthFrequency1: monthFrequency1 ?? [],
            subItems: habitSubItems ?? [],
          );
        }
      }
    } else if (frequency == Frequency.annually) {
      if (isEnd == true) {
        track = generateTrackingMapForAnnually(
          howManyDays: howManyDays,
          startDate: habitStartDate,
          annualFrequency: annualFrequency ?? [],
          subItems: habitSubItems ?? [],
        );
      } else {
        track = generateTrackingMapForAnnually(
          howManyDays: 365,
          startDate: habitStartDate,
          annualFrequency: annualFrequency ?? [],
          subItems: habitSubItems ?? [],
        );
      }
    } else if (frequency == Frequency.periodically) {
      if (isEnd == true) {
        track = generateTrackingMapForPeroidically(
          howManyDays: howManyDays,
          periodFrequencyDay: periodFrequencyDay ?? 3,
          periodFrequency: periodFrequency ?? Period.week,
          startDate: habitStartDate,
          subItems: habitSubItems ?? [],
        );
      } else {
        track = generateTrackingMapForPeroidically(
          howManyDays: 365,
          periodFrequencyDay: periodFrequencyDay ?? 3,
          periodFrequency: periodFrequency ?? Period.week,
          startDate: habitStartDate,
          subItems: habitSubItems ?? [],
        );
      }
    } else {
      if (isEnd == true) {
        if (isAlernateDays == true) {
          track = generateTrackingMapForRecurringAlternate(
            howManyDays: howManyDays,
            alernateActionDays: alernateActionDays ?? 2,
            alernateRestDays: alernateRestDays ?? 3,
            startDate: habitStartDate,
            subItems: habitSubItems ?? [],
          );
        } else {
          track = generateTrackingMapForRecurring(
            howManyDays: howManyDays,
            recurringFrequency: recurringFrequency ?? 2,
            startDate: habitStartDate,
            subItems: habitSubItems ?? [],
          );
        }
      } else {
        if (isAlernateDays == true) {
          track = generateTrackingMapForRecurringAlternate(
            howManyDays: 365,
            alernateActionDays: alernateActionDays ?? 2,
            alernateRestDays: alernateRestDays ?? 3,
            startDate: habitStartDate,
            subItems: habitSubItems ?? [],
          );
        } else {
          track = generateTrackingMapForRecurring(
            howManyDays: 365,
            recurringFrequency: recurringFrequency ?? 2,
            startDate: habitStartDate,
            subItems: habitSubItems ?? [],
          );
        }
      }
    }

    Habit createHabit = Habit(
      habit: habit,
      des: des,
      evaluationMethod: evaluationMethod,
      numericAmount: numericAmount,
      goalNumericAmount: goalNumericAmount,
      unitNumericAmount: unitNumericAmount,
      durationTimerAmount: getDurationToInt(
        durationTimerAmount ?? const Duration(minutes: 10),
      ),
      habitSubItems: habitSubItems,
      frequency: frequency,
      weekFrequency: weekFrequency,
      isUtilizeDays: isUtilizeDays,
      monthFrequency1: monthFrequency1,
      monthFrequency2: monthFrequency2,
      annualFrequency: annualFrequency,
      periodFrequency: periodFrequency,
      periodFrequencyDay: periodFrequencyDay,
      isAlernateDays: isAlernateDays,
      recurringFrequency: recurringFrequency,
      alernateActionDays: alernateActionDays,
      alernateRestDays: alernateRestDays,
      selectedIconGroup: selectedIconGroup,
      selectedIconIndex: selectedIconIndex,
      selectedClrIndex: selectedClrIndex,
      doItAt: doItAt,
      habitStartDate: habitStartDate,
      isEnd: isEnd,
      habitEndDate: habitEndDate,
      repeat: repeat,
      remindTime: remindTime,
      priority: priority,
      track: track,
    );
    final box = Boxes.getHabit();
    box.add(createHabit);
    notifyListeners();
  }

  void updateTrack(String key, Habit habitModel, BuildContext context) {
    // Check date is today date
    if (isInputDateSmallerThanOrEqualCurrentDate(
        habitModel.track[key]![2] as DateTime)) {
      if (habitModel.evaluationMethod == EvaluationMethodType.yesOrNo) {
        if (habitModel.repeat == 1) {
          if (habitModel.track[key]![0] == false) {
            finish(habitModel, key, context);
          } else {
            pending(habitModel, key, context);
          }
        } else {
          int selectedRepeat = 1;
          if (habitModel.track[key]![0] == false) {
            repeat(
              context,
              habitModel: habitModel,
              key: key,
              howManyTimesRepeat:
                  habitModel.repeat - (habitModel.track[key]![4] as int),
              onWrapAll: () {
                habitModel.track[key]![4] = habitModel.repeat;
                habitModel.track[key]![0] = true;
                finishSound(context);
                habitModel.save();
              },
              onWrap: () {
                habitModel.track[key]![4] =
                    (habitModel.track[key]![4] as int) + selectedRepeat;
                if (habitModel.repeat == (habitModel.track[key]![4] as int)) {
                  habitModel.track[key]![0] = true;
                  finishSound(context);
                }
                habitModel.save();
              },
              onChange: (value) {
                selectedRepeat = value;
              },
            );
          } else {
            resetEntry(habitModel, key, context);
          }
        }

        habitModel.save();
        notifyListeners();
      } else if (habitModel.evaluationMethod == EvaluationMethodType.numeric) {
        final TextEditingController controller =
            TextEditingController(text: '0');

        if (habitModel.repeat == 1) {
          numeric(
            context,
            controller: controller,
            habitModel: habitModel,
            key: key,
            onSave: (numericIndex) {
              if (numericIndex == 0) {
                habitModel.track[key]![3] = int.parse(controller.text);
              } else if (numericIndex == 1) {
                habitModel.track[key]![3] = (habitModel.track[key]![3] as int) +
                    int.parse(controller.text);
                habitModel.save();
              }

              NumericAmount currentAmount = habitModel.numericAmount!;
              int goal = habitModel.goalNumericAmount!;
              int achieve = (habitModel.track[key]![3] as int);

              if (currentAmount == NumericAmount.atLeast) {
                if (achieve >= goal) {
                  finish(habitModel, key, context);
                } else {
                  pending(habitModel, key, context);
                }
              } else if (habitModel.numericAmount == NumericAmount.atMost) {
                if (achieve <= goal) {
                  finish(habitModel, key, context);
                } else {
                  pending(habitModel, key, context);
                }
              } else if (habitModel.numericAmount == NumericAmount.lessThan) {
                if (achieve < goal) {
                  finish(habitModel, key, context);
                } else {
                  pending(habitModel, key, context);
                }
              } else if (habitModel.numericAmount ==
                  NumericAmount.greaterThan) {
                if (achieve > goal) {
                  finish(habitModel, key, context);
                } else {
                  pending(habitModel, key, context);
                }
              } else if (habitModel.numericAmount == NumericAmount.exactly) {
                if (achieve == goal) {
                  finish(habitModel, key, context);
                } else {
                  pending(habitModel, key, context);
                }
              } else if (habitModel.numericAmount == NumericAmount.anyValue) {
                if (achieve > 0) {
                  finish(habitModel, key, context);
                } else {
                  pending(habitModel, key, context);
                }
              }
            },
          );
        } else {
          if (habitModel.track[key]![0] == false) {
            numeric(
              context,
              controller: controller,
              habitModel: habitModel,
              key: key,
              onSave: (numericIndex) {
                if (numericIndex == 0) {
                  habitModel.track[key]![3] = int.parse(controller.text);
                  habitModel.save();
                } else if (numericIndex == 1) {
                  habitModel.track[key]![3] =
                      (habitModel.track[key]![3] as int) +
                          int.parse(controller.text);
                  habitModel.save();
                }

                NumericAmount currentAmount = habitModel.numericAmount!;
                int goal = habitModel.goalNumericAmount!;
                int achieve = (habitModel.track[key]![3] as int);

                if (currentAmount == NumericAmount.atLeast) {
                  if (achieve >= goal) {
                    finishNumeric(habitModel, key);
                  } else {}
                } else if (habitModel.numericAmount == NumericAmount.atMost) {
                  if (achieve <= goal) {
                    finishNumeric(habitModel, key);
                  }
                } else if (habitModel.numericAmount == NumericAmount.lessThan) {
                  if (achieve < goal) {
                    finishNumeric(habitModel, key);
                  }
                } else if (habitModel.numericAmount ==
                    NumericAmount.greaterThan) {
                  if (achieve > goal) {
                    finishNumeric(habitModel, key);
                  }
                } else if (habitModel.numericAmount == NumericAmount.exactly) {
                  if (achieve == goal) {
                    finishNumeric(habitModel, key);
                  }
                } else if (habitModel.numericAmount == NumericAmount.anyValue) {
                  if (achieve > 0) {
                    finishNumeric(habitModel, key);
                  }
                }

                if (habitModel.repeat == (habitModel.track[key]![4] as int)) {
                  habitModel.track[key]![0] = true;
                  finishSound(context);
                  habitModel.save();
                }
              },
            );
          } else {
            resetEntry(habitModel, key, context);
          }
        }
        habitModel.save();
      } else if (habitModel.evaluationMethod == EvaluationMethodType.timer) {
        if (habitModel.repeat == 1) {
          if (habitModel.track[key]![0] == false) {
            Navigator.of(context)
                .push(
              CupertinoPageRoute(
                builder: (context) => TimerScreen(
                  durationInSec: habitModel.durationTimerAmount!,
                ),
              ),
            )
                .then((value) {
              if (value == true) {
                finish(habitModel, key, context);
              }
            });
          } else {
            resetEntry(habitModel, key, context);
          }
        } else {
          if (habitModel.track[key]![0] == false) {
            Navigator.of(context)
                .push(
              CupertinoPageRoute(
                builder: (context) => TimerScreen(
                  durationInSec: habitModel.durationTimerAmount!,
                ),
              ),
            )
                .then((value) {
              if (value == true) {
                habitModel.track[key]![4] =
                    (habitModel.track[key]![4] as int) + 1;
                habitModel.save();
              }
              if (habitModel.repeat == (habitModel.track[key]![4] as int)) {
                habitModel.track[key]![0] = true;
                finishSound(context);
                habitModel.save();
              }
            });
          } else {
            resetEntry(habitModel, key, context);
          }
        }
      } else {
        List<SubItems>? lst = habitModel.habitSubItems;
        Map? habitSub = habitModel.track[key]?[5] as Map?;

        void updateCheckboxValue(String id) {
          if (habitSub != null) {
            habitSub[id] = !(habitSub[id] ?? false);
            habitModel.save();
          }
          bool res = habitSub!.values.every((value) => value == true);
          if (habitModel.repeat == 1) {
            if (res) {
              finish(habitModel, key, context);
            } else {
              pending(habitModel, key, context);
            }
          } else {
            if (res) {
              habitModel.track[key]![4] =
                  (habitModel.track[key]![4] as int) + 1;
              Navigator.pop(context);
              resetHabitSub(habitSub);

              habitModel.save();
            }
            if (habitModel.track[key]![0] == false) {
              if (habitModel.repeat == (habitModel.track[key]![4] as int)) {
                habitModel.track[key]![0] = true;
                finishSound(context);
                habitModel.save();
              }
            } else {
              resetEntry(habitModel, key, context);
            }
          }
        }

        if (habitModel.repeat > 1 && habitModel.track[key]![0] == true) {
          resetEntry(habitModel, key, context);
          return;
        }
        subList(
          context,
          habitModel: habitModel,
          key: key,
          lst: lst,
          updateCheckboxValue: updateCheckboxValue,
        );
      }
    }
    habitModel.save();
    notifyListeners();
  }

  void resetEntry(Habit habitModel, String key, BuildContext context) async {
    bool? confirmReset = await showResetConfirmationDialog(context);
    if (confirmReset != null && confirmReset) {
      habitModel.track[key]![4] = 0; // repeat
      habitModel.track[key]![3] = 0; // numeric
      habitModel.track[key]![0] = false; // pending

      resetHabitSub(habitModel.track[key]![5]);

      habitModel.save();
      notifyListeners();
    }
  }

  void onPriorityChange(
    Habit habitModel,
    String key,
    BuildContext context,
  ) {
    Color themeColor = Theme.of(context).colorScheme.primary;
    final theme = Theme.of(context).brightness;
    Color containerColor = Theme.of(context).colorScheme.tertiary;
    TextEditingController controller = TextEditingController();
    controller.text = habitModel.priority.toString();
    showDialog(
      context: context,
      builder: (context) {
        controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: controller.text.length,
        );
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              surfaceTintColor: theme == Brightness.dark ? Colors.black : null,
              backgroundColor: theme == Brightness.dark ? Colors.black : null,
              content: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AboutTitle(
                      habitModel: habitModel,
                      myKey: key,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: containerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          MyBtn(
                            themeColor: themeColor,
                            iconData: CupertinoIcons.minus,
                            onTap: () {
                              setState(() {
                                if (controller.text != '' &&
                                    int.parse(controller.text) > 0) {
                                  controller.text =
                                      (int.parse(controller.text) - 1)
                                          .toString();
                                } else {
                                  controller.text = '0';
                                }
                              });
                            },
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: controller,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]'),
                                ),
                              ],
                              autofocus: true,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: false,
                              ),
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                              ),
                              selectionControls: EmptyTextSelectionControls(),
                              decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 10),
                          MyBtn(
                            themeColor: themeColor,
                            iconData: CupertinoIcons.add,
                            onTap: () {
                              setState(() {
                                if (controller.text != '') {
                                  controller.text =
                                      (int.parse(controller.text) + 1)
                                          .toString();
                                } else {
                                  controller.text = '1';
                                }
                              });
                            },
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      textAlign: TextAlign.center,
                      'Activities with higher priority will be prominently featured at the top of the list.',
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                  onPressed: () {
                    click(context);
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                      color: themeColor,
                    ),
                  ),
                  onPressed: () {
                    click(context);
                    if (controller.text != '') {
                      habitModel.priority = int.parse(controller.text);
                    } else {
                      habitModel.priority = 1;
                    }
                    habitModel.save();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<dynamic> numeric(
    BuildContext context, {
    required TextEditingController controller,
    required Habit habitModel,
    required void Function(int numericIndex) onSave,
    required String key,
  }) {
    final theme = Theme.of(context).brightness;
    Color containerColor = Theme.of(context).colorScheme.tertiary;
    Color themeColor = Theme.of(context).colorScheme.primary;
    int numericIndex = 0;

    controller.text = habitModel.track[key]![3].toString();

    return showDialog(
      context: context,
      builder: (context) {
        controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: controller.text.length,
        );

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              surfaceTintColor: theme == Brightness.dark ? Colors.black : null,
              backgroundColor: theme == Brightness.dark ? Colors.black : null,
              content: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AboutTitle(
                      habitModel: habitModel,
                      myKey: key,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: containerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          MyBtn(
                            themeColor: themeColor,
                            iconData: CupertinoIcons.minus,
                            onTap: () {
                              setState(() {
                                if (controller.text != '' &&
                                    int.parse(controller.text) > 0) {
                                  controller.text =
                                      (int.parse(controller.text) - 1)
                                          .toString();
                                } else {
                                  controller.text = '0';
                                }
                              });
                            },
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: controller,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]'),
                                ),
                              ],
                              autofocus: true,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: false,
                              ),
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                              ),
                              selectionControls: EmptyTextSelectionControls(),
                              decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 10),
                          MyBtn(
                            themeColor: themeColor,
                            iconData: CupertinoIcons.add,
                            onTap: () {
                              setState(() {
                                if (controller.text != '') {
                                  controller.text =
                                      (int.parse(controller.text) + 1)
                                          .toString();
                                } else {
                                  controller.text = '1';
                                }
                              });
                            },
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                    if (controller.text != '0') const SizedBox(height: 10),
                    if (controller.text != '0')
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ToggleSwitch(
                          minHeight: 50,
                          minWidth: 100.0,
                          radiusStyle: true,
                          totalSwitches: 2,
                          cornerRadius: 50.0,
                          animate: true,
                          curve: Curves.fastOutSlowIn,
                          initialLabelIndex: numericIndex,
                          inactiveBgColor: containerColor,
                          activeBgColor: [
                            themeColor,
                          ],
                          labels: const ['Replace', 'Add'],
                          onToggle: (index) {
                            numericIndex = index ?? 1;
                            if (numericIndex == 1) {
                              controller.text = '0';
                            } else {
                              controller.text =
                                  habitModel.track[key]![3].toString();
                            }
                            controller.selection = TextSelection(
                              baseOffset: 0,
                              extentOffset: controller.text.length,
                            );
                          },
                        ),
                      ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: containerColor,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Today',
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.poppins(),
                              children: [
                                TextSpan(
                                  text: habitModel.track[key]![3].toString(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' / ${getNumericAmountText(habitModel)}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InfoText(
                          getNumericAmountString(habitModel.numericAmount!),
                          clr: Theme.of(context).colorScheme.primary,
                          fontSize: 15,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${habitModel.goalNumericAmount}${habitModel.unitNumericAmount != '' ? ' ${habitModel.unitNumericAmount}' : ''}',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                  onPressed: () {
                    MyProvider().playButtonClickSound('coo');
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    'Ok',
                    style: GoogleFonts.poppins(
                      color: themeColor,
                    ),
                  ),
                  onPressed: () {
                    MyProvider().playButtonClickSound('coo');
                    onSave(numericIndex);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<dynamic> repeat(
    BuildContext context, {
    required int howManyTimesRepeat,
    required VoidCallback onWrapAll,
    required VoidCallback onWrap,
    required void Function(int value) onChange,
    required Habit habitModel,
    required String key,
  }) {
    int selectedRepeat = 1;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.onTertiary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      builder: (context) {
        return Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Wrap(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const MyDragHandle(),
                  ),
                  AboutTitle(
                    habitModel: habitModel,
                    myKey: key,
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 130,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CupertinoPicker(
                            selectionOverlay: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    width: 2,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                            itemExtent: 35,
                            useMagnifier: true,
                            children: List.generate(
                              howManyTimesRepeat,
                              (index) => Text(
                                (index + 1).toString(),
                              ),
                            ),
                            onSelectedItemChanged: (value) {
                              onChange(value + 1);
                              setState(
                                () {
                                  selectedRepeat = value + 1;
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 6,
                          child: Column(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    onWrap();
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.done,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          'Wrap up $selectedRepeat rep${selectedRepeat > 1 ? 's' : ''}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    onWrapAll();
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.done_all,
                                          size: 15,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          'Wrap up all',
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void edit() {}

  void delete(Habit habitModel) {
    habitModel.delete();
    notifyListeners();
  }

  void skip(Habit habitModel, String key) {
    habitModel.track[key]![0] = 'off';
    habitModel.save();
    notifyListeners();
  }

  // ------------------Helper fn-------------------------
  void finishNumeric(Habit habitModel, String key) {
    if ((habitModel.track[key]![4] as int) != habitModel.repeat) {
      habitModel.track[key]![4] = (habitModel.track[key]![4] as int) + 1;
    }
    if ((habitModel.track[key]![4] as int) < (habitModel.repeat)) {
      habitModel.track[key]![3] = 0;
    }

    habitModel.save();
    notifyListeners();
  }

  void finish(Habit habitModel, String key, BuildContext context) {
    habitModel.track[key]![4] = 1;
    habitModel.track[key]![0] = true;
    finishSound(context);
    habitModel.save();
    notifyListeners();
  }

  void pending(Habit habitModel, String key, BuildContext context) {
    habitModel.track[key]![4] = 0;
    habitModel.track[key]![0] = false;
    habitModel.save();
    notifyListeners();
  }

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  changeSelectedDate(DateTime newSelectedDate) {
    _selectedDate = newSelectedDate;
    notifyListeners();
  }

  String _rollingValueHabit = 'All';
  String get rollingIndexHabit => _rollingValueHabit;
  changeRollingIndexHabit(String newValue) {
    _rollingValueHabit = newValue;
    notifyListeners();
  }
}

// Necessary utils
bool checkItShow({
  required Period periodFrequency,
  required int periodFrequencyDay,
  required DateTime startDate,
  required Map<String, List<Object>> trackingMap,
}) {
  if (periodFrequency == Period.week) {
    List<DateTime> dateTimeList = getWeekDay(startDate: startDate);

    int currenctFrequencylength = trackingMap.entries
        .where(
          (entry) {
            return (isDateBetweenOrEqual(
                  startDate,
                  dateTimeList[0],
                  dateTimeList[1],
                ) &&
                (entry.value[0] == true));
          },
        )
        .toList()
        .length;

    if (currenctFrequencylength >= periodFrequencyDay) {
      return false;
    }
  } else if (periodFrequency == Period.month) {
    List<DateTime> dateTimeList = getMonthDay(startDate: startDate);

    int currenctFrequencylength = trackingMap.entries
        .where(
          (entry) {
            return (isDateBetweenOrEqual(
                  startDate,
                  dateTimeList[0],
                  dateTimeList[1],
                ) &&
                (entry.value[0] == true));
          },
        )
        .toList()
        .length;
    if (currenctFrequencylength >= periodFrequencyDay) {
      return false;
    }
  } else {
    List<DateTime> dateTimeList = getYearDay(startDate: startDate);
    int currenctFrequencylength = trackingMap.entries
        .where(
          (entry) {
            return (isDateBetweenOrEqual(
                  startDate,
                  dateTimeList[0],
                  dateTimeList[1],
                ) &&
                (entry.value[0] == true));
          },
        )
        .toList()
        .length;
    if (currenctFrequencylength >= periodFrequencyDay) {
      return false;
    }
  }
  return true;
}

List<DateTime> getWeekDay({required DateTime startDate}) {
  DateTime firstDayOfWeek =
      startDate.subtract(Duration(days: startDate.weekday));
  DateTime lastDayOfWeek = startDate
      .add(Duration(days: (DateTime.daysPerWeek - startDate.weekday) - 1));
  return [firstDayOfWeek, lastDayOfWeek];
}

List<DateTime> getMonthDay({required DateTime startDate}) {
  DateTime startDateOfMonth = DateTime(startDate.year, startDate.month, 1);
  DateTime endDateOfMonth = DateTime(startDate.year, startDate.month + 1, 0);
  return [startDateOfMonth, endDateOfMonth];
}

List<DateTime> getYearDay({required DateTime startDate}) {
  DateTime startDateOfYear = DateTime(startDate.year, 1, 1);
  DateTime endDateOfYear = DateTime(startDate.year, 13, 0);
  return [startDateOfYear, endDateOfYear];
}

void resetHabitSub(habitSub) {
  habitSub!.forEach((key, _) {
    habitSub[key] = false;
  });
}

class AboutTitle extends StatelessWidget {
  const AboutTitle({
    super.key,
    required this.habitModel,
    required this.myKey,
  });

  final Habit habitModel;
  final String myKey;
  @override
  Widget build(BuildContext context) {
    Color habitClr = getClr(habitModel.selectedClrIndex, context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardText(txt: habitModel.habit),
              if (habitModel.repeat > 1)
                InfoText(
                    '${habitModel.track[myKey]![4] as int} / ${habitModel.repeat} reps',
                    clr: habitClr)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: LeadingIcon(
            clr: habitClr,
            icon: groupedIcons[habitModel.selectedIconGroup]![
                habitModel.selectedIconIndex],
          ),
        ),
      ],
    );
  }
}

Future<dynamic> subList(
  BuildContext context, {
  required Habit habitModel,
  required String key,
  required List<SubItems>? lst,
  required void Function(String id) updateCheckboxValue,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return makeDismissible(
        context,
        child: DraggableScrollableSheet(
          minChildSize: 0.3,
          initialChildSize: 0.3,
          builder: (_, scrollController) {
            return Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
                top: 5,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onTertiary,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListView(
                        shrinkWrap: true,
                        controller: scrollController,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: const MyDragHandle(),
                          ),
                          AboutTitle(
                            habitModel: habitModel,
                            myKey: key,
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: lst!.length,
                          itemBuilder: (context, index) {
                            SubItems habitSubModel = lst[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  updateCheckboxValue(habitSubModel.id);
                                });
                              },
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(
                                  groupedIcons[
                                          habitSubModel.selectedIconGroup]![
                                      habitSubModel.selectedIconIndex],
                                  color: getClr(
                                      habitSubModel.selectedClrIndex, context),
                                ),
                                title: Text(habitSubModel.name),
                                trailing: MSHCheckbox(
                                  size: 25,
                                  value: (habitModel.track[key]![5]
                                          as Map)[habitSubModel.id] ??
                                      false,
                                  onChanged: (value) {
                                    setState(() {
                                      updateCheckboxValue(habitSubModel.id);
                                    });
                                  },
                                  colorConfig: MSHColorConfig
                                      .fromCheckedUncheckedDisabled(
                                    checkedColor:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      );
    },
  );
}
