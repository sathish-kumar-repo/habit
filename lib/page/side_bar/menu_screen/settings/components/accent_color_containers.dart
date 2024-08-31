import 'package:flutter/material.dart';

class UnSelectedAccentColorContianer extends StatelessWidget {
  const UnSelectedAccentColorContianer({
    super.key,
    required this.clr,
  });
  final Color clr;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: clr,
      ),
    );
  }
}

class SelectedAccentColorContianer extends StatelessWidget {
  const SelectedAccentColorContianer({
    super.key,
    required this.clr,
  });
  final Color clr;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: clr,
        ),
        shape: BoxShape.circle,
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: clr,
        ),
      ),
    );
  }
}
