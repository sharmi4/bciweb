import 'package:flutter/material.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../../constant/constans.dart';
import '../../../../controller/holiday_package_controller.dart';
import 'app_fonts.dart';

class HotelDetails extends StatefulWidget {
  String packageId;
   HotelDetails({super.key,required this.packageId});

  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {


      final holidayPackageController = Get.find<HolidayPackageController>();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holidayPackageController.packageDetails(packageid: widget.packageId);
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            ksizedbox40,
            Text(
              'Hotel Details',
              style: TextStyle(
                  fontSize: 18, color: kblue, fontWeight: FontWeight.w500),
            ),
            kwidth10,
            Expanded(
              child: Container(
                width: size.width,
                child: const Divider(
                  thickness: 0.5,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        ksizedbox10,
        holidayPackageController.getPackageDetailsData.isEmpty?Text('')
        :HtmlContentViewer(htmlContent: holidayPackageController.getPackageDetailsData.first.description,
        initialContentHeight: MediaQuery.of(context).size.height,
        initialContentWidth: MediaQuery.of(context).size.width,)
      
     
      ],
    ));
  }
}
