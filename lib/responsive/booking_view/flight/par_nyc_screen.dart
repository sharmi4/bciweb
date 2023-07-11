
import 'package:bciweb/models/flight_searchdatamodel.dart';
import 'package:date_format/date_format.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constant/constans.dart';
import '../../../controller/api_flightcontroller/api_flight_Controller.dart';
import 'flight_details_screen.dart';


class ParNycSCreen extends StatefulWidget {
   FlightSearchDataModel flightSearchDataModel;
  String searchKey;
   ParNycSCreen({super.key,required this.flightSearchDataModel, required this. searchKey});

  @override
  State<ParNycSCreen> createState() => _ParNycSCreenState();
}

class _ParNycSCreenState extends State<ParNycSCreen> {
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
  final apiflightsController=Get.find<ApiflightsController>();
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kblue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                height: _mediaQuery.height>700?210:250,        
                width: MediaQuery.of(context).size.width,
                child: ListView(children: [
                  Column(
                    children: [
                      Row(children: [
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                                'assets/images/parflaightback.png')),
                        Text(
                          'PAR - NYC',
                          style: TextStyle(color: kwhite, fontSize: 20),
                        )
                      ]),
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
                          Image.asset(
                            'assets/images/pardoubleflaight.png',
                            color: kwhite,
                            fit: BoxFit.fitWidth,
                            width: 35,
                            height: 50,
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
                                padding: const EdgeInsets.only(
                                    bottom: 20, right: 10),
                                child: Text(
                                    formatDate(selectedDate, [dd, MM, yyyy]),
                                    style:
                                        TextStyle(color: kwhite, fontSize: 14)),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/parflaightperson.png',
                              color: kwhite,
                            ),
                             Padding(
                               padding: const EdgeInsets.only(left: 50),
                               child: Image.asset(
                                'assets/images/parflaightperson.png',
                                color: kwhite,
                                                         ),
                             )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 20, top: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  ' Adult ${apiflightsController.adultsCount.value}',
                                  style: TextStyle(color: kwhite),
                                ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 22),
                                   child: Text(
                                    ' Children ${apiflightsController.childsCount.value}',
                                    style: TextStyle(color: kwhite),
                                                                 ),
                                 ),
                              ],
                            ),
                            Text(
                              'Economy',
                              style: TextStyle(color: kwhite),
                            )
                          ],
                        ),
                      ),
                      ksizedbox30
                    ],
                  ),
                ]),
              ),
              ksizedbox30,
              if(apiflightsController.flightList.isEmpty)
              Center(
                child: Text('No Flights For the Selected Options'),
              ),
              for(int i=0;i<apiflightsController.flightList.length;i++)
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(FlightDetailsScreen(
                          flight: apiflightsController.flightList[i],
                          flightSearchDataModel: widget.flightSearchDataModel,
                          searchKey: widget.searchKey,
                        ));
                      },
                      child: Container(
                        height: 240,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            height: 210,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      blurRadius: 5,
                                      color: kgrey),
                                ],
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: Row(
                        children: [
                          Text(
                            'BGR 1565145',
                            style: TextStyle(fontSize: 18, color: kblue),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120, left: 20),
                      child: Row(
                        children: [
                          Image.asset('assets/images/parflaight.png'),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: korange.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                Text(
                                  " -----------------------",
                                  style: primaryFont.copyWith(
                                      letterSpacing: 4,
                                      color: Colors.grey.withOpacity(0.5)),
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: kblue),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        left: 145,
                        top: 110,
                        child: Text(
                          'Duration : 2h 55min',
                          style: TextStyle(color: Color(0xff8C8AAF)),
                        )),
                    Positioned(
                        left: 170,
                        top: 125,
                        child: Text('Non stop',
                            style: TextStyle(color: Color(0xff8C8AAF)))),
                    Positioned(left: 95, top: 155, child: Text('21:00')),
                    Positioned(left: 310, top: 155, child: Text('00:25')),
                    Positioned(
                      top: -5,
                      right: 2,
                      child: Column(children: [
                        Image.asset('assets/images/parflaightclipath.png'),
                      ]),
                    ),
                    Positioned(
                        top: 20,
                        right: 3,
                        child: Text(
                          '₹ 186',
                          style: TextStyle(color: kwhite, fontSize: 18),
                        )),
                    Positioned(
                      bottom: -9,
                      left: 160,
                      child: Container(
                        height: 60,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kblue,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.expand_less,
                          color: kwhite,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              ksizedbox20,
              if(apiflightsController.flightList.isEmpty)
              Center(
                child: Text('No flights For the Selected Options'),
              ),
              for(int i=0;i<apiflightsController.flightList.length;i++)
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(FlightDetailsScreen(
                          flight: apiflightsController.flightList[i],
                          flightSearchDataModel: widget.flightSearchDataModel,
                          searchKey: widget.searchKey,
                        ));
                      },
                      child: Container(
                        height: 240,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            height: 210,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      blurRadius: 5,
                                      color: kgrey),
                                ],
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: Row(
                        children: [
                          Text(
                            'BGR 1565153',
                            style: TextStyle(fontSize: 18, color: kblue),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120, left: 20),
                      child: Row(
                        children: [
                          Image.asset('assets/images/parflaight.png'),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: korange.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                Text(
                                  " --------------------- ",
                                  style: primaryFont.copyWith(
                                      letterSpacing: 4,
                                      color: Colors.grey.withOpacity(0.5)),
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: kblue),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        left: 145,
                        top: 110,
                        child: Text(
                          'Duration : 2h 55min',
                          style: TextStyle(color: Color(0xff8C8AAF)),
                        )),
                    Positioned(
                        left: 170,
                        top: 125,
                        child: Text('Non stop',
                            style: TextStyle(color: Color(0xff8C8AAF)))),
                    Positioned(left: 95, top: 155, child: Text('14:00')),
                    Positioned(left: 310, top: 155, child: Text('17:25')),
                    Positioned(
                      bottom: 160,
                      right: 2,
                      child: Column(children: [
                        Image.asset('assets/images/parflaightclipath.png'),
                      ]),
                    ),
                    Positioned(
                        top: 20,
                        right: 3,
                        child: Text(
                          '₹ 125',
                          style: TextStyle(color: kwhite, fontSize: 18),
                        )),
                    Positioned(
                      top: 200,
                      bottom: 0,
                      left: 160,
                      child: Container(
                        height: 60,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kblue,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.expand_less,
                          color: kwhite,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              ksizedbox20,
              for (int i = 0; i < apiflightsController.flightList.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(FlightDetailsScreen(
                            flight: apiflightsController.flightList[i],
                            flightSearchDataModel: widget.flightSearchDataModel,
                            searchKey: widget.searchKey,
                          ));
                      },
                      child: Container(
                        height: 240,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            height: 210,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      blurRadius: 5,
                                      color: kgrey),
                                ],
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: Row(
                        children: [
                          Text(
                            'BGR 1565153',
                            style: TextStyle(fontSize: 18, color: kblue),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120, left: 20),
                      child: Row(
                        children: [
                          Image.asset('assets/images/parflaight.png'),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: korange.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                Text(
                                  " --------------------",
                                  style: primaryFont.copyWith(
                                      letterSpacing: 4,
                                      color: Colors.grey.withOpacity(0.5)),
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: kblue),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        left: 145,
                        top: 110,
                        child: Text(
                          'Duration : 2h 55min',
                          style: TextStyle(color: Color(0xff8C8AAF)),
                        )),
                    Positioned(
                        left: 170,
                        top: 125,
                        child: Text('Non stop',
                            style: TextStyle(color: Color(0xff8C8AAF)))),
                    Positioned(left: 95, top: 155, child: Text('14:00')),
                    Positioned(left: 310, top: 155, child: Text('17:25')),
                    Positioned(
                      bottom: 160,
                      right: 2,
                      child: Column(children: [
                        Image.asset('assets/images/parflaightclipath.png'),
                      ]),
                    ),
                    Positioned(
                        top: 20,
                        right: 3,
                        child: Text(
                          '₹ 224',
                          style: TextStyle(color: kwhite, fontSize: 18),
                        )),
                    Positioned(
                      top: 200,
                      bottom: 0,
                      left: 160,
                      child: Container(
                        height: 60,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kblue,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.expand_less,
                          color: kwhite,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 1.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
