import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/sound.dart';
import 'forward_icon.dart';

class BottomSheetTile extends StatelessWidget {
  const BottomSheetTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.iconData,
    required this.onTap,
    required this.clr,
  });
  final String title;
  final String? subtitle;
  final IconData iconData;
  final VoidCallback onTap;
  final Color clr;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        click(context);
        Navigator.pop(context);
        onTap();
      },
      contentPadding: EdgeInsets.zero,
      leading: MyIcon(clr: clr, iconData: iconData),
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle!),
      subtitleTextStyle: GoogleFonts.poppins(
        fontSize: 12,
        color: Colors.grey,
      ),
      trailing: const ForwardIcon(),
      titleTextStyle: GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}

class CompleteOrNot extends StatelessWidget {
  const CompleteOrNot({
    super.key,
    required this.isComplete,
  });

  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isComplete
            ? Theme.of(context).colorScheme.primary
            : Colors.grey.withOpacity(0.12),
      ),
      child: isComplete
          ? const Icon(
              Icons.done_rounded,
              color: Colors.white,
              size: 18,
            )
          : null,
    );
  }
}

class CardBottomTxt extends StatelessWidget {
  const CardBottomTxt({
    super.key,
    required this.txt,
  });

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        txt,
        style: GoogleFonts.poppins(
          color: Colors.grey,
        ),
      ),
    );
  }
}

class BottomSheetIcon extends StatelessWidget {
  const BottomSheetIcon({
    super.key,
    required this.iconData,
    required this.onTap,
    required this.clr,
  });
  final IconData iconData;
  final VoidCallback onTap;
  final Color clr;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        click(context);
        Navigator.pop(context);
        onTap();
      },
      child: MyIcon(clr: clr, iconData: iconData),
    );
  }
}

class MyIcon extends StatelessWidget {
  const MyIcon({
    super.key,
    required this.clr,
    required this.iconData,
  });

  final Color clr;

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness;
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: clr.withOpacity(theme == Brightness.dark ? 0.3 : 0.1),
      ),
      child: Icon(
        iconData,
        color: clr,
      ),
    );
  }
}

class CardText extends StatelessWidget {
  const CardText({
    super.key,
    required this.txt,
  });

  final String txt;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      txt.toUpperCase(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: size.width / 26,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}

class LeadingIcon extends StatelessWidget {
  const LeadingIcon({
    super.key,
    required this.clr,
    required this.icon,
  });

  final Color clr;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        size: size.width / 17,
        color: Colors.white,
      ),
    );
  }
}
