import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ticket_search_results_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../components/ticket_card.dart';
import '../../../widgets/background.dart';

class TicketSearchResultsView extends GetView<TicketSearchResultsController> {
  const TicketSearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // Menggunakan IconButton untuk tombol back
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ), // Atur warna ikon
          onPressed: () {
            Get.back();
          },
        ),
        title: Obx(
          () => Row(
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
                // Mengubah Text menjadi Container
                alignment: Alignment.centerLeft, // Tanda ">" rata kiri
                margin: const EdgeInsets.only(
                  right: 8,
                ), // Menambahkan margin kanan
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
        ),
        centerTitle: false,
        backgroundColor: const Color(
          0xFF0064D2,
        ), // Atur warna AppBar sesuai kebutuhan
      ),
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

