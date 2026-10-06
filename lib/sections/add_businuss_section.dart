import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youthfoundationofindia/design_systems/colors/colors.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/register_side_image.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';
import 'package:youthfoundationofindia/design_systems/components/responsive_row_column.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';
import '../design_systems/components/label_with_description.dart';
import 'package:path/path.dart' as path;

class AddBusinussController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final ownerName = TextEditingController();
  final phoneNumber = TextEditingController();
  final emailId = TextEditingController();
  final businussName = TextEditingController();
  final dobController = TextEditingController();
  final RxString gstFileName = "".obs;
  final RxString aadhaarNumberName = "".obs;
  final RxString pancarNumberName = "".obs;
  final RxString videoFileName = "".obs;
  final RxString photoOneName = "".obs;
  final RxString photoTwoName = "".obs;

  //gst
  // Observable variable

  Future<void> gstPickerFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'], // Allow images and PDFs
    );

    if (result != null && result.files.single.path != null) {
      gstFileName.value =
          path.basename(result.files.single.path!); // Extract file name
    } else {
      fileName.value = "No file selected";
    }
  }

  //pancard

  Future<void> pancardPickerFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'], // Allow images and PDFs
    );

    if (result != null && result.files.single.path != null) {
      pancarNumberName.value =
          path.basename(result.files.single.path!); // Extract file name
    } else {
      fileName.value = "No file selected";
    }
  }

  //aadhar

  Future<void> aadharPickerFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'], // Allow images and PDFs
    );

    if (result != null && result.files.single.path != null) {
      aadhaarNumberName.value =
          path.basename(result.files.single.path!); // Extract file name
    } else {
      fileName.value = "No file selected";
    }
  }

  // photo1

  Future<void> photoOnePickerFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'], // Allow images and PDFs
    );

    if (result != null && result.files.single.path != null) {
      photoOneName.value =
          path.basename(result.files.single.path!); // Extract file name
    } else {
      photoOneName.value = "No file selected";
    }
  }

  //video

  Future<void> videoPickerFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'], // Allow images and PDFs
    );

    if (result != null && result.files.single.path != null) {
      videoFileName.value =
          path.basename(result.files.single.path!); // Extract file name
    } else {
      videoFileName.value = "No file selected";
    }
  }

  //photos2
  Future<void> photoTWoPickerFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'], // Allow images and PDFs
    );

    if (result != null && result.files.single.path != null) {
      photoTwoName.value =
          path.basename(result.files.single.path!); // Extract file name
    } else {
      photoTwoName.value = "No file selected";
    }
  }

  String selectedState = 'Karnataka';
  final cityName = TextEditingController();
  final alteranatePhoneController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();
  final mapLinkController = TextEditingController();
  final List<String> states = [
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

  var fileName = "".obs;
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'], // Allow images and PDFs
    );

    if (result != null && result.files.single.path != null) {
      fileName.value =
          path.basename(result.files.single.path!); // Extract file name
    } else {
      fileName.value = "No file selected";
    }
  }

  Future<void> pickImagePdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'], // Allow images and PDFs
    );

    if (result != null && result.files.single.path != null) {
      fileName.value =
          path.basename(result.files.single.path!); // Extract file name
    } else {
      fileName.value = "No file selected";
    }
  }
}

