import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:date_format/date_format.dart';
import '../../../../../../constant/constans.dart';
import '../../../../../../controller/api_flightcontroller/api_flight_Controller.dart';
import '../../../../../../controller/holiday_package_controller.dart';
import '../../../../../../controller/subscription_controller/subscription_controller.dart';
import '../../../../../../models/get_flight_booking_history.dart';

class FlightBookingHistory extends StatefulWidget {
  const FlightBookingHistory({super.key});

  @override
  State<FlightBookingHistory> createState() => _FlightBookingHistoryState();
}

class _FlightBookingHistoryState extends State<FlightBookingHistory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flightController.getFlightBookingHistory();
  }

  final flightController = Get.find<ApiflightsController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        GetBuilder<ApiflightsController>(builder: (_) {
          return Container(
            //  height: 500,
            // width: size.width * 0.5,
            child: flightController.flightBookingHistoyrList.isEmpty
                ? const Center(
                    child: Text("No bookings found"),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: flightController.flightBookingHistoyrList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          dialogBuilderflight(context,
                              flightBookedData: flightController
                                  .flightBookingHistoyrList[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          child: Container(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'TO',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: kblue),
                                        ),
                                        ksizedbox10,
                                        Text(
                                          flightController
                                              .flightBookingHistoyrList[index]
                                              .fromCityname,
                                          style: TextStyle(
                                              color: kblue, fontSize: 19),
                                        ),
                                        ksizedbox10,
                                        Text(
                                          'John F. Kennedy Airport',
                                          style: TextStyle(
                                              fontSize: 15, color: kblue),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/images/Group 39716.png',
                                    height: 55,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'FROM',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: kblue),
                                        ),
                                        ksizedbox10,
                                        Text(
                                          flightController
                                              .flightBookingHistoyrList[index]
                                              .toCityname,
                                          style: TextStyle(
                                              fontSize: 19, color: kblue),
                                        ),
                                        ksizedbox10,
                                        Text(
                                          'Abbotsford National Airport',
                                          style: TextStyle(
                                              color: kblue, fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                            height: 150,
                            width: 700,
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
                      );
                    },
                  ),
          );
        }),
        // ksizedbox30,
        // Container(
        //   child:
        //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //     Padding(
        //       padding: const EdgeInsets.all(15.0),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             'TO',
        //             style: TextStyle(
        //                 fontSize: 22,
        //                 fontWeight: FontWeight.bold,
        //                 color: kblue),
        //           ),
        //           ksizedbox10,
        //           Text(
        //             'CHE',
        //             style: TextStyle(color: kblue, fontSize: 19),
        //           ),
        //           ksizedbox10,
        //           Text(
        //             'John F. Kennedy Airport',
        //             style: TextStyle(fontSize: 15, color: kblue),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Image.asset(
        //       'assets/images/Group 39716.png',
        //       height: 55,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(15.0),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         children: [
        //           Text(
        //             'FROM',
        //             style: TextStyle(
        //                 fontSize: 22,
        //                 fontWeight: FontWeight.bold,
        //                 color: kblue),
        //           ),
        //           ksizedbox10,
        //           Text(
        //             'DEL',
        //             style: TextStyle(fontSize: 19, color: kblue),
        //           ),
        //           ksizedbox10,
        //           Text(
        //             'Abbotsford National Airport',
        //             style: TextStyle(color: kblue, fontSize: 15),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ]),
        //   height: 150,
        //   width: 700,
        //   decoration: BoxDecoration(
        //       color: kwhite,
        //       boxShadow: <BoxShadow>[
        //         BoxShadow(
        //             offset: Offset(0.0, 0.75), blurRadius: 5, color: kgrey),
        //       ],
        //       borderRadius: BorderRadius.circular(5)),
        // ),
      ],
    );
  }

  Future<void> dialogBuilderflight(
    BuildContext context, {
    required FlightBookedData flightBookedData,
  }) {
    return showDialog<void>(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          title: Container(
            height: 400,
            width: 300,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: kblue,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Details',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    // Image.asset('assets/images/Group 291.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            flightBookedData.remark,
                            style: TextStyle(
                                fontSize: 16,
                                color: kblue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Date : ${flightBookedData.bookingDate.split(" ").first}',
                          style: TextStyle(
                              fontSize: 12,
                              color: kblue,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'From city',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      flightBookedData.fromCityname,
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'To City',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      flightBookedData.toCityname,
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Booking Ref.no',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      flightBookedData.bookingRefNo,
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Airline code',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      flightBookedData.airlineCode,
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Invoice number',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      flightBookedData.invoiceNumber,
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                // const Divider(
                //   thickness: 1,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Quantity',
                //       style: TextStyle(
                //           fontSize: 16,
                //           color: kblue,
                //           fontWeight: FontWeight.bold),
                //     ),
                //     Text(
                //       qty,
                //       style: TextStyle(
                //           fontSize: 15,
                //           color: kblue,
                //           fontWeight: FontWeight.w500),
                //     ),
                //   ],
                // ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Download',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Get.find<ApiflightsController>().downloadTicketHistory(
                            refernceNo: flightBookedData.bookingRefNo);
                      },
                      child: Container(
                        height: 45,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HolidayHistory extends StatefulWidget {
  const HolidayHistory({super.key});

  @override
  State<HolidayHistory> createState() => _HolidayHistoryState();
}

class _HolidayHistoryState extends State<HolidayHistory> {
  final holidayPackageController = Get.find<HolidayPackageController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holidayPackageController.enquiryList();
  }

  // ignore: avoid_types_as_parameter_names
  Future<void> tripdialogeBuilder(BuildContext context, List<String> img,
      String tit, String date, String amt, String adult, String vistpalce) {
    return showDialog<void>(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          title: Container(
            height: 500,
            width: 500,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: kblue,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Tourist Details',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.network(
                      img.last,
                      height: 100,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Place',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      tit,
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date',
                        style: TextStyle(
                            fontSize: 16,
                            color: kblue,
                            fontWeight: FontWeight.bold)),
                    holidayPackageController.enquiryData.isNotEmpty
                        ? Text(
                            ' ${formatDate(holidayPackageController.enquiryData.first.createdAt, [
                                  dd,
                                  '-',
                                  mm,
                                  '-',
                                  yyyy
                                ])}',
                            style: TextStyle(
                                fontSize: 16,
                                color: kblue,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(''),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trip',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    holidayPackageController.enquiryData.isNotEmpty
                        ? Container(
                            child: Text(
                              holidayPackageController.enquiryData.first
                                  .packageDetails.placeToVisit,
                              style: TextStyle(
                                fontSize: 15,
                                color: kblue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : Text(''),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Country',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '',
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Adult',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    holidayPackageController.enquiryData.isNotEmpty
                        ? Text(
                            holidayPackageController
                                .enquiryData.first.adultCount,
                            style: TextStyle(
                                fontSize: 15,
                                color: kblue,
                                fontWeight: FontWeight.w500),
                          )
                        : Text(
                            '0',
                            style: TextStyle(fontSize: 15),
                          ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Price',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      amt,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          GetBuilder<HolidayPackageController>(builder: (_) {
            return holidayPackageController.enquiryData.isEmpty
                ? Text('No Bookings Found')
                : GridView.builder(
                    itemCount: holidayPackageController.enquiryData.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 4,
                            crossAxisCount: 2),
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          tripdialogeBuilder(
                            context,
                            holidayPackageController
                                .enquiryData[index].packageDetails.image,
                            holidayPackageController
                                .enquiryData[index].packageDetails.title,
                            holidayPackageController
                                .enquiryData[index].packageDetails.createdAt
                                .toString(),
                            holidayPackageController
                                .enquiryData[index].packageDetails.amount,
                            holidayPackageController
                                .enquiryData[index].adultCount,
                            holidayPackageController
                                .enquiryData[index].packageDetails.placeToVisit,
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: 280,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: Offset(0.0, 0.75),
                                    blurRadius: 5,
                                    color: kgrey)
                              ]),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      holidayPackageController
                                          .enquiryData[index]
                                          .packageDetails
                                          .image
                                          .last,
                                    )),
                              ),
                              kwidth10,
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ksizedbox10,
                                  Text(
                                    holidayPackageController.enquiryData[index]
                                        .packageDetails.title,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    '${holidayPackageController.enquiryData[index].packageDetails.location}',
                                    style: TextStyle(color: kblue),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Check in${formatDate(holidayPackageController.enquiryData[index].packageDetails.createdAt, [
                                              dd,
                                              "-",
                                              mm,
                                              '-',
                                              yyyy
                                            ])}',
                                        style: TextStyle(color: kblue),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Check out ${formatDate(holidayPackageController.enquiryData[index].packageDetails.updatedAt, [
                                              dd,
                                              "-",
                                              mm,
                                              '-',
                                              yyyy
                                            ])}',
                                        style: TextStyle(color: kblue),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Total Person :${holidayPackageController.enquiryData[index].adultCount}',
                                    style: TextStyle(color: kblue),
                                  ),
                                  Text(
                                    'Ac Rooms',
                                    style: TextStyle(color: kblue),
                                  ),
                                  ksizedbox20
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }));
          })
        ],
      ),
    );
  }
}

