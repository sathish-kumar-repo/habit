import 'package:flutter/cupertino.dart';

import 'package:flutter/services.dart';

import '../../../../../widgets/custom_text_field.dart';
import 'field_container.dart';

class GoalField extends StatelessWidget {
  const GoalField({
    super.key,
    required this.evaluationMethodIndex,
    required TextEditingController goalController,
  }) : _goalController = goalController;

  final int evaluationMethodIndex;
  final TextEditingController _goalController;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      child: (evaluationMethodIndex == 1)
          ? FieldContainer(
              iconData: CupertinoIcons.clock,
              title: 'Your Goal',
              child: CustomTextField(
                controller: _goalController,
                hintText: '40',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: false,
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.center,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
