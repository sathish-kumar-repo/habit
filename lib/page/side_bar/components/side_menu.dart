import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
    required this.press,
    required this.txt,
    required this.index,
    required this.selectedIndex,
    required this.iconData,
  });

  final VoidCallback press;
  final String txt;
  final int index;
  final int selectedIndex;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Divider(color: Colors.grey.withOpacity(0.4), height: 1),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              width: selectedIndex == index ? 288 : 0,
              height: 56,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              onTap: press,
              leading: Icon(
                iconData,
                color: selectedIndex == index
                    ? Colors.white
                    : Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                txt,
                style: GoogleFonts.poppins(
                  color: selectedIndex == index
                      ? Colors.white
                      : Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
