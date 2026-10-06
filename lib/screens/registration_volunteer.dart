import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youthfoundationofindia/design_systems/colors/colors.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/register_background_image.dart';

import 'package:youthfoundationofindia/design_systems/components/assets/volunteer_register_side_image.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';
import 'package:youthfoundationofindia/design_systems/components/responsive_row_column.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';

import '../utils/controllers/image_picker_controller.dart';

class RegisterVountererPage extends StatelessWidget {
  const RegisterVountererPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          LandingRegisterBackground(),
          MaxContainer(child: RegistrationVolunteerPage()),
        ],
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
            const SizedBox(
              height: 50,
            ),
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
                    rowFit: FlexFit.tight, child: VolunteerRegisterSideImage()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterVolunteerForm extends StatefulWidget {
  const RegisterVolunteerForm({super.key});

  @override
  State<RegisterVolunteerForm> createState() => _RegisterVolunteerForm();
}

class _RegisterVolunteerForm extends State<RegisterVolunteerForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _enterYourFullNameController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final FilePickerController filePickerController =
      Get.put(FilePickerController());

  bool isAgreed = false;
  void _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _dobController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final breakpoint = BreakpointProvider.of(context);
    final isMobile = breakpoint.equals(Breakpoint.mobile);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(172, 228, 193, 193),
        Color.fromARGB(173, 212, 227, 220)
      ])),
      child: Form(
        key: _formKey,
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
                    color: AppColors.primary600,
                  ),
                ),
                Spacer(),
                Text(
                  "Apply Volunteer Job",
                  style: TextStyle(
                      color: Color.fromARGB(255, 1, 65, 168), fontSize: 25),
                ),
              ],
            ),
            // const SizedBox(height: 10),
            // const Text(
            //   "Apply volunteer Job",
            //   style: TextStyle(color: AppColors.neutral700),
            // ),
            const SizedBox(height: 10),
            TextFormField(
                style: const TextStyle(fontSize: 14),
                controller: _enterYourFullNameController,
                decoration:
                    const InputDecoration(labelText: "Enter Your Full Name")),
            if (screenWidth < 460) const SizedBox(height: 7),
            const SizedBox(height: 7),
            TextFormField(
                style: const TextStyle(fontSize: 14),
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email ID")),
            const SizedBox(width: 10),
            if (screenWidth < 460) const SizedBox(height: 7),
            const SizedBox(height: 7),
            TextFormField(
              style: const TextStyle(fontSize: 14),
              controller: _phoneController,
              decoration: const InputDecoration(labelText: "Phone Number"),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: InkWell(
                onTap: () => _selectDate(context),
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: "Date of Birth"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _dobController.text.isEmpty
                            ? "Not Selected"
                            : _dobController.text,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const Icon(Icons.calendar_today, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ResponsiveRowColumnItem(
              child: SizedBox(
                width: isMobile ? double.infinity : null,
                child: SelectionContainer.disabled(
                    child: GestureDetector(
                  onTap: () {
                    filePickerController.pickFile();
                  },
                  child: Row(
                    children: [
                      Obx(
                        () => filePickerController.fileName.value.isEmpty
                            ? const Text(
                                "Upload Resume",
                                style: TextStyle(color: AppColors.neutral900),
                              )
                            : const Text(
                                "Uploaded Resume",
                                style: TextStyle(color: AppColors.neutral900),
                              ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.file_upload),
                      const SizedBox(
                        width: 10,
                      ),
                      Obx(
                        () => filePickerController.fileName.value.isNotEmpty
                            ? const Icon(Icons.check_box,
                                color: AppColors.secondary900)
                            : const SizedBox(),
                      ),
                    ],
                  ),
                )),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: isAgreed,
                  onChanged: (value) {
                    setState(() {
                      isAgreed = value!;
                    });
                  },
                ),
                const Text(
                  "I agree with the ",
                  style: TextStyle(color: AppColors.neutral900),
                ),
                InkWell(
                  onTap: () {
                    // Implement Privacy Policy navigation
                  },
                  child: const Text(
                    "Privacy Policy",
                    style: TextStyle(color: AppColors.primary600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const RegisterAndCancel()
          ],
        ),
      ),
    );
  }
}

class VolunteerModel {
  String firstName;
  String lastName;
  String? gender;
  String username;
  String password;
  String email;
  String dob;
  String? state;
  String city;
  String phone;
  String? bloodGroup;

  VolunteerModel({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.username,
    required this.password,
    required this.email,
    required this.dob,
    required this.state,
    required this.city,
    required this.phone,
    required this.bloodGroup,
  });

  @override
  String toString() {
    return "$firstName $lastName, $gender, $username, $email, DOB: $dob, State: $state, City: $city, Phone: $phone, Blood: $bloodGroup";
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
            child: SelectionContainer.disabled(
              child: FilledButton(
                onPressed: () {},
                child: const Text('Register'),
              ),
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: SizedBox(
            width: isMobile ? double.infinity : null,
            child: SelectionContainer.disabled(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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
        ),
      ],
    );
  }
}
