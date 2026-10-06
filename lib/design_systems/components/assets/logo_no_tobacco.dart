import 'package:flutter/material.dart';

class LogoNoTobacco extends StatelessWidget {
  const LogoNoTobacco({super.key}) : height = 230;

  const LogoNoTobacco.larger({super.key}) : height = 55;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/no_tobacco.png', height: height);
  }
}
