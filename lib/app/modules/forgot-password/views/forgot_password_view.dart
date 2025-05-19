import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/forgot_password_controller.dart';
import '../../../constants/text_style.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
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
              height: 510,
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
                  Text('Ganti Password', style: medium.copyWith(fontSize: 18)),
                  Text(
                    'Masukkan alamat email Anda untuk mengatur ulang kata sandi.',
                    style: regular.copyWith(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  // Form Input Email / No. Telp
                  Text('Email', style: medium.copyWith(fontSize: 14)),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Masukkan Email Anda',
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
                  const SizedBox(height: 4),
                  Text(
                    'Kode verifikasi akan dikirim ke email Anda.',
                    style: regular.copyWith(fontSize: 14, color: Colors.grey),
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
                        backgroundColor: const Color(
                          0xFF0064D2,
                        ), // Sesuaikan warna tombol
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Reset Password',
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
