import 'package:dlu_project/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_ticket_controller.dart';
import '../../history/controllers/history_controller.dart';
import '../../home/components/custom_navigation_bar.dart';
import '../components/header.dart';
import '../components/search_input.dart';
import '../components/my_ticket_list.dart';

class MyTicketView extends GetView<MyTicketController> {
  const MyTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(HistoryController());

    return Scaffold(
      // appBar: const SecCustomAppBar(page: 'My Ticket'),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Header(),
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
                          'Layanan Cek Tiket Saya',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SearchInputField(
                      onChanged: (value) {
                        print("Kode Pemesanan: $value");
                      },
                    ),
                    TicketList(),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tiket Saya',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36),
                                border: Border.all(color: Colors.grey.shade800),
                              ),
                              child: Center(
                                child: IconButton(
                                  padding:
                                      EdgeInsets.zero, // Menghilangkan padding
                                  constraints: const BoxConstraints(),
                                  icon: Icon(
                                    Icons.history_edu_rounded,
                                    color: Colors.grey[800],
                                  ),
                                  onPressed: () => Get.toNamed('/history'),
                                ),
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
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
