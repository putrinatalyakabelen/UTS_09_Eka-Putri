// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemrograman_mobile/screens/profil_screen.dart';
import 'budget/budget_list_screen.dart';
import 'bill/bill_calender_screen.dart';
import 'profil_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color.fromARGB(255, 227, 0, 159),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              // LOGOUT: kembali ke Login
              Get.offAll(() => const LoginScreen());
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 242, 0, 177),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Color.fromARGB(255, 233, 0, 186),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome User!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Pemasukkan'),
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const BudgetListScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Tagihan keluar/masuk'),
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const BillCalenderScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ProfileScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Get.offAll(() => const LoginScreen());
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(200, 255, 0, 140),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildDashboardCard(
                    title: 'Pemasukkan',
                    icon: Icons.attach_money,
                    color: const Color.fromARGB(255, 166, 0, 185),
                    onTap: () => Get.to(() => const BudgetListScreen()),
                  ),
                  _buildDashboardCard(
                    title: 'Tagihan',
                    icon: Icons.calendar_month,
                    color: const Color.fromARGB(220, 193, 8, 159),
                    onTap: () => Get.to(() => const BillCalenderScreen()),
                  ),
                  _buildDashboardCard(
                    title: 'Profile',
                    icon: Icons.person,
                    color: const Color.fromARGB(255, 255, 0, 183),
                    onTap: () => Get.to(() => const ProfileScreen()),
                  ),
                  _buildDashboardCard(
                    title: 'Settings',
                    icon: Icons.settings,
                    color: const Color.fromARGB(255, 217, 4, 150),
                    onTap: () {
                      Get.snackbar('Info', 'Fitur Settings segera hadir!');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // CARD DENGAN NAVIGASI
  Widget _buildDashboardCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
