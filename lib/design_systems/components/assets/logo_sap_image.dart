import 'package:flutter/material.dart';

class LogoSapImage extends StatelessWidget {
  const LogoSapImage({super.key}) : height = 120;

  const LogoSapImage.larger({super.key}) : height = 152;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logo_sap.png', height: height);
  }
}
