import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:youthfoundationofindia/design_systems/colors/colors.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/feature_better_component_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/feature_flexibility_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/feature_multiple_layout_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/feature_robust_workflow_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/feature_user_friendly_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/feauture_well_organised_image.dart';
import 'package:youthfoundationofindia/design_systems/components/label_with_description.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';
import 'package:youthfoundationofindia/design_systems/components/responsive_row_column.dart';
import 'package:youthfoundationofindia/design_systems/typography/text_styles.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';

class DonationSection extends StatelessWidget {
  const DonationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    int featuresLength = 12;
    int columnSizes = 2;
    int rowSizes = featuresLength;

    if (breakpoint.equals(Breakpoint.desktop)) {
      columnSizes = 3;
      rowSizes = featuresLength ~/ columnSizes;
    } else if (breakpoint.largerThanLaptop) {
      columnSizes = 2;
      rowSizes = featuresLength ~/ columnSizes;
    } else if (breakpoint.smallerOrEqualToTablet) {
      columnSizes = 1;
    }

    return MaxContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 96),
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
                    title: 'Annadaan (Food Donation)',
                    subtitle:
                        'Our mission is to fight hunger and ensure that no one goes to bed hungry, fostering a healthier and more compassionate society.',
                  ),
                );
              },
            ),
            LayoutGrid(
              rowSizes: List.generate(rowSizes, (_) => auto),
              columnSizes: List.generate(columnSizes, (_) => auto),
              rowGap: 22,
              children: const [
                _DonateItem(
                  title: 'Feed 50 people',
                  icon: FeatureRobustWorkflowImage(),
                  amount: '1501',
                ),
                _DonateItem(
                  title: 'Feed 100 people',
                  icon: FeatureFlexibilityImage(),
                  amount: '3001',
                ),
                _DonateItem(
                  title: 'Feed 200 people',
                  icon: FeatureUserFriendlyImage(),
                  amount: '6001',
                ),
                _DonateItem(
                  title: 'Feed 400 people',
                  icon: FeatureMultipleLayoutsImage(),
                  amount: '12,001',
                ),
                _DonateItem(
                  title: 'Feed 500 people',
                  icon: FeatureWellOrganisedImage(),
                  amount: '15,001',
                ),
                _DonateItem(
                  title: 'Feed 1000 people',
                  icon: FeatureRobustWorkflowImage(),
                  amount: '30,001',
                ),
                _DonateItem(
                  title: 'Feed 2000 people',
                  icon: FeatureFlexibilityImage(),
                  amount: '55,555',
                ),
                _DonateItem(
                  title: 'Feed 3000 people',
                  icon: FeatureUserFriendlyImage(),
                  amount: '1,08,000',
                ),
                _DonateItem(
                  title: 'Feed 6000 people',
                  icon: FeatureMultipleLayoutsImage(),
                  amount: '2,00,000',
                ),
                _DonateItem(
                  title: 'Feed 10,000 people',
                  icon: FeatureBetterComponentsImage(),
                  amount: '3,00,000',
                ),
                _DonateItem(
                  title: 'Feed 16,000 people',
                  icon: FeatureWellOrganisedImage(),
                  amount: '5,00,000',
                ),
                _DonateItem(
                  title: 'Feed 33,000 people',
                  icon: FeatureBetterComponentsImage(),
                  amount: '10,00,000',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DonateItem extends StatelessWidget {
  const _DonateItem({
    required this.title,
    required this.icon,
    required this.amount,
  });

  final String title;
  final String amount;

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);
    final isMobile = breakpoint.equals(Breakpoint.mobile);
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(height: 24),
            Text(
              title,
              style: AppTextStyles.displaySmallBold
                  .copyWith(color: AppColors.neutral900),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            ResponsiveRowColumnItem(
              child: SizedBox(
                width: isMobile ? double.infinity : null,
                child: SelectionContainer.disabled(
                  child: FilledButton(
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Donate ₹ $amount'),
                          content: const SelectableText(
                            'Account Name: YOUTH FOUNDATION OF INDIA\n'
                            'Account Number: 106988700000202\n'
                            'IFSC: YESB0001069\n'
                            'PhonePe: 091080 07133',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text('Donate ₹ $amount'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
