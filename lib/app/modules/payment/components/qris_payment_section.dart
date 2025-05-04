import 'package:flutter/material.dart';
import '../../orderTicket/controllers/order_ticket_controller.dart';
import '../components/payment_timer.dart';

class QrisPaymentSection extends StatelessWidget {
  final OrderTicketController controller;

  const QrisPaymentSection({super.key, required this.controller});

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
                'Pembayaran QRIS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
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
              const SizedBox(height: 16),
              const Text(
                'Scan QR Code:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text('QR Code')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
