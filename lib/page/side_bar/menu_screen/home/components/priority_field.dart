import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/box_container.dart';
import 'field_container.dart';

class PriorityField extends StatelessWidget {
  const PriorityField({
    super.key,
    required this.onTap,
    required this.selectedPriority,
  });
  final VoidCallback onTap;
  final int selectedPriority;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FieldContainer(
      title: 'Priority',
      iconData: Icons.flag,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: onTap,
              child: BoxContainer(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      selectedPriority.toString(),
                      key: const ValueKey(2),
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Priority', style: GoogleFonts.poppins()),
                  const SizedBox(height: 8),
                  Icon(
                    Icons.flag,
                    color: Theme.of(context).colorScheme.primary,
                    size: size.width * 0.1,
                  ),
                ],
              ),
            ),
            const PriorityTxt(),
          ],
        ),
      ),
    );
  }
}

class PriorityTxt extends StatelessWidget {
  const PriorityTxt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Activities with higher priority will be prominently featured at the top of the list.',
        style: GoogleFonts.poppins(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
    );
  }
}
