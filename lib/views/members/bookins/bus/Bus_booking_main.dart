import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/members/bookins/bus/buslist.dart';
import 'package:bciweb/views/members/bookins/flight/booking_flight.dart';
import 'package:bciweb/views/members/bookins/history/views/history.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import '../../../../controller/api_flightcontroller/api_flight_Controller.dart';
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

  final apiflightController = Get.find<ApiflightsController>();
  var falightdobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final List<String> items = List.generate(50, (index) => "Item $index");
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
                          child: Center(
                              child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: kblue),
                                    ),
                                                            Container(
                                      child:    TypeAheadField<String>(
        getImmediateSuggestions: true,
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Bording'),
        ),
        suggestionsCallback: (String pattern) async {
          return items
              .where((item) =>
                  item.toLowerCase().startsWith(pattern.toLowerCase()))
              .toList();
        },
        itemBuilder: (context, String suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        itemSeparatorBuilder: (context, index) {
          return Divider();
        },
        onSuggestionSelected: (String suggestion) {
          print("Suggestion selected");
        },
      ),
           
                                    
                                      decoration: BoxDecoration(
                                          //  color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      height: size.height * 0.06,
                                      width: size.width * 0.2,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'To',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: kblue),
                                    ),
                              Container(
                                      child:    TypeAheadField<String>(
        getImmediateSuggestions: true,
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Destination'),
        ),
        suggestionsCallback: (String pattern) async {
          return items
              .where((item) =>
                  item.toLowerCase().startsWith(pattern.toLowerCase()))
              .toList();
        },
        itemBuilder: (context, String suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        itemSeparatorBuilder: (context, index) {
          return Divider();
        },
        onSuggestionSelected: (String suggestion) {
          print("Suggestion selected");
        },
      ),
           
                                    
                                      decoration: BoxDecoration(
                                          //  color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      height: size.height * 0.06,
                                      width: size.width * 0.2,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: kgrey),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
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
                                                _flaightselectDate(context);
                                              },
                                              icon: Icon(
                                                  Icons.date_range_outlined))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(BusList());
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      'Search',
                                      style: TextStyle(
                                          fontSize: 20, color: kwhite),
                                    )),
                                    height: 40,
                                    width: size.width * 0.1,
                                    decoration: BoxDecoration(
                                        color: kyellow,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                )
                              ],
                            ),
                            height: 90,
                            width: size.width * 0.7,
                            //   color: kgrey,
                          )),
                          height: 140,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.zero,
                                  bottomLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
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
                               itemCount:2,
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
                                      child: Image.asset('assets/images/busa.png',
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
                                    Text('KPN Travels',
                                   //   title[index],
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 18, color: kblue),
                                    ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10),
                                        child: Text('Offers Today',
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
                    //     if (flaightshowController.flaightshowindex.value == 2)
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
                              //   controller: mobilenumberController,
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
                    //   if (flaightshowController.flaightshowindex.value == 0)
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
                    //   if (flaightshowController.flaightshowindex.value == 0)
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
      ),
    );
  }
}
