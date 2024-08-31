import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit/model/task.dart';

import '../data/icon_list.dart';
import '../model/my_enum_for_model.dart';
import '../model/sub_item.dart';
import '../utils/boxes.dart';
import '../utils/get_clr.dart';
import '../utils/sound.dart';
import '../widgets/card_widgets.dart';
import '../widgets/field_btn.dart';

class CreateTask extends ChangeNotifier {
  void add({
    required TaskEvaluationMethodType evaluationMethod,
    required String task,
    required String des,
    required DateTime date,
    required bool isTaskComplete,
    required int priority,
    required DateTime remainder,
    required String selectedIconGroup,
    required int selectedIconIndex,
    required int selectedClrIndex,
    required DoItAtPeroid doItAt,
    required List<SubItems>? taskSubitems,
  }) {
    Task createTask = Task(
      evaluationMethod: evaluationMethod,
      task: task,
      des: des,
      date: date,
      isTaskComplete: isTaskComplete,
      priority: priority,
      remainder: remainder,
      selectedIconGroup: selectedIconGroup,
      selectedIconIndex: selectedIconIndex,
      selectedClrIndex: selectedClrIndex,
      doItAt: doItAt,
      taskSubitems: taskSubitems,
    );
    final box = Boxes.getTask();
    box.add(createTask);
    notifyListeners();
  }

  void updateTask(Task taskModel, BuildContext context) {
    taskModel.isTaskComplete = !(taskModel.isTaskComplete);
    if (taskModel.isTaskComplete == true) {
      finishSound(context);
    }
    taskModel.save();
    notifyListeners();
  }

  void delete(Task taskModel) {
    taskModel.delete();
    notifyListeners();
  }

  void onPriorityChange(
    Task taskModel,
    BuildContext context,
  ) {
    Color themeColor = Theme.of(context).colorScheme.primary;
    final theme = Theme.of(context).brightness;
    Color containerColor = Theme.of(context).colorScheme.tertiary;
    TextEditingController controller = TextEditingController();
    controller.text = taskModel.priority.toString();
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
                      taskModel: taskModel,
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
                      taskModel.priority = int.parse(controller.text);
                    } else {
                      taskModel.priority = 1;
                    }
                    taskModel.save();
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

  String _rollingValueTask = 'All';
  String get rollingIndexTask => _rollingValueTask;
  changeRollingIndexTask(String newValue) {
    _rollingValueTask = newValue;
    notifyListeners();
  }

  int _taskViewIndex = 0;
  int get taskViewIndex => _taskViewIndex;
  changeTaskIndex(int newValue) {
    _taskViewIndex = newValue;
    notifyListeners();
  }
}

class AboutTitle extends StatelessWidget {
  const AboutTitle({
    super.key,
    required this.taskModel,
  });

  final Task taskModel;

  @override
  Widget build(BuildContext context) {
    Color habitClr = getClr(taskModel.selectedClrIndex, context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CardText(txt: taskModel.task),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: LeadingIcon(
            clr: habitClr,
            icon: groupedIcons[taskModel.selectedIconGroup]![
                taskModel.selectedIconIndex],
          ),
        ),
      ],
    );
  }
}
