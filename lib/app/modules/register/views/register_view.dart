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
            height: 412,
            width: double.infinity,
            child: Image.asset('assets/img/bg-login.jpg', fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 313),
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
                        child: Center(
                          child: Image.asset(
                            'assets/img/logo2.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.error_outline,
                                size: 60,
                                color: Colors.red,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PT. Dharma Lautan Utama',
                            style: semiBold.copyWith(fontSize: 20),
                          ),
                          Text(
                            'armada pelayaran nasional',
                            style: regular.copyWith(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Buat Akun & Mulai Petualanganmu!',
                    style: medium.copyWith(fontSize: 18),
                  ),
                  Text(
                    'Dapatkan akses mudah untuk memesan tiket dan perjalanan favorit anda.',
                    style: regular.copyWith(
                      fontSize: 14,
                      color: const Color(0xFF989898),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Form Input Email / No. Telp
                  Text(
                    'Email (Sebagai Username)',
                    style: medium.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 43,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukkan Email atau No. Telp anda',
                        hintStyle: light.copyWith(fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFD9D9D9),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),
                  // Form Input Password
                  Text('Password', style: medium.copyWith(fontSize: 14)),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 43,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Masukkan kata sandi anda',
                        hintStyle: light.copyWith(fontSize: 14),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFD9D9D9),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility_off,
                        ), // Ikon mata
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Form Input Password
                  Text(
                    'Verifikasi Password',
                    style: medium.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 43,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Masukkan kata sandi anda',
                        hintStyle: light.copyWith(fontSize: 14),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFD9D9D9),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility_off,
                        ), // Ikon mata
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Checkbox(
                            onChanged: (bool? newValue) {},
                            value: true,
                            activeColor: const Color(0xFF0064D2),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                      Expanded(
                        // Menggunakan Expanded agar teks mengisi sisa ruang
                        child: Text(
                          'Dengan menyetujui syarat dan ketentuan, Anda memasuki kontrak yang mengikat secara hukum dengan penyedia layanan.',
                          style: regular.copyWith(
                            fontSize: 10,
                            color: const Color(0xFFD0CBCB),
                          ), // Sesuaikan style teks
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Lupa Password
                  SizedBox(
                    height: 47,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/register-2');
                        // Tambahkan logika login di sini
                        print('Tombol Lanjutkan ditekan');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0064D2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
