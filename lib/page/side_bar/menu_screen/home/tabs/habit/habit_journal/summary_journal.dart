import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:habit/model/habit.dart';
import 'package:habit/widgets/forward_icon.dart';

import '../../../../../../../utils/date.dart';
import '../../../../../../../utils/padding.dart';
import '../../../../../../../widgets/custom_header_title.dart';
import '../../../../../../../widgets/my_alert_dialog.dart';
import '../../../../../../../widgets/my_title.dart';
import 'my_text_editor.dart';

class HabitJournalSummary extends StatefulWidget {
  const HabitJournalSummary({super.key, required this.habitModel});
  final Habit habitModel;

  @override
  State<HabitJournalSummary> createState() => _HabitJournalSummaryState();
}

class _HabitJournalSummaryState extends State<HabitJournalSummary> {
  @override
  Widget build(BuildContext context) {
    final filteredItems = widget.habitModel.track.entries
        .where((entry) => entry.value[1] != '')
        .toList();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: homePadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeaderTitleWithBack(),
              const SizedBox(height: 10),
              const MyText1(txt: 'Habit Journal'),
              const MyText2(txt: 'Summary'),
              const SizedBox(height: 20),
              filteredItems.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: filteredItems.length,
                          itemBuilder: (context, index) {
                            final myKey = filteredItems[index].key;
                            final value = filteredItems[index].value;
                            return HabitJournalCard(
                              title: ((value[1]) as List)[0],
                              subTitle: myDecideDate(
                                  context,
                                  widget.habitModel.track[myKey]![2]
                                      as DateTime),
                              onDelete: () =>
                                  deleteTile(widget.habitModel, myKey),
                              onTap: () {
                                Navigator.of(context)
                                    .push(CupertinoPageRoute(
                                      builder: (context) => MyTextEditor(
                                        habitModel: widget.habitModel,
                                        mykey: myKey,
                                      ),
                                    ))
                                    .then((value) => setState(() {}));
                              },
                            );
                          }),
                    )
                  : Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            textAlign: TextAlign.center,
                            'No records found in your \ndaily habit journal.',
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> get showDeleteConfirmationDialog {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return MyCustomAlertDialog(
          title: 'Confirm Deletion',
          content: Text(
            'Are you sure you want to delete?',
            style: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 16,
            ),
          ),
          action: 'Delete',
        );
      },
    );
  }

  Future<void> deleteTile(Habit habitModel, String myKey) async {
    bool? confirmDelete = await showDeleteConfirmationDialog;
    if (confirmDelete != null && confirmDelete) {
      widget.habitModel.track[myKey]![1] = '';
      widget.habitModel.save();
      setState(() {});
    }
  }
}

class HabitJournalCard extends StatelessWidget {
  const HabitJournalCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onDelete,
    required this.onTap,
  });

  final String title;
  final String subTitle;

  final VoidCallback onDelete;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      onLongPress: onDelete,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: colorScheme.tertiary,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: ListTile(
          title: Text(title == '' ? subTitle : title),
          subtitle: Text(subTitle),
          titleTextStyle: GoogleFonts.poppins(
            color: colorScheme.primary,
            fontSize: 17,
          ),
          subtitleTextStyle: GoogleFonts.poppins(
            color: Colors.grey,
          ),
          trailing: const ForwardIcon(size: 20),
        ),
      ),
    );
  }
}
