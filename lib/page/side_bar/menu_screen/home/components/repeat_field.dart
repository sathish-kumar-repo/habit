import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'field_container.dart';

class RepeatField extends StatelessWidget {
  const RepeatField({
    super.key,
    required this.selectedRepeat,
    required this.onTap,
    required this.isShow,
  });
  final bool isShow;
  final int selectedRepeat;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      child: isShow
          ? FieldContainer(
              title: 'Repeat',
              iconData: Icons.event_repeat,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: onTap,
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                          ),
                          children: [
                            const TextSpan(
                              text: 'for  ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextSpan(
                              text: selectedRepeat.toString(),
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                            const TextSpan(
                              text: '  times',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'eg. I brush my teeth for 2 times a day.',
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
