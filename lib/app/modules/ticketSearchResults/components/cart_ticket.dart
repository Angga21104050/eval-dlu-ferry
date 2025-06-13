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

  double _getTotalPrice() {
    return cart.fold(0.0, (total, item) {
      final price = _getPriceForItem(item);
      return total + (price * (item['count'] ?? 1));
    });
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
            style: bold.copyWith(fontSize: 16, color: Color(0xFF0064D2)),
          ),
          const SizedBox(height: 4),
          ...cart.map((item) {
            final price = _getPriceForItem(item);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 4,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item['class'],
                                style: medium.copyWith(fontSize: 14),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '(${item['count']})',
                              textAlign: TextAlign.start,
                              style: medium.copyWith(
                                fontSize: 14,
                                color: Color(0xFF0064D2),
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
                  const SizedBox(height: 16),
                ],
              ),
            );
          }).toList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: semiBold.copyWith(fontSize: 14)),
              Text(
                'Rp ${_getTotalPrice().toStringAsFixed(0)}',
                style: bold.copyWith(fontSize: 16, color: Color(0xFF007BFF)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 47,
            margin: const EdgeInsets.only(left: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [Color(0xFF0064D2), Color(0xFF00DDFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.ORDER_TICKET, arguments: cart);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.transparent,
              ),
              child: Text('Pesan', style: semiBold.copyWith(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
