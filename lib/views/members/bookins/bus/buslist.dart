import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/members/bookins/bus/bus_boarding.dart';
import 'package:bciweb/views/members/bookins/bus/wigets/wiget_buslist.dart';
import 'package:bciweb/views/members/bookins/flight/booking_flight.dart';
import 'package:bciweb/views/members/bookins/history/views/history.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../controller/api_flightcontroller/api_flight_Controller.dart';
import '../../../../controller/bus_controllers.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../common_widget/common.dart';
import '../hotels/booking_hotels.dart';
import '../trip/trip_booking.dart';

class BusList extends StatefulWidget {
  String fromCityName;
  String toCityName;
  String tdate;
  String searchKey;
  BusList({
    super.key,
    required this.fromCityName,
    required this.toCityName,
    required this.tdate,
    required this.searchKey,
  });

  @override
  State<BusList> createState() => _BusListState();
}

class _BusListState extends State<BusList> {
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
            Container(
                width: size.width,
                child: Image.asset('assets/images/buss.png')),
            ksizedbox20,
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GetBuilder<BusController>(
                        builder: (_) {
                          return Row(
                            children: [
                              kwidth10,
                              Text('we have got ${busController.busData.length} results')
                                  .text
                                  .semiBold
                                  .blue900
                                  .xl2
                                  .make()
                            ],
                          );
                        },
                      ),
                      //  ksizedbox10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: size.width * 0.2,
                            child: Column(
                              children: [
                                Text('Operator').text.semiBold.orange500.make(),
                              ],
                            ),
                          ),
                          Text('Departure').text.semiBold.orange500.make(),
                          //   Text('Total Duration').text.semiBold.orange500.make(),
                          Text('Arrival').text.semiBold.orange500.make(),
                          //   Text('Rating').text.semiBold.orange500.make(),
                          Text('Price').text.semiBold.orange500.make(),
                          Text('Select Seats').text.semiBold.orange500.make()
                        ],
                      )
                    ],
                  ),
                  width: size.width * 0.8,
                  height: size.height * 0.1,
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
                ),
                ksizedbox10,

                Container(
                  width: size.width * 0.8,
                  //  height: 500,
                  child: GetBuilder<BusController>(builder: (_) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: busController.busData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                //    left: 20, right: 20,
                                top: 5,
                                bottom: 10),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => busBoarding(
                                      busData: busController.busData[index],
                                      searcKey: widget.searchKey,
                                    ));

                                //  Get.to(BusSeatsScreen(
                                //   boardingid: busController.busData[index].boardingDetails.first.boardingId,
                                //   droppingid: busController.busData[index].droppingDetails.first.droppingId,
                                //   buskey: busController.busData[index].busKey,));
                              },
                              child: Container(
                                //  width: size.width * 0.8,
                                height: size.height * 0.08,
                                decoration: BoxDecoration(
                                  color: kwhite,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 198, 198, 198)
                                          .withOpacity(0.3), // Shadow color
                                      spreadRadius:
                                          1, // The spread radius of the shadow
                                      blurRadius:
                                          5, // The blur radius of the shadow
                                      offset: Offset(
                                          0, 3), // The offset of the shadow
                                    ),
                                  ],
                                  border: Border.all(
                                    color: Colors.grey, // Border color
                                    width: 0.2, // Border width
                                  ),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: size.width * 0.2,
                                        child: Column(
                                          children: [
                                            Text(busController
                                                    .busData[index]
                                                    .boardingDetails
                                                    .first
                                                    .boardingLandmark)
                                                .text
                                                .semiBold
                                                .blue900
                                                .xl
                                                .make(),
                                            Text(busController
                                                    .busData[index].busType)
                                                .text
                                                .semiBold
                                                .blue900
                                                .sm
                                                .make(),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        busController
                                            .busData[index].departureTime,
                                      ).text.semiBold.blue900.xl.make(),
                                      // Text('05h  00m')
                                      //     .text
                                      //     .semiBold
                                      //     .blue900
                                      //     .xl
                                      //     .make(),
                                      Text(busController
                                              .busData[index]
                                              .droppingDetails
                                              .first
                                              .droppingTime)
                                          .text
                                          .semiBold
                                          .blue900
                                          .xl
                                          .make(),
                                      // Column(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceEvenly,
                                      //   children: [
                                      //     Row(
                                      //       children: [
                                      //         Image.asset(
                                      //             'assets/images/Icon ionic-md-star.png'),
                                      //         Image.asset(
                                      //             'assets/images/Icon ionic-md-star.png'),
                                      //         Image.asset(
                                      //             'assets/images/Icon ionic-md-star.png'),
                                      //         Image.asset(
                                      //             'assets/images/Icon ionic-md-star.png')
                                      //       ],
                                      //     ),
                                      //     Text('4.2 Rating')
                                      //         .text
                                      //         .blue900
                                      //         .xs
                                      //         .make(),
                                      //   ],
                                      // ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "₹ ${busController.busData[index].fareMasters.first.totalAmount.toString()}",
                                          ).text.semiBold.blue900.xl.make(),
                                          Text('${busController.busData[index].availableSeats.toString()} seats left')
                                              .text
                                              .xs
                                              .make(),
                                          Container(
                                            child: Center(
                                                child:
                                                    Text('cancelation policy')
                                                        .text
                                                        .xs
                                                        .white
                                                        .make()),
                                            height: 15,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                color: kblue,
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: Center(
                                                child: Text('Select Seat')
                                                    .text
                                                    .semiBold
                                                    .sm
                                                    .white
                                                    .make()),
                                            height: 30,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: korange,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                          ),
                                          Container(
                                            child: Center(
                                                child:
                                                    Text('cancelation policy')
                                                        .text
                                                        .xs
                                                        .white
                                                        .make()),
                                            height: 15,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                color: kblue,
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                          )
                                        ],
                                      )
                                    ]),
                              ),

                              // child: Container(
                              //   height: 105,
                              //   width: MediaQuery.of(context).size.width,
                              //   decoration: BoxDecoration(
                              //       color: kwhite,
                              //       boxShadow: <BoxShadow>[
                              //         BoxShadow(
                              //             offset: const Offset(0.0, 0.75),
                              //             blurRadius: 2,
                              //             color: kgrey)
                              //       ],
                              //       borderRadius: BorderRadius.circular(10)),
                              //   child: Padding(
                              //     padding: const EdgeInsets.only(
                              //         top: 0, left: 10, right: 10),
                              //     child: Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         Padding(
                              //           padding: const EdgeInsets.only(
                              //               left: 10, top: 10, bottom: 10),
                              //           child: Column(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.spaceAround,
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.start,
                              //             children: [
                              //               Container(
                              //                 width: 200,
                              //                 child: Text(
                              //                   busController
                              //                       .busData[index]
                              //                       .boardingDetails
                              //                       .first
                              //                       .boardingLandmark,
                              //                   maxLines: 2,
                              //                 ),
                              //               ),
                              //               //ksizedbox10,
                              //               Container(
                              //                 width: 200,
                              //                 child: Text(
                              //                   busController
                              //                       .busData[index].busType,
                              //                   maxLines: 2,
                              //                   style: const TextStyle(
                              //                       color: Color(0xffAEAEAE)),
                              //                 ),
                              //               ),
                              //               //ksizedbox10,
                              //               Row(
                              //                 children: [
                              //                   Text(
                              //                     busController.busData[index]
                              //                         .departureTime,
                              //                     style: const TextStyle(
                              //                         color: Color(0xffAEAEAE)),
                              //                   ),
                              //                   kwidth10,
                              //                   const Icon(
                              //                     Icons.arrow_forward,
                              //                     size: 15,
                              //                   ),
                              //                   kwidth10,
                              //                   Text(
                              //                     busController
                              //                         .busData[index]
                              //                         .droppingDetails
                              //                         .first
                              //                         .droppingTime,
                              //                     style: const TextStyle(
                              //                         color: Color(0xffAEAEAE)),
                              //                   ),
                              //                 ],
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //         Padding(
                              //           padding: const EdgeInsets.only(top: 20),
                              //           child: Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.end,
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.start,
                              //             children: [
                              //               Text(
                              //                 "₹ ${busController.busData[index].fareMasters.first.totalAmount.toString()}",
                              //                 style: TextStyle(
                              //                     color: kOrange,
                              //                     fontWeight: FontWeight.w500),
                              //               ),
                              //               const SizedBox(
                              //                 height: 5,
                              //               ),
                              //               Text(
                              //                 "${busController.busData[index].availableSeats.toString()} Seats",
                              //                 style: const TextStyle(
                              //                     color: Color(0xffAEAEAE)),
                              //               )
                              //             ],
                              //           ),
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ),
                          );
                        });
                  }),
                )

                // InkWell(
                //     onTap: () {
                //       Get.to(BusSeats());
                //     },
                //     child: Buslist()),
                // ksizedbox10,
                // Buslist()
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
