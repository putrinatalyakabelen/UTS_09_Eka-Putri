// lib/screens/budget/budget_list_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/budget_service.dart';
import '../../widgets/budget_progress_bar.dart';
import 'budget_form_screen.dart';

class BudgetListScreen extends StatelessWidget {
  const BudgetListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = Get.find<BudgetService>();
    final budgets = service.getActiveBudgets();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Budget'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: budgets.isEmpty
          ? const Center(
        child: Text(
          'Belum ada budget.\nTambah sekarang!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: budgets.length,
        itemBuilder: (ctx, i) {
          final b = budgets[i];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              title: Text(
                b.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BudgetProgressBar(
                    percentage: b.percentage,
                    amount: b.amount,
                    spent: b.spent,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Periode: ${b.period.toString().split('.').last}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              trailing: Text(
                'Rp${b.spent.toStringAsFixed(0)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const BudgetFormScreen()),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}