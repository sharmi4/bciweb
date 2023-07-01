import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:math' as math;

import '../../../constant/constans.dart';


class flightScreenChoose extends StatefulWidget {
  const flightScreenChoose({super.key});

  @override
  State<flightScreenChoose> createState() => _flightScreenChooseState();
}

class _flightScreenChooseState extends State<flightScreenChoose> {
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
                //search2(),
                ksizedbox10,
                Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Stack(children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            height: _mediaQurey.height>700? 600:540,
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
                            child: Column(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      'Recently Searched',
                                      style:
                                          TextStyle(fontSize: 21, color: kblue),
                                    )
                                  ],
                                ),
                              ),
                              ksizedbox10,
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: Size(30, 25),
                                                backgroundColor: kblue),
                                            onPressed: () {},
                                            child: Text(
                                              'PRG',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        'Prag, Czechia',
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Text('A',
                                            style: TextStyle(fontSize: 17)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: kblue,
                                                minimumSize: Size(30, 25)),
                                            onPressed: () {},
                                            child: Text('PRG'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: Text('Paris, France',
                                            style: TextStyle(fontSize: 17))),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Text('B',
                                            style: TextStyle(fontSize: 17)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: kblue,
                                                minimumSize: Size(30, 25)),
                                            onPressed: () {},
                                            child: Text('NYC'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text('New York, USA',
                                          style: TextStyle(fontSize: 17)),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Text('C',
                                            style: TextStyle(fontSize: 17)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: kblue,
                                                minimumSize: Size(30, 25)),
                                            onPressed: () {},
                                            child: Text(
                                              'ROM',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text('Rome, Italy',
                                          style: TextStyle(fontSize: 17)),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Text('D',
                                            style: TextStyle(fontSize: 17)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: kblue,
                                                  minimumSize: Size(30, 25)),
                                              onPressed: () {},
                                              child: Text(
                                                'PRG',
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text('Istanbul, Turkey',
                                          style: TextStyle(fontSize: 17)),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Text('E',
                                            style: TextStyle(fontSize: 17)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: kblue,
                                                  minimumSize: Size(30, 25)),
                                              onPressed: () {},
                                              child: Text(
                                                'PRG',
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text('Vienne, Austria',
                                          style: TextStyle(fontSize: 17)),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Text('F',
                                            style: TextStyle(fontSize: 17)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: kblue,
                                                  minimumSize: Size(30, 25)),
                                              onPressed: () {},
                                              child: Text('CDG')),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text('Paris, France',
                                          style: TextStyle(fontSize: 17)),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Text('G',
                                            style: TextStyle(fontSize: 17)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: kblue,
                                                  minimumSize: Size(30, 25)),
                                              onPressed: () {},
                                              child: Text(
                                                'TXL',
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text('Berlin, Germany',
                                          style: TextStyle(fontSize: 17)),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Text('H',
                                            style: TextStyle(fontSize: 17)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: kblue,
                                                  minimumSize: Size(30, 25)),
                                              onPressed: () {},
                                              child: Text(
                                                'LAX',
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text('Los Angeles, USA',
                                          style: TextStyle(fontSize: 17)),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Text('I',
                                            style: TextStyle(fontSize: 17)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: kblue,
                                                  minimumSize: Size(30, 25)),
                                              onPressed: () {},
                                              child: Text(
                                                'LGW',
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text('Londan, England',
                                          style: TextStyle(fontSize: 17)),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Text('J',
                                            style: TextStyle(fontSize: 17)))
                                  ],
                                ),
                              ),
                            ]),
                          ))
                    ]))
              ])
            ]))));
  }
}
