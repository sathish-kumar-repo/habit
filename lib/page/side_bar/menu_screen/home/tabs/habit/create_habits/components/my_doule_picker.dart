import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDoublePicker extends StatelessWidget {
  const MyDoublePicker({
    super.key,
    required this.list1,
    required this.list2,
    required this.width1,
    required this.width2,
    required this.onSelectedItemChanged1,
    required this.onSelectedItemChanged2,
    this.bottomTxt,
    required this.onSave,
  });

  final List list1;
  final void Function(int value) onSelectedItemChanged1;
  final double width1;
  final List list2;
  final void Function(int value) onSelectedItemChanged2;
  final double width2;
  final String? bottomTxt;
  final void Function() onSave;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Theme.of(context).colorScheme.onTertiary,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: width1,
                    child: CupertinoPicker(
                      selectionOverlay: Container(),
                      itemExtent: 40,
                      useMagnifier: true,
                      scrollController: FixedExtentScrollController(
                        initialItem: 0,
                      ),
                      onSelectedItemChanged: onSelectedItemChanged1,
                      children:
                          list1.map((item) => Text(item.toString())).toList(),
                    ),
                  ),
                  SizedBox(
                    width: width2,
                    child: CupertinoPicker(
                      selectionOverlay: Container(),
                      itemExtent: 40,
                      useMagnifier: true,
                      scrollController: FixedExtentScrollController(
                        initialItem: 0,
                      ),
                      onSelectedItemChanged: onSelectedItemChanged2,
                      children:
                          list2.map((item) => Text(item.toString())).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (bottomTxt != null)
            Center(
              child: Text(
                bottomTxt!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    onSave();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
