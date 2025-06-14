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
        children:
            ['Tuan', 'Nyonya', 'Nona'].map((title) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: regular.copyWith(fontSize: 14)),
                  Radio<String>(
                    value: title,
                    groupValue: controller.gender.value,
                    activeColor: const Color(0xFF0064D2),
                    onChanged: (value) {
                      if (value != null) {
                        controller.gender.value = value;
                      }
                    },
                  ),

                  const SizedBox(width: 8),
                ],
              );
            }).toList(),
      ),
    );
  }
}
