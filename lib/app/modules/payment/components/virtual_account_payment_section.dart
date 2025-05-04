import 'package:flutter/material.dart';
import '../../orderTicket/controllers/order_ticket_controller.dart';
import '../components/payment_timer.dart';

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
                color: const Color(0x330064D2),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 158, 37, 29),
                  ),
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
                        style: const TextStyle(
                          color: Color.fromARGB(255, 158, 37, 29),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
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
                        icon: const Icon(Icons.copy, color: Colors.blue),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey, thickness: 0.5),
                ],
              ),
              const SizedBox(height: 16),
              Container(
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
                      'Rincian Tiket',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          widget.cart.map((item) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 24.0),
                                    child: Text(
                                      '${item['class']} (${item['count']})',
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Rp. 300.000',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ), // Teks dummy harga
                              ],
                            );
                          }).toList(),
                    ),
                    const SizedBox(height: 8),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Rp. ${(300000 * widget.cart.fold<int>(0, (sum, item) => sum + (item['count'] as int))).toInt()}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ), // Contoh perhitungan total dummy
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
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
                        color: Colors.blue,
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
