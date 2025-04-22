import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

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
                  const SizedBox(height: 20), // Ruang kosong di atas judul
                  const Text(
                    'Ayo Mulai Petualanganmu!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(
                        255,
                        0,
                        0,
                        0,
                      ), // Sesuaikan warna teks
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Login dan temukan tiket terbaik untuk perjalanan anda.',
                    style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                  ),
                  const SizedBox(height: 16),
                  // Form Input Email / No. Telp
                  const Text(
                    'Email / No. Telp',
                    style: TextStyle(
                      color: Color.fromARGB(
                        255,
                        0,
                        0,
                        0,
                      ), // Sesuaikan warna teks
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Masukkan Email atau No. Telp anda',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Form Input Password
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: Color.fromARGB(
                        255,
                        0,
                        0,
                        0,
                      ), // Sesuaikan warna teks
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Masukkan kata sandi anda',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(),
                      ),
                      suffixIcon: const Icon(Icons.visibility_off), // Ikon mata
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Lupa Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Tambahkan logika lupa password di sini
                        print('Lupa password ditekan');
                      },
                      child: const Text(
                        'Lupa password?',
                        style: TextStyle(color: Colors.red), // Sesuaikan warna
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Tombol Lanjutkan
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika login di sini
                        print('Tombol Lanjutkan ditekan');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Sesuaikan warna tombol
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Lanjutkan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Atau
                  Row(
                    children: [
                      const Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Atau',
                          style: TextStyle(
                            color: const Color.fromARGB(179, 0, 0, 0),
                          ),
                        ),
                      ),
                      const Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16),
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
                        style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Daftar',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
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
