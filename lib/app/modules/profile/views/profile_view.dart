import 'package:dlu_project/app/modules/home/controllers/home_controller.dart';
import 'package:dlu_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../../home/components/custom_navigation_bar.dart';
import '../components/custom_profile_appBar.dart';
import '../../../constants/text_style.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    const appBarHeight = 56.0;
    const additionalPadding = 140.0;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: appBarHeight + additionalPadding),
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
                                    Get.toNamed(Routes.EDIT_PROFILE);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person_outlined,
                                        color: Color(0xFF0064D2),
                                      ),
                                      SizedBox(width: 16),
                                      Text(
                                        'Informasi Akun',
                                        style: medium.copyWith(fontSize: 14),
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
                                      Text(
                                        'My Voucher',
                                        style: medium.copyWith(fontSize: 14),
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
                                      Text(
                                        'Payment Methodes',
                                        style: medium.copyWith(fontSize: 14),
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
                                      Text(
                                        'Invite Friends',
                                        style: medium.copyWith(fontSize: 14),
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
                                    Get.offAllNamed(Routes.MY_TICKET);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.confirmation_num_outlined,
                                        color: Color(0xFF0064D2),
                                      ),
                                      SizedBox(width: 16),
                                      Text(
                                        'My Order',
                                        style: medium.copyWith(fontSize: 14),
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
                                    Get.toNamed(Routes.INFORMATION);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.question_mark_rounded,
                                        color: Color(0xFF0064D2),
                                      ),
                                      SizedBox(width: 16),
                                      Text(
                                        'Peratutan Berlayar',
                                        style: medium.copyWith(fontSize: 14),
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
                                      Text(
                                        'Change Password',
                                        style: medium.copyWith(fontSize: 14),
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
                                      Text(
                                        'Logout',
                                        style: medium.copyWith(fontSize: 14),
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
          CustomProfileAppBar(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
