import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_ticket_controller.dart';
import '../../edit-profile/controllers/edit_profile_controller.dart';
import '../../../constants/text_style.dart';

class DeatailOrder extends StatefulWidget {
  const DeatailOrder({super.key});

  @override
  State<DeatailOrder> createState() => _DeatailOrderState();
}

class _DeatailOrderState extends State<DeatailOrder> {
  final orderTicketController = Get.put(OrderTicketController());
  final editProfileController = Get.put(EditProfileController());

  String selectedTitle = 'Tuan'; // Default

  @override
  void initState() {
    super.initState();
    final initialGender = editProfileController.genderController.text.trim();
    selectedTitle =
        ['Tuan', 'Nyonya', 'Nona'].contains(initialGender)
            ? initialGender
            : 'Tuan';

    orderTicketController.gender.value = selectedTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Data Pemesanan', style: semiBold.copyWith(fontSize: 16)),
            Row(
              children:
                  ['Tuan', 'Nyonya', 'Nona'].map((title) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(title, style: regular.copyWith(fontSize: 14)),
                        Radio<String>(
                          value: title,
                          groupValue: selectedTitle,
                          activeColor: const Color(0xFF0064D2),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedTitle = value;
                                editProfileController.genderController.text =
                                    value;
                                orderTicketController.gender.value = value;
                              });
                            }
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    );
                  }).toList(),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: editProfileController.nameController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF0064D2)),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Nama Lengkap Sesuai ID',
                labelStyle: light.copyWith(
                  fontSize: 14,
                  color: Color(0xFF757575),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: editProfileController.phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Nomor Ponsel',
                labelStyle: light.copyWith(
                  fontSize: 14,
                  color: Color(0xFF757575),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF0064D2)),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: editProfileController.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Alamat Email',
                labelStyle: light.copyWith(
                  fontSize: 14,
                  color: Color(0xFF757575),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF0064D2)),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: editProfileController.cityController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Kota',
                labelStyle: light.copyWith(
                  fontSize: 14,
                  color: Color(0xFF757575),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF0064D2)),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              'Kontak ini untuk e-tiket dan kebutuhan rescheduling',
              style: medium.copyWith(
                color: const Color(0xFFB3B3B3),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            Container(
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
                  // Aksi tombol
                },
                child: Text(
                  'Tambahkan Sebagai Penumpang 1',
                  style: semiBold.copyWith(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
