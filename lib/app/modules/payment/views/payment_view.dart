import 'package:dlu_project/app/modules/payment/components/credit_card_payment_section.dart';
import 'package:dlu_project/app/modules/payment/components/qris_payment_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../orderTicket/controllers/order_ticket_controller.dart';
import '../controllers/payment_controller.dart';
import '../components/ewallet_payment_section.dart';
import '../components/virtual_account_payment_section.dart';
import '../../../widgets/background.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cart = Get.arguments ?? [];
    print('🛒 CART: $cart');
    final orderTicketController = Get.find<OrderTicketController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Background(),
          Column(
            // Menggunakan Column sebagai parent untuk mengatur urutan
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ), // Tambah padding horizontal
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: Get.back,
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Selesaikan Pembayaran',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Visibility(
                          visible:
                              orderTicketController
                                  .selectedVirtualAccMethod
                                  .value !=
                              null,
                          child: VirtualAccountPaymentSection(
                            controller: orderTicketController,
                            cart: cart,
                          ),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible:
                              orderTicketController
                                  .selectedEWalletMethod
                                  .value !=
                              null,
                          child: EWalletPaymentSection(
                            controller: orderTicketController,
                            cart: cart,
                          ),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible:
                              orderTicketController
                                  .selectedCreditCardMethod
                                  .value !=
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
                              orderTicketController.selectedQrisMethod.value !=
                              null,
                          child: QrisPaymentSection(
                            controller: orderTicketController,
                            cart: cart,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [Color(0xFF0064D2), Colors.cyan],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Logika konfirmasi pembayaran
                              Get.offNamed('/transaction-succ');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              'Konfirmasi Pembayaran',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
