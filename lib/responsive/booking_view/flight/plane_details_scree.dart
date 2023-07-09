
import 'package:bciweb/models/air_search_model.dart';
import 'package:bciweb/models/flight_searchdatamodel.dart';
import 'package:bciweb/responsive/booking_view/flight/plane_economy_details.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:math' as math;

import '../../../constant/constans.dart';


class PlaneDetailsScreen extends StatefulWidget {
  const PlaneDetailsScreen({super.key, required Flight flight, required FlightSearchDataModel flightSearchDataModel});

  @override
  State<PlaneDetailsScreen> createState() => _PlaneDetailsScreenState();
}

class _PlaneDetailsScreenState extends State<PlaneDetailsScreen> {
  var numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      color: kblue,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
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
                      'Plane Details',
                      style: TextStyle(fontSize: 20, color: kwhite),
                    )
                  ],
                ),
              ),
              ksizedbox20,
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(PlaneEconomyDetailsScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                            height: MediaQuery.of(context).size.height*0.65,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      blurRadius: 5,
                                      color: kwhite),
                                ],
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 40),
                                  child: Row(
                                    children: [
                                      Text(
                                        'BGR Air',
                                        style: TextStyle(
                                            fontSize: 22.5,
                                            color: kblue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Boeing 683-321',
                                        style: TextStyle(
                                            fontSize: 19, color: kblue),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 30),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Customer Rating',
                                        style: TextStyle(
                                            fontSize: 19, color: kyellow),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: kyellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: kyellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: kyellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: kyellow,
                                      ),
                                      Icon(
                                        Icons.star_half,
                                        color: kyellow,
                                      )
                                    ],
                                  ),
                                ),
                                ksizedbox10,
                                Divider(),
                                Padding(
                                  padding:  EdgeInsets.only(
                                      left: 20, top: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Model \nBoeing 683-321',
                                        style: TextStyle(
                                          fontSize: 19,
                                          color: kblue,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(
                                      left: 20, top: 30),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Class \nEconomy & Business',
                                        style: TextStyle(
                                          fontSize: 19,
                                          color: kblue,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(
                                      left: 20, top: 30),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Age \n44',
                                        style: TextStyle(
                                          fontSize: 19,
                                          color: kblue,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(
                                      left: 20, top: 30),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Type \nSingle',
                                        style: TextStyle(
                                          fontSize: 19,
                                          color: kblue,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                    Positioned(
                        top: 60,
                        right: -1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image.asset('assets/images/flaightimage.png'),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: kwhite),
          child: Column(
            children: [
              ksizedbox10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: kgrey),
                    child: Image.asset('assets/images/flaightwifi.png'),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: kgrey),
                    child: Image.asset('assets/images/flaightbaggage.png'),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: kyellow),
                    child: Image.asset(
                      'assets/images/flaightmeal.png',
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: Text(
                      'Wi-Fi',
                      style: TextStyle(fontSize: 16, color: kblue),
                    ),
                  ),
                  Text(
                    'Baggage 10Kg',
                    style: TextStyle(fontSize: 16, color: kblue),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'Meal',
                      style: TextStyle(color: kblue, fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
