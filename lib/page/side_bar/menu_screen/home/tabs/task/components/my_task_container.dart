import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit/provider/create_task_provider.dart';
import 'package:habit/utils/tracking_map.dart';
import 'package:provider/provider.dart';

import '../../../../../../../model/task.dart';
import '../../../../../../../utils/padding.dart';

import '../../../components/rolling_switch.dart';
import '../../../components/today_heading.dart';
import 'task_view.dart';

class TaskContainer extends StatefulWidget {
  const TaskContainer({
    super.key,
    required this.child,
    required this.taskCount,
    required this.taskLst,
  });
  final Widget child;
  final int taskCount;
  final List<Task> taskLst;
  @override
  State<TaskContainer> createState() => _TaskContainerState();
}

class _TaskContainerState extends State<TaskContainer> {
  final now = DateTime.now();
  late String formattedDate;
  @override
  void initState() {
    formattedDate = getFormattedDate(now);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateTask>(
      builder: (context, CreateTask createTaskNotifier, child) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              padding: homePadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeading(),
                  const SizedBox(height: 25),
                  TaskView(
                    taskIndex: createTaskNotifier.taskViewIndex,
                    onToggle: (index) =>
                        createTaskNotifier.changeTaskIndex(index ?? 0),
                  ),
                  const SizedBox(height: 20),
                  RollingSwitch(
                    value: createTaskNotifier.rollingIndexTask,
                    onChanged: (val) =>
                        createTaskNotifier.changeRollingIndexTask(val),
                  ),
                  const SizedBox(height: 10),
                  AnimatedSwitcherTranslation.left(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      key: ValueKey(createTaskNotifier.rollingIndexTask),
                      '${createTaskNotifier.rollingIndexTask} (${widget.taskCount})',
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
}
