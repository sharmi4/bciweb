import 'package:bciweb/controller/api_flightcontroller/api_flight_Controller.dart';
import 'package:bciweb/controller/flaight_show_controller.dart';
import 'package:bciweb/controller/flaightdate_controller.dart';
import 'package:bciweb/models/seach_flight_model.dart';
import 'package:bciweb/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:date_format/date_format.dart';
import '../../../../constant/constans.dart';
import '../../../../controller/flaight _controller.dart';
import '../../../../models/flight_searchdatamodel.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';
import '../bus/Bus_booking_main.dart';
import '../history/views/history.dart';
import '../hotels/booking_hotels.dart';
import '../trip/trip_booking.dart';
import 'options_booking.dart';

class BookingFlight extends StatefulWidget {
  const BookingFlight({super.key});

  @override
  State<BookingFlight> createState() => _BookingFlightState();
}

class _BookingFlightState extends State<BookingFlight> {
  var dropvalue1 = '';
  var dropvalue2 = '';
  bool nonstop = false;
  bool nonstop2 = false;
  bool refundable = false;
  bool prenoon = false;
  bool indiGo = false;
  bool vistara = false;
  bool airIndia = false;
  bool spiceJet = false;
  bool goFirst = false;
  bool airAsia = false;
  bool lateDepartures = false;
  bool morningDepratures = false;
  bool stop = false;
  bool stop2 = false;
  double slider = 20;
  bool airline1 = false;
  bool airline2 = false;
  bool airline3 = false;
  bool airline4 = false;
  bool airline5 = false;
  bool airline6 = false;

  var mobilenumberController = TextEditingController();

  List flaightimage = [
    'assets/images/flaightimage3.png',
    'assets/images/flaightimage1.png'
  ];
  List title = [
    'DOMESTIC FLIGHTS',
    'INTERNATIONAL FLIGHTS',
  ];
  List description = [
    'Avail up to ₹2000* \noff on domestic \nflights!',
    'Avail up to ₹2000* \noff on domestic \nflights!',
  ];
  DateTime flaight2selectedDate = DateTime.now();
  DateTime flaightselectedDate = DateTime.now();

  int increament = 0;
  int decrement = 0;

  Future<void> _flaightselectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: flaightselectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != flaightselectedDate) {
      setState(() {
        apiflightController.returnDate = picked;
        apiflightController.update();
        falightdobController.text =
            '${flaightselectedDate.day}-${flaightselectedDate.month}-${flaightselectedDate.year}';
      });
    }
  }

  Future<void> _flaight2selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: flaight2selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != flaight2selectedDate) {
      setState(() {
        apiflightController.depatureDate = picked;
        apiflightController.update();
        falight2dobController.text =
            '${flaight2selectedDate.day}-${flaight2selectedDate.month}-${flaight2selectedDate.year}';
      });
    }
  }

  var falightdobController = TextEditingController();
  var falight2dobController = TextEditingController();
  var faligsearchController = TextEditingController();
  var faligsearch2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    setDefault();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    apiflightController.flightList.length;
  }

  setDefault() async {
    apiflightController.adultsCount(1);
    apiflightController.childsCount(0);

    WidgetsBinding.instance.addPostFrameCallback((timings) {
      apiflightController.airports.clear();
      apiflightController.airPortFound(false);
      apiflightController.update();
      apiflightController.origin("MAA");
      apiflightController.destination("COK");
      apiflightController.originCountry("Choose");
      apiflightController.destinationCountry("Choose");
    });
  }

  int wayindex = 0;

  final apiflightController = Get.find<ApiflightsController>();
  @override
  Widget build(BuildContext context) {
    final flaightController = Get.find<FlaightController>();
    final flaight2Controller = Get.find<Flaight2Controller>();
    final flaight3Controller = Get.find<Flaight3Controller>();
    final flaightshowController = Get.find<FlaightShowController>();
    final flaightdetailsController = Get.find<FlaightDateSCotroller>();

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: Obx(
        () => ListView(children: [
          Column(
            children: [
              RegisterCommonContainer(),
              Stack(
                children: [
                  Container(
                      width: size.width,
                      child: Image.asset('assets/images/Group 39747.png')),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.FLIGHTBOOKING);
                                    },
                                    child: bookingbutton(
                                      size: size,
                                      text: 'FLIGHT',
                                      colorr: korange,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.HOTELBOOKING);
                                    },
                                    child: bookingbutton(
                                      size: size,
                                      text: 'HOTELS',
                                      colorr: kblue,
                                    ),
                                  ),
 InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.BUSBOOKING);
                                    },
                                    child: bookingbutton(
                                      size: size,
                                      text: 'BUS',
                                      colorr: kblue,
                                    ),
                                  ),

                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.HOLIDAYBOOKING);
                                    },
                                    child: bookingbutton(
                                      size: size,
                                      text: 'HOLIDAYS',
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
                                      Get.toNamed(Routes.HISTORY);
                                    },
                                    child: bookingbutton(
                                      size: size,
                                      text: 'HISTORY',
                                      colorr: kblue,
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
                              width: size.width * 0.88,
                              decoration: BoxDecoration(
                                  color: kwhite,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.zero,
                                      bottomLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                       Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 100,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                children: [
                                                  Text("One Way",style: primaryFont.copyWith(
                                                    color: Colors.black
                                                  ),),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: (){
                                                        apiflightController
                                                            .onwayOrTwoWay(0);
                                                    },
                                                    child: Container(
                                                      height: 20,
                                                      width: 20,
                                                      decoration:  BoxDecoration(
                                                        borderRadius: BorderRadius.circular(30),
                                                       border: Border.all( color: kblue)
                                                      ),
                                                      child: apiflightController
                                                            .onwayOrTwoWay.value == 0 ?   Padding(
                                                              padding: const EdgeInsets.all(5.0),
                                                              child: Container(
                                                               height: 15,
                                                               width: 15,
                                                               decoration:  BoxDecoration(
                                                                 borderRadius: BorderRadius.circular(30),
                                                                color: kblue
                                                                 ),
                                                                 ),
                                                            ): Container(
                                                      width: 10,
                                                    ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            ksizedbox10,
                                             Container(
                                                width: 100,
                                               child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Round trip",style: primaryFont.copyWith(
                                                    color: Colors.black
                                                  ),),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: (){
                                                      apiflightController
                                                            .onwayOrTwoWay(1);
                                                    },
                                                    child: Container(
                                                      height: 20,
                                                      width: 20,
                                                      decoration:  BoxDecoration(
                                                        borderRadius: BorderRadius.circular(30),
                                                       border: Border.all( color: kblue)
                                                      ),
                                                      child: apiflightController
                                                            .onwayOrTwoWay.value == 1 ?   Padding(
                                                              padding: const EdgeInsets.all(5.0),
                                                              child: Container(
                                                               height: 15,
                                                               width: 15,
                                                               decoration:  BoxDecoration(
                                                                 borderRadius: BorderRadius.circular(30),
                                                                color: kblue
                                                               ),
                                                              ),
                                                            ): Container(
                                                      width: 10,
                                                    ),
                                                    ),
                                                  )
                                                ],
                                            ),
                                             ),
                                          ],
                                        ),
                                       ),

                                        // Container(
                                        //   height: 40,
                                        //   width: MediaQuery.of(context)
                                        //           .size
                                        //           .width *
                                        //       0.12,
                                        //   decoration: BoxDecoration(
                                        //       border: Border.all(color: kgrey),
                                        //       borderRadius:
                                        //           BorderRadius.circular(5)),
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       Padding(
                                        //         padding: const EdgeInsets.only(
                                        //             left: 10),
                                        //         child: Text(dropvalue2),
                                        //       ),
                                        //       PopupMenuButton(
                                        //         child:  Icon(Icons
                                        //             .arrow_drop_down_sharp),
                                        //             initialValue: "One Way",
                                                  
                                        //         itemBuilder: (context) => [
                                        //           PopupMenuItem(
                                        //               value: 'One Way',
                                        //               child: Text(
                                        //                 'One Way',
                                        //                 style: TextStyle(
                                        //                     fontSize: 14),
                                        //               )),
                                        //           PopupMenuItem(
                                        //             value: 'Round Way ',
                                        //             child: Row(
                                        //               children: [
                                        //                 Text(
                                        //                   'Round Way',
                                        //                   style: TextStyle(
                                        //                       fontSize: 13),
                                        //                 ),
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ],
                                        //         onSelected: (value) {
                                        //           if (value == "One Way") {
                                                    // apiflightController
                                                    //     .onwayOrTwoWay(0);
                                        //           } else {
                                        //             apiflightController
                                        //                 .onwayOrTwoWay(1);
                                        //           }

                                        //           setState(() {
                                        //             dropvalue2 =
                                        //                 value.toString();
                                        //           });
                                        //         },
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        GetBuilder<ApiflightsController>(
                                            builder: (_) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                  //  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(15)),
                                              height: size.height * 0.06,
                                              width: size.width * 0.13,
                                              child:
                                                  TypeAheadField<FlightSearchModel>(
                                                getImmediateSuggestions: true,
                                                textFieldConfiguration:
                                                    TextFieldConfiguration(
                                                  controller:
                                                      faligsearch2Controller,
                                                  onChanged: (value) async {
                                                    if (value.length > 1) {
                                                    await Future.delayed(const Duration(
                                                     milliseconds: 500
                                                    ));
                                                      Get.find<
                                                              ApiflightsController>()
                                                          .flighsearch(
                                                              city:
                                                                  value.toString());
                                                    }
                                                  },
                                                  decoration: const InputDecoration(
                                                      border: OutlineInputBorder(),
                                                      hintText:
                                                          'Any Airport City',
                                                      hintStyle:
                                                          TextStyle(fontSize: 14)),
                                                ),
                                                suggestionsCallback:
                                                    (String pattern) async {
                                                  return apiflightController
                                                      .searchlistsearchList
                                                      .where(
                                                        (item) => item.city
                                                            .toString()
                                                            .toLowerCase()
                                                            .startsWith(
                                                              pattern.toLowerCase(),
                                                            ),
                                                      )
                                                      .toList();
                                                },
                                                itemBuilder: (context,
                                                    FlightSearchModel citymodel) {
                                                  return ListTile(
                                                    title: Text(citymodel
                                                        .city
                                                        .toString()),
                                                  );
                                                },
                                                itemSeparatorBuilder:
                                                    (context, index) {
                                                  return const Divider();
                                                },
                                                onSuggestionSelected:
                                                    (FlightSearchModel citymodel) {
                                                  print("bording selected");

                                                      apiflightController.origin(
                                                          citymodel.airportcode);
                                               
                                                      apiflightController
                                                          .originFullName(
                                                              citymodel.city);

                                                  faligsearch2Controller.text =
                                                      citymodel.city;

                                                 
                                                      apiflightController
                                                          .originCountry(
                                                              citymodel.countrycode);
                                              
                                                },
                                              ),
                                            );
                                          }
                                        ),
                                       const Icon(Icons.compare_arrows_sharp),

                                        // Padding(
                                        //   padding: const EdgeInsets.only(
                                        //       left: 15, right: 15),
                                        //   child: InkWell(
                                        //     onTap: () {
                                        //      apiflightController.origin(
                                        //           apiflightController
                                        //               .airports[i].iata);
                                        //       apiflightController
                                        //           .originFullName(
                                        //               apiflightController
                                        //                   .airports[i]
                                        //                   .name);

                                        //       apiflightController
                                        //           .originCountry(
                                        //               apiflightController
                                        //                   .airports[i]
                                        //                   .country);

                                        //       Get.back();
                                        //     },
                                        //     child: Row(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment
                                        //               .spaceBetween,
                                        //       children: [
                                        //         Container(
                                        //           width:
                                        //               MediaQuery.of(context)
                                        //                       .size
                                        //                       .width *
                                        //                   0.2,
                                        //           child: Row(
                                        //             mainAxisAlignment:
                                        //                 MainAxisAlignment
                                        //                     .spaceBetween,
                                        //             children: [
                                        //               ElevatedButton(
                                        //                 style: ElevatedButton
                                        //                     .styleFrom(
                                        //                         minimumSize:
                                        //                             const Size(
                                        //                                 30,
                                        //                                 25),
                                        //                         backgroundColor:
                                        //                             kblue),
                                        //                 onPressed: () {},
                                        //                 child: Text(
                                        //                   apiflightController
                                        //                       .airports[i]
                                        //                       .iata,
                                        //                 ),
                                        //               ),
                                        //             ],
                                        //           ),
                                        //         ),
                                        //         Container(
                                        //           width:
                                        //               MediaQuery.of(context)
                                        //                       .size
                                        //                       .width *
                                        //                   0.4,
                                        //           child: Text(
                                        //             apiflightController
                                        //                 .airports[i].name,
                                        //             style: TextStyle(
                                        //                 fontSize: 15),
                                        //           ),
                                        //         ),
                                        //         Container(
                                        //             width: MediaQuery.of(
                                        //                         context)
                                        //                     .size
                                        //                     .width *
                                        //                 0.1,
                                        //             child: Text(
                                        //                 apiflightController
                                        //                     .airports[i].,
                                        //                 style: TextStyle(
                                        //                     fontSize:
                                        //                         15)))
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),

                                        GetBuilder<ApiflightsController>(
                                          builder: (_) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                  //  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(15)),
                                              height: 45,
                                              width: size.width * 0.13,
                                              child:
                                                  TypeAheadField<FlightSearchModel>(
                                                getImmediateSuggestions: true,
                                                textFieldConfiguration:
                                                    TextFieldConfiguration(
                                                  onTap: () {
                                                    // faligsearchController.text;
                                                  },
                                                  controller: faligsearchController,
                                                  onChanged: (value) async {
                                                    if (value.length > 1) {
                                                await Future.delayed(const Duration(milliseconds: 500));
                                                      Get.find<
                                                              ApiflightsController>()
                                                          .flighsearch(
                                                              city:
                                                                  value.toString());
                                                    }
                                                  },
                                                  decoration: const InputDecoration(
                                                      border: OutlineInputBorder(),
                                                      hintText: 'Any Airport City',
                                                      hintStyle:
                                                          TextStyle(fontSize: 14)),
                                                ),
                                                suggestionsCallback:
                                                    (String pattern) async {
                                                  return apiflightController
                                                      .searchlistsearchList
                                                      .where(
                                                        (item) => item.city
                                                            .toString()
                                                            .toLowerCase()
                                                            .startsWith(
                                                              pattern.toLowerCase(),
                                                            ),
                                                      )
                                                      .toList();
                                                },
                                                itemBuilder: (context,
                                                    FlightSearchModel citymodel) {
                                                  return ListTile(
                                                    title: Text(citymodel
                                                        .city
                                                        .toString()),
                                                  );
                                                },
                                                itemSeparatorBuilder:
                                                    (context, index) {
                                                  return const Divider();
                                                },
                                                onSuggestionSelected:
                                                    (FlightSearchModel citymodel) {
                                                  print("bording selected");

                                               
                                                      apiflightController.destination(
                                                          citymodel.airportcode);
                                               
                                                      apiflightController
                                                          .destinationFullName(
                                                              citymodel.city);

                                                  faligsearchController.text =
                                                      citymodel.city;
                                                  apiflightController.destinationCountry(
                                                      citymodel.countrycode);
                                                  // Bordingcontrolr.text =
                                                  //     citymodel.cityName;
                                                  // apiflightController.fromCity(
                                                  //     citymodel.cityName);
                                                  // busController.fromcityId(
                                                  //     citymodel.cityId);
                                                },
                                              ),
                                            );
                                          }
                                        ),
                                        GetBuilder<ApiflightsController>(
                                          builder: (_) {
                                            return Container(
                                              height: 40,
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
                                                          formatDate(apiflightController.depatureDate, [
                                                            dd,
                                                            "/",
                                                            mm,
                                                            '/',
                                                            yyyy
                                                          ])),
                                                      IconButton(
                                                          onPressed: () {
                                                            _flaight2selectDate(
                                                                context);
                                                          },
                                                          icon: const Icon(Icons
                                                              .date_range_outlined))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        ),
                                        // ignore: unrelated_type_equality_checks
                                        if (apiflightController.onwayOrTwoWay.value ==
                                            1)
                                          GetBuilder<ApiflightsController>(
                                          builder: (_) {
                                              return Container(
                                                height: 40,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.12,
                                                decoration: BoxDecoration(
                                                    border:
                                                        Border.all(color: kgrey),
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
                                                            '${formatDate(apiflightController.returnDate, [
                                                              dd,
                                                              "/",
                                                              mm,
                                                              '/',
                                                              yyyy
                                                            ])}'),
                                                        IconButton(
                                                            onPressed: () {
                                                              _flaightselectDate(
                                                                  context);
                                                            },
                                                            icon: const Icon(Icons
                                                                .date_range_outlined))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                          ),
//                                           Column(
//                                             children: [
//                                               Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Text(
//                                                         '${apiflightController.adultsCount.value}'),
//                                                     Text(
//                                                       'Adults',
//                                                       style:
//                                                           TextStyle(fontSize: 13),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     IconButton(
//                                                         onPressed: () {
//                                                           apiflightController
//                                                               .decreaseAdultCount();
//                                                           apiflightController
//                                                               .update();
//                                                         },
//                                                         icon: Icon(Icons
//                                                             .do_not_disturb_on_outlined)),
//                                                     Obx(() => Text(
//                                                           '${apiflightController.adultsCount.value}',
//                                                           style: TextStyle(
//                                                               fontSize: 14),
//                                                         )),
//                                                     IconButton(
//                                                         onPressed: () {
//                                                           apiflightController
//                                                               .increaseAdultCount();
//                                                           apiflightController
//                                                               .update();
//                                                         },
//                                                         icon:const Icon(Icons
//                                                             .add_circle_outline_outlined))
//                                                   ],
//                                                 ),
//                                               ],
//                                         ),
//                                         ksizedbox10,
//                                         //child count
// Row(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .spaceBetween,
//                                                             children: [
//                                                               Text(
//                                                                 'Children (2-12 yrs)',
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         14),
//                                                               ),
//                                                               Row(
//                                                                 children: [
//                                                                   IconButton(
//                                                                       onPressed:
//                                                                           () {
//                                                                         apiflightController
//                                                                             .decreaseChildCount();
//                                                                         apiflightController
//                                                                             .update();
//                                                                       },
//                                                                       icon: Icon(
//                                                                           Icons
//                                                                               .do_not_disturb_on_outlined)),
//                                                                   Obx(
//                                                                       () =>
//                                                                           Text(
//                                                                             '${apiflightController.childsCount.value}',
//                                                                             style:
//                                                                                 TextStyle(fontSize: 14),
//                                                                           )),
//                                                                   IconButton(
//                                                                       onPressed:
//                                                                           () {
//                                                                         apiflightController
//                                                                             .increaseChildCount();
//                                                                         apiflightController
//                                                                             .update();
//                                                                       },
//                                                                       icon: const Icon(
//                                                                           Icons
//                                                                               .add_circle_outline_outlined))
//                                                                 ],
//                                                               ),
//                                                             ],
//                                                           )
//                                             ],
//                                           ),

