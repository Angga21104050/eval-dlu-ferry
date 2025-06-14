import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';
import '../../../constants/text_style.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Colors.blue.shade800,
              elevation: 0,
              leading: IconButton(
                // Menggunakan IconButton untuk tombol back
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ), // Atur warna ikon
                onPressed: () {
                  Get.back();
                },
              ),
              title: Text(
                'Edit Profile',
                style: semiBold.copyWith(fontSize: 18, color: Colors.white),
              ),
            ),
            Positioned(
              bottom: -70,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 58,
                      backgroundImage:
                      // image != null
                      //     ? FileImage(image) as ImageProvider
                      //     : const
                      AssetImage('assets/img/contoh.jpeg'),
                    ),
                  ),

                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // controller.pickImage();
                    },
                    child: Text(
                      "Ganti Foto",
                      style: medium.copyWith(
                        color: const Color(0xFF0064D2),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit Data Diri",
                style: semiBold.copyWith(
                  fontSize: 18,
                  color: Color(0xFF0064D2),
                ),
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: "Email/Username",
                hintController: controller.emailController,
              ),
              _buildTextField(
                label: "Nomor Identitas",
                hintController: controller.identityNumberController,
              ),
              _buildTextField(
                label: "Nama",
                hintController: controller.nameController,
              ),
              _buildTextField(
                label: "Jenis Kelamin",
                hintController: controller.genderController,
              ),
              _buildTextField(
                label: "Alamat Desa",
                hintController: controller.villageAddressController,
              ),
              _buildTextField(
                label: "Kota",
                hintController: controller.cityController,
              ),
              _buildTextField(
                label: "Nomor Telepon",
                hintController: controller.phoneNumberController,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    final updatedProfileData = {
                      'email': controller.emailController.text,
                      'identityNumber':
                          controller.identityNumberController.text,
                      'name': controller.nameController.text,
                      'gender': controller.genderController.text,
                      'villageAddress':
                          controller.villageAddressController.text,
                      'city': controller.cityController.text,
                      'phoneNumber': controller.phoneNumberController.text,
                    };
                    print('Data Profil yang Diperbarui: $updatedProfileData');
                    controller.saveProfile();
                  },
                  child: Text(
                    "Simpan",
                    style: semiBold.copyWith(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController hintController,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: hintController,
            style: regular.copyWith(),
            decoration: InputDecoration(
              label: Text(
                label,
                style: medium.copyWith(
                  color: const Color(0xFFB2B2B2),
                  fontSize: 14,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ), // Adjusted vertical padding
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                ), // More standard enabled border
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
