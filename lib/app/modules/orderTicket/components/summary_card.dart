// order_ticket_view/components/ticket_card.dart (asumsi path file)
import 'package:flutter/material.dart';

class OrderSummaryCard extends StatelessWidget {
  final String ferryName;
  final String departureTime;
  final String arrivalTime;
  final String departurePort;
  final String arrivalPort;
  final String duration;
  final String date;
  final List<Map<String, dynamic>> cart;

  const OrderSummaryCard({
    super.key,
    required this.ferryName,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.date,
    required this.cart,
    required this.departurePort,
    required this.arrivalPort,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 100,
        maxHeight: double.infinity,
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
            offset: const Offset(0, 2), // Offset shadow (horizontal, vertical)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  ferryName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF004AAD),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                27,
                (index) => Container(
                  width: 1,
                  height: 4,
                  color:
                      index.isEven ? Colors.grey.shade500 : Colors.transparent,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cart
                          .map((item) => item['class'])
                          .join(', '), // Tampilkan jenis tiket yang dipesan
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          departureTime,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 8),
                            Container(
                              width: 100,
                              height: 1,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                        Text(
                          arrivalTime,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            departurePort,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Text(
                          '→',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            arrivalPort,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          duration,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
