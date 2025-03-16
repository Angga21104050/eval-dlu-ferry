import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../components/custom_app_bar.dart';
import 'input_form_ticket.dart';
import '../components/navigation_bar.dart' as custom;
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        greeting: 'Selamat Malam',
        username: 'Airlangga Maulana Anwar',
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Background dengan gambar
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF0064D2),
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
                // Form di atas gambar
                Positioned(
                  top: -250, // Sesuaikan tinggi sesuai kebutuhan
                  left: 0,
                  right: 0,
                  child: SingleChildScrollView(child: InputFormTicket()),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200, // Sesuaikan tinggi carousel
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enlargeCenterPage: true,
                ),
                items:
                    [
                      "assets/img/iklan_1.png",
                      "assets/img/iklan_2.png",
                      "assets/img/contoh.jpeg",
                    ].map((imagePath) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: custom.NavigationBar(),
    );
  }
}
