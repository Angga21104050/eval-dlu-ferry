import 'package:flutter/material.dart';

class SecCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String page;

  const SecCustomAppBar({super.key, required this.page});

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
                    page,
                    style: const TextStyle(
                      fontSize: 18,
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
                _buildIconButton(Icons.notifications_none_rounded),
                const SizedBox(width: 3),
                _buildIconButton(Icons.info_outline_rounded),
                const SizedBox(width: 3),
                _buildHelpButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        color: const Color(0x2BFFFFFF),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Center(child: Icon(icon, color: Colors.white, size: 18)),
    );
  }

  Widget _buildHelpButton() {
    return Container(
      height: 28,
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
