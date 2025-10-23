// // lib/screens/bill/bill_form_screen.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../../models/bill.dart';
// import '../../services/bill_service.dart';
// import '../../services/notification_service.dart';

// class BillFormScreen extends StatefulWidget {
//   const BillFormScreen({super.key});

//   @override
//   State<BillFormScreen> createState() => _BillFormScreenState();
// }

// class _BillFormScreenState extends State<BillFormScreen> {
//   final nameCtrl = TextEditingController();
//   final amountCtrl = TextEditingController();
//   DateTime dueDate = DateTime.now();
//   bool isRecurring = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tambah Tagihan'),
//         backgroundColor: Colors.teal,
//         foregroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameCtrl,
//               decoration: const InputDecoration(
//                 labelText: 'Nama Tagihan',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.description),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: amountCtrl,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: 'Jumlah (Rp)',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.attach_money),
//               ),
//             ),
//             const SizedBox(height: 16),
//             ListTile(
//               leading: const Icon(Icons.calendar_today),
//               title: Text('Jatuh Tempo: ${DateFormat('dd MMM yyyy').format(dueDate)}'),
//               trailing: const Icon(Icons.edit_calendar),
//               onTap: () async {
//                 final picked = await showDatePicker(
//                   context: context,
//                   initialDate: dueDate,
//                   firstDate: DateTime.now(),
//                   lastDate: DateTime.now().add(const Duration(days: 365)),
//                 );
//                 if (picked != null) {
//                   setState(() => dueDate = picked);
//                 }
//               },
//             ),
//             SwitchListTile(
//               title: const Text('Tagihan Berulang (Bulanan)'),
//               value: isRecurring,
//               onChanged: (val) => setState(() => isRecurring = val),
//             ),
//             const SizedBox(height: 24),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   if (nameCtrl.text.isEmpty || amountCtrl.text.isEmpty) {
//                     Get.snackbar('Error', 'Isi semua field!', backgroundColor: Colors.red);
//                     return;
//                   }

//                   final amount = double.tryParse(amountCtrl.text) ?? 0;
//                   if (amount <= 0) {
//                     Get.snackbar('Error', 'Jumlah harus lebih dari 0!', backgroundColor: Colors.red);
//                     return;
//                   }

//                   final bill = Bill(
//                     id: DateTime.now().millisecondsSinceEpoch.toString(),
//                     name: nameCtrl.text,
//                     amount: amount,
//                     dueDate: dueDate,
//                     isRecurring: isRecurring,
//                     dayOfMonth: isRecurring ? dueDate.day : null,
//                   );

//                   await Get.find<BillService>().addBill(bill);

//                   if (isRecurring) {
//                     await Get.find<NotificationService>().scheduleBillReminder(bill);
//                   }

//                   Get.back();
//                   Get.snackbar('Sukses', 'Tagihan "${bill.name}" ditambahkan!', backgroundColor: Colors.green);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.teal,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                 ),
//                 child: const Text('SIMPAN', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../models/bill.dart';
import '../../services/bill_service.dart';
import '../../services/notification_service.dart';

class BillFormScreen extends StatefulWidget {
  const BillFormScreen({super.key});

  @override
  State<BillFormScreen> createState() => _BillFormScreenState();
}

class _BillFormScreenState extends State<BillFormScreen> {
  final nameCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  DateTime dueDate = DateTime.now();
  bool isRecurring = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Tagihan'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Nama Tagihan',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: amountCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jumlah (Rp)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text('Jatuh Tempo: ${DateFormat('dd MMM yyyy').format(dueDate)}'),
              trailing: const Icon(Icons.edit_calendar),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: dueDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() => dueDate = picked);
                }
              },
            ),
            SwitchListTile(
              title: const Text('Tagihan Berulang (Bulanan)'),
              value: isRecurring,
              onChanged: (val) => setState(() => isRecurring = val),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (nameCtrl.text.isEmpty || amountCtrl.text.isEmpty) {
                    Get.snackbar('Error', 'Isi semua field!', backgroundColor: Colors.red);
                    return;
                  }

                  final amount = double.tryParse(amountCtrl.text) ?? 0;
                  if (amount <= 0) {
                    Get.snackbar('Error', 'Jumlah harus lebih dari 0!', backgroundColor: Colors.red);
                    return;
                  }

                  final bill = Bill(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    name: nameCtrl.text,
                    amount: amount,
                    dueDate: dueDate,
                    isRecurring: isRecurring,
                    dayOfMonth: isRecurring ? dueDate.day : null,
                  );

                  await Get.find<BillService>().addBill(bill);

                  if (isRecurring) {
                    await Get.find<NotificationService>().scheduleBillReminder(bill);
                  }

                  Get.back();
                  Get.snackbar('Sukses', 'Tagihan "${bill.name}" ditambahkan!', backgroundColor: Colors.green);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'SIMPAN',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
