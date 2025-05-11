import 'package:dlu_project/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_ticket_controller.dart';
import '../../history/controllers/history_controller.dart';
import '../components/secondary_appbar.dart';
import '../../home/components/custom_navigation_bar.dart';
import '../components/search_input.dart';
import '../components/my_ticket_list.dart';
import '../../../widgets/background.dart';

class MyTicketView extends GetView<MyTicketController> {
  const MyTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(HistoryController());

    return Scaffold(
      appBar: const SecCustomAppBar(page: 'My Ticket'),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(children: [Background()]),

          SingleChildScrollView(
            child: Column(
              children: [
                SearchInputField(
                  onChanged: (value) {
                    print("Kode Pemesanan: $value");
                  },
                ),
                TicketList(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
