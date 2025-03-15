import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../components/custom_app_bar.dart';
import 'input_form_ticket.dart';
import '../components/navigation_bar.dart' as custom;

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        greeting: 'Selamat Malam',
        username: 'Airlangga Maulana Anwar',
      ),
      body: Stack(
        children: [
          // Background dengan gambar
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFF0064D2), Colors.white, Colors.white],
              ),
              image: DecorationImage(
                image: AssetImage("assets/img/map-global.png"),
                alignment: Alignment.topCenter,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Form di atas gambar
          Positioned(
            top: -250, // Sesuaikan tinggi sesuai kebutuhan
            left: 0,
            right: 0,
            child: SingleChildScrollView(child: InputFormTicket()),
          ),
        ],
      ),
      bottomNavigationBar: custom.NavigationBar(),
    );
  }
}
