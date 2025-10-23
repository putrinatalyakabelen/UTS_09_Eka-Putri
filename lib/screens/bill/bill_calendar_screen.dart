// lib/screens/bill/bill_calendar_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../services/bill_service.dart';
import '../../services/notification_service.dart';
import 'bill_form_screen.dart';

class BillCalendarScreen extends StatelessWidget {
  const BillCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final billService = Get.find<BillService>();
    final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    final dateFormat = DateFormat('dd MMM yyyy', 'id_ID');

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Tagihan Kelas',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () => Get.to(() => const BillFormScreen()),
            tooltip: 'Tambah Tagihan',
          ),
        ],
      ),
      body: Obx(() {
        final bills = billService.getAllBills();
        if (bills.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.receipt_long, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'Belum ada tagihan',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                Text(
                  'Tekan + untuk menambah',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: bills.length,
          itemBuilder: (context, index) {
            final bill = bills[index];
            final isDueSoon = bill.dueDate.difference(DateTime.now()).inDays <= 3 && !bill.isPaid;

            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: bill.isPaid ? Colors.green[100] : Colors.teal[100],
                  child: Icon(
                    bill.isPaid ? Icons.check_circle : Icons.pending,
                    color: bill.isPaid ? Colors.green : Colors.teal,
                  ),
                ),
                title: Text(
                  bill.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Jatuh Tempo: ${dateFormat.format(bill.dueDate)}',
                  style: TextStyle(color: isDueSoon ? Colors.red : Colors.grey[700]),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currencyFormat.format(bill.amount),
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: bill.isPaid ? Colors.green[50] : Colors.orange[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        bill.isPaid ? 'Lunas' : 'Belum',
                        style: TextStyle(
                          fontSize: 12,
                          color: bill.isPaid ? Colors.green : Colors.orange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () async {
                  final confirm = await Get.dialog(
                    AlertDialog(
                      title: Text(bill.name),
                      content: Text(bill.isPaid
                          ? 'Tagihan sudah lunas.'
                          : 'Tandai sebagai lunas?'),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(result: false),
                          child: const Text('Batal'),
                        ),
                        if (!bill.isPaid)
                          TextButton(
                            onPressed: () => Get.back(result: true),
                            child: const Text('Lunas', style: TextStyle(color: Colors.green)),
                          ),
                      ],
                    ),
                  );

                  if (confirm == true) {
                    await billService.markAsPaid(bill.id);
                    Get.snackbar('Sukses', '${bill.name} ditandai lunas!');

                    // Reschedule jika recurring
                    if (bill.isRecurring) {
                      await Get.find<NotificationService>().scheduleBillReminder(bill);
                    }
                  }
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const BillFormScreen()),
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}