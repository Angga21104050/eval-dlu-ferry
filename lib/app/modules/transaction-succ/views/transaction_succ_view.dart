import 'package:dlu_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/text_style.dart';

import '../controllers/transaction_succ_controller.dart';

class TransactionSuccView extends GetView<TransactionSuccController> {
  const TransactionSuccView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(color: Color(0xFF0064D2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Checkmark Circle
            SizedBox(
              width: 200, // Lebar area gambar
              height: 200, // Tinggi area gambar
              child: Center(
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                    begin: 0.5,
                    end: 1.0,
                  ), // Animasi skala dari 0.5 ke 1.0
                  duration: const Duration(milliseconds: 300), // Durasi animasi
                  builder: (BuildContext context, double scale, Widget? child) {
                    return Transform.scale(scale: scale, child: child);
                  },
                  child: Image.asset(
                    'assets/img/success-check.png', // Ganti dengan jalur gambar sukses Anda
                    width: 200, // Sesuaikan lebar gambar
                    height: 200, // Sesuaikan tinggi gambar
                    fit:
                        BoxFit
                            .contain, // Cara gambar menyesuaikan diri dalam area
                    errorBuilder: (context, error, stackTrace) {
                      // Opsional: Widget yang ditampilkan jika gambar gagal dimuat
                      return const Icon(
                        Icons.error_outline,
                        size: 80,
                        color: Colors.red,
                      );
                    },
                  ),
                ),
              ),
            ),

            // Confirmation Text
            Text(
              'Pesanan dikonfirmasi',
              style: semiBold.copyWith(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),

            // Thank You and Email Info Text
            Text(
              'Terima kasih atas pesanan Anda. Anda akan segera menerima konfirmasi melalui email.',
              style: light.copyWith(fontSize: 16, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Lihat Tiket Button
            SizedBox(
              width: 260,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(Routes.MY_TICKET_DETAIL);
                  print('Lihat Tiket button pressed');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Lihat Tiket',
                  style: semiBold.copyWith(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
