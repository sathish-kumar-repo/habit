import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit/page/side_bar/menu_screen/App%20Maintenance/components/my_back_up.dart';
import 'package:habit/widgets/my_list_tile.dart';
import 'package:habit/widgets/my_title.dart';

import '../../../../provider/theme_provider.dart';
import '../../../../utils/boxes.dart';
import '../../../../utils/padding.dart';
import '../../../../widgets/my_alert_dialog.dart';

class AppMaintenance extends StatefulWidget {
  const AppMaintenance({super.key});

  @override
  State<AppMaintenance> createState() => _AppMaintenanceState();
}

class _AppMaintenanceState extends State<AppMaintenance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: menuPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyText1(txt: 'your'),
              const MyText2(txt: 'App Maintenance'),
              const SizedBox(height: 10),
              const MyBackUp(),
              MyListTile(
                txt: 'Reset my app',
                iconData: CupertinoIcons.delete,
                forwardIcon: true,
                onTap: deleteAllData,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> get showDeleteConfirmationDialog {
    return showCupertinoDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return MyCustomAlertDialog(
          title: 'Confirm Deletion',
          content: Text(
            'Are you sure you want to delete all data?',
            style: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 16,
            ),
          ),
          action: 'Delete all',
        );
      },
    );
  }

  // For Deleting All Data
  Future<void> deleteAllData() async {
    MyProvider().playButtonClickSound('coo');
    bool? confirmDelete = await showDeleteConfirmationDialog;
    if (confirmDelete != null && confirmDelete) {
      try {
        var box = Boxes.getHabit();
        box.clear();
        customFloatingSnackBars('All data deleted successfully.');
      } catch (e) {
        customFloatingSnackBars(
            'Unable to delete data. Please try again later.');
      }
    }
  }

  void customFloatingSnackBars(text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
  }
}
