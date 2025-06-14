import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dlu_project/app/modules/home/controllers/home_controller.dart';
import '../controllers/history_controller.dart';
import '../components/ticket_history_list.dart';
import '../../../constants/text_style.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0064D2),
                  Color(0xFF0064D2),
                  Color(0xFF0064D2),
                  Color(0xFF00DDFF),
                ],
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 26, bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Get.back(),
                        ),
                        Text(
                          'Riwayat Transaksi',
                          style: semiBold.copyWith(
                            fontSize: 22,
                            color: Colors.white,
                          ),
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
                            'Semua tiket ferry yang sudah aktif dan menunggu pembayaran',
                            style: light.copyWith(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (_) => true,
            child: SingleChildScrollView(
              controller: controller.scrollController,
              padding: const EdgeInsets.only(top: 170),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        top: 25,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Riwayat Transaksi Anda',
                          style: medium.copyWith(fontSize: 16),
                        ),
                      ),
                    ),

                    TicketHistoryList(controller: controller),
                  ],
                ),
              ),
            ),
          ),
          // AppBar putih muncul saat scroll
          Obx(
            () =>
                controller.isScrolled.value
                    ? Container(
                      height: 80 + MediaQuery.of(context).padding.top,
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              // Menggunakan IconButton untuk tombol back
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Color(0xFF0064D2),
                              ), // Atur warna ikon
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            Text(
                              'Riwayat Transaksi',
                              style: semiBold.copyWith(
                                fontSize: 24,
                                color: Color(0xFF0064D2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
