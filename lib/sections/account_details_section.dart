import 'package:flutter/material.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/account_integeration_image.dart';
import 'package:youthfoundationofindia/design_systems/components/label_with_description.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';
import 'package:youthfoundationofindia/design_systems/components/responsive_row_column.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';

class IntegrationsSection extends StatelessWidget {
  const IntegrationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    double aspectRatio = 2;

    if (breakpoint.largerOrEqualToTablet) {
      aspectRatio = 3;
    }

    return MaxContainer(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: ResponsiveRowColumn(
          layout: breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.tablet),
          rowSpacing: 32,
          columnSpacing: 48,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              rowFlex: 4,
              child: _Description(),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              rowFlex: 6,
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: const IntegrationsImage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return const LabelWithDescription(
      title: '"Give Hope, Change Lives ~ Donate Today!"',
      subtitle:
          'Account Name : YOUTH FOUNDATION OF INDIA \nAccount Number : 106988700000202 \nIFSC : YESB0001069\nPhone Pay : 091080 07133',
    );
  }
}
