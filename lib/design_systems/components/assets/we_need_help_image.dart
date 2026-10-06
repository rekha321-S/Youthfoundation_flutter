import 'package:flutter/material.dart';
import 'package:youthfoundationofindia/design_systems/components/responsive_row_column.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';

class WeNeedHelpImage extends StatelessWidget {
  const WeNeedHelpImage({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);
    final isMobile = breakpoint.equals(Breakpoint.mobile);

    return ResponsiveRowColumn(
      rowSpacing: 16,
      columnSpacing: 8,
      layout: breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.tablet),
      children: [
        ResponsiveRowColumnItem(
          child: SizedBox(
              width: isMobile ? double.infinity : null,
              child: Image.asset('assets/weneedyourhelp.png')),
        ),
        ResponsiveRowColumnItem(
          child: SizedBox(
              width: isMobile ? double.infinity : null,
              child: Image.asset('assets/80g12a.png')),
        ),
      ],
    );
  }
}
