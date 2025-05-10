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
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            // Gambar latar belakang
            Column(
              children: [
                Container(
                  height: 153,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF0064D2),
                        Color(0xFF5F00D2),
                        const Color(0xFF5200B5),
                      ],
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/img/map-global.png"),
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
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
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
