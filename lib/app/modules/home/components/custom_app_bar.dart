import 'package:flutter/material.dart';
import '../../../widgets/appbar_action_buttons.dart';
import '../../../constants/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String greeting;
  final String username;
  final bool showBottomBorder; // Properti untuk mengontrol border

  const CustomAppBar({
    super.key,
    required this.greeting,
    required this.username,
    this.showBottomBorder = false, // Defaultnya false
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
                    style: regular.copyWith(fontSize: 12, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      username,
                      style: semiBold.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const AppBarActionButtons(),
          ],
        ),
      ),
      bottom: showBottomBorder ? const BorderedDivider() : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class BorderedDivider extends StatelessWidget implements PreferredSizeWidget {
  const BorderedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1.0,
      thickness: 1.0,
      color: Colors.grey, // Warna border sesuai keinginan Anda
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(1.0);
}
