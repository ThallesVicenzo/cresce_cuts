import 'package:flutter/material.dart';

import '../colors/colors_palette.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    this.height = 65,
    required this.title,
    required this.hasLeading,
    this.leading,
  });

  final double height;
  final String title;
  final bool hasLeading;
  final void Function()? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: hasLeading,
      shadowColor: const Color(0xff99CCE3),
      elevation: 0.4,
      leading: Visibility(
        visible: hasLeading,
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsPalette.skyBlue,
          ),
          onPressed: leading ??
              () {
                Navigator.pop(context);
              },
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
