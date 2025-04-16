import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarActionButtons extends StatelessWidget {
  const AppBarActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(
          Icons.notifications_none_rounded,
          onTap: () => Get.toNamed('/notification'),
        ),
        const SizedBox(width: 5),
        _buildIconButton(
          Icons.info_outline_rounded,
          onTap: () => Get.toNamed('/information'),
        ),
        const SizedBox(width: 5),
        _buildHelpButton(onTap: () => Get.toNamed('/help')),
      ],
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

  Widget _buildHelpButton({VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(32),
      child: Container(
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
            Text(
              'Bantuan',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
