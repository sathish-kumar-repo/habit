import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/custom_text_field.dart';
import 'field_container.dart';

class UnitField extends StatelessWidget {
  const UnitField({
    super.key,
    required this.evaluationMethodIndex,
    required TextEditingController unitController,
  }) : _unitController = unitController;

  final int evaluationMethodIndex;
  final TextEditingController _unitController;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      child: (evaluationMethodIndex == 1)
          ? FieldContainer(
              iconData: CupertinoIcons.clock,
              title: 'Your Unit (Optional)',
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _unitController,
                      hintText: 'minutes',
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      'a day',
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
