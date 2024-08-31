// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubItemsAdapter extends TypeAdapter<SubItems> {
  @override
  final int typeId = 9;

  @override
  SubItems read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubItems(
      name: fields[0] as String,
      selectedIconGroup: fields[1] as String,
      selectedIconIndex: fields[2] as int,
      selectedClrIndex: fields[3] as int,
    )..id = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, SubItems obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.selectedIconGroup)
      ..writeByte(2)
      ..write(obj.selectedIconIndex)
      ..writeByte(3)
      ..write(obj.selectedClrIndex)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
