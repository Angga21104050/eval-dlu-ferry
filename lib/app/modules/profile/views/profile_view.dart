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
    return Scaffold(
      appBar: const CustomProfileAppBar(
        profileImage: '',
        name: 'Airlangga',
        email: 'airlangga@example.com',
        phone: '08564346745',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              ProfileSection(
                title: "Data Diri",
                items: const [
                  ProfileItem(
                    label: "Email/Username",
                    value: "sahrulangga@gmail.com",
                  ),
                  ProfileItem(
                    label: "Nomor Identitas",
                    value: "1234567890123456",
                  ),
                  ProfileItem(label: "Nama", value: "Sahrul Angga"),
                  ProfileItem(label: "Jenis Kelamin", value: "Laki-laki"),
                  ProfileItem(label: "Alamat Desa", value: "Desa Sukamaju"),
                  ProfileItem(label: "Kota", value: "Jakarta"),
                  ProfileItem(label: "Nomor Telepon", value: "0819 3756 1790"),
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
