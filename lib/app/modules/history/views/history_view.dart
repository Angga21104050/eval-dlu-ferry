import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dlu_project/app/modules/home/controllers/home_controller.dart';
import '../controllers/history_controller.dart';
import '../../home/components/custom_navigation_bar.dart';
import '../components/ticket_history_list.dart';
import '../../myTicket/components/secondary_appbar.dart';
import '../../../widgets/background.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: const SecCustomAppBar(page: 'History'),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Gradient dan Image
          Column(children: [Background()]),
          // List View for History Tickets
          TicketHistoryList(controller: controller),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
