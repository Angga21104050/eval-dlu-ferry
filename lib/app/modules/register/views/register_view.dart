import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
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
                    'Buat Akun & Mulai Petualanganmu!',
                    style: TextStyle(
                      fontSize: 20,
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
                    'Dapatkan akses mudah untuk memesan tiket dan perjalanan favorit anda.',
                    style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Nama Lengkap',
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
                      hintText: 'Masukan nama lengkap anda',
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
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
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
                  const SizedBox(height: 36),
                  Row(
                    children: [
                      const Expanded(
                        // Menggunakan Expanded agar teks mengisi sisa ruang
                        child: Text(
                          'Dengan menyetujui syarat dan ketentuan, Anda memasuki kontrak yang mengikat secara hukum dengan penyedia layanan.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ), // Sesuaikan style teks
                        ),
                      ),
                      Checkbox(onChanged: (bool? newValue) {}, value: true),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Lupa Password
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika login di sini
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
                      child: const Text(
                        'Buat Akun',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
