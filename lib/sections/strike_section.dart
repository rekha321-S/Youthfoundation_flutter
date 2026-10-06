import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/customised_label_desription.dart';
import 'package:youthfoundationofindia/design_systems/components/label_with_description.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';

class StrikeSection extends StatelessWidget {
  const StrikeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    int featuresLength = 1;
    int columnSizes = 1;
    int rowSizes = featuresLength;

    return MaxContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraint) {
                final fullWidth = constraint.biggest.width;
                final halfWidth = fullWidth / 1.5;

                final width =
                    breakpoint.largerOrEqualToLaptop ? halfWidth : fullWidth;

                return Container(
                  width: width,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 30),
                  child: const CustomLabelWithDescription(
                    labelWithDescriptionAlign: LabelWithDescriptionAlign.center,
                    title:
                        'ಯದಾ ಯದಾ ಹಿ ಧರ್ಮಸ್ಯ ಗ್ಲಾನಿರ್ಭವತಿ ಭಾರತ | ಅಭ್ಯುತ್ತಾನಮಧರ್ಮಸ್ಯ ತದಾತ್ಮಾನಂ ಸೃಜಾಮ್ಯಹಮ್',
                    subtitle:
                        'where there is need of help ,we are always there to serve you',
                  ),
                );
              },
            ),
            LayoutGrid(
              rowSizes: List.generate(rowSizes, (_) => auto),
              columnSizes: List.generate(columnSizes, (_) => auto),
              rowGap: 64,
              children: const [
                _ImageItemStrike(
                  path: "assets/image_protest.png", // Keep only this image
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageItemStrike extends StatelessWidget {
  const _ImageItemStrike({required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Image(
          image: AssetImage(path),
          height: 180,
        ),
      ),
    );
  }
}
