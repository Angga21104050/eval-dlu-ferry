import 'package:flutter/material.dart';
import '../../orderTicket/controllers/order_ticket_controller.dart';
import '../../orderTicket/components/custom_text_form_field.dart';
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
                'Pembayaran Kartu Kredit',
                style: semiBold.copyWith(fontSize: 16),
              ),
              Row(
                children: [
                  Image.asset(
                    controller.getImagePathForMethod(selectedCard ?? ''),
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
                  Text('${selectedCard ?? ''}', style: medium.copyWith()),
                ],
              ),
              const PaymentTimeoutWarning(),
              const SizedBox(height: 4),
              Text(
                'Detail Kartu Kredit:',
                style: medium.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(label: 'Nomor Kartu'),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: CustomTextFormField(label: 'MM/YY')),
                  const SizedBox(width: 16),
                  Expanded(child: CustomTextFormField(label: 'CVV')),
                ],
              ),
              const SizedBox(height: 8),
              TicketDetailPayment(cart: cart),
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
      ],
    );
  }
}
