// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 11;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      evaluationMethod: fields[0] as TaskEvaluationMethodType,
      task: fields[1] as String,
      des: fields[2] as String?,
      date: fields[3] as DateTime,
      isTaskComplete: fields[4] as bool,
      priority: fields[5] as int,
      remainder: fields[6] as DateTime,
      selectedIconGroup: fields[7] as String,
      selectedIconIndex: fields[8] as int,
      selectedClrIndex: fields[10] as int,
      doItAt: fields[11] as DoItAtPeroid,
      taskSubitems: (fields[12] as List?)?.cast<SubItems>(),
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.evaluationMethod)
      ..writeByte(1)
      ..write(obj.task)
      ..writeByte(2)
      ..write(obj.des)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.isTaskComplete)
      ..writeByte(5)
      ..write(obj.priority)
      ..writeByte(6)
      ..write(obj.remainder)
      ..writeByte(7)
      ..write(obj.selectedIconGroup)
      ..writeByte(8)
      ..write(obj.selectedIconIndex)
      ..writeByte(10)
      ..write(obj.selectedClrIndex)
      ..writeByte(11)
      ..write(obj.doItAt)
      ..writeByte(12)
      ..write(obj.taskSubitems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
