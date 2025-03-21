import 'package:dlu_project/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_ticket_controller.dart';
import '../../history/controllers/history_controller.dart';
import '../components/secondary_appbar.dart';
import '../../home/components/custom_navigation_bar.dart';
import '../components/search_input.dart';
import '../components/my_ticket_list.dart';

class MyTicketView extends GetView<MyTicketController> {
  const MyTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(HistoryController());

    return Scaffold(
      appBar: const SecCustomAppBar(page: 'My Ticket'),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF0064D2), Colors.white, Colors.white],
              ),
              image: DecorationImage(
                image: AssetImage("assets/img/map-global.png"),
                alignment: Alignment.topCenter,
                fit: BoxFit.contain,
              ),
            ),
          ),

          Column(
            children: [
              SearchInputField(
                onChanged: (value) {
                  print("Kode Pemesanan: $value");
                },
              ),
              TicketList(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
