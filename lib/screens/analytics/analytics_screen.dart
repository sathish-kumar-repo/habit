import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:habit/model/habit.dart';
import 'package:habit/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/padding.dart';
import '../../widgets/custom_header_title.dart';
import '../../widgets/my_title.dart';
import 'components/analytics_title.dart';
import 'components/my_analytics.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({
    super.key,
    required this.myMap,
    required this.habitModel,
  });
  final Map<String, List<Object>> myMap;
  final Habit habitModel;

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  double count = 0.0;
  double days = 0;
  List<FlSpot> flSpot = [const FlSpot(0, 0)];
  double maxX = 0;
  late List dynamicList;
  List originalValues = [];
  late List isExpandedList = [];

  @override
  void initState() {
    getDynamicList();
    getAnalytics();
    getMessage();
    super.initState();
  }

  void getDynamicList() {
    dynamicList = widget.myMap.values.toList();
  }

  void getAnalytics() {
    for (var element in dynamicList) {
      originalValues.add(element[0]);
    }

    maxX = originalValues.length.toDouble();
    int lastIndex = originalValues.lastIndexOf(true);
    List result = originalValues.sublist(0, lastIndex + 1);

    for (bool value in result) {
      days += 1;
      if (value) {
        count += 1;
        flSpot.add(FlSpot(days, count));
      } else {
        count > 0 ? count -= 1 : count = 0;
        flSpot.add(FlSpot(days, count));
      }
    }
  }

  void getMessage() {
    for (var element in dynamicList) {
      if (element[1] != '') {
        isExpandedList.add([false, element[1]]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: homePadding(),
          child: Column(
            children: [
              const CustomHeaderTitleWithBack(),
              const MyText1(txt: 'your'),
              const MyText2(txt: 'habit statistics'),
              const SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(child: Consumer(
                  builder: (context, MyProvider notifier, child) {
                    return Column(
                      children: [
                        const AnalyticsTitle(txt: 'Habit Analytics Over Time'),
                        const SizedBox(height: 10),
                        MyAnalytics(maxX: maxX, flSpot: flSpot),
                        const SizedBox(height: 15),
                        const AnalyticsTitle(txt: 'Daily Habit Journal'),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
