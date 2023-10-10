
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../constant/constans.dart';
import '../../../../controller/holiday_package_controller.dart';

class AdditionalInfoWidget extends StatefulWidget {
  String packageId;
   AdditionalInfoWidget({super.key,required this.packageId});

  @override
  State<AdditionalInfoWidget> createState() => _AdditionalInfoWidgetState();
}

class _AdditionalInfoWidgetState extends State<AdditionalInfoWidget> {
    final holidayPackageController = Get.find<HolidayPackageController>();
  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                Row(
                  children: [
                    Text('Additional info',
                            style: TextStyle(
                              fontSize: 20, 
                              color: kblue,
                            fontWeight: FontWeight.w500),
                          ),
                          kwidth10,
                          Expanded(
                            child: Container(
                              width: size.width,
                              child: Divider(
                                thickness: 1,
                                color: kblue,
                              ),
                            ),
                          ),
                  ],
                ),
                if(holidayPackageController.getPackageDetailsData.isNotEmpty)
                Column(
                  children: [
                    for(int i=0;i<holidayPackageController.getPackageDetailsData.first.includes.length;i++)
                    Row(
                      children: [
                        Icon(Icons.arrow_right_rounded),
                        Text(holidayPackageController.getPackageDetailsData.first.includes[i].value,
                        style: primaryFont.copyWith(
                         fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    )
                  ],
                )


        ],
      
    );
  }
}