// membuat tombol navigasi di bagian bawah layar
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class CustomNavigationBar extends GetView<HomeController> {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, -2),
              blurRadius: 1,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_num_outlined),
              label: 'My Ticket',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          currentIndex: controller.selectedIndex.value, // Index dinamis
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          iconSize: 24,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          showUnselectedLabels: true,
          onTap: (index) {
            controller.changeIndex(index); // Pindah halaman & update index
          },
        ),
      ),
    );
  }
}
