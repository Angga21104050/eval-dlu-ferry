import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/history_controller.dart';

class TicketHistoryList extends StatelessWidget {
  final HistoryController controller;

  const TicketHistoryList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Obx(() {
        return SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20, bottom: 80),
          child: Column(
            children:
                controller.ticketHistory.map((ticket) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFF0064D2,
                          ).withOpacity(0.2), // 🔹 Shadow Biru
                          offset: const Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔹 Kode Transaksi & Tanggal
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ticket['transactionCode'] ?? 'UNKNOWN',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0064D2),
                              ),
                            ),
                            Text(
                              ticket['transactionDate'] ?? 'UNKNOWN DATE',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        // 🔹 Rute (Keberangkatan - Tujuan)
                        Text(
                          "${ticket['departurePort'] ?? 'UNKNOWN'} → ${ticket['arrivalPort'] ?? 'UNKNOWN'}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        // 🔹 Nama Kapal & Status
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ticket['ferryName'] ?? 'UNKNOWN FERRY',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            // 🔹 Status Badge
                            _buildStatusBadge(ticket['status']),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        );
      }),
    );
  }

  // 🔹 Widget Badge Status Modern
  Widget _buildStatusBadge(String? status) {
    Color bgColor;
    String displayText;

    switch (status) {
      case 'TELAH TERBIT':
        bgColor = Colors.green.shade600;
        displayText = 'Tiket Terbit';
        break;
      case 'GAGAL':
        bgColor = Colors.red.shade600;
        displayText = 'Pembayaran Gagal';
        break;
      default:
        bgColor = Colors.orange.shade600;
        displayText = 'Belum Terbit';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        displayText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
