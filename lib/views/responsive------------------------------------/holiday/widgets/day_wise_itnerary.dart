
import 'package:flutter/material.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:get/get.dart';

import '../../../../constant/constans.dart';
import '../../../../controller/holiday_package_controller.dart';


class DayWiseItinerary extends StatefulWidget {
  String packageId;
   DayWiseItinerary({super.key,
   required this.packageId});

  @override
  State<DayWiseItinerary> createState() => _DayWiseItineraryState();
}

class _DayWiseItineraryState extends State<DayWiseItinerary> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holidayPackageController.packageDetails(packageid:widget.packageId);
  }
  
  final holidayPackageController = Get.find<HolidayPackageController>();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return   Column(
        children: [
          Row(
             children: [
               Text('Day Wise Itineary',
                       style: TextStyle(
                         fontSize: 18, 
                         color: kblue,
                       fontWeight: FontWeight.w500),
                     ),
                     kwidth10,
                     Expanded(
                       child: Container(
                         width: size.width,
                         child:const Divider(
                           thickness: 0.5,
                           color: Colors.black,
                         ),
                       ),
                     ),
             ],
           ),
           ksizedbox10,
       holidayPackageController.getPackageDetailsData.isEmpty?Text(''):
       HtmlContentViewer(htmlContent:holidayPackageController.getPackageDetailsData.first.dayWiseItinerary)

        ],
      
    );
  }
}