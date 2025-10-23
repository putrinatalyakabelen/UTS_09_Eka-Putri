import 'package:hive_flutter/hive_flutter.dart';
import '../models/budget.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BudgetAdapter());
  await Hive.openBox<Budget>('budgets');
}
