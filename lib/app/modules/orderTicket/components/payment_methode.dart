import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_ticket_controller.dart';

class PaymentMethodeDropdown extends StatelessWidget {
  final OrderTicketController controller = Get.find<OrderTicketController>();

  PaymentMethodeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.3), // Shadow biru
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Judul
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: const Text(
              'Pilih Metode Pembayaran',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          // Virtual Account
          Obx(
            () => GestureDetector(
              onTap: controller.toggleVirtualAccDropdown,
              child: _buildDropdownTile(
                title:
                    controller.selectedVirtualAccMethod.value ??
                    'Virtual Account',
                isSelected: controller.selectedVirtualAccMethod.value != null,
                isExpanded: controller.isExpandedVirtualAcc.value,
              ),
            ),
          ),
          Obx(
            () => _buildDropdownList(
              isVisible: controller.isExpandedVirtualAcc.value,
              items: controller.virtualAccMethod,
              selectedItem: controller.selectedVirtualAccMethod.value,
              onSelect: controller.selectVirtualAccMethod,
            ),
          ),
          _buildDivider(),

          // E-Wallet
          Obx(
            () => GestureDetector(
              onTap: controller.toggleEWalletDropdown,
              child: _buildDropdownTile(
                title: controller.selectedEWalletMethod.value ?? 'E-Wallet',
                isSelected: controller.selectedEWalletMethod.value != null,
                isExpanded: controller.isExpandedEWallet.value,
              ),
            ),
          ),
          Obx(
            () => _buildDropdownList(
              isVisible: controller.isExpandedEWallet.value,
              items: controller.eWalletMethod,
              selectedItem: controller.selectedEWalletMethod.value,
              onSelect: controller.selectEWalletMethod,
            ),
          ),
          _buildDivider(),

          // Credit Card
          Obx(
            () => GestureDetector(
              onTap: controller.toggleCreditCardDropdown,
              child: _buildDropdownTile(
                title:
                    controller.selectedCreditCardMethod.value ?? 'Credit Card',
                isSelected: controller.selectedCreditCardMethod.value != null,
                isExpanded: controller.isExpandedCreditCard.value,
              ),
            ),
          ),
          Obx(
            () => _buildDropdownList(
              isVisible: controller.isExpandedCreditCard.value,
              items: controller.creditCardMethod,
              selectedItem: controller.selectedCreditCardMethod.value,
              onSelect: controller.selectCreditCardMethod,
            ),
          ),
          _buildDivider(),

          // QRIS
          Obx(
            () => GestureDetector(
              onTap: controller.toggleQrisDropdown,
              child: _buildDropdownTile(
                title: controller.selectedQrisMethod.value ?? 'QRIS',
                isSelected: controller.selectedQrisMethod.value != null,
                isExpanded: controller.isExpandedQris.value,
              ),
            ),
          ),
          Obx(
            () => _buildDropdownList(
              isVisible: controller.isExpandedQris.value,
              items: controller.qrisMethod,
              selectedItem: controller.selectedQrisMethod.value,
              onSelect: controller.selectQrisMethod,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownTile({
    required String title,
    required bool isSelected,
    required bool isExpanded,
  }) {
    final OrderTicketController controller = Get.find<OrderTicketController>();
    String? imagePath;

    // Tentukan imagePath jika ada metode yang dipilih
    if (isSelected) {
      imagePath = controller.getImagePathForMethod(title);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          if (isSelected &&
              imagePath != null) // Tampilkan gambar jika ada yang dipilih
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset(
                imagePath,
                width: 36,
                height: 36,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(width: 36, height: 36);
                },
              ),
            ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue : Colors.black87,
              ),
            ),
          ),
          Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownList({
    required bool isVisible,
    required List<String> items,
    required String? selectedItem,
    required Function(String) onSelect,
  }) {
    final OrderTicketController controller = Get.find<OrderTicketController>();
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children:
              items.map((method) {
                String imagePath = controller.getImagePathForMethod(method);

                return InkWell(
                  onTap: () => onSelect(method),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                        Expanded(child: Text(method)),
                        if (selectedItem == method)
                          const Icon(Icons.check, color: Colors.green),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      thickness: 1,
      height: 0,
      color: Colors.grey,
      indent: 16,
      endIndent: 16,
    );
  }
}
