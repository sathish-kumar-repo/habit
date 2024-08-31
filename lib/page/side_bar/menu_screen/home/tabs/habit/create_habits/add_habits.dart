import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit/model/sub_item.dart';
import 'package:habit/page/side_bar/menu_screen/home/components/add_sub_item.dart';
import 'package:habit/page/side_bar/menu_screen/home/components/sub_item_tile.dart';
import 'package:habit/provider/create_habit_provider.dart';
import 'package:habit/utils/get_clr.dart';
import 'package:habit/utils/padding.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

import '../../../../../../../data/frequency_list.dart';
import '../../../../../../../data/habit_clr_list.dart';
import '../../../../../../../data/icon_list.dart';
import '../../../../../../../model/habit.dart';
import '../../../../../../../model/my_enum_for_model.dart';
import '../../../../../../../provider/theme_provider.dart';
import '../../../../../../../utils/custom_animation.dart';
import '../../../../../../../utils/enum_fn.dart';

import '../../../../../../../utils/sound.dart';
import '../../../../../../../widgets/custom_header_title.dart';
import '../../../../../../../widgets/custom_text_field.dart';
import '../../../../../../../widgets/my_title.dart';

import '../../../components/add_sub_item_btn.dart';
import '../../../components/priority_field.dart';

import '../../../components/evaluation_method.dart';
import '../../../components/start_field.dart';
import 'components/alternate_picker.dart';
import '../../../components/amount_field.dart';
import '../../../components/color_screen.dart';
import 'components/eg_text.dart';
import 'components/every_no_picker.dart';
import 'components/frequency_container.dart';
import 'components/habit_field.dart';
import '../../../components/icon_screen.dart';
import 'components/month_day_selector.dart';
import '../../../components/do_it_at.dart';
import '../../../components/end_on.dart';
import '../../../components/field_container.dart';
import '../../../components/field_switch.dart';
import '../../../components/goal_field.dart';
import 'components/my_date_picker.dart';
import 'components/my_day_picker.dart';
import 'components/my_doule_picker.dart';
import '../../../components/my_remainder.dart';
import '../../../components/my_validation.dart';
import 'components/period_contianer.dart';
import '../../../components/pick_clr.dart';
import '../../../components/pick_dur.dart';
import '../../../components/pick_icon.dart';
import '../../../components/repeat_field.dart';
import 'components/schedule_field.dart';
import '../../../components/unit_field.dart';
import 'components/week_day_selector.dart';

class AddHabits extends StatefulWidget {
  const AddHabits({
    super.key,
    this.habit,
    this.des,
    this.days,
    this.isEdit = false,
    this.selectedIconGroup,
    this.selectedIconIndex,
    this.selectedClrIndex,
    this.howManyDays,
    this.editIndex,
    this.subItemModel,
  });

  final String? habit;
  final String? des;

  final int? days;
  final bool isEdit;
  final String? selectedIconGroup;
  final int? selectedIconIndex;
  final int? selectedClrIndex;
  final int? howManyDays;
  final int? editIndex;
  final Habit? subItemModel;
  @override
  State<AddHabits> createState() => _AddHabitsState();
}

class _AddHabitsState extends State<AddHabits> {
  // My TextEditingController controller
  final TextEditingController _habitController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _goalController =
      TextEditingController(text: '10');
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _remindController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // For Color
  int selectedColorIndex = 0;
  Color selectedColor = habitClrLst[0];
  // For Icon
  String _selectedGroup = 'All';
  int _selectedIconIndex = 0;
  IconData? _selectedIconData;

  // bool
  bool isFinished = false;
  bool isEndOn = false;
  bool isRemind = false;
  bool isUtilizeDay = false;
  bool isAlternate = false;
  bool isRepeat = false;

  // Toggle Switch index
  int evaluationMethodIndex = 0;
  int amountIndex = 0;
  int frequencyIndex = 0;
  int numericIndex = 0;
  int doItAtIndex = 0;
  int periodIndex = 0;

  // choose no
  int selectedPriority = 1;
  int selectedPeriodDays = 3;
  int selectedAlternateDay = 1;
  int selectedEveryNoDays = 2;
  int selectedRepeat = 2;
  int selectedActionDays = 0;
  int selectedRestDays = 0;

