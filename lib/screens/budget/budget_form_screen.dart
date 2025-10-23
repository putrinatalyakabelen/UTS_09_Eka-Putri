// // lib/screens/budget/budget_form_screen.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../models/budget.dart';
// import '../../services/budget_service.dart';

// class BudgetFormScreen extends StatelessWidget {
//   const BudgetFormScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final nameCtrl = TextEditingController();
//     final amountCtrl = TextEditingController();
//     BudgetPeriod? period = BudgetPeriod.monthly;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pemasukan Baru'),
//         backgroundColor: const Color.fromARGB(255, 222, 20, 181),
//         foregroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameCtrl,
//               decoration: const InputDecoration(
//                 labelText: 'Nama Pemasukan',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: amountCtrl,
//               decoration: const InputDecoration(
//                 labelText: 'Jumlah (Rp)',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 16),
//             DropdownButtonFormField<BudgetPeriod>(
//               value: period,
//               decoration: const InputDecoration(
//                 labelText: 'Periode',
//                 border: OutlineInputBorder(),
//               ),
//               items: BudgetPeriod.values
//                   .map((p) => DropdownMenuItem(
//                 value: p,
//                 child: Text(p.name.toUpperCase()),
//               ))
//                   .toList(),
//               onChanged: (v) => period = v,
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () {
//                 if (nameCtrl.text.isEmpty || amountCtrl.text.isEmpty) {
//                   Get.snackbar('Error', 'Isi semua field!');
//                   return;
//                 }
//                 final budget = Budget(
//                   id: DateTime.now().millisecondsSinceEpoch.toString(),
//                   name: nameCtrl.text,
//                   amount: double.tryParse(amountCtrl.text) ?? 0,
//                   period: period!,
//                   startDate: DateTime.now(),
//                   categoryIds: [],
//                   spent: 0,
//                 );
//                 Get.find<BudgetService>().addBudget(budget);
//                 Get.back();
//                 Get.snackbar('Sukses', 'pemasukan berhasil ditambah!');
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(195, 255, 14, 203),
//                 padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
//               ),
//               child: const Text('Simpan', style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/budget.dart';
import '../../services/budget_service.dart';

class BudgetFormScreen extends StatefulWidget {
  final Budget? budget; // kalau ada berarti edit
  const BudgetFormScreen({super.key, this.budget});

  @override
  State<BudgetFormScreen> createState() => _BudgetFormScreenState();
}

class _BudgetFormScreenState extends State<BudgetFormScreen> {
  final nameCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  BudgetPeriod? period = BudgetPeriod.monthly;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.budget != null) {
      nameCtrl.text = widget.budget!.name;
      amountCtrl.text = widget.budget!.amount.toString();
      period = widget.budget!.period;
      selectedDate = widget.budget!.date;
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _save() {
    if (nameCtrl.text.isEmpty || amountCtrl.text.isEmpty) {
      Get.snackbar('Error', 'Isi semua field!');
      return;
    }

    final service = Get.find<BudgetService>();

    if (widget.budget == null) {
      // Tambah data baru
      final newBudget = Budget(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: nameCtrl.text,
        amount: double.tryParse(amountCtrl.text) ?? 0,
        period: period!,
        startDate: DateTime.now(),
        categoryIds: [],
        spent: 0,
        date: selectedDate,
      );
      service.addBudget(newBudget);
      Get.snackbar('Sukses', 'Pemasukan berhasil ditambah!');
    } else {
      // Edit data
      final b = widget.budget!;
      b.name = nameCtrl.text;
      b.amount = double.tryParse(amountCtrl.text) ?? 0;
      b.period = period!;
      b.date = selectedDate;
      b.save();
      Get.snackbar('Sukses', 'Pemasukan berhasil diperbarui!');
    }

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.budget == null ? 'Pemasukan Baru' : 'Edit Pemasukan'),
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
            InkWell(
              onTap: () => _pickDate(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Tanggal Pemasukan',
                  border: OutlineInputBorder(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Icon(Icons.calendar_today, color: Colors.pink),
                  ],
                ),
              ),
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
              onChanged: (v) => setState(() => period = v),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _save,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(195, 255, 14, 203),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: Text(
                widget.budget == null ? 'Simpan' : 'Perbarui',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
