import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/appbar_action_buttons.dart';

class CustomProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final double height;

  const CustomProfileAppBar({super.key, this.height = 230});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF0064D2), const Color(0xFF5200B5)],
            ),
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
                  const SizedBox(height: 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Foto Profil
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('assets/img/contoh.jpeg'),
                        ),
                      ),
                      const SizedBox(width: 12), // Jarak antar elemen
                      // Informasi Pengguna
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'anggaaa',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'user@example.com',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '085423532234',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
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
