import 'package:flutter/material.dart';

class DonateIconImage extends StatelessWidget {
  const DonateIconImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.volunteer_activism,
      size: 32,
      semanticLabel: 'Donate',
    );
  }
}
