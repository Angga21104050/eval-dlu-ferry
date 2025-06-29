import 'package:dlu_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/ticket_detail_card.dart';
import '../controllers/my_ticket_detail_controller.dart';
import '../components/my_detail_ticket_summ.dart';
import '../components/qr_with_status.dart';
import '../../../constants/text_style.dart';

class MyTicketDetailView extends GetView<MyTicketDetailController> {
  const MyTicketDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification.metrics.pixels > 80) {
                if (!controller.isScrolled.value) {
                  controller.isScrolled.value = true;
                }
              } else {
                if (controller.isScrolled.value) {
                  controller.isScrolled.value = false;
                }
              }
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        height: 200,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF0064D2),
                              Color(0xFF0064D2),
                              Color(0xFF0064D2),
                              Colors.cyan,
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
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 26),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => Get.back(),
                                    ),
                                    Text(
                                      'Detail Tiket',
                                      style: semiBold.copyWith(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 0,
                                  left: 48,
                                  right: 20,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Informasi lengkap tiket ferry Anda, termasuk jadwal dan status pembayaran.",
                                        style: light.copyWith(
                                          fontSize: 14,
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
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: MyDetailTicketSumm(),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        QrWithStatusAndPrintButton(),
                        TicketDetailCard(
                          ferryName: 'UNKNOWN FERRY',
                          price: 'Rp. 300.000',
                          className: 'Kelas III Dewasa',
                          paymentStatus: 'LUNAS',
                          passengerName: 'Toyota GT 86',
                          ticketNumber: 'R 2345 DS',
                          departurePort:
                              'Surabaya - Pelabuhan Tanjung Perak - SUB',
                          arrivalPort:
                              'Lombok - Pelabuhan Lembar/Gilimas - LOM',
                          bookingCode: 'VFGH6896GH',
                          barcodeAssetPath: 'assets/img/barcode.png',
                        ),
                        TicketDetailCard(
                          ferryName: 'UNKNOWN FERRY',
                          price: 'Rp. 300.000',
                          className: 'Kelas III Dewasa',
                          paymentStatus: 'LUNAS',
                          passengerName: 'Pacarnya Uyyeeeeee',
                          ticketNumber: '33034534675',
                          departurePort:
                              'Surabaya - Pelabuhan Tanjung Perak - SUB',
                          arrivalPort:
                              'Lombok - Pelabuhan Lembar/Gilimas - LOM',
                          bookingCode: 'CCC567FGJ',
                          barcodeAssetPath: 'assets/img/barcode.png',
                        ),
                        TicketDetailCard(
                          ferryName: 'UNKNOWN FERRY',
                          price: 'Rp. 300.000',
                          className: 'Kelas III Dewasa',
                          paymentStatus: 'LUNAS',
                          passengerName: 'Pacarnya Uyyeeeeee',
                          ticketNumber: '33034534675',
                          departurePort:
                              'Surabaya - Pelabuhan Tanjung Perak - SUB',
                          arrivalPort:
                              'Lombok - Pelabuhan Lembar/Gilimas - LOM',
                          bookingCode: 'CCC567FGJ',
                          barcodeAssetPath: 'assets/img/barcode.png',
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30), // Add some bottom padding
                ],
              ),
            ),
          ),
          // Scroll-triggered AppBar
          Obx(
            () =>
                controller.isScrolled.value
                    ? Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
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
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Color(0xFF0064D2),
                                ),
                                onPressed:
                                    () => Get.offAllNamed(Routes.MY_TICKET),
                              ),
                              Text(
                                'Detail Tiket',
                                style: semiBold.copyWith(
                                  fontSize: 22,
                                  color: Color(0xFF0064D2),
                                ),
                              ),
                            ],
                          ),
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
