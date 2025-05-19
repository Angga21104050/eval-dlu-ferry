import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../../../constants/text_style.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Widget gambar dengan tinggi 380
          SizedBox(
            height: 380,
            width: double.infinity,
            child: Image.asset('assets/img/bg-login.jpg', fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 350),
            child: Container(
              padding: EdgeInsets.all(24),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 56,
                        height: 56,
                        child: Center(
                          child: Image.asset(
                            'assets/img/logo2.png',
                            width: 120,
                            height: 120,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.error_outline,
                                size: 80,
                                color: Colors.red,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PT. Dharma Lautan Utama',
                            style: bold.copyWith(fontSize: 18),
                          ),
                          Text(
                            'armada pelayaran nasional',
                            style: regular.copyWith(),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Ayo Mulai Petualanganmu!',
                    style: medium.copyWith(fontSize: 18),
                  ),
                  Text(
                    'Login dan temukan tiket terbaik untuk perjalanan anda.',
                    style: regular.copyWith(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  // Form Input Email / No. Telp
                  Text(
                    'Email / No. Telp',
                    style: medium.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Masukkan Email atau No. Telp anda',
                      hintStyle: light.copyWith(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Form Input Password
                  Text('Password', style: medium.copyWith(fontSize: 14)),
                  const SizedBox(height: 4),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Masukkan kata sandi anda',
                      hintStyle: light.copyWith(fontSize: 14),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: const Icon(Icons.visibility_off), // Ikon mata
                    ),
                  ),
                  // Lupa Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Tambahkan logika lupa password di sini
                        Get.toNamed('/forgot-password');
                        print('Lupa password ditekan');
                      },
                      child: Text(
                        'Lupa password?',
                        style: regular.copyWith(
                          color: Colors.red,
                        ), // Sesuaikan warna
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Tombol Lanjutkan
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika login di sini
                        Get.offNamed('/home');
                        print('Tombol Lanjutkan ditekan');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF0064D2,
                        ), // Sesuaikan warna tombol
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Lanjutkan',
                        style: semiBold.copyWith(
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Atau
                  Row(
                    children: [
                      const Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Atau',
                          style: light.copyWith(color: Colors.black),
                        ),
                      ),
                      const Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Login dengan Google dan Facebook
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Tombol Google
                      InkWell(
                        onTap: () {
                          // Tambahkan logika login dengan Google di sini
                          print('Login dengan Google');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset(
                            'assets/img/google-icon.png', // Ganti dengan path gambar ikon Google Anda
                            height: 56,
                            width: 56,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun?',
                        style: light.copyWith(
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/register');
                        },
                        child: Text(
                          'Daftar',
                          style: light.copyWith(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
