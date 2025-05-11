import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ticket_search_results_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../myTicket/components/secondary_appbar.dart';
import '../components/ticket_card.dart';
import '../../../widgets/background.dart';

class TicketSearchResultsView extends GetView<TicketSearchResultsController> {
  const TicketSearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: const SecCustomAppBar(page: 'Tiket'),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(children: [Background()]),
          Obx(() {
            if (homeController.filteredTickets.isEmpty) {
              return const Center(
                child: Text("Tidak ada tiket yang tersedia."),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              itemCount: homeController.filteredTickets.length,
              itemBuilder: (context, index) {
                final ticket = homeController.filteredTickets[index];
                return TicketCard(ticket: ticket);
              },
            );
          }),
        ],
      ),
    );
  }
}
