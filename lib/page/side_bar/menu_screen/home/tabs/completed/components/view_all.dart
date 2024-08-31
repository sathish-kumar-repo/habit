import 'package:flutter/material.dart';
import 'package:habit/page/side_bar/menu_screen/home/tabs/completed/components/completed_view.dart';

import '../../../../../../../utils/padding.dart';

import '../../../components/today_heading.dart';

class ViewAllContainer extends StatefulWidget {
  const ViewAllContainer({super.key, required this.child});
  final Widget child;
  @override
  State<ViewAllContainer> createState() => _ViewAllContainerState();
}

class _ViewAllContainerState extends State<ViewAllContainer> {
  int compeletedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: homePadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeading(),
              const SizedBox(height: 25),
              ViewAll(
                compeletedIndex: compeletedIndex,
                onToggle: (index) {
                  compeletedIndex = index ?? 0;
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: widget.child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
