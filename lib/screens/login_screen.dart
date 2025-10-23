// // lib/screens/login_screen.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'home_screen.dart';
// import 'register_screen.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final usernameCtrl = TextEditingController();
//     final passwordCtrl = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Masuk'),
//         backgroundColor: const Color.fromARGB(255, 243, 33, 145),
//         foregroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Logo
//             Container(
//               width: 100,
//               height: 100,
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 250, 15, 148),
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(Icons.person, size: 50, color: Colors.white),
//             ),
//             const SizedBox(height: 32),

//             // Username
//             TextField(
//               controller: usernameCtrl,
//               decoration: const InputDecoration(
//                 labelText: 'Username',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.person),
//               ),
//             ),
//             const SizedBox(height: 16),

//             // Password
//             TextField(
//               controller: passwordCtrl,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//             const SizedBox(height: 24),

//             // Tombol Login
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // VALIDASI SEDERHANA
//                   if (usernameCtrl.text.isEmpty || passwordCtrl.text.isEmpty) {
//                     Get.snackbar('Error', 'Isi username dan password!');
//                     return;
//                   }

//                   // LOGIN SUKSES → KE HOME
//                   Get.offAll(() => const HomeScreen());
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(208, 255, 0, 191),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                 ),
//                 child: const Text(
//                   'MASUK',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),

//             // Ke Register
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Belum punya akun? "),
//                 TextButton(
//                   onPressed: () => Get.to(() => const RegisterScreen()),
//                   child: const Text('Daftar'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFFFE6F0),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 800),
            opacity: 1.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo animasi
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
                  child: const Icon(Icons.person, size: 60, color: Colors.white),
                ),
                const SizedBox(height: 28),

                // Card form login
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
                            'Selamat Datang 👋',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE100FF),
                            ),
                          ),
                          const SizedBox(height: 20),

                          TextField(
                            controller: usernameCtrl,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              prefixIcon: const Icon(Icons.person,
                                  color: Color(0xFFE100FF)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          const SizedBox(height: 16),

                          TextField(
                            controller: passwordCtrl,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock,
                                  color: Color(0xFFE100FF)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Tombol login gradient
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
                                  if (usernameCtrl.text.isEmpty ||
                                      passwordCtrl.text.isEmpty) {
                                    Get.snackbar('Error',
                                        'Isi username dan password!',
                                        backgroundColor: Colors.pink.shade100);
                                    return;
                                  }
                                  Get.offAll(() => const HomeScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                ),
                                child: const Text(
                                  'MASUK',
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
                    const Text("Belum punya akun? "),
                    TextButton(
                      onPressed: () {
                        Get.to(
                          () => const RegisterScreen(),
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: const Text(
                        'Daftar Sekarang',
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
}
