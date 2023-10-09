import 'package:bciweb/controller/api_flightcontroller/api_flight_Controller.dart';
import 'package:bciweb/views/members/responsive/booking_view/flight/search.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:math' as math;

import '../../../../../constant/constans.dart';


class flightScreenChoose2 extends StatefulWidget {
  const flightScreenChoose2({super.key});

  @override
  State<flightScreenChoose2> createState() => _flightScreenChoose2State();
}

class _flightScreenChoose2State extends State<flightScreenChoose2> {

  final apiflightsController=Get.find<ApiflightsController>();
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Container(
        color: kblue,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: ListView(children: [
              Column(children: [
                ksizedbox20,
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child:
                              Image.asset('assets/images/parflaightback.png')),
                      Text(
                        'To',
                        style: TextStyle(fontSize: 20, color: kwhite),
                      )
                    ],
                  ),
                ),
                ksizedbox10,
                search2(),
                ksizedbox10,
                Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Stack(children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            height: _mediaQuery.height > 700 ? 600 : 540,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: const Offset(0.0, 0.75),
                                      blurRadius: 5,
                                      color: kwhite),
                                ],
                                borderRadius: BorderRadius.circular(5)),
                            child: GetBuilder<ApiflightsController>(builder: (_) {
                              return apiflightsController.airports.isEmpty &&
                                      apiflightsController.airPortFound.isTrue
                                  ? const Center(
                                      child: Text("No airports found"),
                                    )
                                  : apiflightsController.airports.isEmpty
                                      ? const Center(
                                          child: Text("Search City, Airports"),
                                        )
                                      : Column(children: [
                                          // Padding(
                                          //   padding:
                                          //       const EdgeInsets.only(top: 15, left: 20),
                                          //   child: Row(
                                          //     children: [
                                          //       Text(
                                          //         'Recently Searched',
                                          //         style:
                                          //             TextStyle(fontSize: 21, color: kblue),
                                          //       )
                                          //     ],
                                          //   ),
                                          // ),
                                          ksizedbox10,
                                          for (int i = 0;
                                              i <
                                                  apiflightsController
                                                      .airports.length;
                                              i++)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: InkWell(
                                                onTap: () {
                                                  apiflightsController.destination(
                                                      apiflightsController
                                                          .airports[i]['iata']);
                                                  apiflightsController
                                                      .destinationFullName(
                                                          apiflightsController
                                                              .airports[i]
                                                              ['name']);
                                                  Get.back();
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    minimumSize:
                                                                        const Size(
                                                                            30,
                                                                            25),
                                                                    backgroundColor:
                                                                        kblue),
                                                            onPressed: () {},
                                                            child: Text(
                                                             apiflightsController 
                                                                  .airports[i]
                                                                  ['iata'].toString(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                      child: Text(
                                                        apiflightsController
                                                            .airports[i]['name'].toString(),
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                        child: Text(
                                                            apiflightsController
                                                                .airports[i]
                                                                ['dst'].toString(),
                                                            style: TextStyle(
                                                                fontSize:
                                                                    15)))
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ]);
                            }),
                          ))
                    ]))
              ])
            ]))));
  }
}
