import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/ticket_search_results_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../components/ticket_card.dart';

class TicketSearchResultsView extends GetView<TicketSearchResultsController> {
  const TicketSearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Get.back();
            },
          ),
          title: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        homeController.fromCity.value.length > 10
                            ? "${homeController.fromCity.value.substring(0, 14)}..."
                            : homeController.fromCity.value,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(right: 8),
                      child: const Text(
                        " > ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        homeController.toCity.value.length > 10
                            ? "${homeController.toCity.value.substring(0, 14)}..."
                            : homeController.toCity.value,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat(
                    'dd MMM yyyy',
                  ).format(homeController.departureDate.value),
                  style: const TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ),
          centerTitle: false,
          backgroundColor: const Color(0xFF0064D2),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Obx(() {
            if (homeController.filteredTickets.isEmpty) {
              return const Center(
                child: Text("Tidak ada tiket yang tersedia."),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              itemCount:
                  homeController.filteredTickets.length + 1, // +1 untuk header
              itemBuilder: (context, index) {
                if (index == 0) {
                  // Widget header scrollable
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 12),
                    child: Text(
                      'Pilih Ferry Berangkat',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }

                final ticket =
                    homeController.filteredTickets[index - 1]; // offset -1
                return TicketCard(ticket: ticket);
              },
            );
          }),
        ],
      ),
    );
  }
}
