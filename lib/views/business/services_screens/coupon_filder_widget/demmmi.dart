// import 'dart:html';
// import 'dart:html';
// import 'dart:html';
// import 'dart:html';
// import 'dart:typed_data';

// import 'package:flutter/cupertino.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // Code idea from: https://github.com/rjcalifornia/web_upload/blob/master/lib/widgets/web_upload.dart
//   List<Uint8List> _selectedFilesBytes;
//   GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
//   List<Widget> children = [];

//   void startWebFilePicker() async {
//     html.InputElement uploadInput = html.FileUploadInputElement();
//     uploadInput.multiple = true;
//     uploadInput.draggable = true;
//     uploadInput.click();

//     uploadInput.onChange.listen((e) {
//       final files = uploadInput.files;

//      // _selectedFilesBytes = [];
//       for (var i = 0; i < files.length; i++) {
//         final file = files[i];
//         final reader = new html.FileReader();
//         reader.onLoadEnd.listen((event) {
//           _selectedFilesBytes.add(reader.result);
//         });
//         reader.onError.listen((event) {
//           print('there was an error');
//         });
//         reader.readAsArrayBuffer(file);
//       }
//       setState(() {
//         for (var imageBytes in _selectedFilesBytes) {
//             children.add(Image.memory(imageBytes));
//           }
//       });
//     });
//   }}