  // Remainder
  DateTime now = DateTime.now();
  DateTime reminderTime = DateTime.now();
  Time? time;

  // For Start
  DateTime selectedStartDate = DateTime.now();
  // For End
  int howManyDaysSelected = 7;
  DateTime? date;
  DateTime? selectedEndDate;
  String? selectedEndDateInString;

  // month selector
  List<List> monthSelector = List.generate(31, (index) => [index + 1, false])
    ..add(['last', false]);
  // For duration
  Duration setDuration = const Duration(minutes: 10);

  WeekDays myWeekDays = WeekDays.sunday;
  Rank rank = Rank.first;
  List<List<dynamic>> monthFrequency2 = [];

  Month month = Month.january;
  int days = 1;
  List<List<dynamic>> annualFrequency = [];

  final List<SubItems> habitSubItems = [];
  @override
  void initState() {
    intializeField();

    time = Time(hour: now.hour, minute: now.minute);
    super.initState();
  }

  void intializeField() {
    _selectedIconData = groupedIcons[_selectedGroup]![_selectedIconIndex];
    if (widget.habit != null && widget.des != null && widget.days != null) {
      _habitController.text = widget.habit!;
      _descriptionController.text = widget.des!;
      howManyDaysSelected = widget.days!;
      _selectedGroup = 'All';
      _selectedIconIndex = widget.selectedIconIndex!;
      _selectedIconData = groupedIcons[_selectedGroup]![_selectedIconIndex];

      selectedColorIndex = widget.selectedClrIndex!;
      selectedColor = habitClrLst[selectedColorIndex];
    }
    if (widget.isEdit) {
      setState(() {
        _habitController.text = widget.habit!;
        _descriptionController.text = widget.des!;

        _selectedGroup = widget.selectedIconGroup!;

        _selectedIconIndex = widget.selectedIconIndex!;

        _selectedIconData = groupedIcons[_selectedGroup]![_selectedIconIndex];

        selectedColorIndex = widget.selectedClrIndex!;
        selectedColor = habitClrLst[selectedColorIndex];

        howManyDaysSelected = widget.howManyDays!;
      });
    }
    date = DateTime.now().add(Duration(days: howManyDaysSelected));
    selectedEndDateInString = DateFormat.yMMMd().format(date!);
  }