class AddBusinussSection extends StatelessWidget {
  const AddBusinussSection({super.key});
  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);
    return MaxContainer(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
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
                  title: 'Add Business'.toUpperCase(),
                  subtitle:
                      'Register your business and help us build a stronger local community.',
                ),
              );
            },
          ),
          const RegistrationPage(),
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
  AddBusinussController addBusinussController =
      Get.put(AddBusinussController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(172, 228, 193, 193),
        Color.fromARGB(173, 212, 227, 220)
      ])),
      child: Form(
        key: addBusinussController.formKey,
        child: Obx(
          () => Column(
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
                    "Add Business",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 25),
                  ),
                  Spacer()
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          style: const TextStyle(fontSize: 14),
                          controller: addBusinussController.ownerName,
                          decoration:
                              const InputDecoration(labelText: "Owner Name"))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: TextFormField(
                          style: const TextStyle(fontSize: 14),
                          controller: addBusinussController.businussName,
                          decoration: const InputDecoration(
                              labelText: "Business Name"))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          style: const TextStyle(fontSize: 14),
                          controller: addBusinussController.phoneNumber,
                          decoration: const InputDecoration(
                              labelText: "Phone Number"))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: TextFormField(
                          style: const TextStyle(fontSize: 14),
                          controller: addBusinussController.emailId,
                          decoration:
                              const InputDecoration(labelText: "Email Id"))),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: UploadButton(
                      uploadDone: addBusinussController.gstFileName.isEmpty
                          ? false
                          : true,
                      title: "GST File",
                      onTap: () {
                        addBusinussController.gstPickerFile();
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: UploadButton(
                      uploadDone: addBusinussController.pancarNumberName.isEmpty
                          ? false
                          : true,
                      title: "PanCard No",
                      onTap: () {
                        addBusinussController.pancardPickerFile();
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: UploadButton(
                      uploadDone:
                          addBusinussController.aadhaarNumberName.isEmpty
                              ? false
                              : true,
                      title: "AAdhaarCard",
                      onTap: () {
                        addBusinussController.aadharPickerFile();
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: UploadButton(
                      uploadDone: addBusinussController.videoFileName.isEmpty
                          ? false
                          : true,
                      title: "Upload Video",
                      onTap: () {
                        addBusinussController.videoPickerFile();
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: UploadButton(
                      uploadDone: addBusinussController.photoOneName.isEmpty
                          ? false
                          : true,
                      title: "Photo 1",
                      onTap: () {
                        addBusinussController.photoOnePickerFile();
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: UploadButton(
                      uploadDone: addBusinussController.photoTwoName.isEmpty
                          ? false
                          : true,
                      title: "Photo 2",
                      onTap: () {
                        addBusinussController.photoTWoPickerFile();
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => addBusinussController.selectDate(context),
                      child: InputDecorator(
                        decoration:
                            const InputDecoration(labelText: "Date of Birth"),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              addBusinussController.dobController.text.isEmpty
                                  ? "Not Selected"
                                  : addBusinussController.dobController.text,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const Icon(Icons.calendar_today,
                                color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: DropdownButtonFormField(
                      initialValue: addBusinussController.selectedState,
                      hint: const Text("Select State"),
                      items: addBusinussController.states
                          .map((state) => DropdownMenuItem(
                              value: state, child: Text(state)))
                          .toList(),
                      onChanged: (value) => setState(
                          () => addBusinussController.selectedState = value!),
                    ),
                  ),
                  const SizedBox(height: 7),
                ],
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14),
                      controller: addBusinussController.cityName,
                      decoration: const InputDecoration(labelText: "City"),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14),
                      controller:
                          addBusinussController.alteranatePhoneController,
                      decoration:
                          const InputDecoration(labelText: "Alternate Number"),
                    ),
                  ),
                ],
              ),
              TextFormField(
                style: const TextStyle(fontSize: 14),
                controller: addBusinussController.addressController,
                decoration: const InputDecoration(labelText: "Address"),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14),
                      controller: addBusinussController.pincodeController,
                      decoration: const InputDecoration(labelText: "Pincode"),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14),
                      controller: addBusinussController.mapLinkController,
                      decoration:
                          const InputDecoration(labelText: "Google Map Link"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                    value: addBusinussController.isAgreed.value,
                    onChanged: (value) {
                      addBusinussController.isAgreed.value = value!;
                    },
                  ),
                  const Text(
                    "I agree with the ",
                    style: TextStyle(color: AppColors.neutral900),
                  ),
                  InkWell(
                    onTap: () {},
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
      ),
    );
  }
}

class UploadButton extends StatelessWidget {
  const UploadButton({
    super.key,
    required this.uploadDone,
    required this.title,
    required this.onTap,
  });
  final void Function() onTap;
  final bool uploadDone;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              uploadDone
                  ? const Icon(
                      Icons.check_box,
                      color: AppColors.secondary900,
                    )
                  : const Icon(Icons.file_upload)
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 28, 26, 26),
          ),
        ],
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
                child: const Text('Save Business'),
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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Are You sure want clear"),
                        content: const Text("This is a simple alert message!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Closes the dialog
                            },
                            child: const Text("Yes"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Closes the dialog
                            },
                            child: const Text("No"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cancel, size: 24),
                    SizedBox(width: 8),
                    Text('Clear the Form'),
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
