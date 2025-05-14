import 'package:flutter/material.dart';
import '../../orderTicket/controllers/order_ticket_controller.dart';
import '../components/payment_timer.dart';
import 'payment_timeout_warning.dart';
import '../components/ticket_detail_payment.dart';

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
              const Text(
                'Pembayaran Virtual Account',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Image.asset(
                    widget.controller.getImagePathForMethod(selectedVA ?? ''),
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
                  Text(
                    '${selectedVA ?? ''}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const PaymentTimeoutWarning(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kode Pembayaran :',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'HKKF2343242',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy, color: Color(0xFF0064D2)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey, thickness: 0.5),
                ],
              ),
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
                    const Text(
                      'Detail Penumpang',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AIRLANGGA MAULANA ANWAR',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          'NIK-330056235345',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
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
                      const Text(
                        'Tata cara pembayaran',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        _isExpandedInstructions
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: Colors.blue,
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
                    children: const [
                      Text('1. Buka aplikasi mobile banking Anda.'),
                      Text('2. Pilih menu Transfer.'),
                      Text('3. Pilih Virtual Account.'),
                      Text('4. Masukkan nomor virtual account di atas.'),
                      Text(
                        '5. Ikuti instruksi selanjutnya untuk menyelesaikan pembayaran.',
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
