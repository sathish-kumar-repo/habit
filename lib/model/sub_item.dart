import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'sub_item.g.dart';

@HiveType(typeId: 9)
class SubItems {
  @HiveField(0)
  String name;

  @HiveField(1)
  String selectedIconGroup;

  @HiveField(2)
  int selectedIconIndex;

  @HiveField(3)
  int selectedClrIndex;

  @HiveField(4)
  String id;

  SubItems({
    required this.name,
    required this.selectedIconGroup,
    required this.selectedIconIndex,
    required this.selectedClrIndex,
  }) : id = const Uuid().v4();
}
