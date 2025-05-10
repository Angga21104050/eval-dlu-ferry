import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../history/controllers/history_controller.dart';
import 'half_circle.dart';

class TicketList extends StatelessWidget {
  TicketList({super.key});

  final HistoryController controller = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children:
              controller.ticketHistory.map((ticket) {
                return Stack(
                  clipBehavior:
                      Clip.none, // Izinkan widget keluar dari batas Stack
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ticket['ferryName'] ?? 'UNKNOWN FERRY',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0064D2),
                            ),
                          ),
                          const SizedBox(height: 6),
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
                          Text(
                            'Nama Penumpang',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 6),
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
                                    color: Color(0xFF0064D2),
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.grey,
                                size: 18,
                              ),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Stack(
                              // Tambahkan Stack di sekitar garis putus-putus
                              clipBehavior: Clip.none,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    31,
                                    (index) => Container(
                                      width: 6,
                                      height: 2,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 2,
                                      ),
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: -38,
                                  top: -14,
                                  child: HalfCircle(
                                    color: Colors.grey.withOpacity(0.1),
                                    radius: 10,
                                    height: 30,
                                    isLeft: true,
                                  ),
                                ),
                                Positioned(
                                  left: 333,
                                  top: -14,
                                  child: HalfCircle(
                                    color: Colors.grey.withOpacity(0.1),
                                    radius: 10,
                                    height: 30,
                                    isLeft: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Kode Booking',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          const SizedBox(height: 6),
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
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
