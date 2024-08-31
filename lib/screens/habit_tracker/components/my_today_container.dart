import 'package:flutter/material.dart';

class MyTodayContainer extends StatelessWidget {
  const MyTodayContainer({
    super.key,
    required this.index,
    required this.isVisible,
    required this.howManyDays,
  });
  final int index;
  final bool isVisible;
  final int howManyDays;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: const FirstChild(),
      secondChild: SecondChild(
        index: index,
        howManyDays: howManyDays,
      ),
      crossFadeState:
          isVisible ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 500),
    );
  }
}

class FirstChild extends StatelessWidget {
  const FirstChild({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 7,
      height: size.width / 7,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.check,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SecondChild extends StatelessWidget {
  const SecondChild({
    super.key,
    required this.index,
    required this.howManyDays,
  });
  final int index;
  final int howManyDays;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 7,
      height: size.width / 7,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Center(
        child: Text(
          index + 1 == howManyDays ? 'End' : '${index + 1}',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
