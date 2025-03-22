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
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            ...controller.ticketHistory.map((ticket) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade200, width: 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(
                        0xFF0064D2,
                      ).withOpacity(0.15), // 🔹 Shadow Biru
                      offset: const Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 Nama Kapal
                    Text(
                      ticket['ferryName'] ?? 'UNKNOWN FERRY',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0064D2), // 🔹 Warna Biru Elegan
                      ),
                    ),

                    const SizedBox(height: 6),

                    // 🔹 Jenis Tiket & Kategori
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ticket['ticketType'] ?? 'UNKNOWN TYPE',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const Text(
                          'Dewasa',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // 🔹 Nama Penumpang
                    Text(
                      'Nama Penumpang',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // 🔹 Keberangkatan & Tujuan
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            ticket['departurePort'] ?? 'UNKNOWN',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF0064D2), // 🔹 Warna Biru
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.grey,
                          size: 18,
                        ), // 🔹 Icon Modern
                        Flexible(
                          child: Text(
                            ticket['arrivalPort'] ?? 'UNKNOWN',
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF0064D2),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // 🔹 Garis Putus-Putus Soft
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          31,
                          (index) => Container(
                            width: 6,
                            height: 2,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),

                    // 🔹 Kode Booking
                    Text(
                      'Kode Booking',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // 🔹 Kode & Barcode
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ticket['transactionCode'] ?? 'XXXXXX',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0064D2),
                          ),
                        ),
                        Image.asset(
                          'assets/img/barcode.png',
                          fit: BoxFit.contain,
                          width: 90,
                          height: 40,
                        ),
                      ],
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
