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
            SizedBox(
              width: 200, 
              height: 200,
              child: Center(
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                    begin: 0.5,
                    end: 1.0,
                  ), 
                  duration: const Duration(milliseconds: 300), // Durasi animasi
                  builder: (BuildContext context, double scale, Widget? child) {
                    return Transform.scale(scale: scale, child: child);
                  },
                  child: Image.asset(
                    'assets/img/success-check.png', 
                    width: 200, 
                    height: 200, 
                    fit:
                        BoxFit
                            .contain, 
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
            ),

            // Confirmation Text
            Text(
              'Pesanan dikonfirmasi',
              style: semiBold.copyWith(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),

            Text(
              'Terima kasih atas pesanan Anda. Anda akan segera menerima konfirmasi melalui email.',
              style: medium.copyWith(
                fontSize: 16,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            SizedBox(
              width: 320,
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
                  style: medium.copyWith(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
