import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/forward_icon.dart';

class BackUpOption extends StatelessWidget {
  const BackUpOption({
    super.key,
    required this.ctx,
    required this.txt,
    required this.iconData,
    required this.onTap,
  });
  final BuildContext ctx;
  final String txt;
  final IconData iconData;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        iconData,
        color: Theme.of(ctx).colorScheme.primary,
      ),
      trailing: const ForwardIcon(),
      title: Text(
        txt,
        style: GoogleFonts.poppins(
          color: Theme.of(ctx).colorScheme.onBackground,
        ),
      ),
    );
  }
}
