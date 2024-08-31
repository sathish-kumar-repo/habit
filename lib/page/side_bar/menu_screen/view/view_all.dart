import 'package:flutter/material.dart';
import 'package:habit/widgets/my_title.dart';
import '../../../../utils/padding.dart';
import '../home/tabs/completed/components/completed_view.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({super.key});

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  int viewAllIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: menuPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyText2(txt: 'View All'),
              const SizedBox(height: 10),
              ViewAll(
                compeletedIndex: viewAllIndex,
                onToggle: (index) {
                  viewAllIndex = index ?? 0;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
