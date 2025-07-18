import 'package:flutter/material.dart';
import '../../orderTicket/controllers/order_ticket_controller.dart';
import '../components/payment_timer.dart';
import 'payment_timeout_warning.dart';
import '../components/ticket_detail_payment.dart';
import '../../../constants/text_style.dart';

class QrisPaymentSection extends StatelessWidget {
  final OrderTicketController controller;
  final List<Map<String, dynamic>> cart;

  const QrisPaymentSection({
    super.key,
    required this.controller,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    final selectedQris = controller.selectedQrisMethod.value;
    return Column(
      children: [
        const PaymentTimer(),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(
                  0xFF0064D2,
                ).withOpacity(0.35), // Warna shadow dengan sedikit transparansi
                blurRadius: 6, // Tingkat keburaman shadow
                offset: const Offset(
                  0,
                  4,
                ), // Offset shadow (horizontal, vertical)
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kami telah menerima pesanan Anda. Untuk melanjutkan mohon lakukan transfer ke rekening virtual account berikut ini.',
                style: regular.copyWith(fontSize: 12, color: Color(0xFF9D9D9D)),
              ),
              const PaymentTimeoutWarning(),
              Row(
                children: [
                  Image.asset(
                    controller.getImagePathForMethod(selectedQris ?? ''),
                    width: 56,
                    height: 56,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image_not_supported,
                        size: 56,
                        color: Color.fromARGB(255, 158, 37, 29),
                      );
                    },
                  ),
                ],
              ),
              TicketDetailPayment(cart: cart),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AIRLANGGA MAULANA ANWAR',
                          style: bold.copyWith(fontSize: 16),
                        ),
                        Text(
                          'NIK-330056235345',
                          style: light.copyWith(
                            fontSize: 14,
                            color: Color(0xFF0064D2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(
                  0xFF0064D2,
                ).withOpacity(0.35), 
                blurRadius: 6,
                offset: const Offset(
                  0,
                  4,
                ), 
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/img/qris-logo.png', height: 40),
              const SizedBox(height: 12),
              Container(
                height: 320,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'QR Code',
                    style: light.copyWith(color: Colors.black54),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text('NIMD: ID200302030403', style: bold.copyWith(fontSize: 14)),
              const SizedBox(height: 12),
              const Divider(thickness: 0.7, color: Colors.grey),
              Text(
                'Tiket akan terbit secara otomatis saat sistem\nsudah menerima pembayaran dari Anda. Anda\ndapat melihat kembali info ini ke pada menu Cek\nBoking',
                textAlign: TextAlign.justify,
                style: regular.copyWith(fontSize: 12, color: Colors.black45),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
