import 'package:flutter/material.dart';

class TicketDetailPayment extends StatefulWidget {
  final List<Map<String, dynamic>> cart;

  const TicketDetailPayment({super.key, required this.cart});

  @override
  State<TicketDetailPayment> createState() => _TicketDetailPaymentState();
}

class _TicketDetailPaymentState extends State<TicketDetailPayment> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        shape: Border.all(color: Colors.transparent),
        title: const Text(
          'Detail Tiket',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        initiallyExpanded: _isExpanded,
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        trailing: Icon(
          _isExpanded
              ? Icons.keyboard_arrow_up
              : Icons.keyboard_arrow_down, // Ganti dengan icon pilihan Anda
          color: Colors.blue, // Anda bisa atur warna icon di sini
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  widget.cart.map((item) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${item['ferryName']}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${item['departureTime']} WIB - ${item['date']}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${item['departurePort']} → ${item['arrivalPort']}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
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
                        ),
                        const SizedBox(
                          height: 12,
                        ), // Tambah sedikit ruang antar item
                      ],
                    );
                  }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp. ${(300000 * widget.cart.fold<int>(0, (sum, item) => sum + (item['count'] as int))).toInt()}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ), // Contoh perhitungan total dummy
              ],
            ),
          ),
        ],
      ),
    );
  }
}
