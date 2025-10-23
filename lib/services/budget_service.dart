import 'package:hive/hive.dart';
import '../models/budget.dart';

class BudgetService {
  final Box<Budget> box = Hive.box<Budget>('budgets');

  Future<void> addBudget(Budget budget) async {
    await box.put(budget.id, budget);
  }

  List<Budget> getActiveBudgets() {
    final now = DateTime.now();
    return box.values.where((b) {
      return b.startDate.isBefore(now) &&
          (b.endDate == null || b.endDate!.isAfter(now));
    }).toList();
  }

  Future<void> updateSpent(String budgetId, double amount) async {
    final budget = box.get(budgetId);
    if (budget != null) {
      budget.spent += amount;
      await budget.save();
    }
  }
}
