import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit/model/habit.dart';
import 'package:habit/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/date.dart';

import 'my_status.dart';
import 'tile_icon.dart';

class AnalyticsExpansionTile extends StatefulWidget {
  const AnalyticsExpansionTile({
    super.key,
    required this.entry,
    required this.notifier,
    required this.habitModel,
    required this.onDelete,
  });
  final MapEntry<String, List<Object>> entry;
  final MyProvider notifier;
  final Habit habitModel;
  final void Function() onDelete;
  @override
  State<AnalyticsExpansionTile> createState() => _AnalyticsExpansionTileState();
}

class _AnalyticsExpansionTileState extends State<AnalyticsExpansionTile> {
  final TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          // collapsedShape: const ContinuousRectangleBorder(
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(25),
          //   ),
          // ),
          // shape: const ContinuousRectangleBorder(
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(25),
          //   ),
          // ),
          collapsedBackgroundColor: Theme.of(context).colorScheme.tertiary,
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          title: Text(
            decideDateMethod(
              widget.entry.value[2] as DateTime,
              widget.notifier.dateTimeIndex,
            ),
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          collapsedIconColor: Theme.of(context).colorScheme.primary,
          iconColor: Theme.of(context).colorScheme.primary,
          expandedAlignment: Alignment.centerLeft,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Journal',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      TileIcon(
                        iconData: Icons.edit,
                        onTap: () =>
                            editTile(widget.entry.key, widget.habitModel),
                      ),
                      const SizedBox(width: 10),
                      TileIcon(
                        iconData: CupertinoIcons.delete,
                        onTap: widget.onDelete,
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Text(
                    widget.entry.value[1].toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Divider(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Status(entry: widget.entry)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void editTile(String key, Habit habitModel) {
    messageController.text = habitModel.track[key]![1] as String;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 4,
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit your Habit Journal",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 5),
              Consumer(
                builder: (context, MyProvider notifier, child) {
                  return Text(
                    decideDateMethod(
                      habitModel.track[key]![2] as DateTime,
                      notifier.dateTimeIndex,
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ],
          ),
          content: Container(
            margin: const EdgeInsets.all(5),
            child: TextField(
              controller: messageController,
              maxLength: 500,
              cursorColor: Theme.of(context).colorScheme.primary,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Done',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                final String message = messageController.text;
                if (message.isNotEmpty) {
                  habitModel.track[key]![1] = message;
                  habitModel.save();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
