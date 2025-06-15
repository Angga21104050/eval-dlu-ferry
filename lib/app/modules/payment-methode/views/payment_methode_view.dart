import 'package:dlu_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../orderTicket/components/payment_methode.dart';
import '../../orderTicket/controllers/order_ticket_controller.dart';
import '../controllers/payment_methode_controller.dart';
import '../components/header_payment_methode.dart';
import '../../orderTicket/components/summary_card.dart';
import '../../../constants/text_style.dart';
import '../components/syarat_ketentuan.dart';

class PaymentMethodeView extends GetView<PaymentMethodeController> {
  const PaymentMethodeView({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cart = Get.arguments ?? [];
    final orderTicketController = Get.put(OrderTicketController());

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          HeaderPaymentMethode(),
          Container(
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
                SizedBox(height: 8),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 2,
                  ),
                  child: Text(
                    '*Harga tertera sudah terter sudah termasuk pass pelabuhan (penumpang/kendaraan)',
                    style: medium.copyWith(
                      fontSize: 12,
                      color: Color(0xFFB8001F),
                    ),
                  ),
                ),
                //pindah ke sini untuk componeny metode pembayran dan tombol lanjutan
                PaymentMethodeDropdown(),
                TermsAndConditionsCard(),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (bool? value) {},
                        activeColor: Color(0xFF0064D2),
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: regular.copyWith(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: "Dengan ini saya setuju dan mematuhi ",
                              ),
                              TextSpan(
                                text: "syarat dan ketentuan ",
                                style: bold.copyWith(),
                              ),
                              const TextSpan(
                                text:
                                    "perjanjian pengangkutan pelayaran yang dibuat oleh PT. Dharma Lautan Utama",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  width: double.infinity,
                  height: 47,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0064D2), Color(0xFF00DDFF)],
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
                      if (orderTicketController
                              .selectedVirtualAccMethod
                              .value !=
                          null) {
                        Get.toNamed(Routes.PAYMENT, arguments: cart);
                      } else if (orderTicketController
                              .selectedEWalletMethod
                              .value !=
                          null) {
                        Get.toNamed(Routes.PAYMENT, arguments: cart);
                      } else if (orderTicketController
                              .selectedCreditCardMethod
                              .value !=
                          null) {
                        Get.toNamed(Routes.PAYMENT, arguments: cart);
                      } else if (orderTicketController
                              .selectedQrisMethod
                              .value !=
                          null) {
                        Get.toNamed(Routes.PAYMENT, arguments: cart);
                      } else {
                        Get.snackbar(
                          'Peringatan',
                          'Silakan pilih metode pembayaran terlebih dahulu.',
                          snackPosition: SnackPosition.TOP,
                          colorText: Colors.black,
                          margin: const EdgeInsets.all(16),
                        );
                      }
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
        ],
      ),
    );
  }
}
