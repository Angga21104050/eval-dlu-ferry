import 'package:flutter/material.dart';
import '../../orderTicket/controllers/order_ticket_controller.dart';

class EWalletPaymentSection extends StatelessWidget {
  final OrderTicketController controller;

  const EWalletPaymentSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final selectedEWallet = controller.selectedEWalletMethod.value;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0x330064D2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pembayaran E-Wallet',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('Anda telah memilih: ${selectedEWallet ?? ''}'),
          const SizedBox(height: 16),
          const Text(
            'Instruksi Pembayaran:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('1. Buka aplikasi ${selectedEWallet ?? 'E-Wallet'} Anda.'),
          const Text('2. Cari menu Pembayaran atau Bayar.'),
          Text(
            '3. Ikuti instruksi di dalam aplikasi ${selectedEWallet ?? 'E-Wallet'} untuk menyelesaikan pembayaran.',
          ),
        ],
      ),
    );
  }
}