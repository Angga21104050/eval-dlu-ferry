import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/text_style.dart';

class HeaderOrderTicket extends StatelessWidget {
  const HeaderOrderTicket({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0064D2), Color(0xFF0064D2), Colors.cyan],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        image: DecorationImage(
          image: AssetImage("assets/img/map-global.png"),
          alignment: Alignment.center,
          fit: BoxFit.contain,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                  Text(
                    'Pesan Tiket',
                    style: semiBold.copyWith(fontSize: 22, color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0, left: 48, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Lengkapi detail di bawah ini untuk melanjutkan pemesanan tiket Anda.',
                      style: light.copyWith(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
