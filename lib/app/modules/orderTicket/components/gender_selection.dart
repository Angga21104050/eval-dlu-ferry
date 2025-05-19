import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_ticket_controller.dart';
import '../../../constants/text_style.dart';

class GenderSelection extends StatelessWidget {
  final OrderTicketController controller;

  const GenderSelection({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          SizedBox(
            width: 120,
            child: RadioListTile(
              title: Text(
                'Laki-laki',

                style: regular.copyWith(),
                textAlign: TextAlign.left, // Teks rata kiri
              ),
              value: 'Laki Laki',
              groupValue: controller.gender.value,
              activeColor: const Color(0xFF0064D2), // Warna biru modern
              onChanged: (value) => controller.updateGender(value as String),
              contentPadding: EdgeInsets.zero, // Menghapus padding bawaan
              dense: true, // Membuat tampilan lebih ringkas
              visualDensity: VisualDensity.compact, // Lebih ringkas
            ),
          ),
          Expanded(
            child: RadioListTile(
              title: Text(
                'Perempuan',

                style: regular.copyWith(),
                textAlign: TextAlign.left, // Teks rata kiri
              ),
              value: 'Perempuan',
              groupValue: controller.gender.value,
              activeColor: Colors.blueAccent, // Warna biru modern
              onChanged: (value) => controller.updateGender(value as String),
              contentPadding: EdgeInsets.zero, // Menghapus padding bawaan
              dense: true, // Membuat tampilan lebih ringkas
              visualDensity: VisualDensity.compact, // Lebih ringkas
            ),
          ),
        ],
      ),
    );
  }
}
