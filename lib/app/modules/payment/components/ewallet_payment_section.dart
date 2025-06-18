import 'package:flutter/material.dart';
import '../../orderTicket/controllers/order_ticket_controller.dart';
import '../components/payment_timer.dart';
import '../components/payment_timeout_warning.dart';
import '../components/ticket_detail_payment.dart';
import '../../../constants/text_style.dart';

class EWalletPaymentSection extends StatefulWidget {
  final OrderTicketController controller;
  final List<Map<String, dynamic>> cart;

  const EWalletPaymentSection({
    super.key,
    required this.controller,
    required this.cart,
  });

  @override
  State<EWalletPaymentSection> createState() => _EWalletPaymentSectionState();
}

class _EWalletPaymentSectionState extends State<EWalletPaymentSection> {
  bool _isExpandedInstructions = false;

  @override
  Widget build(BuildContext context) {
    final selectedEWallet = widget.controller.selectedEWalletMethod.value;
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
                    widget.controller.getImagePathForMethod(
                      selectedEWallet ?? '',
                    ),
                    height: 44,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image_not_supported,
                        size: 44,
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
                  'G23435235564', 
                  style: semiBold.copyWith(fontSize: 22),
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
              SizedBox(height: 8),
              Text(
                'No. Telp. Penagihan OVO',
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
                  '08577345643', 
                  style: semiBold.copyWith(fontSize: 22),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, bottom: 8),
                height: 47,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0064D2), Color(0xFF00DDFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Kembali',
                    style: semiBold.copyWith(fontSize: 16),
                  ),
                ),
              ),
              Text(
                'Tiket akan terbit secara otomatis saat sistem sudah menerima pembayaran dari Anda. Anda dapat melihat kembali info ini ke pada menu Cek Boking',
                style: regular.copyWith(fontSize: 12, color: Color(0xFF9D9D9D)),
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
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1.  Buka aplikasi ${selectedEWallet ?? 'E-Wallet'} Anda.',
                        style: light.copyWith(fontSize: 14),
                      ),
                      Text(
                        '2. Cari menu Pembayaran atau Bayar.',
                        style: light.copyWith(fontSize: 14),
                      ),
                      Text(
                        '3. Ikuti instruksi di dalam aplikasi ${selectedEWallet ?? 'E-Wallet'} untuk menyelesaikan pembayaran.',
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
