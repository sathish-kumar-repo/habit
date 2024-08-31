// ignore_for_file: constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

enum WeekStartFrom {
  Sunday,
  Monday,
}

class HorizontalWeekCalendar extends StatefulWidget {
  /// week start from [WeekStartFrom.Monday]
  final WeekStartFrom? weekStartFrom;

  ///get DateTime on date select
  final Function(DateTime)? onDateChange;

  ///get the list of DateTime on week change
  final Function(List<DateTime>)? onWeekChange;

  /// Active background color
  ///
  /// Default value [Theme.of(context).primaryColor]

  /// Active text color
  ///
  /// Default value [Theme.of(context).primaryColor]

  /// Active Navigator color
  ///
  /// Default value [Theme.of(context).primaryColor]
  final Color? activeNavigatorColor;

  /// Month Color
  ///
  /// Default value [Theme.of(context).primaryColor.withOpacity(.2)]
  final Color? monthColor;

  const HorizontalWeekCalendar({
    super.key,
    this.onDateChange,
    this.onWeekChange,
    this.activeNavigatorColor,
    this.monthColor,
    this.weekStartFrom = WeekStartFrom.Monday,
  });

  @override
  State<HorizontalWeekCalendar> createState() => _HorizontalWeekCalendarState();
}

class _HorizontalWeekCalendarState extends State<HorizontalWeekCalendar> {
  CarouselController carouselController = CarouselController();

  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();
  List<DateTime> currentWeek = [];
  int currentWeekIndex = 0;

  List<List<DateTime>> listOfWeeks = [];

  @override
  void initState() {
    initCalender();
    super.initState();
  }

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  initCalender() {
    final date = DateTime.now();

    DateTime startOfCurrentWeek = widget.weekStartFrom == WeekStartFrom.Monday
        ? getDate(date.subtract(Duration(days: date.weekday - 1)))
        : getDate(date.subtract(Duration(days: date.weekday % 7)));

    currentWeek.add(startOfCurrentWeek);
    for (int index = 0; index < 6; index++) {
      DateTime addDate = startOfCurrentWeek.add(Duration(days: (index + 1)));
      currentWeek.add(addDate);
    }

    listOfWeeks.add(currentWeek);

    getMorePreviousWeeks();
  }

  getMorePreviousWeeks() {
    List<DateTime> minus7Days = [];
    DateTime startFrom = listOfWeeks.isEmpty
        ? DateTime.now()
        : listOfWeeks[currentWeekIndex].isEmpty
            ? DateTime.now()
            : listOfWeeks[currentWeekIndex][0];

    for (int index = 0; index < 7; index++) {
      DateTime minusDate = startFrom.add(Duration(days: -(index + 1)));
      minus7Days.add(minusDate);
    }
    listOfWeeks.add(minus7Days.reversed.toList());
    setState(() {});
  }

  onDateSelect(DateTime date) {
    setState(() {
      selectedDate = date;
    });
    widget.onDateChange?.call(selectedDate);
  }

  onBackClick() {
    carouselController.nextPage();
  }

  onNextClick() {
    carouselController.previousPage();
  }

  onWeekChange(index) {
    currentWeekIndex = index;
    currentWeek = listOfWeeks[currentWeekIndex];

    if (currentWeekIndex + 1 == listOfWeeks.length) {
      getMorePreviousWeeks();
    }

    widget.onWeekChange?.call(currentWeek);
    setState(() {});
  }

  // =================

  isNextDisabled() {
    return listOfWeeks[currentWeekIndex].last.isBefore(DateTime.now());
  }

  isCurrentYear() {
    return DateFormat('yyyy').format(currentWeek[0]) ==
        DateFormat('yyyy').format(today);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var withOfScreen = MediaQuery.of(context).size.width;

    Color activeBackgroundColor = theme.colorScheme.primary;
    Color inactiveBackGroundColor = theme.brightness == Brightness.dark
        ? theme.colorScheme.tertiary
        : theme.colorScheme.primary.withOpacity(0.15);
    Color activeTextColor = Colors.white;
    Color inactiveTextColor = theme.colorScheme.onBackground;

    return currentWeek.isEmpty
        ? const SizedBox()
        : CarouselSlider(
            carouselController: carouselController,
            items: [
              if (listOfWeeks.isNotEmpty)
                for (int ind = 0; ind < listOfWeeks.length; ind++)
                  Container(
                    width: withOfScreen,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        for (int weekIndex = 0;
                            weekIndex < listOfWeeks[ind].length;
                            weekIndex++)
                          Expanded(
                            child: GestureDetector(
                              // onTap: listOfWeeks[ind][weekIndex]
                              //         .isBefore(DateTime.now())
                              //     ? () {
                              //         onDateSelect(
                              //           listOfWeeks[ind][weekIndex],
                              //         );
                              //       }
                              //     : null,
                              onTap: () {
                                onDateSelect(
                                  listOfWeeks[ind][weekIndex],
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(left: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: DateFormat('dd-MM-yyyy').format(
                                              listOfWeeks[ind][weekIndex]) ==
                                          DateFormat('dd-MM-yyyy')
                                              .format(selectedDate)
                                      ? activeBackgroundColor
                                      : inactiveBackGroundColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        DateFormat(
                                          'EEE',
                                        )
                                            .format(
                                              listOfWeeks[ind][weekIndex],
                                            )
                                            .toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          color: DateFormat('dd-MM-yyyy')
                                                      .format(listOfWeeks[ind]
                                                          [weekIndex]) ==
                                                  DateFormat('dd-MM-yyyy')
                                                      .format(
                                                    selectedDate,
                                                  )
                                              ? activeTextColor
                                              : inactiveTextColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    FittedBox(
                                      child: Column(
                                        children: [
                                          Text(
                                            // "$weekIndex: ${listOfWeeks[ind][weekIndex] == DateTime.now()}",
                                            "${listOfWeeks[ind][weekIndex].day}",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              fontSize: 17,
                                              color: DateFormat('dd-MM-yyyy')
                                                          .format(listOfWeeks[
                                                                  ind]
                                                              [weekIndex]) ==
                                                      DateFormat('dd-MM-yyyy')
                                                          .format(selectedDate)
                                                  ? activeTextColor
                                                  : inactiveTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Container(
                                            height: 4,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: DateFormat('dd-MM-yyyy')
                                                          .format(listOfWeeks[
                                                                  ind]
                                                              [weekIndex]) ==
                                                      DateFormat('dd-MM-yyyy')
                                                          .format(selectedDate)
                                                  ? Colors.white
                                                  : activeBackgroundColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
            ],
            options: CarouselOptions(
              scrollPhysics: const ClampingScrollPhysics(),
              height: 70,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              reverse: true,
              onPageChanged: (index, reason) {
                onWeekChange(index);
              },
            ),
          );
  }
}
