import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:html' as html;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:velocity_x/velocity_x.dart';

import '../../../../constant/constans.dart';
import '../../../../controller/bus_controllers.dart';
import '../../../../models/busbookingmodels/bus_requery_model.dart';

class WebpdfCreationScreen extends StatefulWidget {
   BusRequeryModel busRequeryModel;

  WebpdfCreationScreen({
    super.key,
    required this.busRequeryModel
  });

  @override
  State<WebpdfCreationScreen> createState() => _WebpdfCreationScreenState();
}

class _WebpdfCreationScreenState extends State<WebpdfCreationScreen> {


  //      final bytes = pdf.save();
  // final blob = html.Blob([bytes], 'application/pdf');
  //         final url = html.Url.createObjectUrlFromBlob(blob);
  //             final anchor =
  //                 html.document.createElement('a') as html.AnchorElement
  //                   ..href = url
  //                   ..style.display = 'none'
  //                   ..download = 'some_name.pdf';
  //             html.document.body.children.(anchor);
  //             anchor.click();
  //             html.document.body.children.remove(anchor);
  //             html.Url.revokeObjectUrl(url);

  // final file= File(root.path + );
  // await file.writeAsBytes(await pdf.save());
  // print("------------------------>>>");
  // print(file.path);

  // OpenFilex.open(file.path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Payment was Successfull').text.bold.xl4.make(),
          Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.find<BusController>()
                        .createPDF(context, widget.busRequeryModel);
                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        "Download",
                        style: primaryFont.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // IconButton(
                //   onPressed: () async {
                //     final url = html.Url.createObjectUrlFromBlob(
                //       await myGetBlobPdfContent(),
                //     );
                //     html.window.open(url, "_blank");
                //     html.Url.revokeObjectUrl(url);
                //   },
                //   icon: Icon(Icons.fiber_new),
                // ),

                // IconButton(
                //   onPressed: () async {
                //     final url = html.Url.createObjectUrlFromBlob(
                //         await myGetBlobPdfContent());
                //     final anchor =
                //         html.document.createElement('a') as html.AnchorElement
                //           ..href = url
                //           ..style.display = 'none'
                //           ..download = 'some_name.pdf';
                //     html.document.body!.children.add(anchor);
                //     anchor.click();
                //     html.document.body!.children.remove(anchor);
                //     html.Url.revokeObjectUrl(url);
                //   },
                //   icon: Icon(Icons.copy_all),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
