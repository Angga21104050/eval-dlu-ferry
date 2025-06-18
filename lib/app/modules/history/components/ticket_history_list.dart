import 'package:dlu_project/app/constants/text_style.dart';
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
                          color: Colors.black.withOpacity(
                            0.1,
                          ), 
                          blurRadius: 6,
                          offset: const Offset(
                            0,
                            2,
                          ),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ticket['transactionCode'] ?? 'UNKNOWN',
                              style: medium.copyWith(
                                fontSize: 20,
                                color: Color(0xFF0064D2),
                              ),
                            ),
                            Text(
                              ticket['transactionDate'] ?? 'UNKNOWN DATE',
                              style: light.copyWith(
                                fontSize: 14,
                                color: const Color(0xFF757575),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "${ticket['departurePort'] ?? 'UNKNOWN'} → ${ticket['arrivalPort'] ?? 'UNKNOWN'}",
                          style: regular.copyWith(fontSize: 14),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ticket['ferryName'] ?? 'UNKNOWN FERRY',
                              style: regular.copyWith(
                                fontSize: 14,
                                color: Color(0xFF757575),
                              ),
                            ),
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        displayText,
        style: regular.copyWith(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
