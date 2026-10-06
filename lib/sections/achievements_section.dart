import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/achievement_meals_perday.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/achievement_sponsors_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/achievement_state_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/acievement_members_image.dart';
import 'package:youthfoundationofindia/design_systems/components/label_with_description.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';
import 'package:youthfoundationofindia/design_systems/components/responsive_row_column.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    return MaxContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: ResponsiveRowColumn(
          layout: breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.laptop),
          rowSpacing: 32,
          columnSpacing: 48,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ResponsiveRowColumnItem(
                rowFit: FlexFit.tight, child: _LabelWithDescription()),
            ResponsiveRowColumnItem(
                rowFit: FlexFit.tight, child: _Achievements()),
          ],
        ),
      ),
    );
  }
}

class _LabelWithDescription extends StatelessWidget {
  const _LabelWithDescription();

  @override
  Widget build(BuildContext context) {
    return const LabelWithDescription(
      title: 'Our 14 years of achievements',
      subtitle: 'With our super powers we have reached this',
    );
  }
}

class _Achievements extends StatelessWidget {
  const _Achievements();

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    int rowSizes = 4;
    int columnSizes = 1;

    if (breakpoint.largerOrEqualToLaptop) {
      rowSizes = 2;
      columnSizes = 2;
    }

    return LayoutGrid(
      rowSizes: List.generate(rowSizes, (_) => auto),
      columnSizes: List.generate(columnSizes, (_) => auto),
      rowGap: 40,
      columnGap: 32,
      children: const [
        _AchievementItem(
          icon: AchievementDownloadImage(),
          title: '500 +',
          subtitle: 'Meals per day',
        ),
        _AchievementItem(
          icon: AchievementUsersImage(),
          title: '1,000 +',
          subtitle: 'Members',
        ),
        _AchievementItem(
          icon: AchievementClientsImage(),
          title: '200 +',
          subtitle: 'Sponsors',
        ),
        _AchievementItem(
          icon: AchievementCountriesImage(),
          title: '20 +',
          subtitle: 'States',
        ),
      ],
    );
  }
}

class _AchievementItem extends StatelessWidget {
  const _AchievementItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final Widget icon;

  final String title;

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 16),
        Expanded(
          child: LabelWithDescription(
            title: title,
            subtitle: subtitle,
            labelWithDescriptionType: LabelWithDescriptionType.small,
          ),
        ),
      ],
    );
  }
}
