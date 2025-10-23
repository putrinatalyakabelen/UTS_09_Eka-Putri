// lib/models/budget.dart
import 'package:hive/hive.dart';

part 'budget.g.dart';

@HiveType(typeId: 0)
class Budget extends HiveObject {
  @HiveField(0) final String id;
  @HiveField(1) final String name;
  @HiveField(2) final double amount;
  @HiveField(3) final BudgetPeriod period;
  @HiveField(4) final DateTime startDate;
  @HiveField(5) final DateTime? endDate;
  @HiveField(6) final List<String> categoryIds;
  @HiveField(7) double spent;

  Budget({
    required this.id,
    required this.name,
    required this.amount,
    required this.period,
    required this.startDate,
    this.endDate,
    required this.categoryIds,
    this.spent = 0,
  });

  double get percentage => amount > 0 ? (spent / amount) * 100 : 0;
  double get remaining => amount - spent;
}

@HiveType(typeId: 1)
enum BudgetPeriod {
  @HiveField(0) daily,
  @HiveField(1) weekly,
  @HiveField(2) monthly,
  @HiveField(3) yearly,
}