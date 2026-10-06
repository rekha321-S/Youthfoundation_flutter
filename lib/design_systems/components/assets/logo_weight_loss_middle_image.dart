import 'package:flutter/material.dart';

class LogoWeightLossMiddle extends StatelessWidget {
  const LogoWeightLossMiddle({super.key}) : height = 230;

  const LogoWeightLossMiddle.larger({super.key}) : height = 55;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/weightlossmiddle.png', height: height);
  }
}
