import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onActionPressed;
  const CustomAppBar(
      {super.key,
      required this.titleText,
      this.onLeadingPressed,
      this.onActionPressed});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          if (onLeadingPressed != null) {
            onLeadingPressed!();
          }else {
            context.pop();
          }
        },
        color: const Color(0xFFEE6F57),
      ),
      title: Text(titleText,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18)),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ))
      ],
    );
  }
}
