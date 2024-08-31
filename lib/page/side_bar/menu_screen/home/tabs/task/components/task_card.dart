import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../utils/date.dart';
import '../../../../../../../utils/sound.dart';
import '../../../../../../../widgets/card_widgets.dart';
import '../../../../../../../widgets/custom_model_bottom_sheet.dart';
import '../../../../../../../widgets/my_drag_handle.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    this.notes,
    required this.icon,
    required this.taskCardClr,
    required this.todayCompletedTask,
    required this.onEdit,
    required this.onDelete,
    required this.onPriority,
    required this.onUpdate,
    required this.date,
  });

  final String task;
  final String? notes;
  final IconData icon;
  final Color taskCardClr;

  final bool todayCompletedTask;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  final VoidCallback onPriority;
  final VoidCallback onUpdate;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: onUpdate,
        onLongPress: () => customshowBottomSheet(
          context,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CompleteOrNot(isComplete: todayCompletedTask),
            const SizedBox(width: 7),
            Expanded(
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      LeadingIcon(clr: taskCardClr, icon: icon),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CardText(
                              txt: task,
                            ),

                            Text(
                              date.isToday()
                                  ? 'Today'
                                  : (date.isPast() && !todayCompletedTask)
                                      ? 'Overdue'
                                      : myDecideDate(context, date),
                              style: GoogleFonts.poppins(
                                color: (date.isPast() && !todayCompletedTask)
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                            // if (notes != null) CardBottomTxt(txt: notes!),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void customshowBottomSheet(
    context,
  ) {
    click(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CustomBottomModelSheet(
          padding: const EdgeInsetsDirectional.only(bottom: 10),
          child: Wrap(
            children: [
              const MyDragHandle(),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: CardText(
                      txt: task,
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: LeadingIcon(
                        clr: taskCardClr,
                        icon: icon,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.1),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    BottomSheetTile(
                      clr: taskCardClr,
                      onTap: () {},
                      title: 'Remainder',
                      iconData: Icons.notification_add,
                    ),
                    BottomSheetTile(
                      clr: taskCardClr,
                      onTap: onPriority,
                      title: 'Priority',
                      iconData: Icons.flag,
                    ),
                    BottomSheetTile(
                      clr: taskCardClr,
                      onTap: onEdit,
                      title: 'Edit',
                      iconData: CupertinoIcons.create,
                    ),
                    BottomSheetTile(
                      clr: taskCardClr,
                      onTap: onDelete,
                      title: 'Delete',
                      iconData: CupertinoIcons.delete,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
