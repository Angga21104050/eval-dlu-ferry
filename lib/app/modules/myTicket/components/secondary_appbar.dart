import 'package:flutter/material.dart';
import '../../../widgets/appbar_action_buttons.dart';

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
              child: Text(
                page,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const AppBarActionButtons(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
