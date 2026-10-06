import 'package:flutter/material.dart';

class LogIosImage extends StatelessWidget {
  const LogIosImage({super.key}) : height = 120;

  const LogIosImage.larger({super.key}) : height = 152;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logo_ios.png', height: height);
  }
}
