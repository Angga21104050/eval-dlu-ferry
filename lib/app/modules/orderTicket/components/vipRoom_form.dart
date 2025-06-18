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
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Icon(
                    Icons.hotel_outlined,
                    color: Color(0xFF0064D2),
                  ), 
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      'Kamar VIP',
                      style: semiBold.copyWith(
                        fontSize: 18,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                              ['KTP', 'SIM', 'Paspor'].map((
                                                value,
                                              ) {
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
                                    child: SizedBox(
                                      height: 47,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFF0064D2),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          floatingLabelStyle: light.copyWith(
                                            fontSize: 14,
                                            color: Color(
                                              0xFF0064D2,
                                            ), // warna label saat fokus
                                          ),
                                          labelText: 'Nomor ID',
                                          labelStyle: regular.copyWith(
                                            fontSize: 14,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 47,
                                child: TextField(
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFF0064D2),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    floatingLabelStyle: light.copyWith(
                                      fontSize: 14,
                                      color: Color(
                                        0xFF0064D2,
                                      ), 
                                    ),
                                    labelText: 'Nama Lengkap Sesuai ID',
                                    labelStyle: regular.copyWith(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 47,
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFF0064D2),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    floatingLabelStyle: light.copyWith(
                                      fontSize: 14,
                                      color: Color(
                                        0xFF0064D2,
                                      ), 
                                    ),
                                    labelText: 'Nomor Ponsel',
                                    labelStyle: regular.copyWith(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 47,
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFF0064D2),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    floatingLabelStyle: light.copyWith(
                                      fontSize: 14,
                                      color: Color(
                                        0xFF0064D2,
                                      ), 
                                    ),
                                    labelText: 'Kota',
                                    labelStyle: regular.copyWith(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                height: 43,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFFF411F),
                                      Color(0xFFFF411F),
                                      Color(0xFFFF411F),
                                      Color(0xFF00000),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    // Aksi tombol
                                  },
                                  child: Text(
                                    'Hapus Penumpang',
                                    style: semiBold.copyWith(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pass Penumpang',
                                      style: medium.copyWith(
                                        fontSize: 12,
                                        color: Color(0xFF757575),
                                      ),
                                    ),
                                    Text(
                                      '30.000',
                                      style: semiBold.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      height: 43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF0064D2), Color(0xFF00DDFF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                        },
                        child: Text(
                          'Tambahkan Penumpang',
                          style: semiBold.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tarif VIP',
                          style: medium.copyWith(
                            fontSize: 12,
                            color: Color(0xFF757575),
                          ),
                        ),
                        Text('300.000', style: semiBold.copyWith(fontSize: 12)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pass VIP',
                          style: medium.copyWith(
                            fontSize: 12,
                            color: Color(0xFF757575),
                          ),
                        ),
                        Text('30.000', style: semiBold.copyWith(fontSize: 12)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Subtotal Berangkat',
                          style: medium.copyWith(
                            fontSize: 12,
                            color: Color(0xFF757575),
                          ),
                        ),
                        Text('330.000', style: semiBold.copyWith(fontSize: 12)),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
