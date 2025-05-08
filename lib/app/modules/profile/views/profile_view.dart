import 'package:dlu_project/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../../home/components/custom_navigation_bar.dart';
import '../components/custom_profile_appBar.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    const appBarHeight = 56.0;
    const additionalPadding = 160.0;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          // Konten utama di bawah AppBar
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: appBarHeight + additionalPadding,
            ), // Padding agar konten turun
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.only(top: 70),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Icon(Icons.person_outlined, color: Colors.blue),
                                SizedBox(width: 16),
                                const Text(
                                  'Informasi Akun',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Divider(color: Colors.blue),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Icon(Icons.settings, color: Colors.blue),
                                SizedBox(width: 16),
                                const Text(
                                  'Setting',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Divider(color: Colors.blue),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/change-password');
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.lock_person_outlined,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 16),
                                const Text(
                                  'Change Password',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Divider(color: Colors.blue),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Icon(Icons.login_outlined, color: Colors.blue),
                                SizedBox(width: 16),
                                const Text(
                                  'Log Out',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Divider(color: Colors.blue),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // AppBar yang ditumpuk di atas
          CustomProfileAppBar(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
