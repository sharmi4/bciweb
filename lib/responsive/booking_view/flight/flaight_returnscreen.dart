import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../constant/constans.dart';


class FlaightReturnScreen extends StatefulWidget {
  const FlaightReturnScreen({super.key});

  @override
  State<FlaightReturnScreen> createState() => _FlaightReturnScreenState();
}

class _FlaightReturnScreenState extends State<FlaightReturnScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body: SafeArea(
            child: ListView(children: [
          Stack(children: [
      
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: kblue,
              child:             Column(
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
                          Padding(
                            padding: const EdgeInsets.only(top: 20, right: 60),
                            child: Image.asset(
                                'assets/images/parflaightcalendar.png'),
                          ),
                        ],
                      ),
                      ksizedbox10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Text(
                                  formatDate(
                                    selectedDate,
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
                                    const EdgeInsets.only(left: 10, bottom: 20),
                                child: Text(
                                    formatDate(selectedDate, [dd, MM, yyyy]),
                                    style:
                                        TextStyle(color: kwhite, fontSize: 14)),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Image.asset(
                              'assets/images/pardoubleflaight.png',
                              color: kwhite,
                              fit: BoxFit.fitWidth,
                              width: 35,
                              height: 50,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                formatDate(
                                  selectedDate,
                                  [
                                    '',
                                    DD,
                                    '',
                                  ],
                                ),
                                style: TextStyle(color: kwhite, fontSize: 14),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 20, right: 10),
                                child: Text(
                                    formatDate(selectedDate, [dd, MM, yyyy]),
                                    style:
                                        TextStyle(color: kwhite, fontSize: 14)),
                              )
                            ],
                          ),
                        ],
                      ),
                ],
              ),
            ),

         
                            
              ksizedbox40,
            
            Padding(
                padding: const EdgeInsets.only(left: 15, right: 15,top: 175),
                child: Container(
                  height: 650,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0.0, 0.75),
                        blurRadius: 5,
                        color: kwhite
                      )
                    ],
                    color: kwhite
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10),
                      child: SfDateRangePicker( 
                        todayHighlightColor: kOrange,
                        selectionColor: kOrange,
                        endRangeSelectionColor: kOrange,
                        startRangeSelectionColor: kOrange,
                      
                        selectionMode: DateRangePickerSelectionMode.multiRange,
                  view: DateRangePickerView.month,
                    monthFormat: 'MMM',monthCellStyle: DateRangePickerMonthCellStyle(
            selectionColor: kOrange
                    ),
            
            
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
        )
    );
  }
}

