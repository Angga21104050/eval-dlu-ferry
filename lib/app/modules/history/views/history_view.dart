import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dlu_project/app/modules/home/controllers/home_controller.dart';
import '../controllers/history_controller.dart';
import '../../home/components/custom_navigation_bar.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0064D2),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'History',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Gradient dan Image
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0064D2),
                  Color(0xFF1D8AFF),
                  Colors.white,
                  Colors.white,
                ],
              ),
              image: DecorationImage(
                image: AssetImage("assets/img/map-global.png"),
                alignment: Alignment.topCenter,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // List View for History Tickets
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Obx(() {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    ...controller.ticketHistory.map((ticket) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
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
                            // Transaction Code and Date
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ticket['transactionCode'] ?? 'UNKNOWN',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ticket['transactionDate'] ?? 'UNKNOWN DATE',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Departure - Arrival Port
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Text(
                                "${ticket['departurePort'] ?? 'UNKNOWN'} - ${ticket['arrivalPort'] ?? 'UNKNOWN'}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            // Ferry Name
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ticket['ferryName'] ?? 'UNKNOWN FERRY',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        (ticket['status'] ?? 'BELUM TERBIT') ==
                                                'TELAH TERBIT'
                                            ? Colors.green
                                            : (ticket['status'] == 'GAGAL'
                                                ? Colors.red
                                                : Colors.orange),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    ticket['status'] ?? 'BELUM TERBIT',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
