import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../components/custom_app_bar.dart';
import '../components/input_form_ticket.dart';
import '../components/custom_navigation_bar.dart';
import '../components/custom_carousel.dart';
import '../../../widgets/background.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        greeting: 'Selamat Malam',
        username: 'Airlangga Maulana Anwar',
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Background(),
                Column(children: [InputFormTicket(), CustomHorizontalScroll()]),
                
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
