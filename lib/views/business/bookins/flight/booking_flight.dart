import 'package:bciweb/views/business/bookins/trip/trip_booking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:date_format/date_format.dart';
import '../../../../constant/constans.dart';
import '../../../../controller/flaight _controller.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';
import '../history/views/history.dart';
import '../hotels/booking_hotels.dart';
import '../liquer/Liquer_booking.dart';

class BookingFlight extends StatefulWidget {
  const BookingFlight({super.key});

  @override
  State<BookingFlight> createState() => _BookingFlightState();
}

class _BookingFlightState extends State<BookingFlight> {
  var dropvalue1 = '';
  var dropvalue2 = '';
  int increament = 0;
  int decrement = 0;
  var mobilenumberController = TextEditingController();
  DateTime flaight2selectedDate = DateTime.now();
  DateTime flaightselectedDate = DateTime.now();
  Future<void> _flaightselectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: flaightselectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != flaightselectedDate) {
      setState(() {
        flaightselectedDate = picked;
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
        flaight2selectedDate = picked;
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
  Widget build(BuildContext context) {
    final flaightController = Get.find<FlaightController>();
    final flaight2Controller = Get.find<Flaight2Controller>();
    final flaight3Controller = Get.find<Flaight3Controller>();

    var size = MediaQuery.of(context).size;

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
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: ListView(children: [
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
                                  colorr: korange,
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
                              InkWell(
                                onTap: () {
                                  Get.to(BookingLiquer());
                                },
                                child: bookingbutton(
                                  size: size,
                                  text: 'LIQUOR',
                                  colorr: kblue,
                                ),
                              ),
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
                            ],
                          ),
                          height: 60,
                          width: size.width * 0.6,
                          decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Container(
                          height: 140,
                          width: size.width * 0.88,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.only(
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
                                      height: 40,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: kgrey),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(dropvalue2),
                                          ),
                                          PopupMenuButton(
                                            child: Icon(
                                                Icons.arrow_drop_down_sharp),
                                            itemBuilder: (context) => [
                                              PopupMenuItem(
                                                  value: 'One Way',
                                                  child: Text(
                                                    'One Way',
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  )),
                                              PopupMenuItem(
                                                value: 'Round Way ',
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Round Way',
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                            onSelected: (value) {
                                              setState(() {
                                                dropvalue2 = value.toString();
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: kgrey),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: TextField(
                                        controller: faligsearch2Controller,
                                        decoration: InputDecoration(
                                            hintText: 'Any Airport or City',
                                            hintStyle: TextStyle(fontSize: 14),
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                    Icon(Icons.compare_arrows_sharp),
                                    Container(
                                      height: 40,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: kgrey),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: TextField(
                                        controller: faligsearchController,
                                        decoration: InputDecoration(
                                            hintText: 'Any Airport or City',
                                            hintStyle: TextStyle(fontSize: 14),
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: kgrey),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                  '${formatDate(flaight2selectedDate, [
                                                    dd,
                                                    "/",
                                                    mm,
                                                    '/',
                                                    yyyy
                                                  ])}'),
                                              IconButton(
                                                  onPressed: () {
                                                    _flaight2selectDate(
                                                        context);
                                                  },
                                                  icon: Icon(Icons
                                                      .date_range_outlined))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: kgrey),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                  '${formatDate(flaightselectedDate, [
                                                    dd,
                                                    "/",
                                                    mm,
                                                    '/',
                                                    yyyy
                                                  ])}'),
                                              IconButton(
                                                  onPressed: () {
                                                    _flaightselectDate(context);
                                                  },
                                                  icon: Icon(Icons
                                                      .date_range_outlined))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        height: 40,
                                        width: 170,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: kgrey),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        alignment: Alignment.center,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(dropvalue1),
                                              ),
                                              PopupMenuButton(
                                                child: Icon(Icons
                                                    .arrow_drop_down_sharp),
                                                itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                      value: '01 Traveller',
                                                      child: Text(
                                                        '01 Traveller',
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      )),
                                                  PopupMenuItem(
                                                    value:
                                                        'Adults ${flaightController.cout.value}',
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                                '${flaightController.cout.value}'),
                                                            Text(
                                                              'Adults',
                                                              style: TextStyle(
                                                                  fontSize: 13),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                                onPressed: () {
                                                                  flaightController
                                                                      .decrement();
                                                                  flaightController
                                                                      .update();
                                                                },
                                                                icon: Icon(Icons
                                                                    .do_not_disturb_on_outlined)),
                                                            Obx(() => Text(
                                                                  '${flaightController.cout.value}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14),
                                                                )),
                                                            IconButton(
                                                                onPressed: () {
                                                                  flaightController
                                                                      .increament();
                                                                  flaightController
                                                                      .update();
                                                                },
                                                                icon: Icon(Icons
                                                                    .add_circle_outline_outlined))
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                      value:
                                                          'Children (2-12 yrs)',
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Children (2-12 yrs)',
                                                            style: TextStyle(
                                                                fontSize: 14),
                                                          ),
                                                          Row(
                                                            children: [
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    flaight2Controller
                                                                        .decrement();
                                                                    flaight2Controller
                                                                        .update();
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .do_not_disturb_on_outlined)),
                                                              Obx(() => Text(
                                                                    '${flaight2Controller.cout.value}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14),
                                                                  )),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    flaight2Controller
                                                                        .increament();
                                                                    flaight2Controller
                                                                        .update();
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .add_circle_outline_outlined))
                                                            ],
                                                          ),
                                                        ],
                                                      )),
                                                  PopupMenuItem(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Infants (Below 2 yrs)',
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                                onPressed: () {
                                                                  flaight3Controller
                                                                      .decrement();
                                                                  flaight3Controller
                                                                      .update();
                                                                },
                                                                icon: Icon(Icons
                                                                    .do_not_disturb_on_outlined)),
                                                            Obx(() => Text(
                                                                  '${flaight3Controller.cout.value}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14),
                                                                )),
                                                            IconButton(
                                                                onPressed: () {
                                                                  flaight3Controller
                                                                      .increament();
                                                                  flaight3Controller
                                                                      .update();
                                                                },
                                                                icon: Icon(Icons
                                                                    .add_circle_outline_outlined))
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                                onSelected: (value) {
                                                  setState(() {
                                                    dropvalue1 =
                                                        value.toString();
                                                  });
                                                },
                                              ),
                                            ])),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 13, top: 40),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 21,
                                      width: 80,
                                      decoration: BoxDecoration(color: kOrange),
                                      child: Center(
                                        child: Text(
                                          'Economy',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 11, color: kwhite),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.22,
                                        decoration: BoxDecoration(color: kblue),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  'Premimum Economy ',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: kwhite),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                  'Business',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: kwhite),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Text(
                                                  'First Class',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: kwhite),
                                                ),
                                              ),
                                            ],
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
                Positioned(
                  bottom: 90,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 210,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kwhite),
                            gradient:
                                LinearGradient(colors: [kOrange, kyellow])),
                        child: GestureDetector(
                          onTap: () {},
                          child: Center(
                              child: Text(
                            'SEARCH',
                            style: TextStyle(color: kwhite, fontSize: 16),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            ksizedbox30,
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
            Container(
              height: 210,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: flaightimage.length,
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
                                    flaightimage[index],
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
                                      title[index],
                                      textAlign: TextAlign.start,
                                      style:
                                          TextStyle(fontSize: 18, color: kblue),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 30),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextField(
                              cursorColor: kblue,
                              controller: mobilenumberController,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: kblue)),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(left: 10),
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
                    Positioned(
                        left: 140,
                        top: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Download the App Now!',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25, color: kblue),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                'Use code WELCOMEMMT and get up to first domestic Flight booking',
                                style: TextStyle(fontSize: 15, color: kblue),
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
    );
  }
}
