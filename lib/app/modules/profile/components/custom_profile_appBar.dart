import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/appbar_action_buttons.dart';
import '../../../constants/text_style.dart';

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
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0064D2),
                Color(0xFF0064D2),
                Color(0xFF0064D2),
                Color(0xFF0064D2),
                const Color(0xFF00DDFF),
              ],
            ),
            image: const DecorationImage(
              image: AssetImage(
                "assets/img/map-global.png",
              ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Profile',
                        style: semiBold.copyWith(
                          fontSize: 24,
                          color: Colors.white,
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
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'anggaaa',
                              style: semiBold.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'user@example.com',
                              style: regular.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '085423532234',
                              style: regular.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        icon: const Icon(
                          Icons.edit_note_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
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
