import 'package:flutter/material.dart';

class TrackNumber extends StatefulWidget {
  const TrackNumber({
    super.key,
    required this.index,
    required this.value,
  });
  final int index;
  final Object value;

  @override
  State<TrackNumber> createState() => _TrackNumberState();
}

class _TrackNumberState extends State<TrackNumber> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 7,
      height: size.width / 7,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color:
            widget.value == true ? Theme.of(context).colorScheme.primary : null,
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Center(
        child: widget.value == true
            ? const Icon(
                Icons.check,
                size: 35,
                color: Colors.white,
              )
            : Text(
                '${widget.index + 1}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
      ),
    );
  }
}
