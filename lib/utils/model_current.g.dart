// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_current.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeModelCurrentAdapter extends TypeAdapter<EmployeeModelCurrent> {
  @override
  final int typeId = 1;

  @override
  EmployeeModelCurrent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeModelCurrent(
      name: fields[0] as String,
      role: fields[1] as String,
      fromDate: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeModelCurrent obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.role)
      ..writeByte(2)
      ..write(obj.fromDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeModelCurrentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
