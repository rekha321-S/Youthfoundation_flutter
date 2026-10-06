import 'package:flutter/material.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/logo_android_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/logo_c_cplus_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/logo_flutter_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/logo_ios_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/logo_python_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/logo_sap_image.dart';
import 'package:youthfoundationofindia/design_systems/components/label_with_description.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';

class CourseHeader extends StatelessWidget {
  const CourseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);
    return Column(
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
              margin: const EdgeInsets.only(bottom: 10),
              child: const LabelWithDescription(
                labelWithDescriptionAlign: LabelWithDescriptionAlign.center,
                title: 'Youth Foundation Courses ',
                subtitle: 'For Each Course 1000rs per month.',
              ),
            );
          },
        ),
        const CoursesSection(),
      ],
    );
  }
}

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxContainer(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 32),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Wrap(
                spacing: 64,
                runSpacing: 32,
                alignment: WrapAlignment.center,
                children: [
                  LogoFlutterImage(),
                  LogoPythonImage(),
                  LogoCCImage(),
                  LogoSapImage(),
                  LogIosImage(),
                  LogoAndroidImage(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
