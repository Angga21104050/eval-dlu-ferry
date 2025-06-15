import 'package:dlu_project/app/constants/text_style.dart';
import 'package:dlu_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_ticket_controller.dart';
import '../components/detail_order.dart';
import '../components/summary_card.dart';
import '../../../data/list_tiket_dummy.dart';
import '../components/header_order_ticket.dart';
import '../components/passenger_form.dart';
import '../components/vehicle_form.dart';
import '../components/vipRoom_form.dart';

class OrderTicketView extends GetView<OrderTicketController> {
  const OrderTicketView({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cart = Get.arguments ?? [];
    print('🛒 CART: $cart');
    String ferryName = cart.isNotEmpty ? cart.first['ferryName'] : 'Nama Ferry';
    String departureTime =
        cart.isNotEmpty ? cart.first['departureTime'] : 'Waktu Berangkat';
    String arrivalTime =
        cart.isNotEmpty ? cart.first['arrivalTime'] : 'Waktu Tiba';
    String departurePort =
        cart.isNotEmpty ? cart.first['departurePort'] : 'Pelabuhan Berangkat';
    String arrivalPort =
        cart.isNotEmpty ? cart.first['arrivalPort'] : 'Pelabuhan Tujuan';
    String duration = cart.isNotEmpty ? cart.first['duration'] : 'Durasi';
    String date = cart.isNotEmpty ? cart.first['date'] : 'Tanggal';

    int passengerCount = 0;
    for (var item in cart) {
      if (dummyTicketTypes
          .firstWhere((t) => t.type == 'Penumpang')
          .categories
          .any((cat) => cat.categoryName == item['class'])) {
        passengerCount += (item['count'] as int);
      }
    }

    int vipRoomCount = 0;
    for (var item in cart) {
      if (dummyTicketTypes
          .firstWhere((t) => t.type == 'Kamar VIP')
          .categories
          .any((cat) => cat.categoryName == item['class'])) {
        vipRoomCount += (item['count'] as int);
      }
    }

    int vehicleCount = 0;
    for (var item in cart) {
      if (dummyTicketTypes
          .firstWhere((t) => t.type == 'Kendaraan')
          .categories
          .any((cat) => cat.categoryName == item['class'])) {
        vehicleCount += (item['count'] as int);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          HeaderOrderTicket(),
          NotificationListener<ScrollNotification>(
            onNotification: (_) => true,
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Container(
                margin: EdgeInsets.only(top: 170),
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
                    SizedBox(height: 20),
                    OrderSummaryCard(
                      ferryName: ferryName,
                      departureTime: departureTime,
                      arrivalTime: arrivalTime,
                      duration: duration,
                      date: date,
                      cart: cart,
                      departurePort: departurePort,
                      arrivalPort: arrivalPort,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '*Harga tertera sudah terter sudah termasuk pass pelabuhan (penumpang/kendaraan)',
                        style: medium.copyWith(
                          fontSize: 12,
                          color: Color(0xFFB8001F),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    DeatailOrder(),
                    // Form penumpang
                    if (passengerCount > 0)
                      PassengerForm(
                        passengerCount: passengerCount,
                        controller: controller,
                        cart: cart,
                      ),
                    // Form Kendaraan
                    if (vehicleCount > 0)
                      VehicleForm(vehicleCount: vehicleCount, cart: cart),
                    // Form kamar vip (berulang)
                    if (vipRoomCount > 0)
                      VipRoomForm(
                        vipRoomCount: vipRoomCount,
                        controller: controller,
                      ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16,
                      ),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF0064D2), Colors.cyan],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.PAYMENT_METHODE, arguments: cart);
                        },
                        child: Text(
                          'Lanjutkan Pembayaran',
                          style: semiBold.copyWith(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                            Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Text(
                                'Pemesanan Tiket',
                                style: semiBold.copyWith(
                                  fontSize: 22,
                                  color: Color(0xFF0064D2),
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
    );
  }
}
