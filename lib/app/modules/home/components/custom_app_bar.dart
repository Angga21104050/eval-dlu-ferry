import 'package:flutter/material.dart';
import '../../../widgets/appbar_action_buttons.dart';

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
            const AppBarActionButtons(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
