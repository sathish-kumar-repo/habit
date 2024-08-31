import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit/page/side_bar/menu_screen/home/components/evaluation_method.dart';
import 'package:habit/provider/create_task_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../../../../../../../data/habit_clr_list.dart';
import '../../../../../../../data/icon_list.dart';
import '../../../../../../../model/my_enum_for_model.dart';
import '../../../../../../../model/sub_item.dart';
import '../../../../../../../provider/theme_provider.dart';
import '../../../../../../../utils/custom_animation.dart';
import '../../../../../../../utils/enum_fn.dart';
import '../../../../../../../utils/get_clr.dart';
import '../../../../../../../utils/padding.dart';
import '../../../../../../../widgets/custom_header_title.dart';
import '../../../../../../../widgets/custom_text_field.dart';
import '../../../../../../../widgets/my_title.dart';
import '../../../components/add_sub_item.dart';
import '../../../components/add_sub_item_btn.dart';
import '../../../components/priority_field.dart';
import '../../../components/color_screen.dart';
import '../../../components/do_it_at.dart';
import '../../../components/field_container.dart';
import '../../../components/icon_screen.dart';
import '../../../components/my_remainder.dart';
import '../../../components/pick_clr.dart';
import '../../../components/pick_icon.dart';
import '../../../components/my_validation.dart';
import '../../../components/sub_item_tile.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  // My TextEditingController controller
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _remindController = TextEditingController();

  @override
  void initState() {
    _selectedIconData = groupedIcons[_selectedGroup]![_selectedIconIndex];
    super.initState();
  }

  @override
  void dispose() {
    _taskController.dispose();
    _descriptionController.dispose();
    _remindController.dispose();

    super.dispose();
  }

  // For Color
  int selectedColorIndex = 0;
  Color selectedColor = habitClrLst[0];

  // For Icon
  String _selectedGroup = 'All';
  int _selectedIconIndex = 0;
  IconData? _selectedIconData;
  // bool
  bool isRemind = false;
  bool isFinished = false;

  // Toggle Switch index
  int doItAtIndex = 0;
  int evaluationMethodIndex = 0;

// choose no
  int selectedPriority = 1;

  DateTime now = DateTime.now();
  DateTime reminderTime = DateTime.now();
  DateTime taskDate = DateTime.now();
  Time? time;

  final List<SubItems> taskSubItems = [];
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
                // MyText1(size: size, txt: widget.isEdit ? 'edit' : 'create'),
                const MyText1(txt: 'create'),
                const MyText2(txt: 'your task'),
                const SizedBox(height: 30),
                EvaluationMethodForTask(
                  evaluationMethodIndex: evaluationMethodIndex,
                  onToggle: (index) {
                    setState(
                      () {
                        evaluationMethodIndex = index ?? 0;
                      },
                    );
                  },
                ),
                // Task field
                FieldContainer(
                  iconData: Icons.done_all,
                  title: 'Your Task',
                  child: CustomTextField(
                    controller: _taskController,
                    hintText: 'Stay fit, workout daily',
                  ),
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
                                  itemCount: taskSubItems.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    SubItems subItemModel = taskSubItems[index];
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
                                          taskSubItems.removeAt(index);
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
                                                taskSubItems[index] = value[0];
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
                                          taskSubItems.removeAt(oldIndex);

                                      taskSubItems.insert(newIndex, item);
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
                                              taskSubItems.add(value[0]);
                                            });
                                          }
                                        }
                                      },
                                    );
                                  },
                                ),
                                if (taskSubItems.isEmpty)
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
                ), // Pick Color
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
                FieldContainer(
                  title: 'Date',
                  iconData: Icons.today_rounded,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: taskDatePicker,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            DateFormat.yMMMd().format(taskDate) ==
                                    DateFormat.yMMMd().format(now)
                                ? 'Today'
                                : DateFormat.yMMMd().format(taskDate),
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                MyReminder(
                  showMyTimePicker: showMyTimePicker,
                  reminderTime: reminderTime,
                  controller: _remindController,
                  isShow: isRemind,
                ),
                PriorityField(
                  selectedPriority: selectedPriority,
                  onTap: () => noPicker(100),
                ),
                SwipeableButtonView(
                  buttonText: 'SLIDE TO CREATE',
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

  void savingDetails() {
    if (_taskController.text.isEmpty) {
      showCupertinoDialogForValidation();
      return;
    }
    context.read<CreateTask>().add(
          evaluationMethod: TaskEvaluationMethodType.checkList,
          taskSubitems: [],
          task: _taskController.text,
          des: _descriptionController.text,
          date: taskDate,
          isTaskComplete: false,
          priority: selectedPriority,
          remainder: reminderTime,
          selectedIconGroup: _selectedGroup,
          selectedIconIndex: _selectedIconIndex,
          selectedClrIndex: selectedColorIndex,
          doItAt: getDoItAt(doItAtIndex),
        );
    Navigator.of(context).pop();
  }

  // Validation
  void showCupertinoDialogForValidation() {
    MyProvider().playButtonClickSound('error');
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return const MyValidation(
          txt: '',
        );
      },
    );
  }

  void navigateToColorSelector(int selectedClrIndex) async {
    MyProvider().playButtonClickSound('coo');
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

  void navigateToIconSelector(
      String selectedIconGroup, int selectedIconIndex) async {
    MyProvider().playButtonClickSound('coo');
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

  Future<void> taskDatePicker() async {
    final DateTime now = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: taskDate,
      firstDate: now.subtract(const Duration(days: 365)),
      lastDate: now.add(const Duration(days: 365)),
    );
    if (selectedDate != null) {
      setState(() {
        taskDate = selectedDate;
      });
    }
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

  void noPicker(int len) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        width: double.infinity,
        height: 180,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CupertinoPicker(
          looping: true,
          selectionOverlay: Container(),
          itemExtent: 40,
          useMagnifier: true,
          scrollController: FixedExtentScrollController(
            initialItem: selectedPriority - 1,
          ),
          onSelectedItemChanged: (value) {
            setState(() {
              selectedPriority = value + 1;
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
}
