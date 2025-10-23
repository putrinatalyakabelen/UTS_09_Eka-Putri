// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/login_screen.dart';
import 'models/budget.dart';
import 'services/budget_service.dart';
import 'services/bill_service.dart';           
import 'services/notification_service.dart';  

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // INIT HIVE
  await Hive.initFlutter();
  Hive.registerAdapter(BudgetAdapter());
  Hive.registerAdapter(BudgetPeriodAdapter());

  // OPEN BOX
  await Hive.openBox<Budget>('budgets');

  // INIT SERVICE
  Get.put(BudgetService());
  Get.put(BillService());           
  // Get.put(NotificationService());   

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Expense Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 231, 0, 204)),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}