import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'field_container.dart';

List evaluationMethodDescription = [
  'Record the outcome of the activity as either successful or unsuccessful.',
  'Establish a numerical target as the daily goal or limit for the habit.',
  'Set a time-based objective as the daily goal or limit for the habit.',
  'If you wish to assess your activity according to a series of sub-items.'
];

class EvaluationMethodForHabit extends StatelessWidget {
  const EvaluationMethodForHabit({
    super.key,
    required this.evaluationMethodIndex,
    required this.onToggle,
  });
  final int evaluationMethodIndex;
  final void Function(int? value) onToggle;
  @override
  Widget build(BuildContext context) {
    return FieldContainer(
      iconData: Icons.check_circle_outline,
      title: 'Evaluation Method',
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ToggleSwitch(
                minWidth: 120.0,
                radiusStyle: true,
                totalSwitches: 4,
                cornerRadius: 20.0,
                isVertical: true,
                animate: true,
                curve: Curves.fastOutSlowIn,
                initialLabelIndex: evaluationMethodIndex,
                inactiveBgColor: Theme.of(context).scaffoldBackgroundColor,
                activeBgColor: [Theme.of(context).colorScheme.primary],
                labels: const ['Yes/No', 'Numeric', 'Timer', 'Checklist'],
                icons: const [
                  Icons.check_circle_outline,
                  Icons.insert_chart_outlined,
                  Icons.access_time,
                  Icons.check_box_outlined
                ],
                customTextStyles: [GoogleFonts.poppins()],
                onToggle: onToggle,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedSwitcherPlus.zoomIn(
                duration: const Duration(milliseconds: 600),
                child: Text(
                  evaluationMethodDescription[evaluationMethodIndex],
                  key: ValueKey(evaluationMethodIndex),
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EvaluationMethodForTask extends StatelessWidget {
  const EvaluationMethodForTask({
    super.key,
    required this.evaluationMethodIndex,
    required this.onToggle,
  });
  final int evaluationMethodIndex;
  final void Function(int? value) onToggle;
  @override
  Widget build(BuildContext context) {
    return FieldContainer(
      iconData: Icons.check_circle_outline,
      title: 'Evaluation Method',
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ToggleSwitch(
              minWidth: 120.0,
              minHeight: 50.0,
              radiusStyle: true,
              totalSwitches: 2,
              cornerRadius: 50.0,
              animate: true,
              curve: Curves.fastOutSlowIn,
              initialLabelIndex: evaluationMethodIndex,
              inactiveBgColor: Theme.of(context).scaffoldBackgroundColor,
              activeBgColor: [Theme.of(context).colorScheme.primary],
              labels: const ['Yes/No', 'Checklist'],
              icons: const [
                Icons.check_circle_outline,
                Icons.check_box_outlined
              ],
              customTextStyles: [GoogleFonts.poppins()],
              onToggle: onToggle,
            ),
          ),
        ),
      ),
    );
  }
}
