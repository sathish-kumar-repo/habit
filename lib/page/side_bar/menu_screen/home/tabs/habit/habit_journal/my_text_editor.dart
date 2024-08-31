import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'package:habit/model/habit.dart';

import '../../../../../../../utils/padding.dart';
import '../../../../../../../widgets/custom_header_title.dart';
import '../../../../../../../widgets/my_title.dart';
import '../../../../../../../screens/habit_tracker/components/my_bottom_sheet.dart';
import 'components/my_editor.dart';
import 'components/my_tool_bar.dart';

class MyTextEditor extends StatefulWidget {
  const MyTextEditor({
    super.key,
    required this.habitModel,
    required this.mykey,
  });
  final Habit habitModel;
  final String mykey;
  @override
  State<MyTextEditor> createState() => _MyTextEditorState();
}

class _MyTextEditorState extends State<MyTextEditor> {
  late TextEditingController _titleController;
  late QuillController _quillController;
  @override
  void initState() {
    super.initState();
    if (widget.habitModel.track[widget.mykey]![1] != '') {
      _titleController = TextEditingController(
        text: (widget.habitModel.track[widget.mykey]![1] as List)[0],
      );
      _quillController = QuillController(
        document: Document.fromJson(
          jsonDecode(
            (widget.habitModel.track[widget.mykey]![1] as List)[1],
          ),
        ),
        selection: const TextSelection.collapsed(offset: 0),
      );
    } else {
      _titleController = TextEditingController();
      _quillController = QuillController.basic();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        saveJournal();
      },
      child: Scaffold(
        bottomSheet: MyBottomSheet(
          onSave: () {
            Navigator.of(context).pop();
          },
        ),
        body: SafeArea(
          child: Container(
            padding: homePadding(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeaderTitleWithBack(),
                const SizedBox(height: 10),
                const MyText1(txt: 'Daily'),
                const MyText2(txt: 'Habit Journal'),
                const SizedBox(height: 30),
                MyToolBar(controller: _quillController),
                const SizedBox(height: 30),
                TextField(
                  controller: _titleController,
                  focusNode: FocusNode(),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                MyEditor(controller: _quillController)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveJournal() {
    if (_titleController.text == '' && isQuillEmpty) {
      widget.habitModel.track[widget.mykey]![1] = '';
      return;
    }
    widget.habitModel.track[widget.mykey]![1] = [
      _titleController.text,
      jsonEncode(_quillController.document.toDelta().toJson())
    ];

    widget.habitModel.save();
  }

  bool get isQuillEmpty {
    final delta = _quillController.document.toDelta();
    // Check if delta is empty
    if (delta.isEmpty) {
      return true;
    }
    // Check if delta contains only a single newline
    if (delta.length == 1 && delta.first.data == '\n') {
      return true;
    }
    // Check if delta contains a single insert operation of a newline
    if (delta.length == 1 && delta.first.isInsert && delta.first.data == '\n') {
      return true;
    }
    return false;
  }
}
