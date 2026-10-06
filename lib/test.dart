// import 'package:flutter/material.dart';

// // class FilePickerProvider extends ChangeNotifier {
// //   String? _fileName;
// //   String? get fileName => _fileName;

// //   Future<void> pickFile() async {
// //     FilePickerResult? result = await FilePicker.platform.pickFiles();

// //     if (result != null && result.files.single.path != null) {
// //       _fileName = path.basename(result.files.single.path!);
// //       notifyListeners(); // Notify UI to update
// //     } else {
// //       _fileName = null;
// //       notifyListeners();
// //     }
// //   }
// // }

// class FilePickerPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // final filePickerProvider = Provider.of<FilePickerProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("File Picker with Provider"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 // filePickerProvider.pickFile();
//               },
//               child: const Text('Pick a File'),
//             ),
//             const SizedBox(height: 20),
//             // filePickerProvider.fileName == null
//             //     ? const Text('No file selected')
//             //     : Text(
//             //         'File Name: ${filePickerProvider.fileName}',
//             //         style: const TextStyle(
//             //             fontSize: 16, fontWeight: FontWeight.bold),
//             //       ),
//           ],
//         ),
//       ),
//     );
//   }
// }
