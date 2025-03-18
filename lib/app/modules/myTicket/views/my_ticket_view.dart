import 'package:dlu_project/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_ticket_controller.dart';
import '../../home/components/custom_app_bar.dart';
import '../../home/components/custom_navigation_bar.dart';

class MyTicketView extends GetView<MyTicketController> {
  const MyTicketView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: const CustomAppBar(greeting: '', username: 'My Ticket'),
      body: Stack(
        children: [
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
          Positioned(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Masukan Kode Pemesanan...',
                        prefixIcon: Icon(Icons.search_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
