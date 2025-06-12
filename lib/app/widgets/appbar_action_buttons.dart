import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/text_style.dart';

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
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: const Color(0x2BFFFFFF),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Center(child: Icon(icon, color: Colors.white, size: 20)),
      ),
    );
  }

  Widget _buildHelpButton({VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 35,
        width: 86,
        decoration: BoxDecoration(
          color: const Color(0x2BFFFFFF),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.headset_mic_outlined,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 3),
            Text(
              'Bantuan',
              style: light.copyWith(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