class index4 extends StatefulWidget {
  const index4({super.key});

  @override
  State<index4> createState() => _index4State();
}

class _index4State extends State<index4> {
  @override
  void initState() {
    super.initState();
    subscriptionapiController.getothersBookingList();
  }

  final subscriptionapiController = Get.find<SubscriptionApiController>();
  Future<void> dialogBuilder(BuildContext context, String img, String tit,
      String date, String amt, String qty) {
    return showDialog<void>(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return Padding(
          padding: const EdgeInsets.only(top: 30),
          child: AlertDialog(
            title: Container(
              height: 400,
              width: 300,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: kblue,
                            size: 15,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Tourist Details',
                        style: TextStyle(
                            fontSize: 16,
                            color: kblue,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.network(
                        img,
                        height: 50,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tit,
                            style: TextStyle(
                                fontSize: 16,
                                color: kblue,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Date : 17/30/34',
                            style: TextStyle(
                                fontSize: 12,
                                color: kblue,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Place',
                        style: TextStyle(
                            fontSize: 16,
                            color: kblue,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        tit,
                        style: TextStyle(
                            fontSize: 15,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                            fontSize: 16,
                            color: kblue,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '19/06/23',
                        style: TextStyle(
                            fontSize: 15,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trip',
                        style: TextStyle(
                            fontSize: 16,
                            color: kblue,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '03.54 PM',
                        style: TextStyle(
                            fontSize: 15,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Country',
                        style: TextStyle(
                            fontSize: 16,
                            color: kblue,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'India',
                        style: TextStyle(
                            fontSize: 15,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Adult',
                        style: TextStyle(
                            fontSize: 16,
                            color: kblue,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '10',
                        style: TextStyle(
                            fontSize: 15,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity',
                        style: TextStyle(
                            fontSize: 16,
                            color: kblue,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        qty,
                        style: TextStyle(
                            fontSize: 15,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        amt,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GetBuilder<SubscriptionApiController>(builder: (_) {
        return Container(
         // width: 1000,
          child: subscriptionapiController.othersbookinglist.isEmpty
              ? Text('No data found')
              : GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: subscriptionapiController.othersbookinglist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 40, right: 40),
                      child: GestureDetector(
                        onTap: () {
                          dialogBuilder(
                              context,
                              subscriptionapiController
                                  .othersbookinglist[index].image,
                              subscriptionapiController
                                  .othersbookinglist[index].service,
                              subscriptionapiController
                                  .othersbookinglist[index].description,
                              subscriptionapiController
                                  .othersbookinglist[index].purchasePrice,
                              subscriptionapiController
                                  .othersbookinglist[index].quantity);
                        },
                        child: Container(
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: Offset(0.0, 0.75),
                                    blurRadius: 5,
                                    color: kgrey)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                        height: 168,
                                        width: 168,
                                        child: Image.network(
                                          subscriptionapiController
                                              .othersbookinglist[index].image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              ksizedbox20,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 40),
                                    child: Text(
                                      subscriptionapiController
                                          .othersbookinglist[index].service,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: kblue),
                                    ),
                                  ),
                                  ksizedbox20,
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40),
                                    child: Container(
                                      width: 200,
                                      child: Text(
                                        subscriptionapiController
                                            .othersbookinglist[index]
                                            .description,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
        );
      }),
      ksizedbox30,
    ]);
  }
}
