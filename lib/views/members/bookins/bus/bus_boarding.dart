import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/models/busbookingmodels/search_bus_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/bus_controllers.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../common_widget/common.dart';

import 'dart:math' as math;

import 'bus_seats.dart';

class busBoarding extends StatefulWidget {
  Bus busData;
  String searcKey;
  busBoarding({
    super.key,
    required this.busData,
    required this.searcKey,
  });

  @override
  State<busBoarding> createState() => _busBoardingState();
}

class _busBoardingState extends State<busBoarding> {
  var boardingId;
  var dropingId;

  bool isBordingOrDroping = true;

  int boardingIndex = 777;
  int dropingIndex = 777;
  final busController = Get.find<BusController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: CommonScreen(),
        preferredSize: Size(double.infinity, 40),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterCommonContainer(),
            // Container(
            //     width: size.width,
            //     child: Image.asset('assets/images/buss.png')),
            ksizedbox20,
            Column(
              children: [
                Container(
                  width: size.width * 0.8,
                  // height: size.height * 0.9,
                  decoration: BoxDecoration(
                    color: kwhite,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 198, 198, 198)
                            .withOpacity(0.3), // Shadow color
                        spreadRadius: 1, // The spread radius of the shadow
                        blurRadius: 5, // The blur radius of the shadow
                        offset: Offset(0, 3), // The offset of the shadow
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 0.2, // Border width
                    ),
                  ),
                  child: Column(
                    children: [
                      ksizedbox20,
                      Container(
                        height: 50,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.grey.withOpacity(0.5))
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isBordingOrDroping = true;
                                });
                              },
                              child: Container(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Boarding",
                                        style: primaryFont.copyWith(
                                          color: isBordingOrDroping
                                              ? kOrange
                                              : kgrey,
                                        ),
                                      ),
                                      Container(
                                        height: 5,
                                        width: 100,
                                        color: isBordingOrDroping
                                            ? kOrange
                                            : kwhite,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    isBordingOrDroping = false;
                                  },
                                );
                              },
                              child: Container(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Dropping",
                                        style: primaryFont.copyWith(
                                          color: !isBordingOrDroping
                                              ? kOrange
                                              : kgrey,
                                        ),
                                      ),
                                      Container(
                                        height: 5,
                                        width: 100,
                                        color: !isBordingOrDroping
                                            ? kOrange
                                            : kwhite,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ksizedbox10,
                      Container(
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.grey.withOpacity(0.5))
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: isBordingOrDroping
                              ? Column(
                                  children: [
                                    for (int i = 0;
                                        i <
                                            widget
                                                .busData.boardingDetails.length;
                                        i++)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              boardingId = widget
                                                  .busData
                                                  .boardingDetails[i]
                                                  .boardingId;
                                              busController.boardingName(widget
                                                  .busData
                                                  .boardingDetails[i]
                                                  .boardingName);

                                              boardingIndex = i;
                                            });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 15,
                                                    width: 15,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                boardingIndex ==
                                                                        i
                                                                    ? korange
                                                                    : Colors
                                                                        .grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3.0),
                                                      child: Container(
                                                        height: 10,
                                                        width: 10,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                boardingIndex ==
                                                                        i
                                                                    ? kOrange
                                                                    : Colors
                                                                        .white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    width: size.width * 0.4,
                                                    child: Text(widget
                                                        .busData
                                                        .boardingDetails[i]
                                                        .boardingName),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                widget
                                                    .busData
                                                    .boardingDetails[i]
                                                    .boardingTime,
                                                style: primaryFont.copyWith(
                                                    color: Colors.black45),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    for (int i = 0;
                                        i <
                                            widget
                                                .busData.droppingDetails.length;
                                        i++)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              dropingId = widget
                                                  .busData
                                                  .droppingDetails[i]
                                                  .droppingId;
                                              busController.droppingName(widget
                                                  .busData
                                                  .droppingDetails[i]
                                                  .droppingName);
                                              dropingIndex = i;
                                            });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 15,
                                                    width: 15,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                dropingIndex ==
                                                                        i
                                                                    ? kOrange
                                                                    : Colors
                                                                        .grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3.0),
                                                      child: Container(
                                                        height: 10,
                                                        width: 10,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: dropingIndex ==
                                                                  i
                                                              ? kOrange
                                                              : Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    width: size.width * 0.4,
                                                    child: Text(widget
                                                        .busData
                                                        .droppingDetails[i]
                                                        .droppingName),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                widget
                                                    .busData
                                                    .droppingDetails[i]
                                                    .droppingTime,
                                                style: primaryFont.copyWith(
                                                    color: Colors.black45),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      ksizedbox10,
                      Obx(
                        () => busController.isLoading.isTrue
                            ? InkWell(
                                onTap: () {
                                  if (boardingId == null) {
                                    Get.rawSnackbar(
                                        message: "Please select boarding place",
                                        backgroundColor: Colors.red);
                                  } else if (dropingId == null) {
                                    Get.rawSnackbar(
                                        message: "Please select droping place",
                                        backgroundColor: Colors.red);
                                  } else {
                                    Get.to(() => BusSeats(
                                          boardingId: boardingId,
                                          busData: widget.busData,
                                          dropingId: dropingId,
                                          searchkey: widget.searcKey,
                                        ));
                                  }
                                },
                                child: Container(
                                  height: 44,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      color: kOrange,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            offset: const Offset(0.0, 0.75),
                                            blurRadius: 5,
                                            color: kyellow)
                                      ],
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(
                                    child: const CupertinoActivityIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  if (boardingId == null) {
                                    Get.rawSnackbar(
                                        message: "Please select boarding place",
                                        backgroundColor: Colors.red);
                                  } else if (dropingId == null) {
                                    Get.rawSnackbar(
                                        message: "Please select droping place",
                                        backgroundColor: Colors.red);
                                  } else {
                                    Get.to(
                                      () => BusSeats(
                                        boardingId: boardingId,
                                        busData: widget.busData,
                                        dropingId: dropingId,
                                        searchkey: widget.searcKey,
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  height: 44,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: kOrange,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          offset: const Offset(0.0, 0.75),
                                          blurRadius: 5,
                                          color: kyellow)
                                    ],
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Continue',
                                    style:
                                        TextStyle(color: kwhite, fontSize: 12),
                                  )),
                                ),
                              ),
                      ),
                      ksizedbox10,
                      Column(
                        children: [
                          // Row(
                          //   mainAxisAlignment:
                          //       MainAxisAlignment.spaceAround,
                          //   children: [
                          //     Text('Operator')
                          //         .text
                          //         .semiBold
                          //         .orange500
                          //         .make(),
                          //     Text('Departure')
                          //         .text
                          //         .semiBold
                          //         .orange500
                          //         .make(),
                          //     Text('Total Duration')
                          //         .text
                          //         .semiBold
                          //         .orange500
                          //         .make(),
                          //     Text('Arrival')
                          //         .text
                          //         .semiBold
                          //         .orange500
                          //         .make(),
                          //     Text('Rating').text.semiBold.orange500.make(),
                          //     Text('Price').text.semiBold.orange500.make(),
                          //     Text('Select Seats')
                          //         .text
                          //         .semiBold
                          //         .orange500
                          //         .make()
                          //   ],
                          // ),
                          // ksizedbox20,
                          // Row(
                          //   mainAxisAlignment:
                          //       MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     Positioned(
                          //       bottom: 19,
                          //       right: 5,
                          //       child: Transform.rotate(
                          //         angle: -math.pi / 2.0,
                          //         child: Text(
                          //           "Upper Seats",
                          //           style: TextStyle(
                          //               color: kgrey,
                          //               fontSize: 22,
                          //               fontWeight: FontWeight.w700),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //         height: size.height * 0.7,
                          //         width: size.width * 0.1,
                          //         child: BusBookingGrid()),
                          //     kwidth10,
                          //     kwidth10,
                          //     Row(
                          //       children: [
                          //         Container(
                          //             height: size.height * 0.7,
                          //             width: size.width * 0.1,
                          //             child: BusBookingGrid()),
                          //         kwidth10,
                          //         Container(
                          //             height: size.height * 0.7,
                          //             width: size.width * 0.1,
                          //             child: BusBookingGrid()),
                          //       ],
                          //     ),
                          //     Positioned(
                          //       bottom: 19,
                          //       right: 5,
                          //       child: Transform.rotate(
                          //         angle: -math.pi / 2.0,
                          //         child: Text(
                          //           "Lower Seats",
                          //           style: TextStyle(
                          //               color: kgrey,
                          //               fontSize: 22,
                          //               fontWeight: FontWeight.w700),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        
                          ksizedbox40,
                        ],
                      ),
                    ],
                  ),
                ),
                ksizedbox10,
                //    Buslist(),
              ],
            ),
            ksizedbox30,

            
            RegisterCommonBottom()


          ],
        ),
      ),
    );
  }
}
