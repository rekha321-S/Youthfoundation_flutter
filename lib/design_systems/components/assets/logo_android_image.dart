import 'package:flutter/material.dart';

class LogoAndroidImage extends StatelessWidget {
  const LogoAndroidImage({super.key}) : height = 120;

  const LogoAndroidImage.larger({super.key}) : height = 152;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logo_android.png', height: height);
  }
}
