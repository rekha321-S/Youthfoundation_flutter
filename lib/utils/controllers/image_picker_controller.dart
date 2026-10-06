import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;

class FilePickerController extends GetxController {
  var fileName = "".obs; // Observable variable

  // Function to pick a file (image or PDF)
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
