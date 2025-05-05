import 'package:dlu_project/app/modules/payment/components/credit_card_payment_section.dart';
import 'package:dlu_project/app/modules/payment/components/qris_payment_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../orderTicket/controllers/order_ticket_controller.dart';
import '../controllers/payment_controller.dart';
import '../components/ewallet_payment_section.dart';
import '../components/virtual_account_payment_section.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cart = Get.arguments ?? [];
    print('🛒 CART: $cart');
    final orderTicketController = Get.find<OrderTicketController>();

    return Scaffold(
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
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: Get.back,
                        icon: Icon(
                          Icons.arrow_back,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          size: 26,
                        ),
                      ),
                      Text(
                        'Selesaikan Pembayaran',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible:
                        orderTicketController.selectedVirtualAccMethod.value !=
                        null,
                    child: VirtualAccountPaymentSection(
                      // Gunakan widget yang diimpor
                      controller: orderTicketController,
                      cart: cart,
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible:
                        orderTicketController.selectedEWalletMethod.value !=
                        null,
                    child: EWalletPaymentSection(
                      // Gunakan widget yang diimpor
                      controller: orderTicketController,
                      cart: cart,
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible:
                        orderTicketController.selectedCreditCardMethod.value !=
                        null,
                    child: CreditCardPaymentSection(
                      controller: orderTicketController,
                      cart: cart,
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible:
                        orderTicketController.selectedQrisMethod.value != null,
                    child: QrisPaymentSection(
                      controller: orderTicketController,
                      cart: cart,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Logika konfirmasi pembayaran (mungkin perlu disesuaikan)
                      Get.offNamed('/transaction-succ');
                    },
                    child: const Text('Konfirmasi Pembayaran'),
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
