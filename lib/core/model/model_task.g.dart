// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelTaskAdapter extends TypeAdapter<ModelTask> {
  @override
  final int typeId = 3;

  @override
  ModelTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelTask(
      id: fields[0] as String,
      note: fields[1] as String,
      title: fields[2] as String,
      starttime: fields[3] as String,
      endtime: fields[4] as String,
      date: fields[5] as String,
      color: fields[6] as int,
      iscompleted: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ModelTask obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.starttime)
      ..writeByte(4)
      ..write(obj.endtime)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(7)
      ..write(obj.iscompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
