import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../orderTicket/components/custom_text_form_field.dart';
import '../../orderTicket/controllers/order_ticket_controller.dart';
import '../controllers/payment_controller.dart';
import '../../myTicket/components/secondary_appbar.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    final orderTicketController = Get.find<OrderTicketController>();

    return Scaffold(
      appBar: const SecCustomAppBar(page: 'Pembayaran'),
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
                Obx(
                  () => Visibility(
                    visible:
                        orderTicketController.selectedVirtualAccMethod.value !=
                        null,
                    child: _buildVirtualAccountPayment(orderTicketController),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible:
                        orderTicketController.selectedEWalletMethod.value !=
                        null,
                    child: _buildEWalletPayment(orderTicketController),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible:
                        orderTicketController.selectedCreditCardMethod.value !=
                        null,
                    child: _buildCreditCardPayment(orderTicketController),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible:
                        orderTicketController.selectedQrisMethod.value != null,
                    child: _buildQrisPayment(orderTicketController),
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

  Widget _buildVirtualAccountPayment(OrderTicketController controller) {
    final selectedVA = controller.selectedVirtualAccMethod.value;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0x330064D2), // shadow biru transparan
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pembayaran Virtual Account',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('Anda telah memilih: ${selectedVA ?? ''}'),
          const SizedBox(height: 16),
          const Text(
            'Informasi Pembayaran:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Nomor Virtual Account: 1234567890'),
          Text('Bank: ${selectedVA?.split(' ').first ?? ''}'),
          const SizedBox(height: 16),
          const Text(
            'Instruksi Pembayaran:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Text('- Buka aplikasi mobile banking Anda.'),
          const Text('- Pilih menu Transfer.'),
          const Text('- Pilih Virtual Account.'),
          const Text('- Masukkan nomor virtual account di atas.'),
          const Text(
            '- Ikuti instruksi selanjutnya untuk menyelesaikan pembayaran.',
          ),
        ],
      ),
    );
  }

  Widget _buildEWalletPayment(OrderTicketController controller) {
    final selectedEWallet = controller.selectedEWalletMethod.value;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0x330064D2),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pembayaran E-Wallet',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('Anda telah memilih: ${selectedEWallet ?? ''}'),
          const SizedBox(height: 16),
          const Text(
            'Instruksi Pembayaran:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('1. Buka aplikasi ${selectedEWallet ?? 'E-Wallet'} Anda.'),
          const Text('2. Cari menu Pembayaran atau Bayar.'),
          Text(
            '3. Ikuti instruksi di dalam aplikasi ${selectedEWallet ?? 'E-Wallet'} untuk menyelesaikan pembayaran.',
          ),
        ],
      ),
    );
  }

  Widget _buildCreditCardPayment(OrderTicketController controller) {
    final selectedCard = controller.selectedCreditCardMethod.value;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0x330064D2),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pembayaran Kartu Kredit',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('Anda telah memilih: ${selectedCard ?? ''}'),
          const SizedBox(height: 16),
          const Text(
            'Detail Kartu Kredit:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const CustomTextFormField(label: 'Nomor Kartu'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: CustomTextFormField(label: 'MM/YY')),
              const SizedBox(width: 16),
              Expanded(child: CustomTextFormField(label: 'CVV')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQrisPayment(OrderTicketController controller) {
    final selectedQris = controller.selectedQrisMethod.value;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0x330064D2),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pembayaran QRIS',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('Anda telah memilih: ${selectedQris ?? ''}'),
          const SizedBox(height: 16),
          const Text(
            'Scan QR Code:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(child: Text('QR Code')),
          ),
        ],
      ),
    );
  }
}
