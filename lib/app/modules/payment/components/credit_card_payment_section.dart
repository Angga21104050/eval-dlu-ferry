import 'package:flutter/material.dart';
import '../../orderTicket/controllers/order_ticket_controller.dart';
import '../components/payment_timer.dart';
import '../components/payment_timeout_warning.dart';
import '../components/ticket_detail_payment.dart';
import '../../../constants/text_style.dart';

class CreditCardPaymentSection extends StatelessWidget {
  final OrderTicketController controller;
  final List<Map<String, dynamic>> cart;

  const CreditCardPaymentSection({
    super.key,
    required this.controller,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    final selectedCard = controller.selectedCreditCardMethod.value;
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
                    controller.getImagePathForMethod(selectedCard ?? ''),
                    height: 34,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image_not_supported,
                        size: 56,
                        color: Color.fromARGB(255, 158, 37, 29),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              Text(
                'ID Tagihan',
                style: medium.copyWith(fontSize: 12, color: Color(0xFFB3B3B3)),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 4),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFD0CBCB), width: 1),
                  ),
                ),
                child: Text(
                  'V23435235564', // Ganti dengan data dinamis jika perlu
                  style: semiBold.copyWith(fontSize: 22),
                ),
              ),
              const SizedBox(height: 8),
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
              const SizedBox(height: 8),
              //buatkan form kartu krdeit disini
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FB), // Warna latar biru muda
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nomor Kartu', style: bold.copyWith(fontSize: 14)),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFF0064D2), // Warna saat fokus
                            width: 2, // Ketebalan border saat fokus
                          ),
                        ),
                        hintText: '0000 0000 0000 0000',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFF0064D2), // Warna saat fokus
                            width: 2, // Ketebalan border saat fokus
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Masa Berlaku',
                                style: bold.copyWith(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'MM/YY',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(
                                        0xFF0064D2,
                                      ), // Warna saat fokus
                                      width: 2, // Ketebalan border saat fokus
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(
                                        0xFF0064D2,
                                      ), // Warna saat fokus
                                      width: 2, // Ketebalan border saat fokus
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 12,
                                  ),
                                ),
                                keyboardType: TextInputType.datetime,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('CVV', style: bold.copyWith(fontSize: 14)),
                              const SizedBox(height: 8),
                              TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(
                                        0xFF0064D2,
                                      ), // Warna saat fokus
                                      width: 2, // Ketebalan border saat fokus
                                    ),
                                  ),
                                  hintText: 'Contoh 123',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 12,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                obscureText: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Tiket akan terbit secara otomatis saat sistem sudah menerima pembayaran dari Anda. Anda dapat melihat kembali info ini ke pada menu Cek Boking',
                style: regular.copyWith(fontSize: 12, color: Color(0xFF9D9D9D)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
