import 'package:flutter/material.dart';

class LogoWeightLossRight extends StatelessWidget {
  const LogoWeightLossRight({super.key}) : height = 230;

  const LogoWeightLossRight.larger({super.key}) : height = 55;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/weightlossright.png', height: height);
  }
}
