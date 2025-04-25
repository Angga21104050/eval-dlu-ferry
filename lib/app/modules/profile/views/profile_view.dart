import 'package:dlu_project/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../../home/components/custom_navigation_bar.dart';
import '../components/custom_profile_appBar.dart';
import '../components/profile_section.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    // Dapatkan instance dari ProfileController
    final profileController = Get.find<ProfileController>();
    // Akses EditProfileController melalui ProfileController
    final editController = profileController.editProfileController;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomProfileAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              ProfileSection(
                title: "Data Diri",
                items: [
                  ProfileItem(
                    label: "Email/Username",
                    value: editController.profileEmail,
                  ),
                  ProfileItem(
                    label: "Nomor Identitas",
                    value: editController.profileIdentityNumber,
                  ),
                  ProfileItem(label: "Nama", value: editController.profileName),
                  ProfileItem(
                    label: "Jenis Kelamin",
                    value: editController.profileGender,
                  ),
                  ProfileItem(
                    label: "Alamat Desa",
                    value: editController.profileVillageAddress,
                  ),
                  ProfileItem(label: "Kota", value: editController.profileCity),
                  ProfileItem(
                    label: "Nomor Telepon",
                    value: editController.profilePhone,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Tombol Change Password
              ElevatedButton.icon(
                icon: const Icon(Icons.lock, color: Colors.white),
                label: const Text("Change Password"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  // Tambahkan aksi untuk logout
                  Get.toNamed('/change-password');
                },
              ),
              const SizedBox(height: 10),
              // Tombol Log Out
              ElevatedButton.icon(
                icon: const Icon(Icons.exit_to_app, color: Colors.white),
                label: const Text("Log Out"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  // Tambahkan aksi untuk logout
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
