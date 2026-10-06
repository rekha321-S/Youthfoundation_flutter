import 'package:flutter/material.dart';

class LogoNoSmoke extends StatelessWidget {
  const LogoNoSmoke({super.key}) : height = 230;

  const LogoNoSmoke.larger({super.key}) : height = 55;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/no_smoke.png', height: height);
  }
}
