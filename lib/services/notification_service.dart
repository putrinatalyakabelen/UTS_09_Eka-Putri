// lib/services/notification_service.dart
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../models/bill.dart';
import 'bill_service.dart';

class NotificationService extends GetxService {
  final FlutterLocalNotificationsPlugin plugin;

  NotificationService(this.plugin);

  @override
  Future<void> onInit() async {
    super.onInit();
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.local);
  }

  // TAMBAH METHOD INI
  Future<void> scheduleBillReminder(Bill bill) async {
    if (bill.isPaid || !bill.isRecurring || bill.dayOfMonth == null) return;

    final now = DateTime.now();
    var nextDue = DateTime(now.year, now.month, bill.dayOfMonth!);
    if (nextDue.isBefore(now)) {
      nextDue = DateTime(now.year, now.month + 1, bill.dayOfMonth!);
    }

    final remindAt = nextDue.subtract(const Duration(days: 1)).copyWith(hour: 8, minute: 0);
    if (remindAt.isBefore(now)) return;

    final tzRemindAt = tz.TZDateTime.from(remindAt, tz.local);

    await plugin.zonedSchedule(
      bill.id.hashCode,
      'Tagihan: ${bill.name}',
      'Jatuh tempo besok: Rp${bill.amount.toStringAsFixed(0)}',
      tzRemindAt,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'bill_channel', 'Pengingat Tagihan',
          channelDescription: 'Notifikasi pengingat tagihan bulanan',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> rescheduleAllRecurringBills() async {
    final bills = Get.find<BillService>().getAllBills().where((b) => b.isRecurring);
    for (final bill in bills) {
      await scheduleBillReminder(bill);
    }
  }
}