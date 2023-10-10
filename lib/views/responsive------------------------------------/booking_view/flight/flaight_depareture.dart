import 'package:bciweb/controller/api_flightcontroller/api_flight_Controller.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../constant/constans.dart';


class FlightDeparetureSCreen extends StatefulWidget {
  const FlightDeparetureSCreen({super.key});

  @override
  State<FlightDeparetureSCreen> createState() => _FlightDeparetureSCreenState();
}

class _FlightDeparetureSCreenState extends State<FlightDeparetureSCreen> {
 
 DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  final apiflightsController =Get.find< ApiflightsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: GetBuilder<ApiflightsController>(
          builder: (_){
          return SafeArea(
              child: ListView(children: [
            Stack(children: [
              
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: kblue,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 10),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child:
                                  Image.asset('assets/images/parflaightback.png')),
                          Text(
                            'Departure',
                            style: TextStyle(fontSize: 20, color: kwhite),
                          ),
                         
                                 
                      
                              ],
                               
                              ),
                    ),
                     Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            "Apply",
                            style: primaryFont.copyWith(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 15),
                        child: GestureDetector(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: Image.asset(
                              'assets/images/parflaightcalendar.png'),
                        ),
                      ),
                     
                    ],
                  ),
                   Row(
          
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,top: 10
                            ),
                            child: Text(
                              formatDate(
                                apiflightsController.depatureDate,
                                [
                                  '',
                                  DD,
                                  '',
                                ],
                              ),
                              style: TextStyle(color: kwhite, fontSize: 14),
                            ),
                          ),
                           Padding(
                            padding:
                                const EdgeInsets.only(left: 15,top: 5),
                            child: Text(
                                formatDate(apiflightsController.depatureDate, [dd, MM, yyyy]),
                                style:
                                    TextStyle(color: kwhite, fontSize: 14)),
                          )
                  ],
                ),
                ]
                ),
                  ],
                ),
              ),
        
           
                              
                ksizedbox10,
              Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15,top: 175),
                  child: Container(
                    height: 700,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(0.0,0.75),
                          blurRadius: 5,
                          color: kgrey
                        )
                      ],
                      color: kwhite
                    ),
                    child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, bottom: 10),
                        child: SfDateRangePicker( 
                          initialSelectedDate: apiflightsController.depatureDate,
                          todayHighlightColor: kOrange,
                          selectionColor: kOrange,
                          endRangeSelectionColor: kOrange,
                          startRangeSelectionColor: kOrange,
                        headerStyle: DateRangePickerHeaderStyle(
                          textStyle: TextStyle(color: kOrange),
                          
                        ),
                          selectionMode: DateRangePickerSelectionMode.multiRange,
          view: DateRangePickerView.month,
            monthFormat: 'MMM',monthCellStyle: DateRangePickerMonthCellStyle(
              selectionColor: kOrange
            ),
        
        onSelectionChanged: (date){
          setState(() {
               apiflightsController.depatureDate = date.value;
                          Get.find<ApiflightsController>().depatureDate =
                              apiflightsController.depatureDate;
                          Get.find<ApiflightsController>()
                              .isDepatureDateSelected(true);
                        });

                        apiflightsController.update();
          
        },
              // headerStyle: DateRangePickerHeaderStyle(
              //   textStyle: TextStyle(
              //     fontSize: 16 
              //   )
              // ),
              
             navigationDirection: DateRangePickerNavigationDirection.vertical,
          enableMultiView: true,
               
              )),
                  ))
            ]
            )
              ]
              )
          
          );
          }
        )
    );
  }
}
