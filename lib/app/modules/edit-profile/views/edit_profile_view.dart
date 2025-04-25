import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';
import 'dart:io';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(170),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Colors.blue.shade800,
              elevation: 0,
              title: const Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Obx(() {
                    final File? image = controller.profileImage;
                    return CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 58,
                        backgroundImage:
                            image != null
                                ? FileImage(image) as ImageProvider
                                : const AssetImage('assets/img/contoh.jpeg'),
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      controller.pickImage();
                    },
                    child: Text(
                      "Ganti Foto",
                      style: TextStyle(
                        color: Colors.blue.shade800,
                        fontWeight: FontWeight.w500,
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
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Edit Data Diri",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
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
                    controller.saveProfile();
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
            decoration: InputDecoration(
              label: Text(
                label,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
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
