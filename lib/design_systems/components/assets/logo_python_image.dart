import 'package:flutter/material.dart';

class LogoPythonImage extends StatelessWidget {
  const LogoPythonImage({super.key}) : height = 120;

  const LogoPythonImage.larger({super.key}) : height = 152;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logo_python.png', height: height);
  }
}