import 'package:dlu_project/app/modules/register/components/gender_selection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';
import '../../../constants/text_style.dart';

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
                    'Buat Akun & Mulai Petualanganmu!',
                    style: medium.copyWith(fontSize: 18),
                  ),
                  Text(
                    'Dapatkan akses mudah untuk memesan tiket dan perjalanan favorit anda.',
                    style: regular.copyWith(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),

                  // Form Input Email / No. Telp
                  Text(
                    'Email (Sebagai Username)',
                    style: medium.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
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
                  const SizedBox(height: 16),
                  Text(
                    'Nomor Identitas (KTP/SIM/PASSPORT)',
                    style: medium.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Masukan Nomor Identitas',
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
                  const SizedBox(height: 16),
                  Text('Nama Lengkap', style: medium.copyWith(fontSize: 14)),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Masukan Nama Lengkap',
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
                  const SizedBox(height: 16),
                  GenderSelection(controller: controller),
                  const SizedBox(height: 16),
                  Text('Alamat', style: medium.copyWith(fontSize: 14)),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Masukkan Alamat anda',
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
                  const SizedBox(height: 16),
                  Text('Kota Asal', style: medium.copyWith(fontSize: 14)),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Masukan Kota Asal Anda',
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
                  const SizedBox(height: 16),
                  Text('No. Telepon', style: medium.copyWith(fontSize: 14)),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Masukan No. Telepon Anda',
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
                  const SizedBox(height: 16),
                  // Form Input Password
                  Text('Password', style: medium.copyWith(fontSize: 14)),
                  const SizedBox(height: 8),
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
                  const SizedBox(height: 16),
                  // Form Input Password
                  Text(
                    'Verifikasi Password',
                    style: medium.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
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
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        // Menggunakan Expanded agar teks mengisi sisa ruang
                        child: Text(
                          'Dengan menyetujui syarat dan ketentuan, Anda memasuki kontrak yang mengikat secara hukum dengan penyedia layanan.',
                          style: light.copyWith(
                            fontSize: 12,
                            color: Colors.grey,
                          ), // Sesuaikan style teks
                        ),
                      ),
                      Checkbox(
                        onChanged: (bool? newValue) {},
                        value: true,
                        activeColor: const Color(0xFF0064D2),
                      ),
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
                      child: Text(
                        'Buat Akun',
                        style: semiBold.copyWith(
                          fontSize: 16,
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
