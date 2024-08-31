import 'package:flutter/material.dart';
import 'package:habit/page/side_bar/menu_screen/home/tabs/task/components/task_card.dart';
import 'package:habit/provider/create_task_provider.dart';
import 'package:habit/utils/date.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';
import 'package:provider/provider.dart';

import '../../../../../../data/icon_list.dart';
import '../../../../../../model/task.dart';
import '../../../../../../utils/boxes.dart';
import '../../../../../../utils/ask_confirmation.dart';
import '../../../../../../utils/enum_fn.dart';
import '../../../../../../utils/get_clr.dart';
import '../../../../../../widgets/my_default_message.dart';
import 'components/my_task_container.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Task>>(
      valueListenable: Boxes.getTask().listenable(),
      builder: (context, box, child) {
        final List<Task> originalTaskLst = box.values.toList().cast<Task>();

        List<Task> taskLst = [];

        int taskViewIndex = context.watch<CreateTask>().taskViewIndex;

        if (taskViewIndex == 1) {
          taskLst = originalTaskLst.where(
            (taskModel) {
              return taskModel.date.isToday();
            },
          ).toList();
        } else if (taskViewIndex == 2) {
          taskLst = originalTaskLst
              .where((taskModel) => taskModel.date.isPast())
              .toList();
        } else if (taskViewIndex == 3) {
          taskLst = originalTaskLst
              .where((taskModel) => taskModel.isTaskComplete)
              .toList();
        } else {
          taskLst = originalTaskLst;
          // Sort the list based on the date order
          taskLst.sort((a, b) => a.date.compareTo(b.date));
        }

        // For finish
        if (taskViewIndex != 3) {
          taskLst = taskLst
              .where((taskModel) => !(taskModel.isTaskComplete))
              .toList();
        }

        var taskDoItAtStringToEnum =
            getDoItAtStringToEnum(context.read<CreateTask>().rollingIndexTask);

        if (taskDoItAtStringToEnum != null) {
          taskLst = taskLst.where(
            (taskModel) {
              return taskModel.doItAt == taskDoItAtStringToEnum;
            },
          ).toList();
        }

        int length = taskLst.length;

        // For priority
        taskLst.sort((a, b) {
          int priorityA = a.priority;
          int priorityB = b.priority;
          return priorityA.compareTo(priorityB);
        });

        return TaskContainer(
          taskLst: originalTaskLst,
          taskCount: length,
          child: taskLst.isEmpty
              ? const MyDefaultMessage(
                  'Begin building habits now \nfor a better life!',
                  iconData: Icons.done_all,
                )
              : ImplicitlyAnimatedList<Task>(
                  padding:
                      const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                  items: taskLst,
                  areItemsTheSame: (Task oldItem, Task newItem) =>
                      newItem.isTaskComplete ? true : false,
                  itemBuilder: (context, animation, item, index) {
                    Task taskModel = item;
                    String task = taskModel.task;
                    String selectedIconGroup = taskModel.selectedIconGroup;
                    int selectedIconIndex = taskModel.selectedIconIndex;
                    int selectedClrIndex = taskModel.selectedClrIndex;
                    return SizeFadeTransition(
                      sizeFraction: 0.7,
                      curve: Curves.easeInOut,
                      animation: animation,
                      child: Container(
                        margin: index + 1 == taskLst.length
                            ? const EdgeInsets.only(bottom: 25)
                            : const EdgeInsets.only(bottom: 5),
                        child: TaskCard(
                          task: task,
                          date: taskModel.date,
                          icon: groupedIcons[selectedIconGroup]![
                              selectedIconIndex],
                          taskCardClr: getClr(selectedClrIndex, context),
                          todayCompletedTask: taskModel.isTaskComplete,
                          onEdit: onEdit,
                          onDelete: () => delete(taskModel),
                          onPriority: () => onPriority(taskModel),
                          onUpdate: () => onUpdate(taskModel),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }

  void onEdit() {}

  // Delete
  Future<void> delete(Task taskModel) async {
    bool? confirmDelete = await showDeleteConfirmationDialog(context);
    if (confirmDelete != null && confirmDelete) {
      deleteTaskModel(taskModel);
    }
  }

  void deleteTaskModel(Task taskModel) {
    context.read<CreateTask>().delete(taskModel);
  }

  void onUpdate(Task taskModel) {
    context.read<CreateTask>().updateTask(taskModel, context);
  }

  void onPriority(Task taskModel) {
    context.read<CreateTask>().onPriorityChange(taskModel, context);
  }
}
