import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import 'package:youthfoundationofindia/design_systems/components/label_with_description.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';

import 'package:youthfoundationofindia/utils/breakpoint.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    int featuresLength = 9;
    int columnSizes = 1;
    int rowSizes = featuresLength;

    if (breakpoint.equals(Breakpoint.desktop)) {
      columnSizes = 3;
      rowSizes = featuresLength ~/ columnSizes;
    } else if (breakpoint.largerThanLaptop) {
      columnSizes = 2;
      rowSizes = featuresLength ~/ columnSizes;
    }

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
                  child: const LabelWithDescription(
                    labelWithDescriptionAlign: LabelWithDescriptionAlign.center,
                    title: 'Youth Foundation Free Services ',
                    subtitle:
                        'ಯದಾ ಯದಾ ಹಿ ಧರ್ಮಸ್ಯ ಗ್ಲಾನಿರ್ಭವತಿ ಭಾರತ | ಅಭ್ಯುತ್ತಾನಮಧರ್ಮಸ್ಯ ತದಾತ್ಮಾನಂ ಸೃಜಾಮ್ಯಹಮ್',
                  ),
                );
              },
            ),
            LayoutGrid(
              rowSizes: List.generate(rowSizes, (_) => auto),
              columnSizes: List.generate(columnSizes, (_) => auto),
              rowGap: 64,
              children: const [
                _ImageItem(
                  path: "assets/image_freechair.png",
                ),
                _ImageItem(
                  path: "assets/image_freecomputer.png",
                ),
                _ImageItem(
                  path: "assets/image_fooddonation.png",
                ),
                _ImageItem(
                  path: "assets/image_yoga.png",
                ),
                _ImageItem(
                  path: "assets/image_oldage.png",
                ),
                _ImageItem(
                  path: "assets/image_blind.png",
                ),
                _ImageItem(
                  path: "assets/image_shadi.png",
                ),
                _ImageItem(
                  path: "assets/image_goshala.png",
                ),
                _ImageItem(
                  path: "assets/image_clean.png",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageItem extends StatelessWidget {
  const _ImageItem({required this.path});
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
