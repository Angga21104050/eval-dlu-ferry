import 'package:flutter/material.dart';
import '../../../constants/text_style.dart';

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
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        shape: Border.all(color: Colors.transparent),
        title: Text('Detail Tiket', style: medium.copyWith(fontSize: 14)),
        initiallyExpanded: _isExpanded,
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        trailing: Icon(
          _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: Color(0xFF0064D2),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  widget.cart.map((item) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${item['ferryName']}',
                              style: semiBold.copyWith(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${item['departureTime']} WIB - ${item['date']}',
                                style: regular.copyWith(fontSize: 12),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${item['departurePort']} → ${item['arrivalPort']}',
                          style: medium.copyWith(
                            fontSize: 14,
                            color: const Color(0xFF757575),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 24.0),
                                child: Text(
                                  '${item['class']} (${item['count']})',
                                  style: regular.copyWith(fontSize: 12),
                                ),
                              ),
                            ),
                            Text(
                              'Rp. 300.000',
                              style: regular.copyWith(fontSize: 12),
                            ), // Teks dummy harga
                          ],
                        ),
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
            child: Column(
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: semiBold.copyWith(fontSize: 14)),
                    Text(
                      'Rp. ${(300000 * widget.cart.fold<int>(0, (sum, item) => sum + (item['count'] as int))).toInt()}',
                      style: semiBold.copyWith(fontSize: 14),
                    ), 
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
