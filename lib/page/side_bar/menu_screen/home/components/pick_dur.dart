import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/format_duration.dart';
import 'field_container.dart';

class PickDuration extends StatelessWidget {
  const PickDuration({
    super.key,
    required this.evaluationMethodIndex,
    required this.onTap,
    required this.duration,
  });
  final int evaluationMethodIndex;
  final VoidCallback onTap;
  final Duration duration;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      child: (evaluationMethodIndex == 2)
          ? FieldContainer(
              iconData: CupertinoIcons.clock,
              title: 'Your Goal',
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: onTap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        formatDuration(duration, false),
                        // setDuration.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'a day',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
