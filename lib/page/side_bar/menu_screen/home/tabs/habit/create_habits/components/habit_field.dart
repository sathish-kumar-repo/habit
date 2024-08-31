import 'package:flutter/cupertino.dart';

import 'package:habit/widgets/custom_text_field.dart';

import '../../../../components/field_container.dart';

class HabitField extends StatelessWidget {
  const HabitField({
    super.key,
    required TextEditingController habitController,
  }) : _habitController = habitController;

  final TextEditingController _habitController;

  @override
  Widget build(BuildContext context) {
    return FieldContainer(
      iconData: CupertinoIcons.clock,
      title: 'Your Habit',
      child: CustomTextField(
        controller: _habitController,
        hintText: 'Exercise',
      ),
    );
  }
}
