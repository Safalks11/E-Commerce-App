import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onLogoutPressed;
  final String title;
  final Widget? leading;

  const CustomAppBar({super.key, required this.onLogoutPressed, required this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: leading ?? BackButton(color: Colors.black),
      ),
      title: Text(title),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: const Icon(Icons.logout_rounded),
          onPressed: onLogoutPressed,
          tooltip: 'Logout',
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
