import 'package:dlu_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartWidget extends StatelessWidget {
  final List<Map<String, dynamic>> cart;

  const CartWidget({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    if (cart.isEmpty)
      return const SizedBox(); // Jangan tampilkan jika keranjang kosong

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Keranjang',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF004AAD), // Biru modern
            ),
          ),
          const SizedBox(height: 10),
          ...cart.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item['class'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    '${item['count']}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF007BFF), // Biru lebih cerah
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          const SizedBox(height: 16), // Spasi sebelum tombol
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.ORDER_TICKET, arguments: cart);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                backgroundColor: const Color(0xFF004AAD), // Biru modern
                foregroundColor: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadowColor: Colors.blue.withOpacity(0.2),
              ),
              child: const Text(
                'Pesan',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
