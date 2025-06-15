import 'package:flutter/material.dart';
import '../../orderTicket/controllers/order_ticket_controller.dart';
import '../components/payment_timer.dart';
import 'payment_timeout_warning.dart';
import '../components/ticket_detail_payment.dart';
import '../../../constants/text_style.dart';

class VirtualAccountPaymentSection extends StatefulWidget {
  final OrderTicketController controller;
  final List<Map<String, dynamic>> cart;

  const VirtualAccountPaymentSection({
    super.key,
    required this.controller,
    required this.cart,
  });

  @override
  State<VirtualAccountPaymentSection> createState() =>
      _VirtualAccountPaymentSectionState();
}

class _VirtualAccountPaymentSectionState
    extends State<VirtualAccountPaymentSection> {
  bool _isExpandedInstructions = false;

  @override
  Widget build(BuildContext context) {
    final selectedVA = widget.controller.selectedVirtualAccMethod.value;
    return Column(
      children: [
        const PaymentTimer(),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
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
              SizedBox(height: 4),
              Row(
                children: [
                  Image.asset(
                    widget.controller.getImagePathForMethod(selectedVA ?? ''),
                    height: 27,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image_not_supported,
                        size: 27,
                        color: Color.fromARGB(255, 158, 37, 29),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 8),
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
                  'S23435235564', // Ganti dengan data dinamis jika perlu
                  style: semiBold.copyWith(fontSize: 22),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'No. Rekening VA',
                style: medium.copyWith(fontSize: 12, color: Color(0xFFB3B3B3)),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 4),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFD0CBCB), width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1215375012870', // Ganti dengan data dinamis jika perlu
                      style: semiBold.copyWith(fontSize: 22),
                    ),
                    const Icon(
                      Icons.bookmarks_rounded,
                      color: Color(0xFF0064D2),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),
              TicketDetailPayment(cart: widget.cart),
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
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
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
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpandedInstructions = !_isExpandedInstructions;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.payment_rounded,
                        color: Color(0xFF0064D2),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Instruksi Pembayaran',
                        style: medium.copyWith(fontSize: 16),
                      ),
                      const Spacer(),
                      Icon(
                        _isExpandedInstructions
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Color(0xFF0064D2),
                      ),
                    ],
                  ),
                ),
              ),
              if (_isExpandedInstructions)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1.  Buka aplikasi mobile banking Anda.',
                        style: light.copyWith(fontSize: 14),
                      ),
                      Text(
                        '2. Pilih menu Transfer.',
                        style: light.copyWith(fontSize: 14),
                      ),
                      Text(
                        '3. Pilih Virtual Account.',
                        style: light.copyWith(fontSize: 14),
                      ),
                      Text(
                        '4. Masukkan nomor virtual account di atas.',
                        style: light.copyWith(fontSize: 14),
                      ),
                      Text(
                        '5. Ikuti instruksi selanjutnya untuk menyelesaikan pembayaran.',
                        style: light.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
