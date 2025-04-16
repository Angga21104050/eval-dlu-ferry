import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dlu_project/app/modules/home/controllers/home_controller.dart';
import '../controllers/history_controller.dart';
import '../../home/components/custom_navigation_bar.dart';
import '../components/ticket_history_list.dart';
import '../../myTicket/components/secondary_appbar.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: const SecCustomAppBar(page: 'History'),

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
          TicketHistoryList(controller: controller),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
