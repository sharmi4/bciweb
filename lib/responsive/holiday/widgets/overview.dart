
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:get/get.dart';


import '../../../constant/constans.dart';
import '../../../controller/holiday_package_controller.dart';

class OverviewWidget extends StatefulWidget {
  String packageId;
   OverviewWidget({super.key,
   required this.packageId});

  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  
  final holidayPackageController = Get.find<HolidayPackageController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ksizedbox20,
          Row(
            children: [
              Text(
                'Package Overview',
                style: TextStyle(
                    fontSize: 18,
                    color: kblue,
                    fontWeight: FontWeight.w500),
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
           holidayPackageController.getPackageDetailsData.isEmpty?Text(''):
           HtmlContentViewer(
            htmlContent: holidayPackageController.getPackageDetailsData.first.packageoverview,
            initialContentHeight: MediaQuery.of(context).size.height,
            initialContentWidth: MediaQuery.of(context).size.width,),
            
               if(holidayPackageController.getPackageDetailsData.isNotEmpty)
              ksizedbox20,

          Row(
            children: [
              Text(
                'Inclusions',
                style: TextStyle(
                    fontSize: 18,
                    color: kblue,
                    fontWeight: FontWeight.w500),
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
               holidayPackageController.getPackageDetailsData.isEmpty?Text(''):
               HtmlContentViewer(htmlContent: holidayPackageController.getPackageDetailsData.first.inclusion,
               initialContentHeight: MediaQuery.of(context).size.height,
               initialContentWidth: MediaQuery.of(context).size.width,),
          ksizedbox20,
          Row(
            children: [
              Text(
                'Exclusions',
                style: TextStyle(
                    fontSize: 18,
                    color: kblue,
                    fontWeight: FontWeight.w500),
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
          holidayPackageController.getPackageDetailsData.isEmpty?Text(''):
          HtmlContentViewer(htmlContent: holidayPackageController.getPackageDetailsData.first.exclusion,
          initialContentHeight: MediaQuery.of(context).size.height,
          initialContentWidth: MediaQuery.of(context).size.width,)

        ],
      );
  }
}
