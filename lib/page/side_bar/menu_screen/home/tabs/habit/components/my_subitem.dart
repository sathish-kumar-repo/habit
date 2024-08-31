import 'package:flutter/material.dart';
import 'package:habit/model/habit.dart';
import 'package:habit/model/sub_item.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

import '../../../../../../../data/icon_list.dart';
import '../../../../../../../provider/create_habit_provider.dart';
import '../../../../../../../utils/get_clr.dart';
import '../../../../../../../widgets/my_drag_handle.dart';

class MySubItems extends StatelessWidget {
  const MySubItems({super.key, required this.habitModel, required this.myKey});
  final Habit habitModel;
  final String myKey;
  @override
  Widget build(BuildContext context) {
    List<SubItems>? lst = habitModel.habitSubItems;
    return Material(
      child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Wrap(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const MyDragHandle(),
                  ),
                  AboutTitle(
                    habitModel: habitModel,
                    myKey: myKey,
                  ),
                  const SizedBox(height: 50),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: lst!.length,
                    itemBuilder: (context, index) {
                      SubItems habitSubModel = lst[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          groupedIcons[habitSubModel.selectedIconGroup]![
                              habitSubModel.selectedIconIndex],
                          color:
                              getClr(habitSubModel.selectedClrIndex, context),
                        ),
                        title: Text(habitSubModel.name),
                        // trailing: Checkbox(
                        //   value: (habitModel.track[myKey]?[5]
                        //       as Map<String, bool>)[habitSubModel.id],
                        //   onChanged: (value) {
                        //     setState(() {
                        //       updateCheckboxValue(
                        //           habitSubModel.id, value ?? false);
                        //     });
                        //   },
                        // ),
                        trailing: MSHCheckbox(
                          size: 25,
                          value: (habitModel.track[myKey]![5]
                                  as Map)[habitSubModel.id] ??
                              false,
                          onChanged: (value) {
                            setState(() {
                              (habitModel.track[myKey]![5]
                                  as Map)[habitSubModel.id] = value;
                              habitModel.save();
                            });
                          },
                          colorConfig:
                              MSHColorConfig.fromCheckedUncheckedDisabled(
                            checkedColor: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          )),
    );
  }
}
