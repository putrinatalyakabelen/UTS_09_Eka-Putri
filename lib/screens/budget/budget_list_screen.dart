// // lib/screens/budget/budget_list_screen.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../services/budget_service.dart';
// import '../../widgets/budget_progress_bar.dart';
// import 'budget_form_screen.dart';

// class BudgetListScreen extends StatelessWidget {
//   const BudgetListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final service = Get.find<BudgetService>();
//     final budgets = service.getActiveBudgets();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Daftar Pemasukan'),
//         backgroundColor: const Color.fromARGB(255, 225, 0, 177),
//         foregroundColor: Colors.white,
//       ),
//       body:
//           budgets.isEmpty
//               ? const Center(
//                 child: Text(
//                   'Belum ada budget.\nTambah sekarang!',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 18),
//                 ),
//               )
//               : ListView.builder(
//                 padding: const EdgeInsets.all(8),
//                 itemCount: budgets.length,
//                 itemBuilder: (ctx, i) {
//                   final b = budgets[i];
//                   return Card(
//                     elevation: 4,
//                     margin: const EdgeInsets.symmetric(vertical: 6),
//                     child: ListTile(
//                       title: Text(
//                         b.name,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           BudgetProgressBar(
//                             percentage: b.percentage,
//                             amount: b.amount,
//                             spent: b.spent,
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             'Periode: ${b.period.toString().split('.').last}',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: const Color.fromARGB(255, 255, 255, 255),
//                             ),
//                           ),
//                         ],
//                       ),
//                       trailing: Text(
//                         'Rp${b.spent.toStringAsFixed(0)}',
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Get.to(() => const BudgetFormScreen()),
//         backgroundColor: const Color.fromARGB(255, 197, 0, 118),
//         child: const Icon(Icons.add, color: Colors.white),
//       ),
//     );
//   }
// }
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
        title: const Text('Daftar Pemasukan'),
        backgroundColor: const Color.fromARGB(255, 225, 0, 177),
        foregroundColor: Colors.white,
      ),
      body: budgets.isEmpty
          ? const Center(
              child: Text(
                'Belum ada pemasukan.\nTambah sekarang!',
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
                    onTap: () => Get.to(() => BudgetFormScreen(budget: b)), // ✏️ edit
                    title: Text(
                      b.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tanggal: ${b.date.day}/${b.date.month}/${b.date.year}',
                          style: const TextStyle(fontSize: 13),
                        ),
                        Text(
                          'Periode: ${b.period.name.toUpperCase()}',
                          style: const TextStyle(fontSize: 13),
                        ),
                        const SizedBox(height: 4),
                        BudgetProgressBar(
                          percentage: b.percentage,
                          amount: b.amount,
                          spent: b.spent,
                        ),
                      ],
                    ),
                    trailing: Wrap(
                      spacing: 8,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.purple),
                          onPressed: () =>
                              Get.to(() => BudgetFormScreen(budget: b)),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            Get.defaultDialog(
                              title: "Hapus Data?",
                              middleText:
                                  "Yakin ingin menghapus '${b.name}'?",
                              textCancel: "Batal",
                              textConfirm: "Hapus",
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                b.delete();
                                Get.back();
                                Get.snackbar(
                                  'Dihapus',
                                  'Pemasukan berhasil dihapus!',
                                  backgroundColor: Colors.pink.shade50,
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const BudgetFormScreen()),
        backgroundColor: const Color.fromARGB(255, 197, 0, 118),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
