// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'budget.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class BudgetAdapter extends TypeAdapter<Budget> {
//   @override
//   final int typeId = 0;

//   @override
//   Budget read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Budget(
//       id: fields[0] as String,
//       name: fields[1] as String,
//       amount: fields[2] as double,
//       period: fields[3] as BudgetPeriod,
//       startDate: fields[4] as DateTime,
//       endDate: fields[5] as DateTime?,
//       categoryIds: (fields[6] as List).cast<String>(),
//       spent: fields[7] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, Budget obj) {
//     writer
//       ..writeByte(8)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.name)
//       ..writeByte(2)
//       ..write(obj.amount)
//       ..writeByte(3)
//       ..write(obj.period)
//       ..writeByte(4)
//       ..write(obj.startDate)
//       ..writeByte(5)
//       ..write(obj.endDate)
//       ..writeByte(6)
//       ..write(obj.categoryIds)
//       ..writeByte(7)
//       ..write(obj.spent);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is BudgetAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class BudgetPeriodAdapter extends TypeAdapter<BudgetPeriod> {
//   @override
//   final int typeId = 1;

//   @override
//   BudgetPeriod read(BinaryReader reader) {
//     switch (reader.readByte()) {
//       case 0:
//         return BudgetPeriod.daily;
//       case 1:
//         return BudgetPeriod.weekly;
//       case 2:
//         return BudgetPeriod.monthly;
//       case 3:
//         return BudgetPeriod.yearly;
//       default:
//         return BudgetPeriod.daily;
//     }
//   }

//   @override
//   void write(BinaryWriter writer, BudgetPeriod obj) {
//     switch (obj) {
//       case BudgetPeriod.daily:
//         writer.writeByte(0);
//         break;
//       case BudgetPeriod.weekly:
//         writer.writeByte(1);
//         break;
//       case BudgetPeriod.monthly:
//         writer.writeByte(2);
//         break;
//       case BudgetPeriod.yearly:
//         writer.writeByte(3);
//         break;
//     }
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is BudgetPeriodAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetAdapter extends TypeAdapter<Budget> {
  @override
  final int typeId = 0;

  @override
  Budget read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Budget(
      id: fields[0] as String,
      name: fields[1] as String,
      amount: fields[2] as double,
      period: fields[3] as BudgetPeriod,
      startDate: fields[4] as DateTime,
      endDate: fields[5] as DateTime?,
      categoryIds: (fields[6] as List).cast<String>(),
      spent: fields[7] as double,
      date: fields[8] as DateTime, // 🆕 tambahkan field date
    );
  }

  @override
  void write(BinaryWriter writer, Budget obj) {
    writer
      ..writeByte(9) // 🆕 jumlah total field
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.period)
      ..writeByte(4)
      ..write(obj.startDate)
      ..writeByte(5)
      ..write(obj.endDate)
      ..writeByte(6)
      ..write(obj.categoryIds)
      ..writeByte(7)
      ..write(obj.spent)
      ..writeByte(8)
      ..write(obj.date); // 🆕 simpan tanggal
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BudgetPeriodAdapter extends TypeAdapter<BudgetPeriod> {
  @override
  final int typeId = 1;

  @override
  BudgetPeriod read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BudgetPeriod.daily;
      case 1:
        return BudgetPeriod.weekly;
      case 2:
        return BudgetPeriod.monthly;
      case 3:
        return BudgetPeriod.yearly;
      default:
        return BudgetPeriod.daily;
    }
  }

  @override
  void write(BinaryWriter writer, BudgetPeriod obj) {
    switch (obj) {
      case BudgetPeriod.daily:
        writer.writeByte(0);
        break;
      case BudgetPeriod.weekly:
        writer.writeByte(1);
        break;
      case BudgetPeriod.monthly:
        writer.writeByte(2);
        break;
      case BudgetPeriod.yearly:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetPeriodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
