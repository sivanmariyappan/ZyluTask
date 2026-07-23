import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
    required this.title,
    this.onSearchTap,
    this.onMenuTap,
  });

  final Text title;
  final VoidCallback? onSearchTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,    
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: onMenuTap??(){},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: onSearchTap??(){},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}