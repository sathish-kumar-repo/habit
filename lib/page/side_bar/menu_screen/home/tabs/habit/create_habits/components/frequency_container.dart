import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'title_with_btn.dart';

class FrequencyContainer extends StatelessWidget {
  const FrequencyContainer({
    super.key,
    required this.onTap,
    required this.children,
  });
  final VoidCallback onTap;

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          TitleWithbtn(
            onTap: onTap,
          ),
          if (children.isNotEmpty)
            Container(
              margin: const EdgeInsetsDirectional.only(top: 15),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: children,
              ),
            ),
        ],
      ),
    );
  }
}

class FrequencyTileForMonth extends StatelessWidget {
  const FrequencyTileForMonth({
    super.key,
    required this.onDelete,
    required this.txt1,
    required this.txt2,
  });
  final String txt1;
  final String txt2;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              '$txt1 $txt2 each month',
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
          ),
          GestureDetector(
            onTap: onDelete,
            child: Icon(
              CupertinoIcons.delete,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class FrequencyTileForAnnual extends StatelessWidget {
  const FrequencyTileForAnnual({
    super.key,
    required this.onDelete,
    required this.txt1,
    required this.txt2,
  });
  final String txt1;
  final String txt2;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$txt1 $txt2',
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
          ),
          GestureDetector(
            onTap: onDelete,
            child: Icon(
              CupertinoIcons.delete,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
