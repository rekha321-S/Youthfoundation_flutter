import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youthfoundationofindia/design_systems/colors/colors.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/register_background_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/register_side_image.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';
import 'package:youthfoundationofindia/design_systems/components/responsive_row_column.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';

import '../utils/controllers/image_picker_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          LandingRegisterBackground(),
          MaxContainer(child: RegistrationPage()),
        ],
      ),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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
                  child: RegisterForm(),
                ),
                ResponsiveRowColumnItem(
                    rowFit: FlexFit.tight, child: RegisterSideImage()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _aadhaarController = TextEditingController();

  String? _selectedGender;
  String? _selectedState;
  String? _selectedBloodGroup;

  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
  ];
  final List<String> _bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];

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

  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final FilePickerController filePickerController =
        Get.put(FilePickerController());

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
                  "Register New Members",
                  style: TextStyle(
                      color: Color.fromARGB(255, 1, 65, 168), fontSize: 25),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        style: const TextStyle(fontSize: 14),
                        controller: _firstNameController,
                        decoration:
                            const InputDecoration(labelText: "First Name"))),
                const SizedBox(width: 10),
                Expanded(
                    child: TextFormField(
                        style: const TextStyle(fontSize: 14),
                        controller: _lastNameController,
                        decoration:
                            const InputDecoration(labelText: "Last Name"))),
              ],
            ),
            if (screenWidth < 460) const SizedBox(height: 7),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    initialValue: _selectedGender,
                    hint: const Text("Gender"),
                    items: _genders
                        .map((gender) => DropdownMenuItem(
                            value: gender, child: Text(gender)))
                        .toList(),
                    onChanged: (value) =>
                        setState(() => _selectedGender = value),
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: DropdownButtonFormField(
                    initialValue: _selectedBloodGroup,
                    hint: const Text("Blood Group"),
                    items: _bloodGroups
                        .map((bg) =>
                            DropdownMenuItem(value: bg, child: Text(bg)))
                        .toList(),
                    onChanged: (value) =>
                        setState(() => _selectedBloodGroup = value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        style: const TextStyle(fontSize: 14),
                        controller: _usernameController,
                        decoration:
                            const InputDecoration(labelText: "Username"))),
                const SizedBox(width: 10),
                Expanded(
                    child: TextFormField(
                        style: const TextStyle(fontSize: 14),
                        obscureText: true,
                        controller: _passwordController,
                        decoration:
                            const InputDecoration(labelText: "Password"))),
              ],
            ),
            if (screenWidth < 460) const SizedBox(height: 7),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => _selectDate(context),
                    child: InputDecorator(
                      decoration:
                          const InputDecoration(labelText: "Date of Birth"),
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
                const SizedBox(width: 7),
                Expanded(
                  child: DropdownButtonFormField(
                    initialValue: _selectedState,
                    hint: const Text("Select State"),
                    items: _states
                        .map((state) =>
                            DropdownMenuItem(value: state, child: Text(state)))
                        .toList(),
                    onChanged: (value) =>
                        setState(() => _selectedState = value),
                  ),
                ),
                const SizedBox(height: 7),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    controller: _cityController,
                    decoration: const InputDecoration(labelText: "City"),
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    controller: _phoneController,
                    decoration:
                        const InputDecoration(labelText: "Phone Number"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            // DropdownButtonFormField(
            //   value: _selectedBloodGroup,
            //   hint: Text("Blood Group"),
            //   items: _bloodGroups
            //       .map((bg) => DropdownMenuItem(value: bg, child: Text(bg)))
            //       .toList(),
            //   onChanged: (value) => setState(() => _selectedBloodGroup = value),
            // ),siz
            const SizedBox(
              height: 10,
            ),
            ResponsiveRowColumnItem(
              child: SizedBox(
                // width: isMobile ? double.infinity : null,
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
                                "Upload Aadhaarcard",
                                style: TextStyle(color: AppColors.neutral900),
                              )
                            : const Text(
                                "Uploaded Aadhaarcard",
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
            TextFormField(
              style: const TextStyle(fontSize: 14),
              controller: _aadhaarController,
              decoration: const InputDecoration(labelText: "Aadhaar Number"),
            ),
            const SizedBox(height: 7),
            const SizedBox(height: 20),
            const SizedBox(height: 10),

            // Terms and Conditions Checkbox
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

class UserModel {
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

  UserModel({
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
