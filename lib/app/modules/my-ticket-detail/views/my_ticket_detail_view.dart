import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/ticket_detail_card.dart';
import '../controllers/my_ticket_detail_controller.dart';

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
                  // Your existing header
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
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
                        horizontal: 20,
                        vertical: 26,
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
                                const Text(
                                  'Detail Tiket',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
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
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '10:00',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Divider(
                                                color: Colors.black,
                                                thickness: 1,
                                                height: 1,
                                                indent: 8,
                                                endIndent: 8,
                                              ),
                                            ),
                                          ],
                                        ),

                                        Positioned(
                                          left: 5,
                                          top: -3.3,
                                          child: const Icon(
                                            Icons.circle,
                                            size: 8,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Positioned(
                                          left: 138,
                                          top: -3.3,
                                          child: const Icon(
                                            Icons.circle,
                                            size: 8,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '5j 30m',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '15:30',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                              child: Text(
                                'Surabaya....',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Text(
                              'Lombok....',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // ... Your ticket detail content goes here ...
                  TicketDetailCard(
                    ferryName: 'UNKNOWN FERRY',
                    price: 'Rp. 300.000',
                    className: 'Kelas III Dewasa',
                    paymentStatus: 'LUNAS',
                    passengerName: 'Uuyyeeeeee',
                    ticketNumber: '3300552354324',
                    departurePort: 'Surabaya - Pelabuhan Tanjung Perak - SUB',
                    arrivalPort: 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
                    bookingCode: 'CCC568GGJ',
                    barcodeAssetPath: 'assets/img/barcode.png',
                  ),
                  TicketDetailCard(
                    ferryName: 'UNKNOWN FERRY',
                    price: 'Rp. 300.000',
                    className: 'Kelas III Dewasa',
                    paymentStatus: 'LUNAS',
                    passengerName: 'Toyota GT 86',
                    ticketNumber: 'R 2345 DS',
                    departurePort: 'Surabaya - Pelabuhan Tanjung Perak - SUB',
                    arrivalPort: 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
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
                    departurePort: 'Surabaya - Pelabuhan Tanjung Perak - SUB',
                    arrivalPort: 'Lombok - Pelabuhan Lembar/Gilimas - LOM',
                    bookingCode: 'CCC567FGJ',
                    barcodeAssetPath: 'assets/img/barcode.png',
                  ),
                ],
              ),
            ),
          ),

          // Scroll-triggered AppBar
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
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Color(0xFF0064D2),
                              ),
                              onPressed: () => Get.back(),
                            ),
                            const Text(
                              'Detail Tiket',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 36),
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
