import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'forward_icon.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.txt,
    this.onTap,
    required this.iconData,
    this.trailing,
    this.forwardIcon = false,
  });
  final String txt;
  final IconData iconData;
  final void Function()? onTap;
  final Widget? trailing;
  final bool forwardIcon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      title: Text(
        txt,
        style: GoogleFonts.poppins(
          fontSize: 18,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      leading: Icon(
        iconData,
        color: Theme.of(context).colorScheme.primary,
      ),
      trailing: forwardIcon ? const ForwardIcon() : trailing,
    );
  }
}
