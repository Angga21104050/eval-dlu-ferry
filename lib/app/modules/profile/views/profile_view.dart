import 'package:dlu_project/app/modules/home/controllers/home_controller.dart';
import 'package:dlu_project/app/routes/app_pages.dart';
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
    const additionalPadding = 140.0;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
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
                    vertical: 0,
                    horizontal: 0,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                            left: 30,
                            right: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.offNamed(Routes.EDIT_PROFILE);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person_outlined,
                                        color: Color(0xFF0064D2),
                                      ),
                                      SizedBox(width: 16),
                                      const Text(
                                        'Informasi Akun',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(color: Colors.grey.shade400),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 23,
                                        width: 23,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),
                                          border: Border.all(
                                            color: Color(0xFF0064D2),
                                            width: 2,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.percent,
                                          color: Color(0xFF0064D2),
                                          size: 16,
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      const Text(
                                        'My Voucher',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(color: Colors.grey.shade400),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.payment_rounded,
                                        color: Color(0xFF0064D2),
                                      ),
                                      SizedBox(width: 16),
                                      const Text(
                                        'Payment Methodes',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(color: Colors.grey.shade400),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed('');
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person_add_alt_outlined,
                                        color: Color(0xFF0064D2),
                                      ),
                                      SizedBox(width: 16),
                                      const Text(
                                        'Invite Friends',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(color: Colors.grey.shade400),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.MY_TICKET);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.confirmation_num_outlined,
                                        color: Color(0xFF0064D2),
                                      ),
                                      SizedBox(width: 16),
                                      const Text(
                                        'My Order',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 8),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.CHANGE_PASSWORD);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.question_mark_rounded,
                                        color: Color(0xFF0064D2),
                                      ),
                                      SizedBox(width: 16),
                                      const Text(
                                        'Peratutan Berlayar',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(color: Colors.grey.shade400),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.CHANGE_PASSWORD);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.lock_person_outlined,
                                        color: Color(0xFF0064D2),
                                      ),
                                      SizedBox(width: 16),
                                      const Text(
                                        'Change Password',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(color: Colors.grey.shade400),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed('');
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.logout_outlined,
                                        color: Color(0xFF0064D2),
                                      ),
                                      SizedBox(width: 16),
                                      const Text(
                                        'Logout',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
