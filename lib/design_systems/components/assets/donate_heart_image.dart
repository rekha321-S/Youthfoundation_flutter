import 'package:flutter/material.dart';

class DonateHeartImage extends StatelessWidget {
  const DonateHeartImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.volunteer_activism,
      size: 60,
      color: Color(0xFFE53935),
      semanticLabel: 'Support our community',
    );
  }
}
