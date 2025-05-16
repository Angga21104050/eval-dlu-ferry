import 'package:dlu_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/text_style.dart';

class CartWidget extends StatelessWidget {
  final List<Map<String, dynamic>> cart;
  final List<Map<String, dynamic>> ferryTickets; // Tambahkan ini
  final VoidCallback onClearCart;

  const CartWidget({
    super.key,
    required this.cart,
    required this.ferryTickets, // Wajib diisi
    required this.onClearCart,
  });

  double _getPriceForItem(Map<String, dynamic> cartItem) {
    final ticketData = ferryTickets.firstWhere(
      (ticket) =>
          (ticket['ticketType'] as List).contains(cartItem['ticketType']) ||
          ticket['ticketType'] == cartItem['ticketType'],
      orElse: () => {'price': 300000},
    );
    return (ticketData['price'] is num
                ? ticketData['price']
                : double.tryParse(ticketData['price']?.toString() ?? '0.0'))
            ?.toDouble() ??
        0.0;
  }

  @override
  Widget build(BuildContext context) {
    if (cart.isEmpty) return const SizedBox();

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Keranjang',
            style: semiBold.copyWith(fontSize: 16, color: Color(0xFF004AAD)),
          ),
          const SizedBox(height: 4),
          ...cart.map((item) {
            final price = _getPriceForItem(item);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            item['class'],
                            style: semiBold.copyWith(fontSize: 12),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '(${item['count']})',
                          textAlign: TextAlign.start,
                          style: semiBold.copyWith(
                            fontSize: 12,
                            color: Color(0xFF007BFF),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Flexible(
                    flex: 2,
                    child: Text(
                      'Rp ${price.toStringAsFixed(0)}', // Tampilkan harga yang ditemukan
                      textAlign: TextAlign.end,
                      style: semiBold.copyWith(
                        fontSize: 14,
                        color: Color(0xFF007BFF),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 36,
                height: 36,
                margin: const EdgeInsets.only(right: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: ElevatedButton(
                  onPressed: onClearCart,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadowColor: Colors.red.withOpacity(0.2),
                  ),
                  child: const Icon(Icons.delete, size: 20),
                ),
              ),
              Container(
                width: 70,
                height: 36,
                margin: const EdgeInsets.only(left: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF0064D2),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.ORDER_TICKET, arguments: cart);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadowColor: Colors.blue.withOpacity(0.2),
                  ),
                  child: Text('Pesan', style: medium.copyWith(fontSize: 14)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
