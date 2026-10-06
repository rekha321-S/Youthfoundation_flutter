import 'package:flutter/material.dart';

class LogoCCImage extends StatelessWidget {
  const LogoCCImage({super.key}) : height = 120;

  const LogoCCImage.larger({super.key}) : height = 152;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logo_cc++.png', height: height);
  }
}
