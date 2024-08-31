import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../widgets/box_container.dart';
import '../../../../../widgets/custom_text_field.dart';
import 'field_container.dart';

class MyReminder extends StatelessWidget {
  const MyReminder({
    super.key,
    required this.showMyTimePicker,
    required this.reminderTime,
    required this.controller,
    required this.isShow,
  });
  final VoidCallback showMyTimePicker;
  final DateTime reminderTime;
  final TextEditingController controller;
  final bool isShow;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      child: isShow
          ? FieldContainer(
              title: 'Remainder for this habit',
              iconData: CupertinoIcons.bell,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: showMyTimePicker,
                        child: BoxContainer(
                          children: [
                            Text(
                              DateFormat('hh:mm a').format(reminderTime),
                              style: GoogleFonts.poppins(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text('Remainder', style: GoogleFonts.poppins()),
                            const SizedBox(height: 8),
                            Icon(
                              CupertinoIcons.bell,
                              color: Theme.of(context).colorScheme.primary,
                              size: size.width * 0.1,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Motivate yourself',
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CustomTextField(
                        controller: controller,
                        hintText: 'Keep pushing forward...',
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    )
                  ],
                ),
              ))
          : const SizedBox.shrink(),
    );
  }
}
