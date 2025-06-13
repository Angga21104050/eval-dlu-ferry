// membuat tombol navigasi di bagian bawah layar
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../constants/text_style.dart';

class CustomNavigationBar extends GetView<HomeController> {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1), // Lebih soft
              offset: Offset(0, -2), // Bayangan dari atas ke bawah
              blurRadius: 8, // Membuat bayangan lebih lembut
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: medium.copyWith(),
          unselectedLabelStyle: regular.copyWith(),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_num),
              label: 'My Ticket',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: const Color(0xFF0064D2),
          unselectedItemColor: const Color(0xFFD9D9D9),
          iconSize: 24,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          showUnselectedLabels: true,
          onTap: (index) {
            controller.changeIndex(index);
          },
        ),
      ),
    );
  }
}
