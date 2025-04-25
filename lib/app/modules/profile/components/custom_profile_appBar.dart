import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/appbar_action_buttons.dart';
import '../controllers/profile_controller.dart';

class CustomProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final double height;

  const CustomProfileAppBar({super.key, this.height = 200});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    final editController = profileController.editProfileController;

    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.blue.shade800,
            image: const DecorationImage(
              image: AssetImage(
                "assets/img/map-global.png",
              ), // Gambar latar belakang
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const AppBarActionButtons(),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Foto Profil
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              editController.savedProfileImage?.path != null &&
                                      editController
                                          .savedProfileImage!
                                          .path
                                          .isNotEmpty
                                  ? FileImage(
                                        File(
                                          editController
                                              .savedProfileImage!
                                              .path,
                                        ),
                                      )
                                      as ImageProvider
                                  : null, // Set backgroundImage menjadi null jika path kosong
                          child:
                              editController.savedProfileImage?.path == null ||
                                      editController
                                          .savedProfileImage!
                                          .path
                                          .isEmpty
                                  ? const Icon(
                                    Icons.person,
                                    size: 40,
                                    color: Colors.grey,
                                  )
                                  : null, // Tampilkan Icon jika path kosong
                        ),
                      ),
                      const SizedBox(width: 12), // Jarak antar elemen
                      // Informasi Pengguna
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => Text(
                                editController.profileName.value,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Obx(
                              () => Text(
                                editController.profileEmail.value,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Obx(
                              () => Text(
                                editController.profilePhone.value,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Ikon Edit
                      IconButton(
                        icon: const Icon(
                          Icons.edit_note_outlined,
                          color: Colors.white,
                          size: 36,
                        ),
                        onPressed: () {
                          // Aksi ketika ikon edit ditekan
                          Get.toNamed('/edit-profile');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
