// // lib/models/bill.dart
// import 'package:hive/hive.dart';

// part 'bill.g.dart';

// @HiveType(typeId: 2)
// class Bill extends HiveObject {
//   @HiveField(0) final String id;
//   @HiveField(1) final String name;
//   @HiveField(2) final double amount;
//   @HiveField(3) final DateTime dueDate;
//   @HiveField(4) bool isPaid;
//   @HiveField(5) final bool isRecurring;
//   @HiveField(6) final int? dayOfMonth; // int? bukan DateTime

//   Bill({
//     required this.id,
//     required this.name,
//     required this.amount,
//     required this.dueDate,
//     this.isPaid = false,
//     this.isRecurring = false,
//     this.dayOfMonth,
//   });
// }
import 'package:hive/hive.dart';

part 'bill.g.dart';

@HiveType(typeId: 2)
class Bill extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final DateTime dueDate;

  @HiveField(4)
  bool isPaid;

  @HiveField(5)
  final bool isRecurring;

  @HiveField(6)
  final int? dayOfMonth;

  Bill({
    required this.id,
    required this.name,
    required this.amount,
    required this.dueDate,
    this.isPaid = false,
    this.isRecurring = false,
    this.dayOfMonth,
  });
}
