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
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  0.1,
                ), // Warna shadow dengan sedikit transparansi
                blurRadius: 6, // Tingkat keburaman shadow
                offset: const Offset(
                  0,
                  2,
                ), // Offset shadow (horizontal, vertical)
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pembayaran E-Wallet',
                style: semiBold.copyWith(fontSize: 16),
              ),
              Row(
                children: [
                  Image.asset(
                    widget.controller.getImagePathForMethod(
                      selectedEWallet ?? '',
                    ),
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
                  const SizedBox(width: 8),
                  Text('${selectedEWallet ?? ''}', style: medium.copyWith()),
                ],
              ),
              const PaymentTimeoutWarning(),
              const SizedBox(height: 8),
              TicketDetailPayment(cart: widget.cart),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Penumpang',
                      style: medium.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AIRLANGGA MAULANA ANWAR',
                          style: semiBold.copyWith(fontSize: 16),
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
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  0.1,
                ), // Warna shadow dengan sedikit transparansi
                blurRadius: 6, // Tingkat keburaman shadow
                offset: const Offset(
                  0,
                  2,
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
                        Icons.receipt_long_outlined,
                        color: Color(0xFF0064D2),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Instruksi Pembayaran',
                        style: semiBold.copyWith(fontSize: 16),
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
