import 'package:bciweb/constant/constans.dart';

import 'package:bciweb/views/members/bookins/flight/booking_flight.dart';

import 'package:bciweb/views/members/bookins/history/views/history.dart';

import 'package:date_format/date_format.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:get/get.dart';

import '../../../../controller/api_flightcontroller/api_flight_Controller.dart';

import '../../../../controller/bus_controllers.dart';

import '../../../../models/busbookingmodels/bus_cityList_model.dart';

import '../../../../registerhomescreen/common_reg_bottom.dart';

import '../../../../registerhomescreen/common_reg_homescreen.dart';

import '../../common_widget/common.dart';

import '../hotels/booking_hotels.dart';

import '../trip/trip_booking.dart';

class BusBookingMain extends StatefulWidget {
  const BusBookingMain({super.key});

  @override
  State<BusBookingMain> createState() => _BusBookingMainState();
}

DateTime flaight2selectedDate = DateTime.now();
DateTime flaightselectedDate = DateTime.now();

class _BusBookingMainState extends State<BusBookingMain> {
  setDefault() async {
    WidgetsBinding.instance.addPostFrameCallback((timings) {
      busController.getBusCityList.clear();
      busController.update();
    });
  }

  final apiflightController = Get.find<ApiflightsController>();
  var falightdobController = TextEditingController();
  final busController = Get.find<BusController>();

  final Bordingcontrolr = TextEditingController();
  final Destinationcontrolr = TextEditingController();

