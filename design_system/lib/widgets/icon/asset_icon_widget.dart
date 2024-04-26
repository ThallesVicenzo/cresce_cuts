import 'package:design_system/enums/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetIconWidget extends StatelessWidget {
  final AppIcons icon;
  final Size size;
  final BoxFit fit;
  final Alignment alignment;
  final Color? backgroundColor;
  final String? package;
  final VoidCallback? onTap;
  final BorderRadius? radius;
  final String? customPath;
  final Size? backgroundSize;

  const AssetIconWidget({
    super.key,
    required this.icon,
    this.onTap,
    this.size = const Size(24, 24),
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.package = 'design_system',
    this.customPath,
    this.radius,
    this.backgroundColor,
    this.backgroundSize,
  });

  String get path => customPath ?? icon.path;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: 1,
      splashColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: radius ?? BorderRadius.circular(4),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          constraints: BoxConstraints(
            minHeight: size.height,
            minWidth: size.width,
            maxHeight: backgroundSize?.height ?? size.height,
            maxWidth: backgroundSize?.width ?? size.width,
          ),
          child: Center(
            child: SvgPicture.asset(
              path,
              semanticsLabel: icon.name,
              width: size.width,
              height: size.height,
              fit: fit,
              alignment: alignment,
              package: package,
            ),
          ),
        ),
      ),
    );
  }
}
