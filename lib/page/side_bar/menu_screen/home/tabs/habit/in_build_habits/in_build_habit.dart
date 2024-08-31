import 'package:flutter/material.dart';
import 'package:habit/widgets/my_title.dart';

import '../../../../../../../data/in_build_habit_modal.dart';
import '../../../../../../../model/habit.dart';
import '../../../../../../../utils/padding.dart';
import '../../../../../../../widgets/custom_header_title.dart';

import 'components/in_build_habits_items.dart';

class AddInBuildHabits extends StatefulWidget {
  const AddInBuildHabits({super.key, required this.onSave});
  final void Function(
    String habit,
    String description,
    int howManyDays,
    int daysComplete,
    String selectedGroup,
    int selectedIconIndex,
    int selectedClrIndex,
    bool isEdit,
    int editIndex,
    Habit? habitModel,
  )? onSave;

  @override
  State<AddInBuildHabits> createState() => _AddInBuildHabitsState();
}

class _AddInBuildHabitsState extends State<AddInBuildHabits> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: homePadding(),
          child: Column(
            children: [
              const CustomHeaderTitleWithBack(),
              const MyText1(txt: 'create'),
              const MyText2(txt: 'your habit'),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: inBuildHabits.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  controller: ScrollController(),
                  itemBuilder: (context, index) {
                    String habit = inBuildHabits.keys.elementAt(index);
                    List<dynamic> lst = inBuildHabits[habit]!;
                    return InBuildHabitsItems(
                      size: size,
                      lst: lst,
                      habit: habit,
                      onSave: widget.onSave,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
