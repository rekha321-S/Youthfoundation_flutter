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
import 'package:youthfoundationofindia/design_systems/typography/text_styles.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    int featuresLength = 6;
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
                    title: 'Youth Foundation Services',
                    subtitle: '"Empowering lives, building a better tomorrow!"',
                  ),
                );
              },
            ),
            LayoutGrid(
              rowSizes: List.generate(rowSizes, (_) => auto),
              columnSizes: List.generate(columnSizes, (_) => auto),
              rowGap: 64,
              children: const [
                _FeatureItem(
                  title: 'Empowering Youth',
                  description:
                      'Youth Foundation is dedicated to uplifting young minds through education, skill development, and community service, fostering a generation of confident, capable, and responsible leaders. 🚀',
                  icon: FeatureRobustWorkflowImage(),
                ),
                _FeatureItem(
                  title: 'Caring Elders',
                  description:
                      'Youth Foundation is committed to supporting and uplifting senior citizens through compassion, care, and community initiatives, ensuring they live with dignity, respect, and joy. ❤️',
                  icon: FeatureFlexibilityImage(),
                ),
                _FeatureItem(
                  title: 'Supporting the Needy',
                  description:
                      'Youth Foundation is dedicated to feeding the needy, ensuring no one sleeps hungry by providing meals with dignity and love.',
                  icon: FeatureUserFriendlyImage(),
                ),
                _FeatureItem(
                  title: 'Promoting Wellness',
                  description:
                      'Youth Foundation promotes physical, mental, and emotional well-being through awareness, support, and community-driven initiatives, empowering everyone to live healthier lives. 🌿💙',
                  icon: FeatureMultipleLayoutsImage(),
                ),
                _FeatureItem(
                  title: 'Child Rights',
                  description:
                      'Youth Foundation advocates for the protection, education, and well-being of children, ensuring they grow up in a safe, supportive environment. 🌍✨',
                  icon: FeatureBetterComponentsImage(),
                ),
                _FeatureItem(
                  title: 'Animal Shelters',
                  description:
                      'Youth Foundation supports animal shelters, providing care, love, and protection for stray and abandoned animals. 🐾❤️',
                  icon: FeatureWellOrganisedImage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;

  final String description;

  final Widget icon;

  @override
  Widget build(BuildContext context) {
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
            Text(
              description,
              style: AppTextStyles.bodyMediumRegular
                  .copyWith(color: AppColors.neutral700),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
