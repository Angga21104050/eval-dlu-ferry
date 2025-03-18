import 'package:dlu_project/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_ticket_controller.dart';
import '../../home/components/custom_app_bar.dart';
import '../../home/components/custom_navigation_bar.dart';

class MyTicketView extends GetView<MyTicketController> {
  const MyTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: const CustomAppBar(greeting: '', username: 'My Ticket'),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF0064D2), Colors.white, Colors.white],
              ),
              image: DecorationImage(
                image: AssetImage("assets/img/map-global.png"),
                alignment: Alignment.topCenter,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Masukan Kode Pemesanan...',
                        prefixIcon: Icon(Icons.search_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomPaint(
                      size: const Size(
                        double.infinity,
                        350,
                      ), // Lebar menyesuaikan, tinggi 350
                      painter: RoundedCutoutPainter(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class RoundedCutoutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white; // Warna latar belakang

    RRect rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(30), // Sudut melengkung
    );

    Path path = Path()..addRRect(rect);

    // Potongan kecil di sisi kiri dan kanan
    double cutoutSize = 20;
    path.addOval(
      Rect.fromCircle(center: Offset(0, size.height / 2), radius: cutoutSize),
    );
    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width, size.height / 2),
        radius: cutoutSize,
      ),
    );

    canvas.drawShadow(path, Colors.black, 5.0, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
