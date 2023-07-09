
import 'package:bciweb/controller/api_flightcontroller/api_flight_Controller.dart';
import 'package:bciweb/responsive/booking_view/flight/plane_details_scree.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:math' as math;

import '../../../constant/constans.dart';
import '../../../models/air_search_model.dart';
import '../../../models/flight_searchdatamodel.dart';


class FlightDetailsScreen extends StatefulWidget {
   Flight flight;
  FlightSearchDataModel flightSearchDataModel;
  String searchKey;
   FlightDetailsScreen({super.key,required this.flight,required this.flightSearchDataModel,required this.searchKey});

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  var numberController = TextEditingController();

  final apiflightController=Get.find<ApiflightsController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kblue,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView(
            children:[ Column(
              children: [
                ksizedbox40,
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset('assets/images/parflaightback.png')),
                      Text(
                        'Flight Details',
                        style: TextStyle(fontSize: 20, color: kwhite),
                      )
                    ],
                  ),
                ),
                ksizedbox30,
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Stack(
                    children: [
                      InkWell(
                        child: Container(
                          height: 650,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(),
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
                                          color: kwhite),
                                    ],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, top: 19),
                                          child: Text(
                                            'From',
                                            style: TextStyle(
                                                fontSize: 20, color: kblue),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 85, top: 20),
                                          child: Text(
                                            'To',
                                            style: TextStyle(
                                                color: kblue, fontSize: 19),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, top: 19),
                                          child: Text(
                                            widget.flightSearchDataModel.fromIata,
                                            style: TextStyle(
                                                fontSize: 15, color: kblue),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 108, top: 20),
                                          child: Text(
                                            widget.flightSearchDataModel.toIata,
                                            style: TextStyle(
                                                color: kblue, fontSize: 15),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(
                                              left: 28, top: 19),
                                          child: Text(
                                            widget.flightSearchDataModel.fromName,
                                            style: TextStyle(
                                                fontSize: 15, color: kblue),
                                          ),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(
                                              left: 22, top: 5),
                                          child: Text(
                                            widget.flightSearchDataModel.toIata,
                                            style: TextStyle(
                                                color: kblue, fontSize: 15),
                                          ),
                                        )
                                      ],
                                    ),
                                    ksizedbox10,
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.error,
                                            color: kblue,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    ksizedbox30,
                                    Stack(
                                      children: [
                                        Column(children: [
                                          Image.asset(
                                            'assets/images/parflaightdown1.png',
                                            color: kblue,
                                          ),
                                          SizedBox(
                                            height: 65,
                                          ),
                                          Image.asset(
                                            'assets/images/parflaightdown3.png',
                                            color: kblue,
                                          ),
                                          SizedBox(
                                            height: 65,
                                          ),
                                          Image.asset(
                                            'assets/images/parflaightdown.png',
                                            color: kblue,
                                          ),
                                        ]),
                                        Padding(
                                          padding:  EdgeInsets.only(
                                              right: 95, top: 120),
                                          child: Container(
                                            child: Transform.rotate(
                                              angle: -math.pi / 2.0,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                        color: kOrange,
                                                        shape: BoxShape.circle),
                                                  ),
                                                  Text(
                                                    '- - - - - - - - - - - - - - - - - - - - - - -',
                                                    style:
                                                        TextStyle(color: kgrey),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                        color: kOrange,
                                                        shape: BoxShape.circle),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 120,
                                          top: 20,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 18),
                                                child: Text(
                                                  widget.flight.segments.first.departureDateTime
                                                  .split("").first,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xff8C8AAf)),
                                                ),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(
                                                    right: 35, top: 5),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.schedule,
                                                      size: 13,
                                                    ),
                                                    Text(
                                                      widget.flight.segments.first
                                                      .departureDateTime.split('').last,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff8C8AAf)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              ksizedbox40,
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                         EdgeInsets.only(
                                                            left: 27, top: 30),
                                                    child: Text(
                                                      'Duration: ${widget.flight.segments.first.duration}',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff8C8AAf)),
                                                    ),
                                                  ),
 Center(
                                                    child: widget
                                                                .flight
                                                                .segments
                                                                .length ==
                                                            1
                                                        ? const Text('Non stop',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff8C8AAF)))
                                                        : Padding(
                                                          padding: const EdgeInsets.only(left: 12),
                                                          child: Text(
                                                              '${widget.flight.segments.length - 1} stop, via ${widget.flight.segments.first.destinationCity} ',
                                                              style: const TextStyle(
                                                                fontSize: 11,
                                                                  color: Color(
                                                                      0xff8C8AAF))),
                                                        ),
                                                  )
                                                ],
                                              ),
                                              ksizedbox40,
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                         EdgeInsets.only(
                                                            right: 18, top: 50),
                                                    child: Text(
                                                      widget.flight.segments.
                                                      first.arrivalDateTime.
                                                      split('').first,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff8C8AAf)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 40),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.schedule,
                                                          size: 13,
                                                        ),
                                                        Text(widget.flight.
                                                        segments.first.arrivalDateTime.split('').last,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xff8C8AAf))),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -5,
                        right: -1,
                        child: Column(children: [
                          Image.asset('assets/images/parflaightclipath.png'),
                        ]),
                      ),
                      Positioned(
                          top: 15,
                          right: 15,
                          child: Image.asset(
                            'assets/images/flaightswap.png',
                            color: kwhite,
                          )),
                    ],
                  ),
                ),
                ksizedbox10,
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                          top: Radius.circular(26.0),
                        )),
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              height: 340,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  ksizedbox40,
                                  Text(
                                    'Flights Details',
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  ksizedbox20,
                                  Text(
                                    'Enter your mobile phone number',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  ksizedbox40,
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 25),
                                    child: TextField(
                                      controller: numberController,
                                      decoration: InputDecoration(
                                          prefixIcon: Image.asset(
                                              'assets/images/flaightindiaimage.png'),
                                          suffixIcon: Image.asset(
                                              'assets/images/flaightcorrectimage.png'),
                                          hintText: '(+91) 9876543210',
                                          helperStyle:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ),
                                  ksizedbox40,
                                  InkWell(
                                    onTap: () {
                                      Get.to(PlaneDetailsScreen(
                                         flight: widget.flight,
                      flightSearchDataModel: widget.flightSearchDataModel,
                                      ));
                                    },
                                    child: Container(
                                      height: 45,
                                      width:
                                          MediaQuery.of(context).size.width * 0.7,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            kyellow,
                                            kOrange,
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                        child: Text(
                                          'Send ',
                                          style: TextStyle(
                                              color: kwhite, fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          kyellow,
                          kOrange,
                        ]),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Send Me',
                        style: TextStyle(color: kwhite, fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
            ]
          ),
        ),
      ),
    );
  }
}
