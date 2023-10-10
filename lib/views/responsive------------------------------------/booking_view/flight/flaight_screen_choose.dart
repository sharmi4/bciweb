import 'package:bciweb/models/flight_searchdatamodel.dart';
import 'package:bciweb/views/responsive------------------------------------/booking_view/flight/search.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:math' as math;

import '../../../../constant/constans.dart';
import '../../../../controller/api_flightcontroller/api_flight_Controller.dart';


class flightScreenChoose extends StatefulWidget {
  const flightScreenChoose({super.key});

  @override
  State<flightScreenChoose> createState() => _flightScreenChooseState();
}

class _flightScreenChooseState extends State<flightScreenChoose> {

  final apiflightsController = Get.find<ApiflightsController>();

    @override
  void initState() {
    super.initState();
    setDefault();
  }

  setDefault() async {
    WidgetsBinding.instance.addPostFrameCallback((timings) {
      apiflightsController.airports.clear();
      apiflightsController.airPortFound(false);
      apiflightsController.update();
    });
  }
  @override
  Widget build(BuildContext context) {
    final _mediaQurey = MediaQuery.of(context).size;
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
                        'From',
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
                            height: _mediaQurey.height > 700 ? 600 : 540,
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
                              print(FlightSearchDataModel);
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
                                                  apiflightsController.origin(
                                                      apiflightsController
                                                          .airports[i]['iata']);
                                                  apiflightsController.originFullName(
                                                      apiflightsController
                                                          .airports[i]['name']);

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
                    ])
                    ),
              ])
            ]))));
  }
}
