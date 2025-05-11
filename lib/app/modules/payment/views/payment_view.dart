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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: Get.back,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Selesaikan Pembayaran',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
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
                      const SizedBox(height: 8),
                      Center(
                        child: SizedBox(
                          // Menggunakan SizedBox untuk mengatur lebar tombol
                          width:
                              double
                                  .infinity, // Membuat tombol memenuhi lebar parent (Center)
                          child: ElevatedButton(
                            onPressed: () {
                              // Logika konfirmasi pembayaran
                              Get.offNamed('/transaction-succ');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0064D2),
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
