import 'package:flutter/material.dart';

class LogoFlutterImage extends StatelessWidget {
  const LogoFlutterImage({super.key}) : height = 120;

  const LogoFlutterImage.larger({super.key}) : height = 32;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logo_flutter.png', height: height);
  }
}

