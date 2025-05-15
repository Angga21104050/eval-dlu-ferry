import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/ticket_search_results_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../components/ticket_card.dart';
import '../components/date_selector_widget.dart';
import '../components/card_for_sold.dart';

class TicketSearchResultsView extends GetView<TicketSearchResultsController> {
  const TicketSearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBar(
          scrolledUnderElevation: 0.0,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF0064D2)),
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
                          color: Color.fromARGB(255, 0, 0, 0),
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
                          color: Color.fromARGB(255, 0, 0, 0),
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
                          color: Color.fromARGB(255, 0, 0, 0),
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
                    'id_ID',
                  ).format(homeController.departureDate.value),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: false,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 247, 251, 255),
      body: Column(
        children: [
          DateSelectorWidget(homeController: homeController),
          Expanded(
            child: Obx(() {
              if (homeController.filteredTickets.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      SizedBox(
                        height: 170,
                        width: 170,

                        child: Image.asset('assets/img/list.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 80,
                        ),
                        child: const Text(
                          "Maaf tidak ada tiket yang tersedia 😥.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    'Pilih Ferry Berangkat',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const CardForSold(),
                  ...homeController.filteredTickets.map((ticket) {
                    return TicketCard(ticket: ticket);
                  }).toList(),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
