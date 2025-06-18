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
      constraints: const BoxConstraints(maxHeight: double.infinity),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(
              0xFF0064D2,
            ).withOpacity(0.35), 
            blurRadius: 6,
            offset: const Offset(0, 4), 
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                width: 50,
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    ferryName,
                    style: bold.copyWith(
                      fontSize: 16,
                      color: Color(0xFF0064D2),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                33,
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
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cart
                          .map((item) => item['class'])
                          .join(', '), 
                      style: medium.copyWith(
                        fontSize: 12,
                        color: const Color(0xFFB3B3B3),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          departureTime,
                          style: regular.copyWith(fontSize: 24),
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 8),
                            Column(
                              children: [
                                SizedBox(height: 12),
                                Container(
                                  width: 100,
                                  height: 0.5,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                                Text(
                                  duration,
                                  style: medium.copyWith(
                                    fontSize: 8,
                                    color: const Color(0xFFBDBDBD),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                        Text(
                          arrivalTime,
                          style: regular.copyWith(fontSize: 24),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            departurePort,
                            style: medium.copyWith(
                              fontSize: 12,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Text(
                          '→',
                          style: medium.copyWith(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            arrivalPort,
                            style: medium.copyWith(
                              fontSize: 12,
                              color: const Color.from(
                                alpha: 1,
                                red: 0,
                                green: 0,
                                blue: 0,
                              ),
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
                          'Jumlah Tiket',
                          style: medium.copyWith(fontSize: 12),
                        ),
                        Text('2', style: medium.copyWith(fontSize: 12)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: medium.copyWith(fontSize: 12)),
                        Text('660.000', style: medium.copyWith(fontSize: 12)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          date,
                          style: medium.copyWith(
                            fontSize: 10,
                            color: const Color(0xFFB3B3B3),
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
