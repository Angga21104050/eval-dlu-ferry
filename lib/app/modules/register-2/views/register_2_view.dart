import 'package:dlu_project/app/modules/register/components/gender_selection.dart';
import 'package:dlu_project/app/modules/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_2_controller.dart';
import '../../../constants/text_style.dart';

class Register2View extends GetView<Register2Controller> {
  const Register2View({super.key});
  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterController());

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
                    'Isi Data Akun Baru Anda!',
                    style: medium.copyWith(fontSize: 20),
                  ),
                  Text(
                    'Dapatkan akses mudah untuk memesan tiket dan perjalanan favorit anda.',
                    style: regular.copyWith(
                      fontSize: 14,
                      color: const Color(0xFF989898),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Nama Lengkap', style: medium.copyWith(fontSize: 14)),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 43,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukan Nama Lengkap',
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
                  Text(
                    'Nomor Identitas (KTP/SIM/PASSPORT)',
                    style: medium.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 43,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukan Nomor Identitas',
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
                  Text('Jenis kelamin', style: medium.copyWith(fontSize: 14)),
                  const SizedBox(height: 4),
                  GenderSelection(controller: registerController),
                  const SizedBox(height: 8),
                  Text('Alamat', style: medium.copyWith(fontSize: 14)),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 43,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukkan Alamat anda',
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
                  Text('Kota Asal', style: medium.copyWith(fontSize: 14)),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 43,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukan Kota Asal Anda',
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
                  Text('No. Ponsel', style: medium.copyWith(fontSize: 14)),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 43,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukan No. Telepon Anda',
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

                  const SizedBox(height: 20),

                  // Lupa Password
                  SizedBox(
                    height: 47,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/home');
                        // Tambahkan logika login di sini
                        print('Tombol Lanjutkan ditekan');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF0064D2,
                        ), // Sesuaikan warna tombol
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Buat Akun',
                        style: semiBold.copyWith(
                          fontSize: 18,
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
