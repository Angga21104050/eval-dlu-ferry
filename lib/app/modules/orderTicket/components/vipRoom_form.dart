import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_ticket_controller.dart';
import '../components/gender_selection.dart';
import '../../../constants/text_style.dart';

class VipRoomForm extends StatelessWidget {
  final int vipRoomCount;
  final OrderTicketController controller;

  const VipRoomForm({
    super.key,
    required this.vipRoomCount,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final RxBool isExpanded = false.obs;

    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Icon(
                    Icons.hotel_outlined,
                    color: Color(0xFF0064D2),
                  ), // Tambahkan icon penumpang di sini
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      'Kamar VIP',
                      style: semiBold.copyWith(
                        fontSize: 16,
                        color: Color(0xFF0064D2),
                      ),
                    ),
                    trailing: Icon(
                      isExpanded.value
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Color(0xFF0064D2),
                    ),
                    onTap: () => isExpanded.value = !isExpanded.value,
                  ),
                ),
              ],
            ),
            if (isExpanded.value)
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16,
                  bottom: 16,
                ),
                child: Column(
                  children: List.generate(vipRoomCount, (i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'VIP Room 1 (1 kasur) ${i + 1}',
                            style: medium.copyWith(fontSize: 14),
                          ),
                          GenderSelection(controller: controller),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: 'KTP',
                                      onChanged: (newValue) {},
                                      items:
                                          ['KTP', 'SIM', 'Paspor'].map((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                      style: regular.copyWith(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 5,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Nomor ID',
                                    labelStyle: regular.copyWith(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Nama Lengkap Sesuai ID',
                              labelStyle: regular.copyWith(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'Nomor Ponsel',
                              labelStyle: regular.copyWith(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Kota',
                              labelStyle: regular.copyWith(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
