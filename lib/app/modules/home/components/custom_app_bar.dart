import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String greeting;
  final String username;

  const CustomAppBar({
    super.key,
    required this.greeting,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF0064D2),
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    greeting,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    username,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                _buildIconButton(
                  Icons.notifications_none_rounded,
                  onTap: () {
                    Get.toNamed('/notification');
                  },
                ),
                const SizedBox(width: 5),
                _buildIconButton(
                  Icons.info_outline_rounded,
                  onTap: () {
                    Get.toNamed('/information');
                  },
                ),
                const SizedBox(width: 5),
                _buildHelpButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(32),
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: const Color(0x2BFFFFFF),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Center(child: Icon(icon, color: Colors.white, size: 18)),
      ),
    );
  }

  Widget _buildHelpButton() {
    return Container(
      height: 32,
      width: 80,
      decoration: BoxDecoration(
        color: const Color(0x2BFFFFFF),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.headset_mic_outlined, color: Colors.white, size: 18),
          SizedBox(width: 3),
          Text('Bantuan', style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
