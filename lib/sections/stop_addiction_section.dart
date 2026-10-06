import 'package:flutter/material.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/logo_donotspit_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/logo_no_smoke_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/logo_no_tobacco.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';

class StopTobaccoSection extends StatelessWidget {
  const StopTobaccoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxContainer(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 32),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Wrap(
                spacing: 64,
                runSpacing: 32,
                alignment: WrapAlignment.center,
                children: [
                  LogoDoNotSpitImage(),
                  LogoNoTobacco(),
                  LogoNoSmoke(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
