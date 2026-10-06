import 'package:flutter/material.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';
import 'package:youthfoundationofindia/design_systems/components/responsive_row_column.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';
import 'package:get/get.dart';

import '../design_systems/components/label_with_description.dart';

class JobApplySectionController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  var isAgreed = false.obs;

  void selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      dobController.text =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }
}

class JobApplyPageSection extends StatelessWidget {
  const JobApplyPageSection({super.key});
  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);
    return MaxContainer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: isMobile
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        LayoutBuilder(
                          builder: (context, constraint) {
                            final fullWidth = constraint.biggest.width;
                            final halfWidth = fullWidth / 1.5;

                            final width = breakpoint.largerOrEqualToLaptop
                                ? halfWidth
                                : fullWidth;

                            return Container(
                              width: width,
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(bottom: 10),
                              child: const LabelWithDescription(
                                  labelWithDescriptionAlign:
                                      LabelWithDescriptionAlign.center,
                                  title: 'Join Hands for a Better Tomorrow!',
                                  subtitle:
                                      "Join us to help others!  Youth Foundation works to support communities and bring positive change. Be a part of our mission for a better tomorrow!"),
                            );
                          },
                        ),
                        const ImageContainer(),
                        const SizedBox(height: 20),
                        const ContentContainer(),
                      ],
                    )
                  : Column(
                      children: [
                        LayoutBuilder(
                          builder: (context, constraint) {
                            final fullWidth = constraint.biggest.width;
                            final halfWidth = fullWidth / 1.5;

                            final width = breakpoint.largerOrEqualToLaptop
                                ? halfWidth
                                : fullWidth;

                            return Container(
                              width: width,
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(bottom: 10),
                              child: const LabelWithDescription(
                                  labelWithDescriptionAlign:
                                      LabelWithDescriptionAlign.center,
                                  title:
                                      'Your Help Matters , Become a Volunteer!',
                                  subtitle:
                                      "Join us to help others!  Youth Foundation works to support communities and bring positive change. Be a part of our mission for a better tomorrow!"),
                            );
                          },
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(flex: 1, child: ImageContainer()),
                            SizedBox(width: 20),
                            Expanded(flex: 1, child: ContentContainer()),
                          ],
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/upload_resume.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class ContentContainer extends StatelessWidget {
  const ContentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);
    final isMobile = breakpoint.equals(Breakpoint.mobile);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Join Our Team!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Apply now and be part of an amazing work environment.',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ResponsiveRowColumnItem(
            child: SizedBox(
              width: isMobile ? double.infinity : null,
              child: SelectionContainer.disabled(
                child: FilledButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/volunteerregister');
                  },
                  child: const Text('Volunteer Apply!'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
