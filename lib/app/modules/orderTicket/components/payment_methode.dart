import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_ticket_controller.dart';
import '../../../constants/text_style.dart';

class PaymentMethodeDropdown extends StatelessWidget {
  final OrderTicketController controller = Get.find<OrderTicketController>();

  PaymentMethodeDropdown({super.key});

  void _showPaymentMethods(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext bc) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_outlined),
                        color: Color(0xFF0064D2),
                      ),
                      Text(
                        'Pilih Metode Pembayaran',
                        style: semiBold.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(color: Colors.grey),
                  ),
                  _buildPaymentCategory(
                    title: 'Virtual Account',
                    methods: controller.virtualAccMethod,
                    selectedMethod: controller.selectedVirtualAccMethod.value,
                    onSelect: controller.selectVirtualAccMethod,
                  ),
                  const SizedBox(height: 16),
                  _buildPaymentCategory(
                    title: 'E-Wallet',
                    methods: controller.eWalletMethod,
                    selectedMethod: controller.selectedEWalletMethod.value,
                    onSelect: controller.selectEWalletMethod,
                  ),
                  const SizedBox(height: 16),
                  _buildPaymentCategory(
                    title: 'Credit Card',
                    methods: controller.creditCardMethod,
                    selectedMethod: controller.selectedCreditCardMethod.value,
                    onSelect: controller.selectCreditCardMethod,
                  ),
                  const SizedBox(height: 16),
                  _buildPaymentCategory(
                    title: 'QRIS',
                    methods: controller.qrisMethod,
                    selectedMethod: controller.selectedQrisMethod.value,
                    onSelect: controller.selectQrisMethod,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPaymentCategory({
    required String title,
    required List<String> methods,
    required String? selectedMethod,
    required Function(String) onSelect,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(title, style: regular.copyWith(fontSize: 16)),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children:
                methods.map((method) {
                  String imagePath = controller.getImagePathForMethod(method);
                  return InkWell(
                    onTap: () {
                      onSelect(method); 
                      Navigator.pop(
                        Get.context!,
                      ); 
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Image.asset(
                              imagePath,
                              width: 36,
                              height: 36,
                              errorBuilder: (context, error, StackTrace) {
                                return const SizedBox(width: 36, height: 36);
                              },
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                method,
                                style: regular.copyWith(fontSize: 16),
                              ),
                            ),
                            Obx(
                              () => 
                                  controller.selectedVirtualAccMethod.value ==
                                              method ||
                                          controller
                                                  .selectedEWalletMethod
                                                  .value ==
                                              method ||
                                          controller
                                                  .selectedCreditCardMethod
                                                  .value ==
                                              method ||
                                          controller.selectedQrisMethod.value ==
                                              method
                                      ? const Icon(
                                        Icons.navigate_next_rounded,
                                        color: Colors.blue,
                                      )
                                      : const SizedBox.shrink(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPaymentMethods(context),
      child: Container(
        height: 47,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(
                0xFF0064D2,
              ).withOpacity(0.35), 
              blurRadius: 6, 
              offset: const Offset(
                0,
                4,
              ), 
            ),
          ],
        ),
        child: Row(
          children: [
            Obx(() {
              String? selectedMethod;
              if (controller.selectedVirtualAccMethod.value != null) {
                selectedMethod = controller.selectedVirtualAccMethod.value;
              } else if (controller.selectedEWalletMethod.value != null) {
                selectedMethod = controller.selectedEWalletMethod.value;
              } else if (controller.selectedCreditCardMethod.value != null) {
                selectedMethod = controller.selectedCreditCardMethod.value;
              } else if (controller.selectedQrisMethod.value != null) {
                selectedMethod = controller.selectedQrisMethod.value;
              }

              if (selectedMethod != null) {
                String imagePath = controller.getImagePathForMethod(
                  selectedMethod,
                );
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Image.asset(
                    imagePath,
                    width: 26,
                    height: 26,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(width: 36, height: 36);
                    },
                  ),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.credit_card, color: Color(0xFF0064D2)),
                );
              }
            }),
            const SizedBox(width: 8),
            Expanded(
              child: Obx(() {
                String selectedMethod = '';
                if (controller.selectedVirtualAccMethod.value != null) {
                  selectedMethod = controller.selectedVirtualAccMethod.value!;
                } else if (controller.selectedEWalletMethod.value != null) {
                  selectedMethod = controller.selectedEWalletMethod.value!;
                } else if (controller.selectedCreditCardMethod.value != null) {
                  selectedMethod = controller.selectedCreditCardMethod.value!;
                } else if (controller.selectedQrisMethod.value != null) {
                  selectedMethod = controller.selectedQrisMethod.value!;
                } else {
                  selectedMethod = 'Pilih Metode Pembayaran';
                }
                return Text(
                  selectedMethod,
                  style: medium.copyWith(
                    fontSize: 14,
                    color:
                        selectedMethod == 'Pilih Metode Pembayaran'
                            ? Colors.grey
                            : Color(0xFF0064D2),
                  ),
                );
              }),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF0064D2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
