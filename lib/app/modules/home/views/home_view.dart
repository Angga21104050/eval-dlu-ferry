import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../components/custom_app_bar.dart';
import '../components/input_form_ticket.dart';
import '../components/custom_navigation_bar.dart';
import '../components/custom_carousel.dart';

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
          // Gambar latar belakang
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              // Gradasi biru ke putih
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF0064D2),
                  Colors.white, // Warna biru di atas
                  Colors.white, // Warna putih di bawah
                ],
              ),
              // Gambar latar belakang
              image: DecorationImage(
                image: AssetImage("assets/img/map-global.png"),
                alignment: Alignment.topCenter,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Column di atas gambar latar belakang
          Positioned(
            top: -260, // Mulai dari bagian atas layar
            left: 0,
            right: 0,
            bottom: 0, // Menutupi seluruh layar
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Form Input Ticket
                  InputFormTicket(),
                  // Carousel Slider
                  CustomCarousel(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
