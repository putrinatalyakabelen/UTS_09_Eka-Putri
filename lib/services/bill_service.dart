// lib/services/bill_service.dart
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/bill.dart';

class BillService extends GetxService {
  late Box<Bill> _box;

  @override
  Future<void> onInit() async {
    super.onInit();
    _box = await Hive.openBox<Bill>('bills');
  }

  // TAMBAH METHOD INI
  List<Bill> getAllBills() => _box.values.toList()
    ..sort((a, b) => a.dueDate.compareTo(b.dueDate));

  // TAMBAH METHOD INI
  Future<void> addBill(Bill bill) async {
    await _box.put(bill.id, bill);
  }

  // TAMBAH METHOD INI
  Future<void> markAsPaid(String id) async {
    final bill = _box.get(id);
    if (bill != null) {
      bill.isPaid = true;
      await bill.save();
    }
  }
}