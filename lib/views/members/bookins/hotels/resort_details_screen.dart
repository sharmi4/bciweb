import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';

import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../../constant/constans.dart';

import '../../../../controller/hotel_controller/hotel_controller.dart';

import '../../../../registerhomescreen/common_reg_homescreen.dart';

class ResortDetailsScreen extends StatefulWidget {
  final String userIp;
  final String resultIndex;
  final String hotelCode;
  final String searchToken;

  const ResortDetailsScreen({
    super.key,
    required this.userIp,
    required this.resultIndex,
    required this.hotelCode,
    required this.searchToken,
  });

  @override
  State<ResortDetailsScreen> createState() => _ResortDetailsScreenState();
}

class _ResortDetailsScreenState extends State<ResortDetailsScreen> {
  final hotelController = Get.find<HotelController>();
  @override
  void initState() {
    super.initState();
    hotelController.hotelInfo(
        userIp: widget.userIp,
        resultIndex: widget.resultIndex,
        hotelCode: widget.hotelCode,
        searchToken: widget.searchToken);
    hotelController.getHotelRoomApiServices(
        userIp: widget.userIp,
        resultIndex: widget.resultIndex,
        hotelCode: widget.hotelCode,
        searchToken: widget.searchToken);
  }

  var dropvalue1 = '';
  var lastname1Controller = TextEditingController();
  var lastname2Controller = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'MR';

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<HotelController>(builder: (_) {
        return ListView(children: [
          Column(
            children: [
              RegisterCommonContainer(),
              Stack(
                children: [
                  Container(
                    width: size.width,
                    child: Image.network('assets/images/Group 39748.png'),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(
                      child: Text(
                        'Choose Hotel :)',
                        style: TextStyle(
                            fontSize: 45,
                            color: kwhite,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              // hotelController.isLoading.isTrue
              //     ? Container(
              //         child: const CircularProgressIndicator(
              //           color: Colors.yellow,
              //         ),
              //       )
              //     :
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      // height: 500,
                      width: 700,
                      decoration: BoxDecoration(
                        color: kwhite,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 5,
                              color: kgrey)
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    hotelController.hotelInfoData.isEmpty
                                        ? Text('')
                                        : Text(
                                            hotelController
                                                .hotelInfoData.first.hotelName,
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold),
                                          ),
                                    ksizedbox10,
                                    Row(
                                      children: [
                                        Text(
                                          'Rating',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        kwidth10,
                                        hotelController.hotelInfoData.isEmpty
                                            ? Text('')
                                            : Row(
                                                children: [
                                                  for (int i = 0;
                                                      i <
                                                          hotelController
                                                              .hotelInfoData
                                                              .first
                                                              .starRating;
                                                      i++)
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 2),
                                                      child: Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                      ),
                                                    )
                                                ],
                                              )
                                      ],
                                    ),
                                    ksizedbox20,
                                    Container(
                                      width: 300,
                                      child: Column(
                                        children: [
                                          hotelController.hotelInfoData.isEmpty
                                              ? Text('')
                                              : Text(
                                                  hotelController.hotelInfoData
                                                      .first.address,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: hotelController.hotelInfoData.isEmpty
                                      ? WebsafeSvg.asset(
                                          'assets/images/No_image_available.svg',
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                        )
                                      // ? Image.asset(
                                      //     'assets/images/resorthotelimage.jpg',
                                      //     height: 100,
                                      //     fit: BoxFit.fitHeight,
                                      //   )
                                      : Image.network(
                                          hotelController
                                              .hotelInfoData.first.images.first,
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                        ),
                                )
                              ],
                            ),
                          ),
                          ksizedbox20,
                          // Container(
                          //   height: 100,
                          //   decoration:
                          //       BoxDecoration(color: kgrey.withOpacity(0.4)),
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(left: 20),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       children: [
                          //         Column(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceAround,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Text('CHECK IN'),
                          //             Text(
                          //               '6 May 2023',
                          //               style: TextStyle(
                          //                   fontSize: 19,
                          //                   color: kblue,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //             Text('Saturday, 1 PM'),
                          //             // Row(
                          //             //   children: [

                          //             //     Icon(Icons.arrow_back),
                          //             //     Text('1 NIGHT'),
                          //             //     Icon(Icons.arrow_forward),
                          //             //     Text('7 May 2023'),
                          //             //     Text('1 Night | 2 Adults | 1 Room'),
                          //             //     Text('')
                          //             //   ],
                          //             // )
                          //           ],
                          //         ),
                          //         const Padding(
                          //           padding: EdgeInsets.only(left: 50),
                          //           child: Row(
                          //             children: [
                          //               Icon(
                          //                 Icons.arrow_back,
                          //                 size: 12,
                          //               ),
                          //               Text(
                          //                 '1 NIGHT',
                          //                 style: TextStyle(fontSize: 14),
                          //               ),
                          //               Icon(
                          //                 Icons.arrow_forward,
                          //                 size: 12,
                          //               )
                          //             ],
                          //           ),
                          //         ),
                          //         Padding(
                          //           padding: const EdgeInsets.only(left: 50),
                          //           child: Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceAround,
                          //             children: [
                          //               Text('CHECK OUT'),
                          //               Text(
                          //                 '7 May 2023',
                          //                 style: TextStyle(
                          //                     fontSize: 19,
                          //                     fontWeight: FontWeight.bold,
                          //                     color: kblue),
                          //               ),
                          //               Text('Sunday, 10 AM')
                          //             ],
                          //           ),
                          //         ),
                          //         Padding(
                          //           padding: const EdgeInsets.only(left: 60),
                          //           child: Row(
                          //             children: [
                          //               Text(
                          //                 '1 Night | 2 Adults | 1 Room',
                          //                 style: TextStyle(
                          //                     color: kblue,
                          //                     fontWeight: FontWeight.bold),
                          //               )
                          //             ],
                          //           ),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // hotelController.hotelRoomsData.isEmpty
                                //     ? Text('')
                                //     : Text(
                                //         hotelController
                                //                 .hotelRoomsData
                                //                 .first
                                //                 .hotelRoomsDetails
                                //                 .first
                                //                 .availabilityType ??
                                //             "",
                                //         style: TextStyle(
                                //             fontSize: 19,
                                //             fontWeight: FontWeight.bold,
                                //             color: kblue),
                                //       ),
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 4),
                                //   child: Text('2 Adults'),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: hotelController.hotelInfoData.isEmpty
                                      ? Text('')
                                      : HtmlContentViewer(
                                          htmlContent: hotelController
                                                  .hotelInfoData
                                                  .first
                                                  .roomData ??
                                              "",
                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: hotelController.hotelInfoData.isEmpty
                                      ? Text('')
                                      : Text(hotelController
                                              .hotelInfoData.first.services ??
                                          ""),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      // Text(
                                      //   'Non-Refundable |',
                                      //   style: TextStyle(color: korange),
                                      // ),

                                      hotelController.hotelInfoData.isEmpty
                                          ? Text('')
                                          : Container(
                                              width: 500,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    hotelController
                                                        .hotelInfoData
                                                        .first
                                                        .hotelPolicy,
                                                    style: TextStyle(
                                                        //   color: korange
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 30, left: 20),
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         'Upgrade Your Stay',
                          //         style: TextStyle(
                          //             fontSize: 19,
                          //             fontWeight: FontWeight.bold,
                          //             color: kblue),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // hotelController.hotelInfoData.isEmpty
                                //     ? Text('')
                                //     : Padding(
                                //         padding: const EdgeInsets.symmetric(
                                //             horizontal: 10),
                                //         child: HtmlContentViewer(
                                //           htmlContent: hotelController
                                //               .hotelInfoData.first.description,
                                //         ),
                                //       ),
                                //   Text('Add Breakfast for ₹ 595 for all guests'),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: hotelController.hotelRoomsData.isEmpty
                                      ? const Text('')
                                      : Container(
                                          height: 50,
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: hotelController
                                                .hotelRoomsData.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return ListTile(
                                                title: Text(hotelController
                                                    .hotelRoomsData
                                                    .first
                                                    .hotelRoomsDetails[index]
                                                    .amenity
                                                    .first
                                                    .toString()),
                                              );
                                            },
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          //height: 350,
                          width: 330,
                          decoration: BoxDecoration(
                              color: kwhite,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: Offset(0.0, 0.75),
                                    blurRadius: 5,
                                    color: kgrey)
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      'Price Breakup',
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: kblue),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 19, right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '1 Room x 1 Night',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: kblue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text('Base Price'),
                                        ),
                                        Text(
                                          '₹ 3,550',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: korange,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Text(
                                      '-----------------------------------------------------',
                                      style: TextStyle(color: kgrey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total Discount',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: kblue),
                                          ),
                                          Text(
                                            '₹ 744',
                                            style: TextStyle(
                                                color: kblue,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '-----------------------------------------------------',
                                      style: TextStyle(color: kgrey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Price after Discount',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: kblue),
                                          ),
                                          Text(
                                            '₹ 2,806',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: korange),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '-----------------------------------------------------',
                                      style: TextStyle(color: kgrey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Taxes & Service Fees',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: kblue),
                                          ),
                                          Text(
                                            '₹ 573',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: korange),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '-----------------------------------------------------',
                                      style: TextStyle(color: kgrey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 200,
                                            decoration:
                                                BoxDecoration(color: kOrange),
                                            child: Center(
                                              child: Text(
                                                'Total Amount to be paid',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: kwhite,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              hotelController.blockroomapi(
                                                  userIp: widget.userIp,
                                                  hotelInfoData: hotelController
                                                      .hotelInfoData.first,
                                                  resultIndex:
                                                      widget.resultIndex,
                                                  hotelCode: widget.hotelCode,
                                                  hotelName: hotelController
                                                      .hotelInfoData
                                                      .first
                                                      .hotelName,
                                                  searchToken:
                                                      widget.searchToken,
                                                  hotelRoomsDetail:
                                                      hotelController
                                                          .hotelRoomsData
                                                          .first
                                                          .hotelRoomsDetails
                                                          .first
                                                  // hotelController
                                                  //     .hotelRoomsData
                                                  //     .first
                                                  //     .hotelRoomsDetails
                                                  //     .first
                                                  );
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 100,
                                              decoration:
                                                  BoxDecoration(color: kblue),
                                              child: Center(
                                                child: hotelController
                                                        .hotelRoomsData.isEmpty
                                                    ? Text('')
                                                    : Text(
                                                        hotelController
                                                            .hotelRoomsData
                                                            .first
                                                            .hotelRoomsDetails
                                                            .first
                                                            .price
                                                            .roomPrice
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: kwhite,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ksizedbox10,
                              Obx(
                                () => InkWell(
                                  onTap: () {
                                    hotelController.blockroomapi(
                                        userIp: widget.userIp,
                                        hotelInfoData:
                                            hotelController.hotelInfoData.first,
                                        resultIndex: widget.resultIndex,
                                        hotelCode: widget.hotelCode,
                                        hotelName: hotelController
                                            .hotelInfoData.first.hotelName,
                                        searchToken: widget.searchToken,
                                        hotelRoomsDetail: hotelController
                                            .hotelRoomsData
                                            .first
                                            .hotelRoomsDetails
                                            .first);
                                  },
                                  child: hotelController.isLoading.isTrue
                                      ? Container(
                                          height: 50,
                                          width: 300,
                                          decoration:
                                              BoxDecoration(color: kOrange),
                                          child: Center(
                                            child:
                                                const CupertinoActivityIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          height: 50,
                                          width: 300,
                                          decoration:
                                              BoxDecoration(color: kOrange),
                                          child: Center(
                                            child: Text(
                                              'Pay Now',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: kwhite,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                              ksizedbox10,
                            ],
                          ),
                        ),
                        ksizedbox20,
                        Container(
                          height: 140,
                          width: 330,
                          decoration: BoxDecoration(
                              color: kwhite,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: Offset(0.0, 0.75),
                                    blurRadius: 5,
                                    color: kgrey)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'WHY ',
                                      style: TextStyle(
                                          color: kblue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                          color: korange,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ' OR LOGIN',
                                      style: TextStyle(
                                          color: kblue,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: korange),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: kwhite,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Get access to Secret Deals',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: korange),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: kwhite,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Book Faster - we’ll save & pre-enter \nyour details',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: korange),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          size: 14,
                                          color: kwhite,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Manage your bookings from one place',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              ksizedbox30,
              ksizedbox30,
            ],
          ),
        ]);
      }),
    );
  }
}
