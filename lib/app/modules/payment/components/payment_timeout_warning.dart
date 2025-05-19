import 'package:flutter/material.dart';
import '../../../constants/text_style.dart';

class PaymentTimeoutWarning extends StatelessWidget {
  const PaymentTimeoutWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 158, 37, 29)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.red.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/img/timer.png'),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Selesaikan pembayaran anda sebelum waktu habis',
              style: medium.copyWith(color: Color.fromARGB(255, 158, 37, 29)),
            ),
          ),
        ],
      ),
    );
  }
}
