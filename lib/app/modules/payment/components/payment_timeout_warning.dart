import 'package:flutter/material.dart';
import '../../../constants/text_style.dart';

class PaymentTimeoutWarning extends StatelessWidget {
  const PaymentTimeoutWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFB8001F)),
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFB8001F).withOpacity(0.15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/img/timer.png'),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Selesaikan pembayaran anda sebelum: waktu habis',
              style: light.copyWith(
                fontSize: 12,
                color: Color.fromARGB(255, 158, 37, 29),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
