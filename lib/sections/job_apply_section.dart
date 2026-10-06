import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youthfoundationofindia/design_systems/colors/colors.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/volunteer_register_side_image.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';
import 'package:youthfoundationofindia/design_systems/components/responsive_row_column.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';
import '../design_systems/components/label_with_description.dart';
import '../utils/controllers/image_picker_controller.dart';

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

class JobApplySection extends StatelessWidget {
  const JobApplySection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    return MaxContainer(
      child: MaxContainer(
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
                  margin: const EdgeInsets.only(bottom: 10),
                  child: LabelWithDescription(
                    labelWithDescriptionAlign: LabelWithDescriptionAlign.center,
                    title: 'Apply job'.toUpperCase(),
                    subtitle:
                        'Bring your skills and compassion to work that strengthens our communities.',
                  ),
                );
              },
            ),
            const RegistrationVolunteerPage(),
          ],
        ),
      ),
    );
  }
}

class RegistrationVolunteerPage extends StatelessWidget {
  const RegistrationVolunteerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            ResponsiveRowColumn(
              layout:
                  breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.laptop),
              columnSpacing: 72,
              children: const [
                ResponsiveRowColumnItem(
                  rowFit: FlexFit.tight,
                  child: RegisterVolunteerForm(),
                ),
                ResponsiveRowColumnItem(
                  rowFit: FlexFit.tight,
                  child: VolunteerRegisterSideImage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterVolunteerForm extends StatelessWidget {
  const RegisterVolunteerForm({super.key});

  @override
  Widget build(BuildContext context) {
    final JobApplySectionController controller =
        Get.put(JobApplySectionController());
    final FilePickerController filePickerController =
        Get.put(FilePickerController());
    final breakpoint = BreakpointProvider.of(context);
    breakpoint.equals(Breakpoint.mobile);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(172, 228, 193, 193),
            Color.fromARGB(173, 212, 227, 220)
          ])),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary600),
                    ),
                    Spacer(),
                    Text(
                      "All Types of Job",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25),
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.fullNameController,
                  decoration:
                      const InputDecoration(labelText: "Enter Your Full Name"),
                ),
                const SizedBox(height: 7),
                TextFormField(
                  controller: controller.emailController,
                  decoration: const InputDecoration(labelText: "Email ID"),
                ),
                const SizedBox(height: 7),
                TextFormField(
                  controller: controller.phoneController,
                  decoration: const InputDecoration(labelText: "Phone Number"),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => controller.selectDate(context),
                  child: InputDecorator(
                    decoration:
                        const InputDecoration(labelText: "Date of Birth"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.dobController.text.isEmpty
                              ? "Not Selected"
                              : controller.dobController.text,
                        ),
                        const Icon(Icons.calendar_today, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: filePickerController.pickFile,
                  child: Obx(() => Row(
                        children: [
                          Text(filePickerController.fileName.value.isEmpty
                              ? "Upload Resume"
                              : "Uploaded Resume"),
                          const SizedBox(width: 10),
                          const Icon(Icons.file_upload),
                          if (filePickerController.fileName.value.isNotEmpty)
                            const Icon(Icons.check_box,
                                color: AppColors.secondary900),
                        ],
                      )),
                ),
                const SizedBox(height: 10),
                Obx(() => Row(
                      children: [
                        Checkbox(
                          value: controller.isAgreed.value,
                          onChanged: (value) =>
                              controller.isAgreed.value = value!,
                        ),
                        const Text("I agree with the "),
                        InkWell(
                          onTap: () {},
                          child: const Text("Privacy Policy",
                              style: TextStyle(color: AppColors.primary600)),
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                const RegisterAndCancel(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RegisterAndCancel extends StatelessWidget {
  const RegisterAndCancel({super.key});

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
            child: FilledButton(
              onPressed: () {},
              child: const Text('Register'),
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: SizedBox(
            width: isMobile ? double.infinity : null,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cancel, size: 24),
                  SizedBox(width: 8),
                  Text('Cancel Register'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
