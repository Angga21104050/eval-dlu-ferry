import 'package:dlu_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../history/controllers/history_controller.dart';
import 'half_circle.dart';
import '../../../constants/text_style.dart';

class TicketList extends StatelessWidget {
  TicketList({super.key});

  final HistoryController controller = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.MY_TICKET_DETAIL);
      },
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children:
              controller.ticketHistory.map((ticket) {
                return Stack(
                  clipBehavior:
                      Clip.none, 
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ticket['ferryName'] ?? 'UNKNOWN FERRY',
                                  style: bold.copyWith(
                                    fontSize: 24,
                                    color: Color(0xFF0064D2),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    ticket['ticketType'] ?? 'UNKNOWN TYPE',
                                    style: regular.copyWith(
                                      fontSize: 14,
                                      color: const Color(0xFFD0CBCB),
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 2),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18.0,
                            ),
                            child: Text(
                              'Uyeeee',
                              style: semiBold.copyWith(fontSize: 16),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18.0,
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      ticket['departurePort'] ?? 'UNKNOWN',
                                      textAlign: TextAlign.start,
                                      style: medium.copyWith(
                                        fontSize: 16,
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
                                      style: medium.copyWith(
                                        fontSize: 16,
                                        color: Color(0xFF0064D2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Stack(
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
                                  left: -20,
                                  top: -14,
                                  child: HalfCircle(
                                    color: Colors.grey.shade100,
                                    radius: 10,
                                    height: 30,
                                    isLeft: true,
                                  ),
                                ),
                                Positioned(
                                  left: 353,
                                  top: -14,
                                  child: HalfCircle(
                                    color: Colors.grey.shade100,
                                    radius: 10,
                                    height: 30,
                                    isLeft: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18.0,
                            ),
                            child: Text(
                              'Kode Booking',
                              style: semiBold.copyWith(
                                fontSize: 14,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ticket['transactionCode'] ?? 'XXXXXX',
                                  style: semiBold.copyWith(
                                    fontSize: 24,
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
