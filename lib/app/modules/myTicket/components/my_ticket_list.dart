import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../history/controllers/history_controller.dart';

class TicketList extends StatelessWidget {
  TicketList({super.key});

  final HistoryController controller = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...controller.ticketHistory.map((ticket) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(0, 3),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama Kapal
                    Text(
                      ticket['ferryName'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Jenis Tiket dan Kategori
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ticket['ticketType'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'Dewasa',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    // Nama Penumpang
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Nama Penumpang',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Keberangkatan & Tujuan
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            ticket['departurePort'],
                            textAlign: TextAlign.start,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF4785FF),
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 1,
                          color: Colors.grey,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                        ),
                        Flexible(
                          child: Text(
                            ticket['arrivalPort'],
                            textAlign: TextAlign.end,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF4785FF),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Garis Putus-putus
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          20,
                          (index) => Expanded(
                            child: Container(
                              height: 2,
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Kode Booking
                    Text(
                      'Kode Booking',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ticket['transactionCode'],
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.asset(
                            'assets/img/barcode.png',
                            fit: BoxFit.contain,
                            width: 80,
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}