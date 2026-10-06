import 'package:flutter/material.dart';
import 'package:youthfoundationofindia/design_systems/colors/colors.dart';
import 'package:youthfoundationofindia/design_systems/components/label_with_description.dart';
import 'package:youthfoundationofindia/design_systems/typography/text_styles.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';

enum CustomLabelWithDescriptionAlign { start, center }

enum CustomLabelWithDescriptionType { title, heading, small }

class CustomLabelWithDescription extends StatelessWidget {
  const CustomLabelWithDescription({
    super.key,
    required this.title,
    required this.subtitle,
    this.labelWithDescriptionAlign = LabelWithDescriptionAlign.start,
    this.labelWithDescriptionType = LabelWithDescriptionType.title,
  });

  final String title;

  final String subtitle;

  final LabelWithDescriptionAlign labelWithDescriptionAlign;

  final LabelWithDescriptionType labelWithDescriptionType;

  CrossAxisAlignment get crossAxisAlignment {
    if (labelWithDescriptionAlign == LabelWithDescriptionAlign.start) {
      return CrossAxisAlignment.start;
    }

    return CrossAxisAlignment.center;
  }

  TextAlign get textAlign {
    if (labelWithDescriptionAlign == LabelWithDescriptionAlign.start) {
      return TextAlign.start;
    }

    return TextAlign.center;
  }

  TextStyle titleStyle(Breakpoint breakpoint) {
    TextStyle style;

    switch (labelWithDescriptionType) {
      case LabelWithDescriptionType.title:
        if (breakpoint.largerOrEqualToLaptop) {
          style = AppTextStyles.displayLargeBold;
        } else if (breakpoint.largerOrEqualToTablet) {
          style = AppTextStyles.displayMediumBold;
        } else {
          style = AppTextStyles.displaySmallBold;
        }
      case LabelWithDescriptionType.heading:
        if (breakpoint.largerOrEqualToLaptop) {
          style = AppTextStyles.displayExtraLargeBold;
        } else if (breakpoint.largerOrEqualToTablet) {
          style = AppTextStyles.displayLargeBold;
        } else {
          style = AppTextStyles.displayMediumBold;
        }
      case LabelWithDescriptionType.small:
        if (breakpoint.largerOrEqualToLaptop) {
          style = AppTextStyles.displayMediumBold;
        } else if (breakpoint.largerOrEqualToTablet) {
          style = AppTextStyles.displaySmallBold;
        } else {
          style = AppTextStyles.displayExtraSmallBold;
        }
    }

    return style;
  }

  TextStyle subtitleStyle(Breakpoint breakpoint) {
    TextStyle style;

    switch (labelWithDescriptionType) {
      case LabelWithDescriptionType.title:
        if (breakpoint.largerOrEqualToLaptop) {
          style = AppTextStyles.bodyLargeRegular;
        } else if (breakpoint.largerOrEqualToTablet) {
          style = AppTextStyles.bodyLargeRegular;
        } else {
          style = AppTextStyles.bodyMediumRegular;
        }
      case LabelWithDescriptionType.heading:
        style = AppTextStyles.bodyLargeRegular;
      case LabelWithDescriptionType.small:
        if (breakpoint.largerOrEqualToLaptop) {
          style = AppTextStyles.bodyMediumRegular;
        } else if (breakpoint.largerOrEqualToTablet) {
          style = AppTextStyles.bodyMediumRegular;
        } else {
          style = AppTextStyles.bodySmallRegular;
        }
    }

    return style;
  }

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: titleStyle(breakpoint).copyWith(color: AppColors.neutral900),
          textAlign: textAlign,
        ),
        if (labelWithDescriptionType == LabelWithDescriptionType.heading) ...{
          const SizedBox(height: 16),
        } else if (labelWithDescriptionType ==
            LabelWithDescriptionType.title) ...{
          const SizedBox(height: 8),
        },
        Text(
          subtitle,
          style: subtitleStyle(breakpoint)
              .copyWith(color: const Color.fromARGB(255, 21, 85, 222)),
          textAlign: textAlign,
        ),
      ],
    );
  }
}
