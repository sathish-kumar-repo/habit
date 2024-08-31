import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit/model/sub_item.dart';
import 'package:habit/utils/sound.dart';
import 'package:provider/provider.dart';

import '../../../../../../../data/habit_clr_list.dart';
import '../../../../../../../data/icon_list.dart';
import '../../../../../../../utils/custom_animation.dart';
import '../../../../../utils/padding.dart';
import '../../../../../../../widgets/custom_header_title.dart';
import '../../../../../../../widgets/custom_text_field.dart';
import '../../../../../../../widgets/my_title.dart';
import '../../../../../provider/theme_provider.dart';
import 'color_screen.dart';
import 'field_container.dart';
import 'icon_screen.dart';
import 'my_validation.dart';
import 'pick_clr.dart';
import 'pick_icon.dart';

class AddSubItems extends StatefulWidget {
  const AddSubItems({
    super.key,
    this.name,
    this.selectedIconGroup,
    this.selectedIconIndex,
    this.selectedClrIndex,
    this.init = false,
  });

  final String? name;
  final String? selectedIconGroup;
  final int? selectedIconIndex;
  final int? selectedClrIndex;
  final bool init;

  @override
  State<AddSubItems> createState() => _AddSubItemsState();
}

class _AddSubItemsState extends State<AddSubItems> {
  // My TextEditingController controller
  final TextEditingController _subItemController = TextEditingController();

  // For Color
  int selectedColorIndex = 0;
  Color selectedColor = habitClrLst[0];
  // For Icon
  String _selectedGroup = 'All';
  int _selectedIconIndex = 0;
  IconData? _selectedIconData;

  @override
  void initState() {
    intializeField();
    super.initState();
  }

  void intializeField() {
    _selectedIconData = groupedIcons[_selectedGroup]![_selectedIconIndex];
    if (widget.init) {
      _subItemController.text = widget.name!;
      _selectedGroup = widget.selectedIconGroup!;
      _selectedIconIndex = widget.selectedIconIndex!;
      _selectedIconData = groupedIcons[_selectedGroup]![_selectedIconIndex];
      selectedColorIndex = widget.selectedClrIndex!;
      selectedColor = habitClrLst[selectedColorIndex];
    }
  }

  @override
  void dispose() {
    _subItemController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: homePadding(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeaderTitleWithBack(),
                const SizedBox(height: 10),
                const MyText1(txt: 'create'),
                const MyText2(txt: 'your habit'),
                const SizedBox(height: 30),

                FieldContainer(
                  iconData: CupertinoIcons.clock,
                  title: 'Your Habit',
                  child: CustomTextField(
                    controller: _subItemController,
                    hintText: 'Exercise',
                  ),
                ),

                // Pick Color
                PickClr(
                  onTap: () => navigateToColorSelector(selectedColorIndex),
                  clr: theme == Brightness.dark
                      ? selectedColor == Colors.black
                          ? Colors.grey
                          : selectedColor
                      : selectedColor,
                ),
                // Pick Icon
                PickIcon(
                  onTap: () => navigateToIconSelector(
                    _selectedGroup,
                    _selectedIconIndex,
                  ),
                  iconData: _selectedIconData!,
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: saveDetails,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveDetails() {
    if (_subItemController.text.isEmpty) {
      showCupertinoDialogForValidation();
      return;
    }

    Navigator.of(context).pop([
      SubItems(
        name: _subItemController.text,
        selectedIconGroup: _selectedGroup,
        selectedIconIndex: _selectedIconIndex,
        selectedClrIndex: selectedColorIndex,
      ),
      widget.init
    ]);
  }

  // Validation
  void showCupertinoDialogForValidation() {
    context.read<MyProvider>().playButtonClickSound('error');
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return const MyValidation(
          txt: 'Please make sure a valid habit name was entered.',
        );
      },
    );
  }

  // For Color and Icon
  void navigateToIconSelector(
      String selectedIconGroup, int selectedIconIndex) async {
    click(context);
    final lst = await Navigator.of(context).push(
      customAnimation(IconSelector(
        initialSelectedIconGroup: selectedIconGroup,
        initialSelectedIconIndex: selectedIconIndex,
      )),
    );
    if (lst != null) {
      setState(() {
        _selectedGroup = lst[0];
        _selectedIconIndex = lst[1];
        _selectedIconData = groupedIcons[_selectedGroup]![_selectedIconIndex];
      });
    }
  }

  void navigateToColorSelector(int selectedClrIndex) async {
    click(context);
    final colorIndex = await Navigator.of(context).push(
      customAnimation(
        ColorSelector(
          initialSelectedColorIndex: selectedClrIndex,
        ),
      ),
    );
    if (colorIndex != null) {
      setState(() {
        selectedColorIndex = colorIndex;
        selectedColor = habitClrLst[colorIndex];
      });
    }
  }
}
