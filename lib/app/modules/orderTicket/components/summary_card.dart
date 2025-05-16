// order_ticket_view/components/ticket_card.dart (asumsi path file)
import 'package:flutter/material.dart';
import '../../../constants/text_style.dart';

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
        borderRadius: BorderRadius.circular(16),
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
                  style: semiBold.copyWith(
                    fontSize: 16,
                    color: Color(0xFF0064D2),
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
                      style: semiBold.copyWith(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          departureTime,
                          style: semiBold.copyWith(fontSize: 22),
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
                          style: semiBold.copyWith(fontSize: 22),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            departurePort,
                            style: semiBold.copyWith(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Text(
                          '→',
                          style: semiBold.copyWith(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            arrivalPort,
                            style: semiBold.copyWith(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          date,
                          style: medium.copyWith(
                            fontSize: 12,
                            color: Colors.grey.shade900,
                          ),
                        ),
                        Text(
                          duration,
                          style: medium.copyWith(
                            fontSize: 12,
                            color: Colors.grey.shade900,
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
