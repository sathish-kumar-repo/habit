import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'field_container.dart';

class AmountField extends StatelessWidget {
  const AmountField({
    super.key,
    required this.evaluationMethodIndex,
    required this.amountIndex,
    required this.onToggle,
  });
  final int evaluationMethodIndex;
  final int amountIndex;
  final void Function(int? index) onToggle;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      child: (evaluationMethodIndex == 1)
          ? FieldContainer(
              iconData: Icons.check_circle_outline,
              title: 'Your Amount',
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ToggleSwitch(
                      minHeight: 45,
                      minWidth: 150.0,
                      radiusStyle: true,
                      totalSwitches: 6,
                      cornerRadius: 20.0,
                      animate: true,
                      isVertical: true,
                      curve: Curves.fastOutSlowIn,
                      initialLabelIndex: amountIndex,
                      inactiveBgColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      activeBgColor: [Theme.of(context).colorScheme.primary],
                      labels: const [
                        'At least',
                        'At most',
                        'Less than',
                        'Greater than',
                        'Exactly',
                        'Any value',
                      ],
                      customTextStyles: [GoogleFonts.poppins()],
                      onToggle: onToggle,
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
