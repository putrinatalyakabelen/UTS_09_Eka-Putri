// // lib/screens/register_screen.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'home_screen.dart';

// class RegisterScreen extends StatelessWidget {
//   const RegisterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Controller untuk form
//     final nameCtrl = TextEditingController();
//     final emailCtrl = TextEditingController();
//     final usernameCtrl = TextEditingController();
//     final passwordCtrl = TextEditingController();
//     final confirmCtrl = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Daftar'),
//         backgroundColor: Colors.blue,
//         foregroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Logo
//               Container(
//                 width: 100,
//                 height: 100,
//                 decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
//                 child: const Icon(Icons.person_add, size: 50, color: Colors.white),
//               ),
//               const SizedBox(height: 32),

//               // Form
//               _buildTextField(nameCtrl, 'Nama Lengkap', Icons.person),
//               const SizedBox(height: 16),
//               _buildTextField(emailCtrl, 'Email', Icons.email),
//               const SizedBox(height: 16),
//               _buildTextField(usernameCtrl, 'Username', Icons.account_circle),
//               const SizedBox(height: 16),
//               _buildTextField(passwordCtrl, 'Password', Icons.lock, obscure: true),
//               const SizedBox(height: 16),
//               _buildTextField(confirmCtrl, 'Konfirmasi Password', Icons.lock_outline, obscure: true),
//               const SizedBox(height: 24),

//               // Tombol Daftar
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (passwordCtrl.text != confirmCtrl.text) {
//                       Get.snackbar('Error', 'Password tidak cocok!');
//                       return;
//                     }
//                     if ([nameCtrl, emailCtrl, usernameCtrl, passwordCtrl].any((c) => c.text.isEmpty)) {
//                       Get.snackbar('Error', 'Isi semua field!');
//                       return;
//                     }
//                     // DAFTAR SUKSES → KE HOME
//                     Get.offAll(() => const HomeScreen());
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                   ),
//                   child: const Text('DAFTAR', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Ke Login
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Sudah punya akun? "),
//                   TextButton(onPressed: () => Get.back(), child: const Text('Masuk')),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(TextEditingController ctrl, String label, IconData icon, {bool obscure = false}) {
//     return TextField(
//       controller: ctrl,
//       obscureText: obscure,
//       decoration: InputDecoration(
//         labelText: label,
//         border: const OutlineInputBorder(),
//         prefixIcon: Icon(icon),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final usernameCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();
    final confirmCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFFFE6F0),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 700),
            opacity: 1.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOutBack,
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF0099), Color(0xFFE100FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.shade200,
                        blurRadius: 12,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.person_add,
                      size: 60, color: Colors.white),
                ),
                const SizedBox(height: 28),

                AnimatedSlide(
                  offset: const Offset(0, 0.2),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOut,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Column(
                        children: [
                          const Text(
                            'Buat Akun Baru ✨',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE100FF),
                            ),
                          ),
                          const SizedBox(height: 20),

                          _buildTextField(nameCtrl, 'Nama Lengkap', Icons.person),
                          const SizedBox(height: 14),
                          _buildTextField(emailCtrl, 'Email', Icons.email),
                          const SizedBox(height: 14),
                          _buildTextField(usernameCtrl, 'Username', Icons.account_circle),
                          const SizedBox(height: 14),
                          _buildTextField(passwordCtrl, 'Password', Icons.lock, obscure: true),
                          const SizedBox(height: 14),
                          _buildTextField(confirmCtrl, 'Konfirmasi Password', Icons.lock_outline, obscure: true),
                          const SizedBox(height: 24),

                          SizedBox(
                            width: double.infinity,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: const LinearGradient(
                                  colors: [Color(0xFFFF0099), Color(0xFFE100FF)],
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (passwordCtrl.text != confirmCtrl.text) {
                                    Get.snackbar('Error', 'Password tidak cocok!',
                                        backgroundColor: Colors.pink.shade100);
                                    return;
                                  }
                                  if ([nameCtrl, emailCtrl, usernameCtrl, passwordCtrl]
                                      .any((c) => c.text.isEmpty)) {
                                    Get.snackbar('Error', 'Isi semua field!',
                                        backgroundColor: Colors.pink.shade100);
                                    return;
                                  }
                                  Get.offAll(() => const HomeScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                                child: const Text(
                                  'DAFTAR',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah punya akun? "),
                    TextButton(
                      onPressed: () {
                        Get.off(
                          () => const LoginScreen(),
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                          color: Color(0xFFE100FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController ctrl, String label, IconData icon,
      {bool obscure = false}) {
    return TextField(
      controller: ctrl,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFFE100FF)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
              const BorderSide(color: Color(0xFFE100FF), width: 2.0),
        ),
      ),
    );
  }
}