  DateTime date = DateTime.now();

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(1910),
      locale: const Locale('en', 'IN'),
      lastDate: DateTime.now().add(const Duration(days: 6570)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: kblue, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: kblue, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null)
      setState(() {
        date = picked;
        busController.date(formatDate(date, [dd, "/", mm, "/", yyyy]));
        busController.travelDatess = date;
        //busController.day(formatDate(date, []));
      });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterCommonContainer(),
            Stack(
              children: [
                Container(
                    width: size.width,
                    child: Image.asset('assets/images/buss.png')),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(BookingFlight());
                                },
                                child: bookingbutton(
                                  size: size,
                                  text: 'FLIGHT',
                                  colorr: kblue,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(BookingHotels());
                                },
                                child: bookingbutton(
                                  size: size,
                                  text: 'HOTELS',
                                  colorr: kblue,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(BookingTrip());
                                },
                                child: bookingbutton(
                                  size: size,
                                  text: 'TRIP',
                                  colorr: kblue,
                                ),
                              ),
                              // InkWell(
                              //   onTap: () {
                              //     Get.to(BookingLiquer());
                              //   },
                              //   child: bookingbutton(
                              //     size: size,
                              //     text: 'LIQUOR',
                              //     colorr: kblue,
                              //   ),
                              // ),
                              InkWell(
                                onTap: () {
                                  Get.to(History());
                                },
                                child: bookingbutton(
                                  size: size,
                                  text: 'HISTORY',
                                  colorr: kblue,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(BusBookingMain());
                                },
                                child: bookingbutton(
                                  size: size,
                                  text: 'Bus',
                                  colorr: korange,
                                ),
                              ),
                            ],
                          ),
                          height: 60,
                          width: size.width * 0.7,
                          decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Container(
                          height: 140,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.zero,
                                  bottomLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: Center(
                            child: Container(
                              height: 90,
                              width: size.width * 0.7,
                              child: GetBuilder<BusController>(
                                builder: (_) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'From',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: kblue),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  //  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              height: size.height * 0.06,
                                              width: size.width * 0.2,
                                              child: TypeAheadField<
                                                  GetBusCityList>(
                                                getImmediateSuggestions: true,
                                                textFieldConfiguration:
                                                    TextFieldConfiguration(
                                                  controller: Bordingcontrolr,
                                                  onChanged: (value) async {
                                                    if (value.length > 1) {
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  200));
                                                      Get.find<BusController>()
                                                          .busCityList(
                                                              searchCity:
                                                                  value);
                                                    }
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          hintText:
                                                              'Enter Bording',
                                                          hintStyle: TextStyle(
                                                              fontSize: 15)),
                                                ),
                                                suggestionsCallback:
                                                    (String pattern) async {
                                                  return busController
                                                      .getBusCityList
                                                      .where(
                                                        (item) => item.cityName
                                                            .toLowerCase()
                                                            .startsWith(
                                                              pattern
                                                                  .toLowerCase(),
                                                            ),
                                                      )
                                                      .toList();
                                                },
                                                itemBuilder: (context,
                                                    GetBusCityList citymodel) {
                                                  return ListTile(
                                                    title: Text(
                                                        citymodel.cityName),
                                                  );
                                                },
                                                itemSeparatorBuilder:
                                                    (context, index) {
                                                  return const Divider();
                                                },
                                                onSuggestionSelected:
                                                    (GetBusCityList citymodel) {
                                                  print("bording selected");
                                                  Bordingcontrolr.text =
                                                      citymodel.cityName;
                                                  busController.fromCity(
                                                      citymodel.cityName);
                                                  busController.fromcityId(
                                                      citymodel.cityId);
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'To',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: kblue),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  //  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              height: size.height * 0.06,
                                              width: size.width * 0.2,
                                              child: TypeAheadField<
                                                  GetBusCityList>(
                                                getImmediateSuggestions: true,
                                                textFieldConfiguration:
                                                    TextFieldConfiguration(
                                                  onChanged: (value) async {
                                                    if (value.length > 1) {
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  200));
                                                      Get.find<BusController>()
                                                          .busCityList(
                                                              searchCity:
                                                                  value);
                                                    }
                                                  },
                                                  controller:
                                                      Destinationcontrolr,
                                                  decoration: const InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      hintText:
                                                          'Enter Destination',
                                                      hintStyle: TextStyle(
                                                          fontSize: 15)),
                                                ),
                                                suggestionsCallback:
                                                    (String pattern) async {
                                                  return busController
                                                      .getBusCityList
                                                      .where((item) => item
                                                          .cityName
                                                          .toLowerCase()
                                                          .startsWith(pattern
                                                              .toLowerCase()))
                                                      .toList();
                                                },
                                                itemBuilder: (context,
                                                    GetBusCityList citymodel) {
                                                  return ListTile(
                                                    title: Text(
                                                        citymodel.cityName),
                                                  );
                                                },
                                                itemSeparatorBuilder:
                                                    (context, index) {
                                                  return Divider();
                                                },
                                                onSuggestionSelected:
                                                    (GetBusCityList citymodel) {
                                                  print("destination selected");
                                                  Destinationcontrolr.text =
                                                      citymodel.cityName;
                                                  busController.toCity(
                                                      citymodel.cityName);
                                                  busController.tocityId(
                                                      citymodel.cityId);
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Container(
                                          height: size.height * 0.06,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.12,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: kgrey),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                      busController.date.value),

                                                  // Text(
                                                  //     '${formatDate(apiflightController.returnDate, [
                                                  //       dd,
                                                  //       "/",
                                                  //       mm,
                                                  //       '/',
                                                  //       yyyy
                                                  //     ])}'),
                                                  IconButton(
                                                      onPressed: () {
                                                        _selectDate(context);
                                                      },
                                                      icon: Icon(Icons
                                                          .date_range_outlined))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Obx(
                                            () => busController.isLoading.isTrue
                                                ? Container(
                                                    child: const Center(
                                                        child:
                                                            CupertinoActivityIndicator(
                                                      color: Colors.white,
                                                    )),
                                                    height: 40,
                                                    width: size.width * 0.1,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          korange,
                                                          kyellow
                                                        ],
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                      busController.searchBus(
                                                          fromCityId:
                                                              busController
                                                                  .fromcityId
                                                                  .value
                                                                  .toString(),
                                                          toCityId:
                                                              busController
                                                                  .tocityId
                                                                  .value
                                                                  .toString(),
                                                          travelDate: formatDate(
                                                              busController
                                                                  .travelDatess,
                                                              [
                                                                mm,
                                                                "/",
                                                                dd,
                                                                "/",
                                                                yyyy
                                                              ]), isMobile: false);
                                                    },
                                                    child: Container(
                                                      child: Center(
                                                        child: Text(
                                                          'Search',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: kwhite,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      height: 40,
                                                      width: size.width * 0.1,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            korange,
                                                            kyellow
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                  ),
                                            // child: Obx(
                                            //   () => busController.isLoading.isTrue
                                            //       ? InkWell(
                                            //           onTap: () {
                                            //             busController.searchBus(
                                            //                 fromCityId: busController
                                            //                     .fromcityId.value
                                            //                     .toString(),
                                            //                 toCityId: busController
                                            //                     .tocityId.value
                                            //                     .toString(),
                                            //                 travelDate: formatDate(
                                            //                     busController
                                            //                         .travelDatess,
                                            //                     [
                                            //                       dd,
                                            //                       "-",
                                            //                       mm,
                                            //                       "-",
                                            //                       yyyy
                                            //                     ]));
                                            //           },
                                            //           child: Container(
                                            //             child: Center(
                                            //               child:
                                            //                   const CupertinoActivityIndicator(
                                            //                 color: Colors.white,
                                            //               ),
                                            //             ),
                                            //             height: size.height*0.06,
                                            //             width: size.width * 0.1,
                                            //             decoration: BoxDecoration(
                                            //                 gradient: LinearGradient(
                                            //                     colors: [
                                            //                       korange,
                                            //                       kyellow
                                            //                     ]),
                                            //                 borderRadius:
                                            //                     BorderRadius.circular(
                                            //                         10)),
                                            //           ),
                                            //         )
                                            //       : InkWell(
                                            //           onTap: () {
                                            //             busController.searchBus(
                                            //                 fromCityId: busController
                                            //                     .fromcityId.value
                                            //                     .toString(),
                                            //                 toCityId: busController
                                            //                     .tocityId.value
                                            //                     .toString(),
                                            //                 travelDate: formatDate(
                                            //                     busController
                                            //                         .travelDatess,
                                            //                     [
                                            //                       dd,
                                            //                       "-",
                                            //                       mm,
                                            //                       "-",
                                            //                       yyyy
                                            //                     ]));
                                            //           },
                                            //           child: Container(
                                            //             child: Center(
                                            //               child: Text(
                                            //                 'Search',
                                            //                 style: TextStyle(
                                            //                     fontSize: 20,
                                            //                     color: kwhite,
                                            //                     fontWeight:
                                            //                         FontWeight.w600),
                                            //               ),
                                            //             ),
                                            //             height: 40,
                                            //             width: size.width * 0.1,
                                            //             decoration: BoxDecoration(
                                            //               gradient: LinearGradient(
                                            //                 colors: [
                                            //                   korange,
                                            //                   kyellow
                                            //                 ],
                                            //               ),
                                            //               borderRadius:
                                            //                   BorderRadius.circular(
                                            //                       10),
                                            //             ),
                                            //           ),
                                            //         ),
                                            // ),
                                          )),
                                    ],
                                  );
                                },
                              ),
                              //   color: kgrey,
                            ),
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                )
              ],
            ),
            ksizedbox20,
            Text(
              'Popular Bus Travel Offers',
              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 28,
                  color: kblue,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ksizedbox10,
            //   if (flaightshowController.flaightshowindex.value == 0)
            Container(
              height: 210,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  // flaightimage.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(right: 50, top: 20, left: 50),
                      child: Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width * 0.36,
                        decoration: BoxDecoration(
                            color: kwhite.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  offset: Offset(0.0, 0.75),
                                  blurRadius: 5,
                                  color: kgrey)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      child: Image.asset(
                                    'assets/images/busa.png',
                                    //  flaightimage[index],
                                    fit: BoxFit.fitHeight,
                                    height: 170,
                                  )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'KPN Travels',
                                      //   title[index],
                                      textAlign: TextAlign.start,
                                      style:
                                          TextStyle(fontSize: 18, color: kblue),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Offers Today',
                                        //      description[index],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            height: 1.2,
                                            fontSize: 22,
                                            color: kblue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Container(
                                        height: 5,
                                        width: 80,
                                        color: kOrange,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Terms and Conditions Apply',
                                        style: TextStyle(
                                            fontSize: 16, color: kblue),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            // if (flaightshowController.flaightshowindex.value == 0)
            // Padding(
            //   padding: const EdgeInsets.only(top: 60),
            //   child: Container(
            //     height: 220,
            //     width: MediaQuery.of(context).size.width * 0.8,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: kwhite.withOpacity(0.8),
            //         boxShadow: <BoxShadow>[
            //           BoxShadow(
            //               offset: Offset(0.0, 0.75),
            //               blurRadius: 5,
            //               color: kgrey)
            //         ]),
            //     child: Stack(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(bottom: 80),
            //           child: Container(
            //             height: 200,
            //             width: 300,
            //             alignment: Alignment.centerLeft,
            //             child: Image.asset(
            //               'assets/images/appdownimage.png',
            //               height: 300,
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //         ),
            //         //     if (flaightshowController.flaightshowindex.value == 2)
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.end,
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(left: 50, bottom: 30),
            //               child: Container(
            //                 width: MediaQuery.of(context).size.width * 0.4,
            //                 child: TextField(
            //                   cursorColor: kblue,
            //                   //   controller: mobilenumberController,
            //                   decoration: InputDecoration(
            //                       focusedBorder: OutlineInputBorder(
            //                           borderSide: BorderSide(color: kblue)),
            //                       prefixIcon: Padding(
            //                         padding: const EdgeInsets.only(left: 10),
            //                         child: Image.asset(
            //                           'assets/images/indiaflaimgae.png',
            //                           height: 10,
            //                           fit: BoxFit.fitHeight,
            //                         ),
            //                       ),
            //                       hintText: ' +91 - enter mobile number',
            //                       suffixIcon: Container(
            //                         height: 50,
            //                         width: 190,
            //                         decoration: BoxDecoration(
            //                             gradient: LinearGradient(
            //                                 colors: [kyellow, kOrange])),
            //                         child: Center(
            //                           child: Text(
            //                             'Get App Link',
            //                             style: TextStyle(
            //                                 fontSize: 20, color: kwhite),
            //                           ),
            //                         ),
            //                       ),
            //                       border: OutlineInputBorder(
            //                           borderSide: BorderSide(
            //                         color: kblue,
            //                       ))),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //         //   if (flaightshowController.flaightshowindex.value == 0)
            //         Padding(
            //           padding: const EdgeInsets.only(),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.end,
            //             children: [
            //               Image.asset(
            //                 'assets/images/appsimage.png',
            //               ),
            //               Image.asset(
            //                 'assets/images/scanerimage.png',
            //                 height: 200,
            //                 fit: BoxFit.fitHeight,
            //               ),
            //             ],
            //           ),
            //         ),
            //         //   if (flaightshowController.flaightshowindex.value == 0)
            //         Positioned(
            //             left: 140,
            //             top: 50,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   'Download the App Now!',
            //                   textAlign: TextAlign.center,
            //                   style: TextStyle(fontSize: 25, color: kblue),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(top: 5),
            //                   child: Text(
            //                     'Use code WELCOMEMMT and get up to first domestic Flight booking',
            //                     style: TextStyle(fontSize: 15, color: kblue),
            //                   ),
            //                 )
            //               ],
            //             )),
            //       ],
            //     ),
            //   ),
            // ),
            ksizedbox30,
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}
