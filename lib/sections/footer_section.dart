import 'package:flutter/material.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/app_store_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/google_play_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/logo_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/text_link_button.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';
import 'package:youthfoundationofindia/design_systems/components/responsive_row_column.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';

import '../design_systems/colors/colors.dart';
import '../design_systems/typography/text_styles.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    return Container(
      color: Colors.black,
      width: double.infinity,
      child: MaxContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64),
          child: ResponsiveRowColumn(
            layout: breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.tablet),
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            rowSpacing: 32,
            columnSpacing: 32,
            children: const [
              ResponsiveRowColumnItem(
                  rowFit: FlexFit.tight, child: _Information()),
              ResponsiveRowColumnItem(rowFit: FlexFit.tight, child: _GetApps()),
            ],
          ),
        ),
      ),
    );
  }
}

class _Information extends StatelessWidget {
  const _Information();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: LogoImage(),
        ),
        const SizedBox(height: 24),
        Wrap(
          children: [
            TextLinkButton.dark('Donate Now', () {}),
            TextLinkButton.dark('License', () {}),
          ],
        ),
        Wrap(
          children: [
            TextLinkButton.dark('About', () {}),
            TextLinkButton.dark('Features', () {}),
            TextLinkButton.dark('Donation', () {}),
            TextLinkButton.dark('News', () {}),
            TextLinkButton.dark('Help', () {}),
            TextLinkButton.dark('Contact', () {}),
          ],
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            '© 2025 Youth Foundation of India. All rights reserved',
            style: AppTextStyles.bodySmallRegular
                .copyWith(color: AppColors.neutral300),
          ),
        ),
      ],
    );
  }
}

class _GetApps extends StatelessWidget {
  const _GetApps();

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    return Align(
      alignment: breakpoint.largerOrEqualToTablet
          ? Alignment.topRight
          : Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get the App',
              style: AppTextStyles.bodyLargeMedium
                  .copyWith(color: AppColors.neutral300),
            ),
            const SizedBox(height: 16),
            const GooglePlayImage(),
            const SizedBox(height: 16),
            const AppStoreImage(),
          ],
        ),
      ),
    );
  }
}
