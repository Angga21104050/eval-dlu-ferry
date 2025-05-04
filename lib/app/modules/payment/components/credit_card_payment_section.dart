import 'package:flutter/material.dart';
import '../../orderTicket/controllers/order_ticket_controller.dart';
import '../../orderTicket/components/custom_text_form_field.dart';

class CreditCardPaymentSection extends StatelessWidget {
  final OrderTicketController controller;

  const CreditCardPaymentSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final selectedCard = controller.selectedCreditCardMethod.value;
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
            'Pembayaran Kartu Kredit',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('Anda telah memilih: ${selectedCard ?? ''}'),
          const SizedBox(height: 16),
          const Text(
            'Detail Kartu Kredit:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const CustomTextFormField(label: 'Nomor Kartu'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: CustomTextFormField(label: 'MM/YY')),
              const SizedBox(width: 16),
              Expanded(child: CustomTextFormField(label: 'CVV')),
            ],
          ),
        ],
      ),
    );
  }
}