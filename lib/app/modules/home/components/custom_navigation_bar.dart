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
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Lebih soft
              offset: Offset(0, -2), // Bayangan dari atas ke bawah
              blurRadius: 8, // Membuat bayangan lebih lembut
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
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
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: const Color.fromARGB(255, 0, 179, 255),
          unselectedItemColor: Colors.grey,
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
