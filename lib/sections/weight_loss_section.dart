import 'package:flutter/material.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/logo_weight_loss_middle_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/logo_weight_loss_right_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/logo_weightloss_left_image.dart';
import 'package:youthfoundationofindia/design_systems/components/label_with_description.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';

class WeightLossProducts extends StatelessWidget {
  const WeightLossProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);
    return MaxContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
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
                  margin: const EdgeInsets.only(bottom: 64),
                  child: const LabelWithDescription(
                    labelWithDescriptionAlign: LabelWithDescriptionAlign.center,
                    title: 'Youth Foundation Products',
                    subtitle:
                        'Youth Foundation offers a range of products designed to support healthy weight management, catering to both weight loss and weight gain goals.',
                  ),
                );
              },
            ),
            const Wrap(
              spacing: 64,
              runSpacing: 32,
              alignment: WrapAlignment.center,
              children: [
                LogoWeightLossLeft(),
                LogoWeightLossMiddle(),
                LogoWeightLossRight(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
