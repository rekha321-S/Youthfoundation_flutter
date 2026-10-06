import 'package:flutter/material.dart';

class LandingRegisterBackground extends StatelessWidget {
  const LandingRegisterBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Image.asset(
      'assets/landing_register_background.png',
      width: double.infinity,
      fit: BoxFit.cover,
      height: height,
    );
  }
}
