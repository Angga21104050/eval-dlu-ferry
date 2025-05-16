import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_ticket_controller.dart';
import '../../edit-profile/controllers/edit_profile_controller.dart';
import '../components/gender_selection.dart';
import '../../../constants/text_style.dart';

class DeatailOrder extends StatefulWidget {
  const DeatailOrder({super.key});

  @override
  State<DeatailOrder> createState() => _DeatailOrderState();
}

class _DeatailOrderState extends State<DeatailOrder> {
  final orderTicketController = Get.put(OrderTicketController());
  final editProfileController = Get.put(EditProfileController());

  @override
  void initState() {
    super.initState();
    // Sinkronisasi gender dari editProfileController ke orderTicketController
    orderTicketController.gender.value =
        editProfileController.genderController.text.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
            Text('Detail Pemesanan', style: semiBold.copyWith(fontSize: 16)),
            const SizedBox(height: 10),

            // Gunakan controller yang sudah di-Get.put di atas
            GenderSelection(controller: orderTicketController),
            const SizedBox(height: 10),

            TextField(
              controller: editProfileController.nameController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(),
                labelText: 'Nama Lengkap Sesuai ID',
                labelStyle: medium.copyWith(fontSize: 14),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF0064D2)),
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

                labelStyle: medium.copyWith(fontSize: 14),
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
                labelStyle: medium.copyWith(fontSize: 14),
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
                labelStyle: medium.copyWith(fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),

            Text(
              'Kontak ini untuk e-tiket dan kebutuhan rescheduling',
              style: regular.copyWith(color: Colors.grey[500], fontSize: 12),
            ),
            const SizedBox(height: 8),

            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Color(0xFF0064D2), Colors.cyan],
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
