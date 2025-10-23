// lib/screens/budget/budget_form_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/budget.dart';
import '../../services/budget_service.dart';

class BudgetFormScreen extends StatelessWidget {
  const BudgetFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController();
    final amountCtrl = TextEditingController();
    BudgetPeriod? period = BudgetPeriod.monthly;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pemasukan Baru'),
        backgroundColor: const Color.fromARGB(255, 222, 20, 181),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Nama Pemasukan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: amountCtrl,
              decoration: const InputDecoration(
                labelText: 'Jumlah (Rp)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<BudgetPeriod>(
              value: period,
              decoration: const InputDecoration(
                labelText: 'Periode',
                border: OutlineInputBorder(),
              ),
              items: BudgetPeriod.values
                  .map((p) => DropdownMenuItem(
                value: p,
                child: Text(p.name.toUpperCase()),
              ))
                  .toList(),
              onChanged: (v) => period = v,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (nameCtrl.text.isEmpty || amountCtrl.text.isEmpty) {
                  Get.snackbar('Error', 'Isi semua field!');
                  return;
                }
                final budget = Budget(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: nameCtrl.text,
                  amount: double.tryParse(amountCtrl.text) ?? 0,
                  period: period!,
                  startDate: DateTime.now(),
                  categoryIds: [],
                  spent: 0,
                );
                Get.find<BudgetService>().addBudget(budget);
                Get.back();
                Get.snackbar('Sukses', 'pemasukan berhasil ditambah!');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(195, 255, 14, 203),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: const Text('Simpan', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}