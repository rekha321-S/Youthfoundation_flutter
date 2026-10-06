import 'package:flutter/material.dart';

class LogoWeightLossLeft extends StatelessWidget {
  const LogoWeightLossLeft({super.key}) : height = 230;

  const LogoWeightLossLeft.larger({super.key}) : height = 55;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/weightlossleft.png', height: height);
  }
}
