import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart';

class MyToolBar extends StatelessWidget {
  const MyToolBar({
    super.key,
    required QuillController controller,
  }) : _controller = controller;

  final QuillController _controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: QuillToolbar.simple(
          configurations: QuillSimpleToolbarConfigurations(
            controller: _controller,
            showLink: false,
            showAlignmentButtons: true,
            showSearchButton: false,
            headerStyleType: HeaderStyleType.buttons,
            dialogTheme: QuillDialogTheme(
              inputTextStyle: GoogleFonts.poppins(),
            ),
            axis: Axis.horizontal,
            sharedConfigurations: const QuillSharedConfigurations(),
            buttonOptions: const QuillSimpleToolbarButtonOptions(
              base: QuillToolbarBaseButtonOptions(
                iconTheme: QuillIconTheme(
                  iconButtonSelectedData: IconButtonData(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
