// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_previous.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeModelPreviousAdapter extends TypeAdapter<EmployeeModelPrevious> {
  @override
  final int typeId = 2;

  @override
  EmployeeModelPrevious read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeModelPrevious(
      name: fields[0] as String,
      role: fields[1] as String,
      fromDate: fields[2] as String,
      toDate: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeModelPrevious obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.role)
      ..writeByte(2)
      ..write(obj.fromDate)
      ..writeByte(3)
      ..write(obj.toDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeModelPreviousAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