GetBuilder<ApiflightsController>(
    builder: (_) {
    return  Row(
      children: [
         Row(
     mainAxisAlignment:
    
                                                                      MainAxisAlignment
    
                                                                          .spaceBetween,
    
                                                                  children: [
    
                                                                    Row(
    
                                                                      children: [
    
                                                                        // Text('${apiflightController.adultsCount.value}'),
    
                                                                          const Text(
    
                                                                          'Adults',
    
                                                                          style: TextStyle(
    
                                                                              fontSize:
    
                                                                                  13),
    
                                                                        ),
    
                                                                      ],
    
                                                                    ),
    
                                                                    Row(
    
                                                                      children: [
    
                                                                        IconButton(
    
                                                                            onPressed:
    
                                                                                () {
    
                                                                              apiflightController
    
                                                                                  .decreaseAdultCount();
    
                                                                              apiflightController
    
                                                                                  .update();
    
                                                                            },
    
                                                                            icon: const Icon(Icons
    
                                                                                .do_not_disturb_on_outlined),
    
                                                                                ),
    
                                                                        Obx(() => Text(
    
                                                                              '${apiflightController.adultsCount.value}',
    
                                                                              style: const TextStyle(
    
                                                                                  fontSize:
    
                                                                                      14),
    
                                                                            )),
    
                                                                        IconButton(
    
                                                                            onPressed:
    
                                                                                () {
    
                                                                              apiflightController
    
                                                                                  .increaseAdultCount();
    
                                                                              apiflightController
    
                                                                                  .update();
    
                                                                            },
    
                                                                            icon: const Icon(Icons
    
                                                                                .add_circle_outline_outlined))
    
                                                                      ],
    
                                                                    ),
    
                                                                  ],
    
                                                                ),
    
    
    
                                                                ksizedbox10,
    
    
    
                                                                Row(
    
                                                                    mainAxisAlignment:
    
                                                                        MainAxisAlignment
    
                                                                            .spaceBetween,
    
                                                                    children: [
    
                                                                      const Text(
    
                                                                        'Children',
    
                                                                        style: TextStyle(
    
                                                                            fontSize:
    
                                                                                14),
    
                                                                      ),
    
                                                                      Row(
    
                                                                        children: [
    
                                                                          IconButton(
    
                                                                              onPressed:
    
                                                                                  () {
    
                                                                                apiflightController
    
                                                                                    .decreaseChildCount();
    
                                                                                apiflightController
    
                                                                                    .update();
    
                                                                              },
    
                                                                              icon: Icon(
    
                                                                                  Icons
    
                                                                                      .do_not_disturb_on_outlined)),
    
                                                                          Obx(
    
                                                                              () =>
    
                                                                                  Text(
    
                                                                                    '${apiflightController.childsCount.value}',
    
                                                                                    style:
    
                                                                                       const TextStyle(fontSize: 14),
    
                                                                                  )),
    
                                                                          IconButton(
    
                                                                              onPressed:
    
                                                                                  () {
    
                                                                                apiflightController
    
                                                                                    .increaseChildCount();
    
                                                                                apiflightController
    
                                                                                    .update();
    
                                                                              },
    
                                                                              icon: const Icon(
    
                                                                                  Icons
    
                                                                                      .add_circle_outline_outlined))
    
                                                                        ],
    
                                                                      ),
    
                                                                    ],
    
                                                                  )
    
    
    
      ],
    
    );
  }
),
                                        // GetBuilder<ApiflightsController>(
                                        //   builder: (_) {
                                        //     return Container(
                                        //         height: 40,
                                        //         width: MediaQuery.of(context)
                                        //                 .size
                                        //                 .width *
                                        //             0.12,
                                        //         decoration: BoxDecoration(
                                        //             border:
                                        //                 Border.all(color: kgrey),
                                        //             borderRadius:
                                        //                 BorderRadius.circular(5)),
                                        //         alignment: Alignment.center,
                                        //         child: Row(
                                        //             mainAxisAlignment:
                                        //                 MainAxisAlignment
                                        //                     .spaceBetween,
                                        //             children: [
                                        //               Padding(
                                        //                 padding:
                                        //                     const EdgeInsets.only(
                                        //                         left: 10),
                                        //                 child: Text(dropvalue1),
                                        //               ),
                                        //               PopupMenuButton(
                                        //                 child:  Icon(Icons
                                        //                     .arrow_drop_down_sharp),
                                        //                   initialValue: 'Adults ${apiflightController.adultsCount.value}',
                                        //                 itemBuilder: (context) => [
                                        //                   PopupMenuItem(
                                        //                     value:  'Adults ${apiflightController.adultsCount.value}',
                                        //                     child: Row(
                                        //                       mainAxisAlignment:
                                        //                           MainAxisAlignment
                                        //                               .spaceBetween,
                                        //                       children: [
                                        //                         Row(
                                        //                           children: [
                                        //                             Text('${apiflightController.adultsCount.value}'),
                                        //                               const Text(
                                        //                               'Adults',
                                        //                               style: TextStyle(
                                        //                                   fontSize:
                                        //                                       13),
                                        //                             ),
                                        //                           ],
                                        //                         ),
                                        //                         Row(
                                        //                           children: [
                                        //                             IconButton(
                                        //                                 onPressed:
                                        //                                     () {
                                        //                                   apiflightController
                                        //                                       .decreaseAdultCount();
                                        //                                   apiflightController
                                        //                                       .update();
                                        //                                 },
                                        //                                 icon: const Icon(Icons
                                        //                                     .do_not_disturb_on_outlined),
                                        //                                     ),
                                        //                             Obx(() => Text(
                                        //                                   '${apiflightController.adultsCount.value}',
                                        //                                   style: const TextStyle(
                                        //                                       fontSize:
                                        //                                           14),
                                        //                                 )),
                                        //                             IconButton(
                                        //                                 onPressed:
                                        //                                     () {
                                        //                                   apiflightController
                                        //                                       .increaseAdultCount();
                                        //                                   apiflightController
                                        //                                       .update();
                                        //                                 },
                                        //                                 icon: const Icon(Icons
                                        //                                     .add_circle_outline_outlined))
                                        //                           ],
                                        //                         ),
                                        //                       ],
                                        //                     ),
                                        //                   ),
                                        //                   PopupMenuItem(
                                        //                       value:
                                        //                           'Children (2-12 yrs)',
                                        //                       child: Row(
                                        //                         mainAxisAlignment:
                                        //                             MainAxisAlignment
                                        //                                 .spaceBetween,
                                        //                         children: [
                                        //                           const Text(
                                        //                             'Children (2-12 yrs)',
                                        //                             style: TextStyle(
                                        //                                 fontSize:
                                        //                                     14),
                                        //                           ),
                                        //                           Row(
                                        //                             children: [
                                        //                               IconButton(
                                        //                                   onPressed:
                                        //                                       () {
                                        //                                     apiflightController
                                        //                                         .decreaseChildCount();
                                        //                                     apiflightController
                                        //                                         .update();
                                        //                                   },
                                        //                                   icon: Icon(
                                        //                                       Icons
                                        //                                           .do_not_disturb_on_outlined)),
                                        //                               Obx(
                                        //                                   () =>
                                        //                                       Text(
                                        //                                         '${apiflightController.childsCount.value}',
                                        //                                         style:
                                        //                                             TextStyle(fontSize: 14),
                                        //                                       )),
                                        //                               IconButton(
                                        //                                   onPressed:
                                        //                                       () {
                                        //                                     apiflightController
                                        //                                         .increaseChildCount();
                                        //                                     apiflightController
                                        //                                         .update();
                                        //                                   },
                                        //                                   icon: const Icon(
                                        //                                       Icons
                                        //                                           .add_circle_outline_outlined))
                                        //                             ],
                                        //                           ),
                                        //                         ],
                                        //                       )
                                        //                       ),
                                        //                 ],
                                        //                 onSelected: (value) {
                                        //                   setState(() {
                                        //                     dropvalue1 =
                                        //                         value.toString();
                                        //                   });
                                        //                 },
                                        //               ),
                                        //             ]));
                                        //   }
                                        // ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 22, top: 40),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            apiflightController
                                                .cabinClassIndex(0);
                                            apiflightController.update();
                                          },
                                          child: Container(
                                            height: 21,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            decoration:
                                                BoxDecoration(color: kOrange),
                                            child: Center(
                                              child: Text(
                                                'Economy',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: apiflightController
                                                                .cabinClassIndex
                                                                .value ==
                                                            0
                                                        ? kwhite
                                                        : kblue),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          child: InkWell(
                                            onTap: () {
                                              apiflightController
                                                  .cabinClassIndex(1);
                                              apiflightController.update();
                                            },
                                            child: Container(
                                              height: 20,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.22,
                                              decoration:
                                                  BoxDecoration(color: kblue),
                                              child: Center(
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 12),
                                                      child: Text(
                                                        'Premimum Economy ',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            color: apiflightController
                                                                        .cabinClassIndex ==
                                                                    1
                                                                ? korange
                                                                : kwhite),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: InkWell(
                                                        onTap: () {
                                                          apiflightController
                                                              .cabinClassIndex(
                                                                  2);
                                                          apiflightController
                                                              .update();
                                                        },
                                                        child: Text(
                                                          'Business',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 11,
                                                              color: apiflightController
                                                                          .cabinClassIndex
                                                                          .value ==
                                                                      2
                                                                  ? korange
                                                                  : kwhite),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: InkWell(
                                                        onTap: () {
                                                          apiflightController
                                                              .cabinClassIndex(
                                                                  3);
                                                          apiflightController
                                                              .update();
                                                        },
                                                        child: Text(
                                                          'First Class',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 11,
                                                              color: apiflightController
                                                                          .cabinClassIndex
                                                                          .value ==
                                                                      3
                                                                  ? korange
                                                                  : kwhite),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer()
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 300,
                    right: 0,
                    left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        apiflightController.isLoading.isTrue
                            ? Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.14,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: kwhite),
                                    gradient: LinearGradient(
                                        colors: [kOrange, kyellow])),
                                child: GestureDetector(
                                    onTap: () {
                                      flaightshowController.flaightshowindex(1);
                                      flaightshowController.update();
                                      print('............');
                                    },
                                    child: Container(
                                      height: 35,
                                      child: Center(
                                          child: CircularProgressIndicator(backgroundColor: kyellow,color: kOrange,)),
                                    )),
                              )
                            : Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.14,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: kwhite),
                                    gradient: LinearGradient(
                                        colors: [kOrange, kyellow])),
                                child: GestureDetector(
                                  onTap: () {
                                    int domORIntl = 0;

                                    if (apiflightController
                                            .originCountry.value ==
                                        apiflightController
                                            .destinationCountry.value) {
                                      domORIntl = 0;
                                    } else {
                                      domORIntl = 1;
                                    }

                                    print(
                                        "<<----------------->>- going to search -<<--------------->>");
                                    flaightshowController.flaightshowindex(1);
                                    flaightshowController.update();
                                    FlightSearchDataModel flightSearchDataModel = FlightSearchDataModel(
                                        adultsCount: apiflightController
                                            .adultsCount.value,
                                        cabinClass: apiflightController
                                            .cabinClassIndex.value,
                                        fromName: apiflightController
                                            .originFullName.value,
                                        toName: apiflightController
                                            .destinationFullName.value,
                                        childCount: apiflightController
                                            .childsCount.value,
                                        depatureDate:
                                            apiflightController.depatureDate,
                                        fromIata:
                                            apiflightController.origin.value,
                                        isOneWayOrRoundTrip:
                                            apiflightController.wayIndex.value,
                                        fromCountry: apiflightController
                                            .originCountry.value,
                                        toCountry: apiflightController
                                            .destinationCountry.value,
                                        returnDate:
                                            apiflightController.returnDate,
                                        isDomOrINTL: domORIntl,
                                        toIata: apiflightController
                                            .destination.value);

                                    apiflightController.airSearch(
                                        flightSearchModel:
                                            flightSearchDataModel,
                                        ismobilorweb: false);
                                  },
                                  child: Center(
                                      child: Text(
                                    'SEARCH',
                                    style:
                                        TextStyle(color: kwhite, fontSize: 16),
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                              )
                      ],
                    ),
                  ),
                ],
              ),
              if (flaightshowController.flaightshowindex.value == 1)
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                              color: kwhite,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: const Offset(0.0, 0.75),
                                    blurRadius: 5,
                                    color: kgrey)
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Popular Filters',
                                      style: TextStyle(
                                          fontSize: 16.2,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              ksizedbox20,
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              checkColor: kblue,
                                              activeColor: kwhite,
                                              value: nonstop,
                                              splashRadius: 1,
                                              onChanged: (value) {
                                                setState(() {
                                                  nonstop = value!;
                                                });
                                              }),
                                         const Text(
                                            'Non Stop',
                                            style: TextStyle(fontSize: 13),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              checkColor: kblue,
                                              activeColor: kwhite,
                                              value: prenoon,
                                              onChanged: (value) {
                                                setState(() {
                                                  prenoon = value!;
                                                });
                                              }),
                                          Text(
                                            'Prenoon Deparature',
                                            style: TextStyle(fontSize: 13),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              checkColor: kblue,
                                              activeColor: kwhite,
                                              value: indiGo,
                                              onChanged: (value) {
                                                setState(() {
                                                  indiGo = value!;
                                                });
                                              }),
                                          Text(
                                            'IndiGo',
                                            style: TextStyle(fontSize: 13),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              checkColor: kblue,
                                              activeColor: kwhite,
                                              value: vistara,
                                              onChanged: (value) {
                                                setState(() {
                                                  vistara = value!;
                                                });
                                              }),
                                          Text(
                                            'Vistara',
                                            style: TextStyle(fontSize: 13),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              checkColor: kblue,
                                              activeColor: kwhite,
                                              value: airIndia,
                                              onChanged: (value) {
                                                setState(() {
                                                  airIndia = value!;
                                                });
                                              }),
                                         const Text(
                                            'Air India',
                                            style: TextStyle(fontSize: 13),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              checkColor: kblue,
                                              activeColor: kwhite,
                                              value: spiceJet,
                                              onChanged: (value) {
                                                setState(() {
                                                  spiceJet = value!;
                                                });
                                              }),
                                         const Text(
                                            'SpiceJet',
                                            style: TextStyle(fontSize: 13),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              checkColor: kblue,
                                              activeColor: kwhite,
                                              value: goFirst,
                                              onChanged: (value) {
                                                setState(() {
                                                  goFirst = value!;
                                                });
                                              }),
                                          Text(
                                            'Go First',
                                            style: TextStyle(fontSize: 13),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              checkColor: kblue,
                                              activeColor: kwhite,
                                              value: airAsia,
                                              onChanged: (value) {
                                                setState(() {
                                                  airAsia = value!;
                                                });
                                              }),
                                          Text(
                                            'Air Asia',
                                            style: TextStyle(fontSize: 13),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              checkColor: kblue,
                                              activeColor: kwhite,
                                              value: lateDepartures,
                                              onChanged: (value) {
                                                setState(() {
                                                  lateDepartures = value!;
                                                });
                                              }),
                                          Text(
                                            'Late Departures ',
                                            style: TextStyle(fontSize: 13),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              checkColor: kblue,
                                              activeColor: kwhite,
                                              value: morningDepratures,
                                              onChanged: (value) {
                                                setState(() {
                                                  morningDepratures = value!;
                                                });
                                              }),
                                          Text(
                                            'Morning Depratures',
                                            style: TextStyle(fontSize: 13),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Container(
                              //   width: MediaQuery.of(context).size.width * 0.25,
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Padding(
                              //         padding: const EdgeInsets.only(left: 10),
                              //         child: Row(
                              //           children: [
                              //             Checkbox(
                              //                 checkColor: kblue,
                              //                 activeColor: kwhite,
                              //                 value: stop,
                              //                 onChanged: (value) {
                              //                   setState(() {
                              //                     stop = value!;
                              //                   });
                              //                 }),
                              //             Text(
                              //               '1 Stop (22)',
                              //               style: TextStyle(fontSize: 13),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Padding(
                                    //   padding: const EdgeInsets.only(left: 10),
                                    //   child: Row(
                                    //     children: [
                                    //       Checkbox(
                                    //           checkColor: kblue,
                                    //           activeColor: kwhite,
                                    //           value: refundable,
                                    //           onChanged: (value) {
                                    //             setState(() {
                                    //               refundable = value!;
                                    //             });
                                    //           }),
                                    //       Text(
                                    //         'Refundable Fares',
                                    //         style: TextStyle(fontSize: 13),
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(left: 10, top: 16),
                              //   child: Row(
                              //     children: [
                              //       Text(
                              //         'Show less',
                              //         style: TextStyle(
                              //             fontSize: 13, color: Colors.blue),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(top: 25, left: 10),
                              //   child: Row(
                              //     children: [
                              //       Text(
                              //         'One Way Price',
                              //         style: TextStyle(
                              //             fontSize: 14,
                              //             fontWeight: FontWeight.bold),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // Row(
                              //   children: [
                              //     Container(
                              //       width:
                              //           MediaQuery.of(context).size.width * 0.2,
                              //       child: Slider(
                              //           divisions: 200,
                              //           thumbColor: kwhite,
                              //           max: 200.0,
                              //           min: 0.0,
                              //           value: slider,
                              //           label: slider.round().toString(),
                              //           onChanged: (value) {
                              //             setState(() {
                              //               slider = value;
                              //             });
                              //           }),
                              //     )
                              //   ],
                              // ),

                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(top: 20, left: 10),
                              //   child: Row(
                              //     children: [
                              //       Text(
                              //         'Stops From Chennai',
                              //         style: TextStyle(
                              //             fontSize: 14,
                              //             fontWeight: FontWeight.bold),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(left: 15, top: 10),
                              //   child: Row(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Column(
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.start,
                              //         children: [
                              //           Row(
                              //             children: [
                              //               Checkbox(
                              //                   checkColor: kblue,
                              //                   activeColor: kwhite,
                              //                   value: stop,
                              //                   splashRadius: 1,
                              //                   onChanged: (value) {
                              //                     setState(() {
                              //                       stop = value!;
                              //                     });
                              //                   }),
                              //               Text(
                              //                 'Non Stop (17)',
                              //                 style: TextStyle(fontSize: 13),
                              //               )
                              //             ],
                              //           ),
                              //           Row(
                              //             children: [
                              //               Checkbox(
                              //                   checkColor: kblue,
                              //                   activeColor: kwhite,
                              //                   value: stop2,
                              //                   splashRadius: 1,
                              //                   onChanged: (value) {
                              //                     setState(() {
                              //                       stop2 = value!;
                              //                     });
                              //                   }),
                              //               Text(
                              //                 '1 Stop (22)',
                              //                 style: TextStyle(fontSize: 13),
                              //               )
                              //             ],
                              //           ),
                              //         ],
                              //       ),

                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(top: 30, left: 10),
                              //   child: Row(
                              //     children: [
                              //       Text(
                              //         'Departure From Chennai',
                              //         style: TextStyle(
                              //             fontSize: 14,
                              //             fontWeight: FontWeight.bold),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       left: 10, top: 20, right: 10),
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceAround,
                              //     children: [
                              //       Container(
                              //         height: 80,
                              //         width: 70,
                              //         decoration: BoxDecoration(
                              //             border: Border.all(color: kgrey),
                              //             borderRadius:
                              //                 BorderRadius.circular(5)),
                              //         child: Padding(
                              //           padding: const EdgeInsets.only(top: 10),
                              //           child: Column(
                              //             children: [
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 2),
                              //                 child: Center(
                              //                   child: Icon(
                              //                     Icons.wb_twilight_outlined,
                              //                     color: kgrey,
                              //                   ),
                              //                 ),
                              //               ),
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 5),
                              //                 child: Text(
                              //                   'Before 6AM',
                              //                   style: TextStyle(fontSize: 11),
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //       Container(
                              //         height: 80,
                              //         width: 70,
                              //         decoration: BoxDecoration(
                              //             border: Border.all(color: kgrey),
                              //             borderRadius:
                              //                 BorderRadius.circular(5)),
                              //         child: Padding(
                              //           padding: const EdgeInsets.only(top: 10),
                              //           child: Column(
                              //             children: [
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 2),
                              //                 child: Center(
                              //                   child: Icon(
                              //                     Icons.light_mode_outlined,
                              //                     color: kgrey,
                              //                   ),
                              //                 ),
                              //               ),
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 5),
                              //                 child: Text(
                              //                   'Before 6AM',
                              //                   style: TextStyle(fontSize: 11),
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //       Container(
                              //         height: 80,
                              //         width: 70,
                              //         decoration: BoxDecoration(
                              //             border: Border.all(color: kgrey),
                              //             borderRadius:
                              //                 BorderRadius.circular(5)),
                              //         child: Padding(
                              //           padding: const EdgeInsets.only(top: 10),
                              //           child: Column(
                              //             children: [
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 2),
                              //                 child: Center(
                              //                   child: Icon(
                              //                     Icons.light_mode_outlined,
                              //                     color: kgrey,
                              //                   ),
                              //                 ),
                              //               ),
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 5),
                              //                 child: Text(
                              //                   'Before 6AM',
                              //                   style: TextStyle(fontSize: 11),
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //       Container(
                              //         height: 80,
                              //         width: 70,
                              //         decoration: BoxDecoration(
                              //             border: Border.all(color: kgrey),
                              //             borderRadius:
                              //                 BorderRadius.circular(5)),
                              //         child: Padding(
                              //           padding: const EdgeInsets.only(top: 10),
                              //           child: Column(
                              //             children: [
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 2),
                              //                 child: Center(
                              //                   child: Icon(
                              //                     Icons.wb_twilight_outlined,
                              //                     color: kgrey,
                              //                   ),
                              //                 ),
                              //               ),
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 5),
                              //                 child: Text(
                              //                   'Before 6AM',
                              //                   style: TextStyle(fontSize: 11),
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // // ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(top: 30, left: 10),
                              //   child: Row(
                              //     children: [
                              //       Text(
                              //         'Arrival at New Delhi ',
                              //         style: TextStyle(
                              //             fontSize: 14,
                              //             fontWeight: FontWeight.bold),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       left: 10, top: 20, right: 10),
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceAround,
                              //     children: [
                              //       Container(
                              //         height: 80,
                              //         width: 70,
                              //         decoration: BoxDecoration(
                              //             border: Border.all(color: kgrey),
                              //             borderRadius:
                              //                 BorderRadius.circular(5)),
                              //         child: Padding(
                              //           padding: const EdgeInsets.only(top: 10),
                              //           child: Column(
                              //             children: [
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 2),
                              //                 child: Center(
                              //                   child: Icon(
                              //                     Icons.wb_twilight_outlined,
                              //                     color: kgrey,
                              //                   ),
                              //                 ),
                              //               ),
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 5),
                              //                 child: Text(
                              //                   'Before 6AM',
                              //                   style: TextStyle(fontSize: 11),
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //       Container(
                              //         height: 80,
                              //         width: 70,
                              //         decoration: BoxDecoration(
                              //             border: Border.all(color: kgrey),
                              //             borderRadius:
                              //                 BorderRadius.circular(5)),
                              //         child: Padding(
                              //           padding: const EdgeInsets.only(top: 10),
                              //           child: Column(
                              //             children: [
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 2),
                              //                 child: Center(
                              //                   child: Icon(
                              //                     Icons.light_mode_outlined,
                              //                     color: kgrey,
                              //                   ),
                              //                 ),
                              //               ),
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 5),
                              //                 child: Text(
                              //                   'Before 6AM',
                              //                   style: TextStyle(fontSize: 11),
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //       Container(
                              //         height: 80,
                              //         width: 70,
                              //         decoration: BoxDecoration(
                              //             border: Border.all(color: kgrey),
                              //             borderRadius:
                              //                 BorderRadius.circular(5)),
                              //         child: Padding(
                              //           padding: const EdgeInsets.only(top: 10),
                              //           child: Column(
                              //             children: [
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 2),
                              //                 child: Center(
                              //                   child: Icon(
                              //                     Icons.light_mode_outlined,
                              //                     color: kgrey,
                              //                   ),
                              //                 ),
                              //               ),
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 5),
                              //                 child: Text(
                              //                   'Before 6AM',
                              //                   style: TextStyle(fontSize: 11),
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //       Container(
                              //         height: 80,
                              //         width: 70,
                              //         decoration: BoxDecoration(
                              //             border: Border.all(color: kgrey),
                              //             borderRadius:
                              //                 BorderRadius.circular(5)),
                              //         child: Padding(
                              //           padding: const EdgeInsets.only(top: 10),
                              //           child: Column(
                              //             children: [
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 2),
                              //                 child: Center(
                              //                   child: Icon(
                              //                     Icons.wb_twilight_outlined,
                              //                     color: kgrey,
                              //                   ),
                              //                 ),
                              //               ),
                              //               Padding(
                              //                 padding:
                              //                     const EdgeInsets.only(top: 5),
                              //                 child: Text(
                              //                   'Before 6AM',
                              //                   style: TextStyle(fontSize: 11),
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),
                            const  Padding(
                                padding:
                                     EdgeInsets.only(left: 10, top: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      'Airlines',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: kblue,
                                                value: airline1,
                                                onChanged: (value) {
                                                  setState(() {
                                                    airline1 = value!;
                                                  });
                                                }),
                                            const Text(
                                              'Air India',
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Checkbox(
                                                    activeColor: kblue,
                                                    value: airline2,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        airline2 = value!;
                                                      });
                                                    }),
                                               const Text('Air Asia')
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: airline3,
                                                onChanged: (value) {
                                                  setState(() {
                                                    airline3 = value!;
                                                  });
                                                }),
                                            Text('Go First')
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: kblue,
                                                value: airline4,
                                                onChanged: (value) {
                                                  setState(() {
                                                    airline4 = value!;
                                                  });
                                                }),
                                            Text('IndiGo')
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: kblue,
                                                value: airline5,
                                                onChanged: (value) {
                                                  setState(() {
                                                    airline5 = value!;
                                                  });
                                                }),
                                            Text('SpiceJet')
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Checkbox(
                                                    activeColor: kblue,
                                                    value: airline6,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        airline6 = value!;
                                                      });
                                                    }),
                                                Text('Vistara'),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              ksizedbox20,
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25, left: 20),
                              child: Text(
                                'Flights from ${apiflightController.origin} to ${apiflightController.destination}',
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 24,
                                    color: kblue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 30, left: 20),
                            //   child: Obx(
                            //     () => Row(
                            //       children: [
                            //         Container(
                            //           height: 75,
                            //           width: 25,
                            //           decoration: BoxDecoration(
                            //             color: kwhite,
                            //             boxShadow: <BoxShadow>[
                            //               BoxShadow(
                            //                   offset: Offset(0.0, 0.75),
                            //                   blurRadius: 5,
                            //                   color: kgrey)
                            //             ],
                            //           ),
                            //           child: Center(
                            //               child: IconButton(
                            //                   onPressed: () {},
                            //                   icon: Icon(
                            //                     Icons.arrow_back_ios,
                            //                     color: kblue,
                            //                   ))),
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(left: 8),
                            //           child: GestureDetector(
                            //             onTap: () {
                            //               flaightdetailsController
                            //                   .faidetailsindex(1);
                            //               flaightdetailsController.update();
                            //             },
                            //             child: Container(
                            //                 height: 75,
                            //                 width: 100,
                            //                 decoration: BoxDecoration(
                            //                     color: flaightdetailsController
                            //                                 .faidetailsindex
                            //                                 .value ==
                            //                             1
                            //                         ? kOrange
                            //                         : kwhite,
                            //                     boxShadow: <BoxShadow>[
                            //                       BoxShadow(
                            //                           offset: Offset(0.0, 0.75),
                            //                           blurRadius: 5,
                            //                           color: kgrey)
                            //                     ]),
                            //                 child: Column(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment.center,
                            //                     children: [
                            //                       Text(
                            //                           formatDate(
                            //                               apiflightController
                            //                                   .depatureDate,
                            //                               [DD, '', mm, '']),
                            //                           style: TextStyle(
                            //                             color: kblue,
                            //                           )),
                            //                       Text('........',
                            //                           style: TextStyle(
                            //                               color: kblue,
                            //                               fontWeight:
                            //                                   FontWeight.bold))
                            //                     ])),
                            //           ),
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(left: 8),
                            //           child: GestureDetector(
                            //             onTap: () {
                            //               flaightdetailsController
                            //                   .faidetailsindex(2);
                            //               flaightdetailsController.update();
                            //             },
                            //             child: Container(
                            //                 height: 75,
                            //                 width: 100,
                            //                 decoration: BoxDecoration(
                            //                     color: flaightdetailsController
                            //                                 .faidetailsindex
                            //                                 .value ==
                            //                             2
                            //                         ? kOrange
                            //                         : kwhite,
                            //                     boxShadow: <BoxShadow>[
                            //                       BoxShadow(
                            //                           offset: Offset(0.0, 0.75),
                            //                           blurRadius: 5,
                            //                           color: kgrey)
                            //                     ]),
                            //                 child: Column(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment.center,
                            //                     children: [
                            //                       Text(
                            //                           formatDate(
                            //                               apiflightController
                            //                                   .depatureDate,
                            //                               [DD, '', mm, '']),
                            //                           style: TextStyle(
                            //                             color: kblue,
                            //                           )),
                            //                       Text('........',
                            //                           style: TextStyle(
                            //                               color: kblue,
                            //                               fontWeight:
                            //                                   FontWeight.bold))
                            //                     ])),
                            //           ),
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(left: 8),
                            //           child: GestureDetector(
                            //             onTap: () {
                            //               flaightdetailsController
                            //                   .faidetailsindex(3);
                            //               flaightdetailsController.update();
                            //             },
                            //             child: Container(
                            //                 height: 75,
                            //                 width: 100,
                            //                 decoration: BoxDecoration(
                            //                     color: flaightdetailsController
                            //                                 .faidetailsindex
                            //                                 .value ==
                            //                             3
                            //                         ? korange
                            //                         : kwhite,
                            //                     boxShadow: <BoxShadow>[
                            //                       BoxShadow(
                            //                           offset: Offset(0.0, 0.75),
                            //                           blurRadius: 5,
                            //                           color: kgrey)
                            //                     ]),
                            //                 child: Column(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment.center,
                            //                     children: [
                            //                       Text(
                            //                           formatDate(
                            //                               apiflightController
                            //                                   .depatureDate,
                            //                               [DD, '', mm, '']),
                            //                           style: TextStyle(
                            //                             color: kblue,
                            //                           )),
                            //                       Text('........',
                            //                           style: TextStyle(
                            //                               color: kblue,
                            //                               fontWeight:
                            //                                   FontWeight.bold))
                            //                     ])),
                            //           ),
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(left: 8),
                            //           child: GestureDetector(
                            //             onTap: () {
                            //               flaightdetailsController
                            //                   .faidetailsindex(4);
                            //               flaightdetailsController.update();
                            //             },
                            //             child: Container(
                            //                 height: 75,
                            //                 width: 100,
                            //                 decoration: BoxDecoration(
                            //                     color: flaightdetailsController
                            //                                 .faidetailsindex
                            //                                 .value ==
                            //                             4
                            //                         ? korange
                            //                         : kwhite,
                            //                     boxShadow: <BoxShadow>[
                            //                       BoxShadow(
                            //                           offset: Offset(0.0, 0.75),
                            //                           blurRadius: 5,
                            //                           color: kgrey)
                            //                     ]),
                            //                 child: Column(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment.center,
                            //                     children: [
                            //                       Text(
                            //                           formatDate(
                            //                               apiflightController
                            //                                   .depatureDate,
                            //                               [DD, '', mm, '']),
                            //                           style: TextStyle(
                            //                             color: kblue,
                            //                           )),
                            //                       Text('........',
                            //                           style: TextStyle(
                            //                               color: kblue,
                            //                               fontWeight:
                            //                                   FontWeight.bold))
                            //                     ])),
                            //           ),
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(left: 8),
                            //           child: GestureDetector(
                            //             onTap: () {
                            //               flaightdetailsController
                            //                   .faidetailsindex(5);
                            //               flaightdetailsController.update();
                            //             },
                            //             child: Container(
                            //                 height: 75,
                            //                 width: 100,
                            //                 decoration: BoxDecoration(
                            //                     color: flaightdetailsController
                            //                                 .faidetailsindex
                            //                                 .value ==
                            //                             5
                            //                         ? korange
                            //                         : kwhite,
                            //                     boxShadow: <BoxShadow>[
                            //                       BoxShadow(
                            //                           offset: Offset(0.0, 0.75),
                            //                           blurRadius: 5,
                            //                           color: kgrey)
                            //                     ]),
                            //                 child: Column(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment.center,
                            //                     children: [
                            //                       Text(
                            //                           formatDate(
                            //                               apiflightController
                            //                                   .depatureDate,
                            //                               [DD, '', mm, '']),
                            //                           style: TextStyle(
                            //                             color: kblue,
                            //                           )),
                            //                       Padding(
                            //                         padding:
                            //                             const EdgeInsets.only(
                            //                                 top: 4),
                            //                         child: Text('',
                            //                             style: TextStyle(
                            //                                 color: kblue,
                            //                                 fontWeight:
                            //                                     FontWeight
                            //                                         .bold)),
                            //                       )
                            //                     ])),
                            //           ),
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(left: 8),
                            //           child: GestureDetector(
                            //             onTap: () {
                            //               flaightdetailsController
                            //                   .faidetailsindex(6);
                            //               flaightdetailsController.update();
                            //             },
                            //             child: Container(
                            //                 height: 75,
                            //                 width: 100,
                            //                 decoration: BoxDecoration(
                            //                     color: flaightdetailsController
                            //                                 .faidetailsindex
                            //                                 .value ==
                            //                             6
                            //                         ? korange
                            //                         : kwhite,
                            //                     boxShadow: <BoxShadow>[
                            //                       BoxShadow(
                            //                           offset: Offset(0.0, 0.75),
                            //                           blurRadius: 5,
                            //                           color: kgrey)
                            //                     ]),
                            //                 child: Column(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment.center,
                            //                     children: [
                            //                       Text('Thu,May13',
                            //                           style: TextStyle(
                            //                             color: kblue,
                            //                           )),
                            //                       Padding(
                            //                         padding:
                            //                             const EdgeInsets.only(
                            //                                 top: 4),
                            //                         child: Text('₹ 6,123',
                            //                             style: TextStyle(
                            //                                 color: kblue,
                            //                                 fontWeight:
                            //                                     FontWeight
                            //                                         .bold)),
                            //                       )
                            //                     ])),
                            //           ),
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(left: 8),
                            //           child: GestureDetector(
                            //             onTap: () {
                            //               flaightdetailsController
                            //                   .faidetailsindex(7);
                            //               flaightdetailsController.update();
                            //             },
                            //             child: Container(
                            //                 height: 75,
                            //                 width: 100,
                            //                 decoration: BoxDecoration(
                            //                     color: flaightdetailsController
                            //                                 .faidetailsindex
                            //                                 .value ==
                            //                             7
                            //                         ? korange
                            //                         : kwhite,
                            //                     boxShadow: <BoxShadow>[
                            //                       BoxShadow(
                            //                           offset: Offset(0.0, 0.75),
                            //                           blurRadius: 5,
                            //                           color: kgrey)
                            //                     ]),
                            //                 child: Column(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment.center,
                            //                     children: [
                            //                       Text('Thu,May14',
                            //                           style: TextStyle(
                            //                             color: kblue,
                            //                           )),
                            //                       Padding(
                            //                         padding:
                            //                             const EdgeInsets.only(
                            //                                 top: 4),
                            //                         child: Text('₹ 6,123',
                            //                             style: TextStyle(
                            //                                 color: kblue,
                            //                                 fontWeight:
                            //                                     FontWeight
                            //                                         .bold)),
                            //                       )
                            //                     ])),
                            //           ),
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(left: 8),
                            //           child: GestureDetector(
                            //             onTap: () {
                            //               flaightdetailsController
                            //                   .faidetailsindex(8);
                            //               flaightdetailsController.update();
                            //             },
                            //             child: Container(
                            //                 height: 75,
                            //                 width: 100,
                            //                 decoration: BoxDecoration(
                            //                     color: flaightdetailsController
                            //                                 .faidetailsindex
                            //                                 .value ==
                            //                             8
                            //                         ? korange
                            //                         : kwhite,
                            //                     boxShadow: <BoxShadow>[
                            //                       BoxShadow(
                            //                           offset: Offset(0.0, 0.75),
                            //                           blurRadius: 5,
                            //                           color: kgrey)
                            //                     ]),
                            //                 child: Column(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment.center,
                            //                     children: [
                            //                       Text('Thu,May15',
                            //                           style: TextStyle(
                            //                             color: kblue,
                            //                           )),
                            //                       Padding(
                            //                         padding:
                            //                             const EdgeInsets.only(
                            //                                 top: 4),
                            //                         child: Text('₹ 6,123',
                            //                             style: TextStyle(
                            //                                 color: kblue,
                            //                                 fontWeight:
                            //                                     FontWeight
                            //                                         .bold)),
                            //                       )
                            //                     ])),
                            //           ),
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(left: 8),
                            //           child: Container(
                            //             height: 75,
                            //             width: 25,
                            //             decoration: BoxDecoration(
                            //                 color: kwhite,
                            //                 boxShadow: <BoxShadow>[
                            //                   BoxShadow(
                            //                       offset: Offset(0.0, 0.75),
                            //                       blurRadius: 5,
                            //                       color: kgrey)
                            //                 ]),
                            //             child: Center(
                            //                 child: IconButton(
                            //                     onPressed: () {},
                            //                     icon: Icon(
                            //                       Icons.arrow_forward_ios,
                            //                       color: korange,
                            //                     ))),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 40),
                              child: Container(
                                width: MediaQuery.of(context).size.width -
                                    MediaQuery.of(context).size.width * 0.28,
                                decoration: BoxDecoration(
                                    color: kwhite,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          offset: const Offset(0.0, 0.75),
                                          blurRadius: 5,
                                          color: kgrey)
                                    ]),
                                child: GetBuilder<ApiflightsController>(
                                    builder: (_) {
                                  return ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          apiflightController.flightList.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 20,
                                                left: 20,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                   const Text(
                                                        'Sorted By:',
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 20),
                                                        child: Row(
                                                          children: [
                                                          Image.asset(
                                                            'assets/images/bookingflaight.png',
                                                            height: 35,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10),
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  apiflightController
                                                                      .flightList[
                                                                          index]
                                                                      .segments
                                                                      .first
                                                                      .airlineName,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color:
                                                                          kblue,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 4),
                                                                  child: Text(
                                                                    apiflightController
                                                                        .flightList[
                                                                            index]
                                                                        .segments
                                                                        .first
                                                                        .flightNumber,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color:
                                                                            kblue,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ]),
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                      const  Text(
                                                          'Departure',
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 20),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    apiflightController
                                                                        .flightList[
                                                                            index]
                                                                        .segments
                                                                        .first
                                                                        .departureDateTime
                                                                        .split(
                                                                            " ")
                                                                        .last,
                                                                    style: TextStyle(
                                                                        color:
                                                                            kblue,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 4),
                                                                  child: Text(
                                                                      apiflightController
                                                                          .flightList[
                                                                              index]
                                                                          .segments
                                                                          .first
                                                                          .originCity,
                                                                      style: TextStyle(
                                                                          color:
                                                                              kblue,
                                                                          fontSize:
                                                                              12)),
                                                                )
                                                              ]),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                       const Text(
                                                          'Duration',
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 20),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  apiflightController
                                                                      .flightList[
                                                                          index]
                                                                      .segments
                                                                      .last
                                                                      .duration,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          12)),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 4),
                                                                child: Container(
                                                                    height: 2,
                                                                    width: 50,
                                                                    color:
                                                                        korange),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 4),
                                                                child: apiflightController
                                                                            .flightList[
                                                                                index]
                                                                            .segments
                                                                            .length ==
                                                                        1
                                                                    ? const Text(
                                                                        'Non stop',
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xff8C8AAF)))
                                                                    : Text(
                                                                        '${apiflightController.flightList[index].segments.length - 1} stop,via ${apiflightController.flightList[index].segments.first.destinationCity}',
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                12)),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Arrival',
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 20),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  apiflightController
                                                                      .flightList[
                                                                          index]
                                                                      .segments
                                                                      .last
                                                                      .arrivalDateTime
                                                                      .split(
                                                                          " ")
                                                                      .last,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color:
                                                                          kblue)),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 4),
                                                                child: Text(
                                                                    apiflightController
                                                                        .flightList[
                                                                            index]
                                                                        .segments
                                                                        .last
                                                                        .destination,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12)),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 60),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Price',
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 35),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  '₹ ${apiflightController.flightList[index].fares.first.fareDetails.first.totalAmount}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      color:
                                                                          kblue,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            45),
                                                                child:
                                                                    ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(
                                                                            backgroundColor:
                                                                                korange),
                                                                        onPressed:
                                                                            () {
                                                                          int domORIntl =
                                                                              0;

                                                                          if (apiflightController.originCountry.value ==
                                                                              apiflightController.destinationCountry.value) {
                                                                            domORIntl =
                                                                                0;
                                                                          } else {
                                                                            domORIntl =
                                                                                1;
                                                                          }
                                                                          Get.offAll(
                                                                              BookingOptionsScreen(
                                                                            flight:
                                                                                apiflightController.flightList[index],
                                                                            flightSearchDataModel: FlightSearchDataModel(
                                                                                adultsCount: apiflightController.adultsCount.value,
                                                                                cabinClass: apiflightController.cabinClassIndex.value,
                                                                                fromName: apiflightController.originFullName.value,
                                                                                toName: apiflightController.destinationFullName.value,
                                                                                childCount: apiflightController.childsCount.value,
                                                                                depatureDate: apiflightController.depatureDate,
                                                                                fromIata: apiflightController.origin.value,
                                                                                isOneWayOrRoundTrip: apiflightController.wayIndex.value,
                                                                                returnDate: apiflightController.returnDate,
                                                                                toIata: apiflightController.destination.value,
                                                                                fromCountry: apiflightController.originCountry.value,
                                                                                isDomOrINTL: domORIntl,
                                                                                toCountry: apiflightController.destinationCountry.value),
                                                                            flightKey:
                                                                                apiflightController.flightList[index].flightKey,
                                                                            seachKey:
                                                                               apiflightController.tempSearchKey.value,
                                                                          ));
                                                                        },
                                                                        child: Text(
                                                                            'Book')),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ksizedbox10,
                                            const  Divider(
                                              thickness: 1,
                                            ),
                                            // Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       left: 20, top: 10),
                                            //   child: Row(
                                            //     children: [
                                            //       InkWell(
                                            //         onTap: () {
                                            //           apiflightController
                                            //               .showdetails(1);
                                            //           apiflightController
                                            //               .update();
                                            //         },
                                            //         onDoubleTap: () {
                                            //           apiflightController
                                            //               .showdetails(0);
                                            //           apiflightController
                                            //               .update();
                                            //         },
                                            //         child: apiflightController
                                            //                     .showdetails
                                            //                     .value ==
                                            //                 0
                                            //             ? Text(
                                            //                 'Show details',
                                            //                 style: TextStyle(
                                            //                     fontSize: 12,
                                            //                     color: korange),
                                            //               )
                                            //             : Text('Hide details',
                                            //                 style: TextStyle(
                                            //                     fontSize: 12,
                                            //                     color:
                                            //                         korange)),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Row(
                                                children: [
                                                  Container(
                                                      height: 1,
                                                      width: 65,
                                                      color: korange),
                                                ],
                                              ),
                                            ),
                                            if (apiflightController
                                                    .showdetails.value ==
                                                1)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20,
                                                    left: 20,
                                                    right: 20),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.28,
                                                  decoration: BoxDecoration(
                                                      color: kwhite,
                                                      border: Border.all(
                                                          color: kgrey)),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20,
                                                                  top: 10),
                                                          child: Row(children: [
                                                            Text(
                                                                '${apiflightController.originCountry} → ${apiflightController.destinationCountry} ${formatDate(apiflightController.depatureDate, [
                                                                      DD,
                                                                      '-',
                                                                      mm,
                                                                      '-',
                                                                      yyyy
                                                                    ])}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12))
                                                          ]),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 20),
                                                                  child: Image.asset(
                                                                      'assets/images/bookingflaight.png',
                                                                      height:
                                                                          35,
                                                                      fit: BoxFit
                                                                          .fitHeight),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 40),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          '${apiflightController.flightList[index].segments.first.originCity} ${apiflightController.flightList[index].segments.first.departureDateTime.split(' ').last}',
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: kblue)),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 5),
                                                                        child: Text(
                                                                            formatDate(apiflightController.splitdate(apiflightController.flightList[index].segments.first.departureDateTime.split(' ').first), [
                                                                              DD,
                                                                              ',',
                                                                              dd,
                                                                              ' ',
                                                                              MM,
                                                                              ' ',
                                                                              yyyy,
                                                                              ''
                                                                            ]),
                                                                            style:
                                                                                TextStyle(fontSize: 12)),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 40),
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Icon(Icons
                                                                            .schedule_outlined),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(top: 5),
                                                                          child: Text(
                                                                              apiflightController.flightList[index].segments.first.duration,
                                                                              style: TextStyle(fontSize: 12)),
                                                                        )
                                                                      ]),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 40),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          '${apiflightController.flightList[index].segments.first.destination} ${apiflightController.flightList[index].segments.first.arrivalDateTime.split(' ').last}',
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: kblue)),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 5),
                                                                        child: Text(
                                                                            formatDate(apiflightController.splitdate(apiflightController.flightList[index].segments.first.arrivalDateTime.split(' ').first), [
                                                                              DD,
                                                                              ',',
                                                                              dd,
                                                                              ' ',
                                                                              MM,
                                                                              ' ',
                                                                              yyyy
                                                                            ]),
                                                                            style:  const  TextStyle(fontSize: 12)),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      right: 60,
                                                                      top: 50),
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Baggage',
                                                                          style: TextStyle(
                                                                              fontSize: 17,
                                                                              color: kblue,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(top: 3),
                                                                          child: Text(
                                                                              'Check In Baggage: ${apiflightController.flightList[index].fares.last.fareDetails.last.freeBaggage.checkInBaggage}',
                                                                              style: TextStyle(fontSize: 13, color: kblue)),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(top: 5),
                                                                          child: Text(
                                                                              'Hand Baggage: ${apiflightController.flightList[index].fares.last.fareDetails.last.freeBaggage.handBaggage}',
                                                                              style: TextStyle(
                                                                                fontSize: 13,
                                                                                color: kblue,
                                                                              )),
                                                                        )
                                                                      ]),
                                                                )
                                                              ]),
                                                        ),
                                                        // Padding(
                                                        //   padding:
                                                        //       const EdgeInsets
                                                        //               .only(
                                                        //           left: 20),
                                                        //   child: Row(children: [
                                                        //     Column(
                                                        //       crossAxisAlignment:
                                                        //           CrossAxisAlignment
                                                        //               .start,
                                                        //       children: [
                                                        //         Text(
                                                        //             'Indigo airline',
                                                        //             style: TextStyle(
                                                        //                 fontSize:
                                                        //                     12)),
                                                        //         Padding(
                                                        //           padding: const EdgeInsets
                                                        //                   .only(
                                                        //               top: 4),
                                                        //           child: Text(
                                                        //               'Indigo-23',
                                                        //               style: TextStyle(
                                                        //                   fontSize:
                                                        //                       12)),
                                                        //         ),
                                                        //         Padding(
                                                        //           padding: const EdgeInsets
                                                        //                   .only(
                                                        //               top: 4),
                                                        //           child: Text(
                                                        //               'Economy',
                                                        //               style: TextStyle(
                                                        //                   fontSize:
                                                        //                       12)),
                                                        //         )
                                                        //       ],
                                                        //     ),
                                                        //   ]),
                                                        // ),
                                                        ksizedbox10,
                                                      ]),
                                                ),
                                              )
                                          ],
                                        );
                                      });
                                }),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top:40,left:20),
                            //   child: Container(
                            //       height: MediaQuery.of(context).size.height*0.2,
                            //       width:MediaQuery.of(context).size.width-MediaQuery.of(context).size.width*0.28,
                            //       decoration: BoxDecoration(
                            //         color: kwhite,
                            //         boxShadow: <BoxShadow>[
                            //           BoxShadow(
                            //             offset: Offset(0.0, 0.75),
                            //             blurRadius: 5,
                            //             color:kgrey
                            //           )
                            //         ],

                            //       ),
                            //       child:Padding(
                            //         padding: const EdgeInsets.only(top:20,left:20),
                            //         child: Row(
                            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //               children: [
                            //                 Column(
                            //                   crossAxisAlignment: CrossAxisAlignment.start,
                            //                   children: [
                            //                     Text('Sorted By:',
                            //                     style: TextStyle(
                            //                       fontSize: 14
                            //                     ),),
                            //                        Padding(
                            //                          padding: const EdgeInsets.only(top:20),
                            //                          child: Row(
                            //                            children:[ Image.asset('assets/images/bookingflaight.png',
                            //                                 height: 35,fit:BoxFit.fitHeight,),

                            //                                Padding(
                            //                               padding: const EdgeInsets.only(left:10),
                            //                               child: Column(
                            //                                   children: [
                            //                                     Text('IndiGo',
                            //                                     style: TextStyle(
                            //                                       fontSize: 12,
                            //                                       color:kblue,
                            //                                       fontWeight: FontWeight.bold
                            //                                     ),),
                            //                                     Padding(
                            //                                       padding: const EdgeInsets.only(top:4),
                            //                                       child: Text('6E8282',
                            //                                       style: TextStyle(
                            //                                         fontSize: 12,
                            //                                         color:kblue,
                            //                                         fontWeight: FontWeight.bold
                            //                                       ),),
                            //                                     )
                            //                                   ],
                            //                                 ),
                            //                             ),
                            //                            ]
                            //                          ),
                            //                        )

                            //                   ],
                            //                 ),
                            //                    Padding(
                            //                      padding: const EdgeInsets.only(right:0),
                            //                      child: Column(
                            //                       crossAxisAlignment: CrossAxisAlignment.start,
                            //                        children: [
                            //                          Text('Departure',
                            //                          style: TextStyle(
                            //                           fontSize: 14
                            //                           ),),
                            //                           Padding(
                            //                             padding: const EdgeInsets.only(top:20),
                            //                             child: Column(
                            //                               children:[
                            //                                  Text('10:34',
                            //                                  style:TextStyle(
                            //                                   color:kblue,
                            //                                   fontSize: 15,
                            //                                   fontWeight: FontWeight.bold
                            //                                  )),
                            //                             Padding(
                            //                               padding: const EdgeInsets.only(top:4),
                            //                               child: Text('Chennai',
                            //                               style:TextStyle(
                            //                                 color:kblue,
                            //                                 fontSize: 12
                            //                               )),
                            //                             )
                            //                               ]
                            //                             ),
                            //                           )

                            //                        ],
                            //                      ),
                            //                    ),
                            //                 Padding(
                            //                   padding: const EdgeInsets.only(right: 0),
                            //                   child: Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       Text('Duration',
                            //                        style: TextStyle(
                            //                         fontSize: 14
                            //                       ),),
                            //                       Padding(
                            //                         padding: const EdgeInsets.only(top:20),
                            //                         child: Column(
                            //                           crossAxisAlignment: CrossAxisAlignment.start,
                            //                           children: [
                            //                             Text('02 h 50 m',
                            //                             style:TextStyle(
                            //                               fontSize: 12
                            //                             )),
                            //                             Padding(
                            //                               padding: const EdgeInsets.only(top:4),
                            //                               child: Container(
                            //                                  height: 2,
                            //                                   width:50,
                            //                                   color:korange
                            //                                   ),
                            //                             ),
                            //                         Padding(
                            //                           padding: const EdgeInsets.only(top:4),
                            //                           child: Text('Non Stop',
                            //                           style:TextStyle(
                            //                             fontSize:12
                            //                           )),
                            //                         )
                            //                           ],
                            //                         ),
                            //                       ),

                            //                     ],
                            //                   ),
                            //                 ),
                            //                 Padding(
                            //                   padding: const EdgeInsets.only(right:0),
                            //                   child: Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       Text('Arrival',
                            //                        style: TextStyle(
                            //                         fontSize: 14
                            //                       ),),
                            //                       Padding(
                            //                         padding: const EdgeInsets.only(top:20),
                            //                         child: Column(
                            //                           crossAxisAlignment: CrossAxisAlignment.start,
                            //                           children: [
                            //                             Text('01:25',
                            //                             style:TextStyle(
                            //                               fontSize: 15,
                            //                               fontWeight: FontWeight.bold,
                            //                               color:kblue
                            //                             )),
                            //                              Padding(
                            //                                padding: const EdgeInsets.only(top:4),
                            //                                child: Text('New Delhi',
                            //                                style:TextStyle(
                            //                                 fontSize:12
                            //                                )),
                            //                              )
                            //                           ],
                            //                         ),
                            //                       ),

                            //                     ],
                            //                   ),
                            //                 ),
                            //                 Padding(
                            //                   padding: const EdgeInsets.only(right:60),
                            //                   child: Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       Text('Price',
                            //                        style: TextStyle(
                            //                         fontSize: 14
                            //                       ),),
                            //                       Padding(
                            //                         padding: const EdgeInsets.only(top:35),
                            //                         child: Row(
                            //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                           children: [
                            //                             Text('₹ 5,183',
                            //                             style:TextStyle(fontSize: 15,
                            //                             color:kblue,
                            //                             fontWeight: FontWeight.bold)),
                            //                             Padding(
                            //                               padding: const EdgeInsets.only(left:45),
                            //                               child: ElevatedButton(
                            //                                 style: ElevatedButton.styleFrom(
                            //                                   backgroundColor: korange
                            //                                 ),
                            //                                 onPressed:(){
                            //                                   Get.offAll(BookingOptionsScreen());
                            //                                 } ,
                            //                                  child: Text('Book')),
                            //                             )
                            //                           ],
                            //                         ),
                            //                       )
                            //                     ],
                            //                   ),
                            //                 ),

                            //               ],
                            //             ),
                            //       ),
                            //   ),
                            // ),
                            //  Padding(
                            //   padding: const EdgeInsets.only(top:40,left:20),
                            //   child: Container(
                            //       height: MediaQuery.of(context).size.height*0.2,
                            //       width:MediaQuery.of(context).size.width-MediaQuery.of(context).size.width*0.28,
                            //       decoration: BoxDecoration(
                            //         color: kwhite,
                            //         boxShadow: <BoxShadow>[
                            //           BoxShadow(
                            //             offset: Offset(0.0, 0.75),
                            //             blurRadius: 5,
                            //             color:kgrey
                            //           )
                            //         ],

                            //       ),
                            //       child:Padding(
                            //         padding: const EdgeInsets.only(top:20,left:20),
                            //         child: Row(
                            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //               children: [
                            //                 Column(
                            //                   crossAxisAlignment: CrossAxisAlignment.start,
                            //                   children: [
                            //                     Text('Sorted By:',
                            //                     style: TextStyle(
                            //                       fontSize: 14
                            //                     ),),
                            //                        Padding(
                            //                          padding: const EdgeInsets.only(top:20),
                            //                          child: Row(
                            //                            children:[ Image.asset('assets/images/bookingflaight.png',
                            //                                 height: 35,fit:BoxFit.fitHeight,),

                            //                                Padding(
                            //                               padding: const EdgeInsets.only(left:10),
                            //                               child: Column(
                            //                                   children: [
                            //                                     Text('IndiGo',
                            //                                     style: TextStyle(
                            //                                       fontSize: 12,
                            //                                       color:kblue,
                            //                                       fontWeight: FontWeight.bold
                            //                                     ),),
                            //                                     Padding(
                            //                                       padding: const EdgeInsets.only(top:4),
                            //                                       child: Text('6E8282',
                            //                                       style: TextStyle(
                            //                                         fontSize: 12,
                            //                                         color:kblue,
                            //                                         fontWeight: FontWeight.bold
                            //                                       ),),
                            //                                     )
                            //                                   ],
                            //                                 ),
                            //                             ),
                            //                            ]
                            //                          ),
                            //                        )

                            //                   ],
                            //                 ),
                            //                    Padding(
                            //                      padding: const EdgeInsets.only(right:0),
                            //                      child: Column(
                            //                       crossAxisAlignment: CrossAxisAlignment.start,
                            //                        children: [
                            //                          Text('Departure',
                            //                          style: TextStyle(
                            //                           fontSize: 14
                            //                           ),),
                            //                           Padding(
                            //                             padding: const EdgeInsets.only(top:20),
                            //                             child: Column(
                            //                               children:[
                            //                                  Text('10:34',
                            //                                  style:TextStyle(
                            //                                   color:kblue,
                            //                                   fontSize: 15,
                            //                                   fontWeight: FontWeight.bold
                            //                                  )),
                            //                             Padding(
                            //                               padding: const EdgeInsets.only(top:4),
                            //                               child: Text('Chennai',
                            //                               style:TextStyle(
                            //                                 color:kblue,
                            //                                 fontSize: 12
                            //                               )),
                            //                             )
                            //                               ]
                            //                             ),
                            //                           )

                            //                        ],
                            //                      ),
                            //                    ),
                            //                 Padding(
                            //                   padding: const EdgeInsets.only(right: 0),
                            //                   child: Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       Text('Duration',
                            //                        style: TextStyle(
                            //                         fontSize: 14
                            //                       ),),
                            //                       Padding(
                            //                         padding: const EdgeInsets.only(top:20),
                            //                         child: Column(
                            //                           crossAxisAlignment: CrossAxisAlignment.start,
                            //                           children: [
                            //                             Text('02 h 50 m',
                            //                             style:TextStyle(
                            //                               fontSize: 12
                            //                             )),
                            //                             Padding(
                            //                               padding: const EdgeInsets.only(top:4),
                            //                               child: Container(
                            //                                  height: 2,
                            //                                   width:50,
                            //                                   color:korange
                            //                                   ),
                            //                             ),
                            //                         Padding(
                            //                           padding: const EdgeInsets.only(top:4),
                            //                           child: Text('Non Stop',
                            //                           style:TextStyle(
                            //                             fontSize:12
                            //                           )),
                            //                         )
                            //                           ],
                            //                         ),
                            //                       ),

                            //                     ],
                            //                   ),
                            //                 ),
                            //                 Padding(
                            //                   padding: const EdgeInsets.only(right:0),
                            //                   child: Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       Text('Arrival',
                            //                        style: TextStyle(
                            //                         fontSize: 14
                            //                       ),),
                            //                       Padding(
                            //                         padding: const EdgeInsets.only(top:20),
                            //                         child: Column(
                            //                           crossAxisAlignment: CrossAxisAlignment.start,
                            //                           children: [
                            //                             Text('01:25',
                            //                             style:TextStyle(
                            //                               fontSize: 15,
                            //                               fontWeight: FontWeight.bold,
                            //                               color:kblue
                            //                             )),
                            //                              Padding(
                            //                                padding: const EdgeInsets.only(top:4),
                            //                                child: Text('New Delhi',
                            //                                style:TextStyle(
                            //                                 fontSize:12
                            //                                )),
                            //                              )
                            //                           ],
                            //                         ),
                            //                       ),

                            //                     ],
                            //                   ),
                            //                 ),
                            //                 Padding(
                            //                   padding: const EdgeInsets.only(right:60),
                            //                   child: Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       Text('Price',
                            //                        style: TextStyle(
                            //                         fontSize: 14
                            //                       ),),
                            //                       Padding(
                            //                         padding: const EdgeInsets.only(top:35),
                            //                         child: Row(
                            //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                           children: [
                            //                             Text('₹ 5,183',
                            //                             style:TextStyle(fontSize: 15,
                            //                             color:kblue,
                            //                             fontWeight: FontWeight.bold)),
                            //                             Padding(
                            //                               padding: const EdgeInsets.only(left:45),
                            //                               child: ElevatedButton(
                            //                                 style: ElevatedButton.styleFrom(
                            //                                   backgroundColor: korange
                            //                                 ),
                            //                                 onPressed:(){} ,
                            //                                  child: Text('Book')),
                            //                             )
                            //                           ],
                            //                         ),
                            //                       )
                            //                     ],
                            //                   ),
                            //                 ),

                            //               ],
                            //             ),
                            //       ),
                            //   ),
                            // ),

                            //  Padding(
                            //   padding: const EdgeInsets.only(top:40,left:20),
                            //   child: Container(
                            //       height: MediaQuery.of(context).size.height*0.2,
                            //       width:MediaQuery.of(context).size.width-MediaQuery.of(context).size.width*0.28,
                            //       decoration: BoxDecoration(
                            //         color: kwhite,
                            //         boxShadow: <BoxShadow>[
                            //           BoxShadow(
                            //             offset: Offset(0.0, 0.75),
                            //             blurRadius: 5,
                            //             color:kgrey
                            //           )
                            //         ],

                            //       ),
                            //       child:Padding(
                            //         padding: const EdgeInsets.only(top:20,left:20),
                            //         child: Row(
                            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //               children: [
                            //                 Column(
                            //                   crossAxisAlignment: CrossAxisAlignment.start,
                            //                   children: [
                            //                     Text('Sorted By:',
                            //                     style: TextStyle(
                            //                       fontSize: 14
                            //                     ),),
                            //                        Padding(
                            //                          padding: const EdgeInsets.only(top:20),
                            //                          child: Row(
                            //                            children:[ Image.asset('assets/images/bookingflaight.png',
                            //                                 height: 35,fit:BoxFit.fitHeight,),

                            //                                Padding(
                            //                               padding: const EdgeInsets.only(left:10),
                            //                               child: Column(
                            //                                   children: [
                            //                                     Text('IndiGo',
                            //                                     style: TextStyle(
                            //                                       fontSize: 12,
                            //                                       color:kblue,
                            //                                       fontWeight: FontWeight.bold
                            //                                     ),),
                            //                                     Padding(
                            //                                       padding: const EdgeInsets.only(top:4),
                            //                                       child: Text('6E8282',
                            //                                       style: TextStyle(
                            //                                         fontSize: 12,
                            //                                         color:kblue,
                            //                                         fontWeight: FontWeight.bold
                            //                                       ),),
                            //                                     )
                            //                                   ],
                            //                                 ),
                            //                             ),
                            //                            ]
                            //                          ),
                            //                        )

                            //                   ],
                            //                 ),
                            //                    Padding(
                            //                      padding: const EdgeInsets.only(right:0),
                            //                      child: Column(
                            //                       crossAxisAlignment: CrossAxisAlignment.start,
                            //                        children: [
                            //                          Text('Departure',
                            //                          style: TextStyle(
                            //                           fontSize: 14
                            //                           ),),
                            //                           Padding(
                            //                             padding: const EdgeInsets.only(top:20),
                            //                             child: Column(
                            //                               children:[
                            //                                  Text('10:34',
                            //                                  style:TextStyle(
                            //                                   color:kblue,
                            //                                   fontSize: 15,
                            //                                   fontWeight: FontWeight.bold
                            //                                  )),
                            //                             Padding(
                            //                               padding: const EdgeInsets.only(top:4),
                            //                               child: Text('Chennai',
                            //                               style:TextStyle(
                            //                                 color:kblue,
                            //                                 fontSize: 12
                            //                               )),
                            //                             )
                            //                               ]
                            //                             ),
                            //                           )

                            //                        ],
                            //                      ),
                            //                    ),
                            //                 Padding(
                            //                   padding: const EdgeInsets.only(right: 0),
                            //                   child: Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       Text('Duration',
                            //                        style: TextStyle(
                            //                         fontSize: 14
                            //                       ),),
                            //                       Padding(
                            //                         padding: const EdgeInsets.only(top:20),
                            //                         child: Column(
                            //                           crossAxisAlignment: CrossAxisAlignment.start,
                            //                           children: [
                            //                             Text('02 h 50 m',
                            //                             style:TextStyle(
                            //                               fontSize: 12
                            //                             )),
                            //                             Padding(
                            //                               padding: const EdgeInsets.only(top:4),
                            //                               child: Container(
                            //                                  height: 2,
                            //                                   width:50,
                            //                                   color:korange
                            //                                   ),
                            //                             ),
                            //                         Padding(
                            //                           padding: const EdgeInsets.only(top:4),
                            //                           child: Text('Non Stop',
                            //                           style:TextStyle(
                            //                             fontSize:12
                            //                           )),
                            //                         )
                            //                           ],
                            //                         ),
                            //                       ),

                            //                     ],
                            //                   ),
                            //                 ),
                            //                 Padding(
                            //                   padding: const EdgeInsets.only(right:0),
                            //                   child: Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       Text('Arrival',
                            //                        style: TextStyle(
                            //                         fontSize: 14
                            //                       ),),
                            //                       Padding(
                            //                         padding: const EdgeInsets.only(top:20),
                            //                         child: Column(
                            //                           crossAxisAlignment: CrossAxisAlignment.start,
                            //                           children: [
                            //                             Text('01:25',
                            //                             style:TextStyle(
                            //                               fontSize: 15,
                            //                               fontWeight: FontWeight.bold,
                            //                               color:kblue
                            //                             )),
                            //                              Padding(
                            //                                padding: const EdgeInsets.only(top:4),
                            //                                child: Text('New Delhi',
                            //                                style:TextStyle(
                            //                                 fontSize:12
                            //                                )),
                            //                              )
                            //                           ],
                            //                         ),
                            //                       ),

                            //                     ],
                            //                   ),
                            //                 ),
                            //                 Padding(
                            //                   padding: const EdgeInsets.only(right:60),
                            //                   child: Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       Text('Price',
                            //                        style: TextStyle(
                            //                         fontSize: 14
                            //                       ),),
                            //                       Padding(
                            //                         padding: const EdgeInsets.only(top:35),
                            //                         child: Row(
                            //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                           children: [
                            //                             Text('₹ 5,183',
                            //                             style:TextStyle(fontSize: 15,
                            //                             color:kblue,
                            //                             fontWeight: FontWeight.bold)),
                            //                             Padding(
                            //                               padding: const EdgeInsets.only(left:45),
                            //                               child: ElevatedButton(
                            //                                 style: ElevatedButton.styleFrom(
                            //                                   backgroundColor: korange
                            //                                 ),
                            //                                 onPressed:(){} ,
                            //                                  child: Text('Book')),
                            //                             )
                            //                           ],
                            //                         ),
                            //                       )
                            //                     ],
                            //                   ),
                            //                 ),

                            //               ],
                            //             ),
                            //       ),
                            //   ),
                            // ),
                            //  Padding(
                            //   padding: const EdgeInsets.only(top:40,left:20),
                            //   child: Container(
                            //       height: MediaQuery.of(context).size.height*0.2,
                            //       width:MediaQuery.of(context).size.width-MediaQuery.of(context).size.width*0.28,
                            //       decoration: BoxDecoration(
                            //         color: kwhite,
                            //         boxShadow: <BoxShadow>[
                            //           BoxShadow(
                            //             offset: Offset(0.0, 0.75),
                            //             blurRadius: 5,
                            //             color:kgrey
                            //           )
                            //         ],

                            //       ),
                            //       child:Padding(
                            //         padding: const EdgeInsets.only(top:20,left:20),
                            //         child: Row(
                            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //               children: [
                            //                 Column(
                            //                   crossAxisAlignment: CrossAxisAlignment.start,
                            //                   children: [
                            //                     Text('Sorted By:',
                            //                     style: TextStyle(
                            //                       fontSize: 14
                            //                     ),),
                            //                        Padding(
                            //                          padding: const EdgeInsets.only(top:20),
                            //                          child: Row(
                            //                            children:[ Image.asset('assets/images/bookingflaight.png',
                            //                                 height: 35,fit:BoxFit.fitHeight,),

                            //                                Padding(
                            //                               padding: const EdgeInsets.only(left:10),
                            //                               child: Column(
                            //                                   children: [
                            //                                     Text('IndiGo',
                            //                                     style: TextStyle(
                            //                                       fontSize: 12,
                            //                                       color:kblue,
                            //                                       fontWeight: FontWeight.bold
                            //                                     ),),
                            //                                     Padding(
                            //                                       padding: const EdgeInsets.only(top:4),
                            //                                       child: Text('6E8282',
                            //                                       style: TextStyle(
                            //                                         fontSize: 12,
                            //                                         color:kblue,
                            //                                         fontWeight: FontWeight.bold
                            //                                       ),),
                            //                                     )
                            //                                   ],
                            //                                 ),
                            //                             ),
                            //                            ]
                            //                          ),
                            //                        )

                            //                   ],
                            //                 ),
                            //                    Padding(
                            //                      padding: const EdgeInsets.only(right:0),
                            //                      child: Column(
                            //                       crossAxisAlignment: CrossAxisAlignment.start,
                            //                        children: [
                            //                          Text('Departure',
                            //                          style: TextStyle(
                            //                           fontSize: 14
                            //                           ),),
                            //                           Padding(
                            //                             padding: const EdgeInsets.only(top:20),
                            //                             child: Column(
                            //                               children:[
                            //                                  Text('10:34',
                            //                                  style:TextStyle(
                            //                                   color:kblue,
                            //                                   fontSize: 15,
                            //                                   fontWeight: FontWeight.bold
                            //                                  )),
                            //                             Padding(
                            //                               padding: const EdgeInsets.only(top:4),
                            //                               child: Text('Chennai',
                            //                               style:TextStyle(
                            //                                 color:kblue,
                            //                                 fontSize: 12
                            //                               )),
                            //                             )
                            //                               ]
                            //                             ),
                            //                           )

                            //                        ],
                            //                      ),
                            //                    ),
                            //                 Padding(
                            //                   padding: const EdgeInsets.only(right: 0),
                            //                   child: Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       Text('Duration',
                            //                        style: TextStyle(
                            //                         fontSize: 14
                            //                       ),),
                            //                       Padding(
                            //                         padding: const EdgeInsets.only(top:20),
                            //                         child: Column(
                            //                           crossAxisAlignment: CrossAxisAlignment.start,
                            //                           children: [
                            //                             Text('02 h 50 m',
                            //                             style:TextStyle(
                            //                               fontSize: 12
                            //                             )),
                            //                             Padding(
                            //                               padding: const EdgeInsets.only(top:4),
                            //                               child: Container(
                            //                                  height: 2,
                            //                                   width:50,
                            //                                   color:korange
                            //                                   ),
                            //                             ),
                            //                         Padding(
                            //                           padding: const EdgeInsets.only(top:4),
                            //                           child: Text('Non Stop',
                            //                           style:TextStyle(
                            //                             fontSize:12
                            //                           )),
                            //                         )
                            //                           ],
                            //                         ),
                            //                       ),

                            //                     ],
                            //                   ),
                            //                 ),
                            //                 Padding(
                            //                   padding: const EdgeInsets.only(right:0),
                            //                   child: Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       Text('Arrival',
                            //                        style: TextStyle(
                            //                         fontSize: 14
                            //                       ),),
                            //                       Padding(
                            //                         padding: const EdgeInsets.only(top:20),
                            //                         child: Column(
                            //                           crossAxisAlignment: CrossAxisAlignment.start,
                            //                           children: [
                            //                             Text('01:25',
                            //                             style:TextStyle(
                            //                               fontSize: 15,
                            //                               fontWeight: FontWeight.bold,
                            //                               color:kblue
                            //                             )),
                            //                              Padding(
                            //                                padding: const EdgeInsets.only(top:4),
                            //                                child: Text('New Delhi',
                            //                                style:TextStyle(
                            //                                 fontSize:12
                            //                                )),
                            //                              )
                            //                           ],
                            //                         ),
                            //                       ),

                            //                     ],
                            //                   ),
                            //                 ),
                            //                 Padding(
                            //                   padding: const EdgeInsets.only(right:60),
                            //                   child: Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       Text('Price',
                            //                        style: TextStyle(
                            //                         fontSize: 14
                            //                       ),),
                            //                       Padding(
                            //                         padding: const EdgeInsets.only(top:35),
                            //                         child: Row(
                            //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                           children: [
                            //                             Text('₹ 5,183',
                            //                             style:TextStyle(fontSize: 15,
                            //                             color:kblue,
                            //                             fontWeight: FontWeight.bold)),
                            //                             Padding(
                            //                               padding: const EdgeInsets.only(left:45),
                            //                               child: ElevatedButton(
                            //                                 style: ElevatedButton.styleFrom(
                            //                                   backgroundColor: korange
                            //                                 ),
                            //                                 onPressed:(){} ,
                            //                                  child: Text('Book')),
                            //                             )
                            //                           ],
                            //                         ),
                            //                       )
                            //                     ],
                            //                   ),
                            //                 ),

                            //               ],
                            //             ),
                            //       ),
                            //   ),
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ksizedbox30,
              if (flaightshowController.flaightshowindex.value == 0)
                Text(
                  'Popular International Flights',
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 28,
                      color: kblue,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ksizedbox10,
              if (flaightshowController.flaightshowindex.value == 0)
                Container(
                  height: 210,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: flaightimage.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              right: 50, top: 20, left: 50),
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
                                        flaightimage[index],
                                        fit: BoxFit.fitHeight,
                                        height: 170,
                                      )),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          title[index],
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 18, color: kblue),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                            description[index],
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                height: 1.2,
                                                fontSize: 22,
                                                color: kblue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
                                          child: Container(
                                            height: 5,
                                            width: 80,
                                            color: kOrange,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
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
              if (flaightshowController.flaightshowindex.value == 0)
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: kwhite.withOpacity(0.8),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 5,
                              color: kgrey)
                        ]),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: Container(
                            height: 200,
                            width: 300,
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              'assets/images/appdownimage.png',
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (flaightshowController.flaightshowindex.value == 2)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 50, bottom: 30),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    cursorColor: kblue,
                                    controller: mobilenumberController,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kblue)),
                                        prefixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Image.asset(
                                            'assets/images/indiaflaimgae.png',
                                            height: 10,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        hintText: ' +91 - enter mobile number',
                                        suffixIcon: Container(
                                          height: 50,
                                          width: 190,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [kyellow, kOrange])),
                                          child: Center(
                                            child: Text(
                                              'Get App Link',
                                              style: TextStyle(
                                                  fontSize: 20, color: kwhite),
                                            ),
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: kblue,
                                        ))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (flaightshowController.flaightshowindex.value == 0)
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/images/appsimage.png',
                                ),
                                Image.asset(
                                  'assets/images/scanerimage.png',
                                  height: 200,
                                  fit: BoxFit.fitHeight,
                                ),
                              ],
                            ),
                          ),
                        if (flaightshowController.flaightshowindex.value == 0)
                          Positioned(
                              left: 140,
                              top: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Download the App Now!',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontSize: 25, color: kblue),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Use code WELCOMEMMT and get up to first domestic Flight booking',
                                      style:
                                          TextStyle(fontSize: 15, color: kblue),
                                    ),
                                  )
                                ],
                              )),
                      ],
                    ),
                  ),
                ),
              ksizedbox30,
              RegisterCommonBottom()
            ],
          ),
        ]),
      ),
    );
  }
}
