// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'bill.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class BillAdapter extends TypeAdapter<Bill> {
//   @override
//   final int typeId = 2;

//   @override
//   Bill read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Bill(
//       id: fields[0] as String,
//       name: fields[1] as String,
//       amount: fields[2] as double,
//       dueDate: fields[3] as DateTime,
//       isPaid: fields[4] as bool,
//       isRecurring: fields[5] as bool,
//       dayOfMonth: fields[6] as int?,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, Bill obj) {
//     writer
//       ..writeByte(7)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.name)
//       ..writeByte(2)
//       ..write(obj.amount)
//       ..writeByte(3)
//       ..write(obj.dueDate)
//       ..writeByte(4)
//       ..write(obj.isPaid)
//       ..writeByte(5)
//       ..write(obj.isRecurring)
//       ..writeByte(6)
//       ..write(obj.dayOfMonth);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is BillAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BillAdapter extends TypeAdapter<Bill> {
  @override
  final int typeId = 2;

  @override
  Bill read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bill(
      id: fields[0] as String,
      name: fields[1] as String,
      amount: fields[2] as double,
      dueDate: fields[3] as DateTime,
      isPaid: fields[4] as bool,
      isRecurring: fields[5] as bool,
      dayOfMonth: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Bill obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.dueDate)
      ..writeByte(4)
      ..write(obj.isPaid)
      ..writeByte(5)
      ..write(obj.isRecurring)
      ..writeByte(6)
      ..write(obj.dayOfMonth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
