import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class MyEditor extends StatelessWidget {
  const MyEditor({
    super.key,
    required QuillController controller,
  }) : _controller = controller;

  final QuillController _controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: QuillEditor(
        focusNode: FocusNode(),
        scrollController: ScrollController(),
        configurations: QuillEditorConfigurations(
          controller: _controller,
          readOnly: false,
          scrollable: true,
          expands: false,
          padding: EdgeInsets.zero,
          showCursor: true,
          enableScribble: true,
          placeholder: 'Write your journal',
          scrollPhysics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
