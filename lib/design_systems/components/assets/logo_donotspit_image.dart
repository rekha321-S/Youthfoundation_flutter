import 'package:flutter/material.dart';

class LogoDoNotSpitImage extends StatelessWidget {
  const LogoDoNotSpitImage({super.key}) : height = 230;

  const LogoDoNotSpitImage.larger({super.key}) : height = 55;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/do_not_spit.png', height: height);
  }
}
