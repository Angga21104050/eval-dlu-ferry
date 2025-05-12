import 'package:flutter/material.dart';
import '../../home/controllers/home_controller.dart';
import 'package:get/get.dart';
import '../../home/components/custom_navigation_bar.dart';
import '../../home/views/home_view.dart';
import '../../myTicket/views/my_ticket_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/main_scaffold_controller.dart';

class MainScaffoldView extends GetView<MainScaffoldController> {
  MainScaffoldView({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: homeController.selectedIndex.value,
          children: const [HomeView(), MyTicketView(), ProfileView()],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
