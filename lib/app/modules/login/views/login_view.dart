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
                    'Ayo Mulai Petualanganmu!',
                    style: medium.copyWith(fontSize: 20),
                  ),
                  Text(
                    'Login dan temukan tiket terbaik untuk perjalanan anda.',
                    style: regular.copyWith(
                      fontSize: 14,
                      color: const Color(0xFF989898),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Form Input Email / No. Telp
                  Text(
                    'Email / No. Telp',
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
                          borderRadius: BorderRadius.circular(10.0),
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
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFD9D9D9),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility_off,
                        ), // Ikon mata
                      ),
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
                    height: 46,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offNamed('/home');
                        print('Tombol Lanjutkan ditekan');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0064D2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Lanjutkan',
                          style: semiBold.copyWith(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Atau
                  Row(
                    children: [
                      const Expanded(child: Divider(color: Color(0xFFD0CBCB))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Atau',
                          style: light.copyWith(color: Color(0xFFD0CBCB)),
                        ),
                      ),
                      const Expanded(child: Divider(color: Color(0xFFD0CBCB))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          print('Login dengan Google');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset(
                            'assets/img/google-icon.png',
                            height: 44,
                            width: 44,
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
                        style: regular.copyWith(
                          fontSize: 14,
                          color: const Color(0xFFD0CBCB),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/register');
                        },
                        child: Text(
                          'Daftar',
                          style: semiBold.copyWith(
                            fontSize: 14,
                            color: Color(0xFF0064D2),
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
