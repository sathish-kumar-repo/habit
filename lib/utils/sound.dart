import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';

void click(BuildContext context) {
  context.read<MyProvider>().playButtonClickSound('coo');
}

void finishSound(BuildContext context) {
  context.read<MyProvider>().playButtonClickSound('finish', ex: 'mp3');
}
