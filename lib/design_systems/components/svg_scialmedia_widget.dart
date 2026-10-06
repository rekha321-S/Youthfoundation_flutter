import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaIcon extends StatelessWidget {
  final String path;
  final Color color;
  final String tooltip;
  final VoidCallback onTap;

  const SocialMediaIcon(
      {super.key,
      required this.path,
      required this.color,
      required this.tooltip,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onTap,
      icon: SvgPicture.asset(
        path,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        height: 32,
        width: 32,
      ),
    );
  }
}