  @override
  void dispose() {
    _habitController.dispose();
    _descriptionController.dispose();
    _goalController.dispose();
    _unitController.dispose();
    _remindController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: homePadding(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeaderTitleWithBack(),
                const SizedBox(height: 10),
                MyText1(txt: widget.isEdit ? 'edit' : 'create'),
                const MyText2(txt: 'your habit'),
                const SizedBox(height: 30),
                EvaluationMethodForHabit(
                  evaluationMethodIndex: evaluationMethodIndex,
                  onToggle: (index) {
                    setState(
                      () {
                        evaluationMethodIndex = index ?? 0;
                      },
                    );
                  },
                ),
                HabitField(habitController: _habitController),
                // To show text in numeric and timer
                EgText(evaluationMethodIndex: evaluationMethodIndex),
                // Amount field
                AmountField(
                  evaluationMethodIndex: evaluationMethodIndex,
                  amountIndex: amountIndex,
                  onToggle: (index) {
                    setState(() {
                      amountIndex = index ?? 0;
                    });
                  },
                ),
                // Goal Field
                GoalField(
                  evaluationMethodIndex: evaluationMethodIndex,
                  goalController: _goalController,
                ),
                // Unit Field
                UnitField(
                  evaluationMethodIndex: evaluationMethodIndex,
                  unitController: _unitController,
                ),
                // Pick Duration
                PickDuration(
                  evaluationMethodIndex: evaluationMethodIndex,
                  onTap: myShowDurationPicker,
                  duration: setDuration,
                ),
                // Sub-items
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  child: (evaluationMethodIndex == 3)
                      ? FieldContainer(
                          title: 'title',
                          iconData: CupertinoIcons.clock,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                ReorderableListView.builder(
                                  shrinkWrap: true,
                                  itemCount: habitSubItems.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    SubItems subItemModel =
                                        habitSubItems[index];
                                    String selectedIconGroup =
                                        subItemModel.selectedIconGroup;
                                    int selectedIconIndex =
                                        subItemModel.selectedIconIndex;
                                    int selectedClrIndex =
                                        subItemModel.selectedClrIndex;
                                    return Dismissible(
                                      key: ValueKey(subItemModel),
                                      onDismissed: (direction) {
                                        setState(() {
                                          habitSubItems.removeAt(index);
                                        });
                                      },
                                      background:
                                          const Icon(CupertinoIcons.delete),
                                      child: SubItemTile(
                                        icon: groupedIcons[selectedIconGroup]![
                                            selectedIconIndex],
                                        clr: getClr(selectedClrIndex, context),
                                        name: subItemModel.name,
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => AddSubItems(
                                              init: true,
                                              name: subItemModel.name,
                                              selectedClrIndex:
                                                  subItemModel.selectedClrIndex,
                                              selectedIconIndex: subItemModel
                                                  .selectedIconIndex,
                                              selectedIconGroup: subItemModel
                                                  .selectedIconGroup,
                                            ),
                                          ))
                                              .then((value) {
                                            if (value != null) {
                                              setState(() {
                                                habitSubItems[index] = value[0];
                                              });
                                            }
                                          });
                                        },
                                      ),
                                    );
                                  },
                                  onReorder: (oldIndex, newIndex) {
                                    setState(() {
                                      if (oldIndex < newIndex) {
                                        newIndex -= 1;
                                      }
                                      final SubItems item =
                                          habitSubItems.removeAt(oldIndex);

                                      habitSubItems.insert(newIndex, item);
                                    });
                                  },
                                ),
                                const SizedBox(height: 10),
                                AddSubItemBtn(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => const AddSubItems(),
                                    ))
                                        .then(
                                      (value) {
                                        if (value != null) {
                                          if (!value[1]) {
                                            setState(() {
                                              habitSubItems.add(value[0]);
                                            });
                                          }
                                        }
                                      },
                                    );
                                  },
                                ),
                                if (habitSubItems.isEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Click to add',
                                      style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                // Decription field
                FieldContainer(
                  iconData: CupertinoIcons.book,
                  title: 'Your Decription',
                  child: CustomTextField(
                    controller: _descriptionController,
                    hintText: 'Stay fit, workout daily',
                  ),
                ),
                // Schedule Field
                ScheduleField(
                  frequencyIndex: frequencyIndex,
                  onToggle: (index) {
                    setState(() {
                      frequencyIndex = index ?? 0;
                    });
                  },
                  child: getChild(frequencyIndex),
                ),

                // Pick Color
                PickClr(
                  onTap: () => navigateToColorSelector(selectedColorIndex),
                  clr: theme == Brightness.dark
                      ? selectedColor == Colors.black
                          ? Colors.grey
                          : selectedColor
                      : selectedColor,
                ),
                // Pick Icon
                PickIcon(
                  onTap: () => navigateToIconSelector(
                    _selectedGroup,
                    _selectedIconIndex,
                  ),
                  iconData: _selectedIconData!,
                ),

                DoItAt(
                  doItAtIndex: doItAtIndex,
                  onToggle: (index) {
                    setState(() {
                      doItAtIndex = index ?? 0;
                    });
                  },
                ),

                StartField(
                  selectedStartDate: selectedStartDate,
                  onTap: myStartDatePicker,
                ),
                // Confirmation for end date
                FieldSwitch(
                  txt: 'End date',
                  value: isEndOn,
                  onChanged: (bool newBool) {
                    setState(() {
                      isEndOn = newBool;
                    });
                  },
                ),
                EndOn(
                  selectedEndDate: selectedEndDateInString!,
                  howManyDaysSelected: howManyDaysSelected,
                  onToggle: (index) {
                    index == 0
                        ? onSeletedEndDate(context)
                        : onSelectedEndDays();
                  },
                  isShow: isEndOn,
                ),
                FieldSwitch(
                  txt: 'Repeat',
                  value: isRepeat,
                  onChanged: (bool newBool) {
                    setState(() {
                      isRepeat = newBool;
                    });
                  },
                ),
                RepeatField(
                  selectedRepeat: selectedRepeat,
                  onTap: () => noPicker(1000, 'Repeat'),
                  isShow: isRepeat,
                ),
                // Confirmation for Reminder
                FieldSwitch(
                  txt: 'Remind me',
                  value: isRemind,
                  onChanged: (bool newBool) {
                    setState(() {
                      isRemind = newBool;
                    });
                  },
                ),
                MyReminder(
                  showMyTimePicker: showMyTimePicker,
                  reminderTime: reminderTime,
                  controller: _remindController,
                  isShow: isRemind,
                ),
                PriorityField(
                  selectedPriority: selectedPriority,
                  onTap: () => noPicker(100, 'Priority'),
                ),
                // Select what time to do

                // Select last date

                // if (!widget.isEdit) const SizedBox(height: 20),
                // if (!widget.isEdit)

                // if (!widget.isEdit) const SizedBox(height: 20),
                // if (!widget.isEdit)

                // FieldSwitch(size: size),

                const SizedBox(height: 30),
                SwipeableButtonView(
                  buttonText: 'SLIDE TO ${widget.isEdit ? 'EDIT' : 'CREATE'}',
                  buttonWidget: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                  activeColor: Theme.of(context).colorScheme.primary,
                  isFinished: isFinished,
                  onWaitingProcess: () {
                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() {
                        isFinished = true;
                      });
                    });
                  },
                  onFinish: () async {
                    setState(() {
                      isFinished = false;
                    });
                    savingDetails();
                  },
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ------------------------------------CRUD------------------------
  void savingDetails() {
    if (_habitController.text.isEmpty) {
      showCupertinoDialogForValidation();
      return;
    }

    List<WeekDays> weekFrequency = [];

    for (var item in daySelectorList) {
      if (item[1] == true) {
        weekFrequency.add(item[0]);
      }
    }
    context.read<CreateHabit>().add(
          habit: _habitController.text,
          des: _descriptionController.text,
          evaluationMethod: getEvaluationMethodType(evaluationMethodIndex),
          numericAmount: getNumericAmount(amountIndex),
          goalNumericAmount: int.parse(_goalController.text),
          unitNumericAmount: _unitController.text,
          durationTimerAmount: setDuration,
          habitSubItems: habitSubItems,
          frequency: getFrequency(frequencyIndex),
          weekFrequency: weekFrequency,
          isUtilizeDays: isUtilizeDay,
          monthFrequency1:
              monthSelector.where((item) => item[1] == true).toList(),
          monthFrequency2: monthFrequency2,
          annualFrequency: annualFrequency,
          periodFrequency: getPeriod(periodIndex),
          periodFrequencyDay: selectedPeriodDays,
          isAlernateDays: isAlternate,
          recurringFrequency: selectedEveryNoDays,
          alernateActionDays: selectedActionDays,
          alernateRestDays: selectedRestDays,
          selectedIconGroup: _selectedGroup,
          selectedIconIndex: _selectedIconIndex,
          selectedClrIndex: selectedColorIndex,
          doItAt: getDoItAt(doItAtIndex),
          habitStartDate: selectedStartDate,
          repeat: isRepeat ? selectedRepeat : 1,
          isEnd: isEndOn,
          habitEndDate: selectedEndDate,
          remindTime: reminderTime,
          priority: selectedPriority,
          howManyDays: howManyDaysSelected,
        );

    Navigator.of(context).pop();
  }

  /// ------------------------------------Helper Function----------------------------------

  // For Color and Icon
  void navigateToIconSelector(
      String selectedIconGroup, int selectedIconIndex) async {
    click(context);
    final lst = await Navigator.of(context).push(
      customAnimation(IconSelector(
        initialSelectedIconGroup: selectedIconGroup,
        initialSelectedIconIndex: selectedIconIndex,
      )),
    );
    if (lst != null) {
      setState(() {
        _selectedGroup = lst[0];
        _selectedIconIndex = lst[1];
        _selectedIconData = groupedIcons[_selectedGroup]![_selectedIconIndex];
      });
    }
  }

  void navigateToColorSelector(int selectedClrIndex) async {
    click(context);
    final colorIndex = await Navigator.of(context).push(
      customAnimation(
        ColorSelector(
          initialSelectedColorIndex: selectedClrIndex,
        ),
      ),
    );
    if (colorIndex != null) {
      setState(() {
        selectedColorIndex = colorIndex;
        selectedColor = habitClrLst[colorIndex];
      });
    }
  }

  // Selecting start and end Dates
  Future<void> myStartDatePicker() async {
    final DateTime now = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: selectedStartDate,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );
    if (selectedDate != null) {
      setState(() {
        selectedStartDate = selectedDate;
      });
    }
  }

  void onSelectedEndDays() {
    click(context);
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return MyDayPicker(
          value: howManyDaysSelected,
          onSelectedItemChanged: (value) {
            setState(() {
              howManyDaysSelected = value + 1;
              selectedEndDateInString = DateFormat.yMMMd().format(
                DateTime.now().add(
                  Duration(days: howManyDaysSelected),
                ),
              );
              selectedEndDate = DateTime.now().add(
                Duration(days: howManyDaysSelected),
              );
            });
          },
        );
      },
    );
  }

  Future<void> onSeletedEndDate(BuildContext context) async {
    click(context);
    final now = DateTime.now();
    DateTime maximumDate = now.add(const Duration(days: 365));
    DateTime initialDateTime = now.add(Duration(days: howManyDaysSelected));
    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return MyDatePicker(
          child: CupertinoDatePicker(
            showDayOfWeek: true,
            mode: CupertinoDatePickerMode.date,
            initialDateTime: initialDateTime,
            maximumDate: maximumDate,
            minimumDate: now.add(const Duration(days: 1)),
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                date = newDateTime;
                selectedEndDate = date!;
                selectedEndDateInString = DateFormat.yMMMd().format(date!);
                //very important to add +1
                howManyDaysSelected = newDateTime.difference(now).inDays + 1;
              });
            },
          ),
        );
      },
    );
  }

  // Selecting durtion
  Future<void> myShowDurationPicker() async {
    var resultingDuration = await showDurationPicker(
      context: context,
      initialTime: setDuration,
    );
    setState(() {
      setDuration = resultingDuration ?? setDuration;
    });
  }

  // Validation
  void showCupertinoDialogForValidation() {
    context.read<MyProvider>().playButtonClickSound('error');
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return const MyValidation(
          txt: 'Please make sure a valid habit name was entered.',
        );
      },
    );
  }

  // no picker
  void noPicker(int len, String type) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        width: double.infinity,
        height: 200,
        color: Theme.of(context).colorScheme.onTertiary,
        child: CupertinoPicker(
          looping: true,
          selectionOverlay: Container(),
          itemExtent: 40,
          useMagnifier: true,
          scrollController: FixedExtentScrollController(
            initialItem: (type == 'Priority'
                    ? selectedPriority
                    : type == 'PeriodDays'
                        ? selectedPeriodDays
                        : type == 'AlternateDay'
                            ? selectedAlternateDay
                            : type == 'Repeat'
                                ? selectedRepeat
                                : type == 'Action'
                                    ? selectedActionDays
                                    : type == 'Rest'
                                        ? selectedRestDays
                                        : selectedEveryNoDays) -
                1,
          ),
          onSelectedItemChanged: (value) {
            setState(() {
              type == 'Priority'
                  ? selectedPriority = value + 1
                  : type == 'PeriodDays'
                      ? selectedPeriodDays = value + 1
                      : type == 'AlternateDay'
                          ? selectedAlternateDay = value + 1
                          : type == 'Repeat'
                              ? selectedRepeat = value + 1
                              : type == 'Action'
                                  ? selectedActionDays = value + 1
                                  : type == 'Rest'
                                      ? selectedRestDays = value + 1
                                      : selectedEveryNoDays = value + 1;
            });
          },
          children: List.generate(
            len,
            (index) => Text(
              (index + 1).toString(),
            ),
          ),
        ),
      ),
    );
  }

  void showDayOfTheYearPicker() {
    int length = daysInMonth[0];

    showCupertinoModalPopup(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState1) {
          return MyDoublePicker(
            list1: months,
            width1: 130,
            onSelectedItemChanged1: (value) {
              setState1(() {
                length = daysInMonth[value];
              });
              month = getMonthEnum(value);
            },
            list2: List.generate(length, (index) => index + 1),
            width2: 50,
            onSelectedItemChanged2: (value) {
              days = value + 1;
            },
            onSave: () {
              setState(() {
                List a = annualFrequency.map((e) => e.toString()).toList();
                if (!a.contains([month, days].toString())) {
                  annualFrequency.add([month, days]);
                }
              });

              month = Month.january;
              days = 1;
            },
          );
        },
      ),
    );
  }

  void showDayOfTheMonthPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => MyDoublePicker(
        list1: frequencyForWeekDays,
        width1: 80,
        onSelectedItemChanged1: (value) {
          rank = getRankEnum(value);
        },
        list2: weekDays.map((weekDay) => getWeekDays(weekDay, false)).toList(),
        width2: 130,
        onSelectedItemChanged2: (value) {
          myWeekDays = getWeekDayEnum(value);
        },
        bottomTxt: '(of each month)',
        onSave: () {
          setState(() {
            List a = monthFrequency2.map((e) => e.toString()).toList();
            if (!a.contains([myWeekDays, rank].toString())) {
              monthFrequency2.add([myWeekDays, rank]);
            }
          });

          myWeekDays = WeekDays.sunday;
          rank = Rank.first;
        },
      ),
    );
  }

  void showMyTimePicker() {
    Navigator.of(context).push(
      showPicker(
        iosStylePicker: true,
        elevation: 1,
        blurredBackground: true,
        accentColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        context: context,
        value: time!,
        onChange: (Time newTime) {
          setState(() {
            time = newTime;
          });
        },
        onChangeDateTime: (DateTime dateTime) {
          setState(() {
            reminderTime = dateTime;
          });
        },
        // Optional onChange to receive value as DateTime
      ),
    );
  }

  Widget getChild(int frequencyIndex) {
    switch (frequencyIndex) {
      case 0:
        return const SizedBox.shrink();
      case 1:
        return WeekDaySelector(
          daySelectorList: daySelectorList,
        );
      case 2:
        return Column(
          children: [
            FieldSwitch(
              txt: 'Utilize the days of the week',
              onChanged: (value) {
                setState(() {
                  isUtilizeDay = value;
                });
              },
              value: isUtilizeDay,
              fontSize: 14,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: isUtilizeDay
                  ? FrequencyContainer(
                      onTap: showDayOfTheMonthPicker,
                      children: monthFrequency2
                          .map(
                            (item) => FrequencyTileForMonth(
                              onDelete: () {
                                setState(() {
                                  monthFrequency2.remove(item);
                                });
                              },
                              txt1: getRankEnumToString(item[1]),
                              txt2: getWeekDaysEnumToString(item[0]),
                            ),
                          )
                          .toList(),
                    )
                  : MonthDaySelector(
                      monthSelector: monthSelector,
                    ),
            )
          ],
        );

      case 3:
        return FrequencyContainer(
          onTap: showDayOfTheYearPicker,
          children: annualFrequency
              .map(
                (item) => FrequencyTileForAnnual(
                  onDelete: () {
                    setState(() {
                      annualFrequency.remove(item);
                    });
                  },
                  txt1: getMonthToString(item[0]),
                  txt2: item[1].toString(),
                ),
              )
              .toList(),
        );
      case 4:
        return PeriodContainer(
          days: selectedPeriodDays,
          periodIndex: periodIndex,
          onToggle: (index) {
            setState(() {
              periodIndex = index ?? 0;
              selectedPeriodDays = 3;
            });
          },
          onTap: () => noPicker(periodDays[periodIndex], 'PeriodDays'),
        );
      default:
        return Column(
          children: [
            FieldSwitch(
              txt: 'On alternate days',
              onChanged: (bool newBool) {
                setState(() {
                  isAlternate = newBool;
                });
              },
              value: isAlternate,
              fontSize: 14,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: isAlternate
                  ? AlternatePicker(
                      onAction: () => noPicker(365, 'Action'),
                      onRest: () => noPicker(365, 'Rest'),
                      selectedActionDays: selectedActionDays,
                      selectedRestDays: selectedRestDays,
                    )
                  : EveryNoDayPicker(
                      onTap: () => noPicker(365, 'EveryNoDays'),
                      selectedEveryNoDays: selectedEveryNoDays,
                    ),
            )
          ],
        );
    }
  }
}
