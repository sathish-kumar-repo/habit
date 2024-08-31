import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

List<String> periodLst = [
  'Week',
  'Month',
  'Year',
];

class PeriodContainer extends StatelessWidget {
  const PeriodContainer({
    super.key,
    required this.periodIndex,
    required this.onTap,
    required this.onToggle,
    required this.days,
  });
  final int periodIndex;
  final void Function() onTap;
  final void Function(int? index) onToggle;
  final int days;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ToggleSwitch(
            minHeight: 50,
            minWidth: 100.0,
            radiusStyle: true,
            totalSwitches: 3,
            cornerRadius: 50.0,
            animate: true,
            curve: Curves.fastOutSlowIn,
            initialLabelIndex: periodIndex,
            inactiveBgColor: Theme.of(context).scaffoldBackgroundColor,
            activeBgColor: [Theme.of(context).colorScheme.primary],
            labels: periodLst,
            onToggle: onToggle,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.5,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  child: Center(
                    child: AnimatedSwitcherPlus.zoomIn(
                      duration: const Duration(milliseconds: 100),
                      child: Text(
                        days.toString(),
                        key: ValueKey(days),
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'days per ',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.5,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  child: Center(
                    child: AnimatedSwitcherPlus.zoomIn(
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      child: Text(
                        periodLst[periodIndex],
                        key: ValueKey(periodIndex),
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
