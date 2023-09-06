import 'package:bciweb/views/members/bookins/hotels/resort.dart';
import 'package:bciweb/views/members/bookins/hotels/resort_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../constant/constans.dart';
import '../../../../controller/hotel_controller/hotel_controller.dart';
import '../../../../models/hotel_model/hoteldestination_model.dart';
import '../../../../models/hotel_model/store_temp_search_data.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';
import '../bus/Bus_booking_main.dart';
import '../flight/booking_flight.dart';
import '../history/views/history.dart';
import '../trip/trip_booking.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class BookingHotels extends StatefulWidget {
  const BookingHotels({super.key});

  @override
  State<BookingHotels> createState() => _BookingHotelsState();
}

class _BookingHotelsState extends State<BookingHotels> {
  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDateRange: daterange,
    );

    if (newDateRange == null) return;

    setState(() => daterange = newDateRange);
  }

  DateTimeRange daterange = DateTimeRange(
      start: DateTime.now(), end: DateTime.now().add(Duration(days: 1)));

  var destinationController = TextEditingController();
  final hotelController = Get.find<HotelController>();
  final Destinationcontrolr = TextEditingController();

  ///finalhotelController = Get.find<HotelController>();
  @override
  Widget build(BuildContext context) {
    final start = daterange.start;
    final end = daterange.end;
    final diffrence = daterange.duration;
    bool isChecked = false;
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
                    child: Image.asset('assets/images/Group 39748.png')),
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
                                  colorr: korange,
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
                        GetBuilder<HotelController>(builder: (_) {
                          return Container(
                            height: 140,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                                color: kwhite,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.zero,
                                    bottomLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15))),
                            child: Row(
                              children: [
                                const Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                      //  color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(15)),
                                  height: size.height * 0.06,
                                  width: size.width * 0.2,
                                  child: TypeAheadField<SearchCityListModel>(
                                    getImmediateSuggestions: true,
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                      onChanged: (value) async {
                                        if (value.length > 1) {
                                          await Future.delayed(const Duration(
                                              milliseconds: 200));
                                          hotelController.hoteldestination(
                                              city: value.toString());
                                        }
                                      },
                                      controller: destinationController,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter Destination',
                                          hintStyle: TextStyle(fontSize: 14)),
                                    ),
                                    suggestionsCallback:
                                        (String pattern) async {
                                      return hotelController.getHotelCityList
                                          .where((item) => item.destination
                                              .toLowerCase()
                                              .startsWith(
                                                  pattern.toLowerCase()))
                                          .toList();
                                    },
                                    itemBuilder: (context,
                                        SearchCityListModel citymodel) {
                                      return ListTile(
                                        title: Text(citymodel.destination),
                                      );
                                    },
                                    itemSeparatorBuilder: (context, index) {
                                      return Divider();
                                    },
                                    onSuggestionSelected:
                                        (SearchCityListModel citymodel) {
                                      print("destination selected");
                                      destinationController.text =
                                          citymodel.destination;
                                      //    hotelController.toCity(citymodel.cityName);
                                      hotelController
                                          .hotelSearchKey(citymodel.cityid);
                                      hotelController.hotelSearchKeyCode(
                                          citymodel.countrycode);
                                      print(citymodel.cityid);
                                      print(citymodel.country);
                                      print(citymodel.countrycode);
                                      print(citymodel.destination);
                                    },
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    pickDateRange();
                                  },
                                  child: Container(
                                    height: 79,
                                    width: size.width * 0.09,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('CHECK-IN',
                                              style: TextStyle(fontSize: 13)),
                                          Spacer(),
                                          Text(
                                            DateFormat('dd-MM-yyyy')
                                                .format(start),
                                            style: TextStyle(
                                                color: kblue, fontSize: 14),
                                          ),
                                          Spacer(),

                                          //Text('6 May23', style: primarymediumFont),
                                          Spacer(),
                                          //       Text('Saturday', style: primarysmallFont),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                        color: kblue,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 79,
                                  width: size.width * 0.09,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('CHECK-OUT',
                                            style: TextStyle(fontSize: 13)),
                                        Spacer(),
                                        Text(
                                          DateFormat('dd-MM-yyyy').format(end),
                                          style: TextStyle(
                                              color: kblue, fontSize: 14),
                                        ),
                                        Spacer(),
                                        //     Text('Saturday', style: primarysmallFont),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      color: kblue,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Obx(
                                  () => Container(
                                    height: 79,
                                    width: size.width * 0.15,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('ROOMS ',
                                                  style:
                                                      TextStyle(fontSize: 13)),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        hotelController
                                                            .roomno--;
                                                      },
                                                      child: const Icon(
                                                        Icons
                                                            .remove_circle_outline_outlined,
                                                        size: 20,
                                                      )),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Text(
                                                      hotelController
                                                          .roomno.value
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 13)),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      hotelController.roomno++;
                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .add_circle_outline_outlined,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(' GUESTS',
                                                  style:
                                                      TextStyle(fontSize: 13)),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      hotelController.adult--;
                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .remove_circle_outline_outlined,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Text(
                                                      hotelController
                                                          .adult.value
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14)),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      hotelController.adult++;
                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .add_circle_outline_outlined,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                        color: kblue,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Obx(
                                  () => InkWell(
                                    onTap: () {
                                      hotelController.tempBookingModel =
                                          TempBookingModel(
                                              bookingDate:
                                                  DateFormat('dd/MM/yyyy')
                                                      .format(start),
                                              noOfDays:
                                                  diffrence.inDays.toString(),
                                              noOfPeople: hotelController
                                                  .adult.value
                                                  .toString(),
                                              place: Destinationcontrolr.text);
                                      hotelController.searchHotel(
                                          child: hotelController.child.value,
                                          adult: hotelController.adult.value,
                                          checkindate: DateFormat('dd/MM/yyyy')
                                              .format(start),
                                          checkoutdate: DateFormat('dd/MM/yyyy')
                                              .format(end),
                                          destination: hotelController
                                              .hotelSearchKey.value,
                                          //  childage: hotelController.roomno.value,
                                          roomsno:
                                              hotelController.roomno.string,
                                          countryCode: hotelController
                                              .hotelSearchKeyCode.value);
                                      hotelController.update();
                                    },
                                    child: hotelController.isLoading.isTrue
                                        ? Container(
                                            child: Center(
                                              child:
                                                  const CupertinoActivityIndicator(
                                                color: Colors.white,
                                              ),
                                            ),
                                            height: 40,
                                            width: size.width * 0.1,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [korange, kyellow]),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          )
                                        : Container(
                                            child: Center(
                                                child: Text(
                                              'Search',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: kwhite,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                            height: 40,
                                            width: size.width * 0.1,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [korange, kyellow]),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                  ),
                                ),
                                ksizedbox20,
                                Spacer()
                              ],
                            ),
                          );
                        }),
                        Spacer()
                      ],
                    ),
                  ),
                )
              ],
            ),
            ksizedbox30,
            Text(
              '',
              style: TextStyle(
                  fontSize: 25, color: kblue, fontWeight: FontWeight.bold),
            ),
            ksizedbox40,
            GetBuilder<HotelController>(builder: (_) {
              return Obx(
                ()=> Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: hotelController.isLoading.isTrue
                      ? Container(
                          child: const CircularProgressIndicator(
                            color: Colors.yellow,
                          ),
                        )
                      : Container(
                          width: size.width * 0.6,
                          // color: kblue,
                          //  height: 500,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: hotelController.searchHotelData.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  child: Row(
                                    children: [
                                      kwidth10,
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          hotelController.searchHotelData[index]
                                              .hotelPicture,
                                          fit: BoxFit.cover,
                                          height: 170,
                                          width: 180,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text('3.8')
                                                    .text
                                                    .white
                                                    .semiBold
                                                    .make()
                                                    .box
                                                    .blue900
                                                    .roundedLg
                                                    .p8
                                                    .make(),
                                                kwidth5,
                                                Text('Very Good Raiting')
                                                    .text
                                                    .semiBold
                                                    .blue900
                                                    .make()
                                              ],
                                            ),
                                            ksizedbox10,
                                            Text(
                                              hotelController
                                                  .searchHotelData[index]
                                                  .hotelName,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: kOrange),
                                            ),
                                            ksizedbox10,
                                            Container(
                                              width: 420,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    hotelController
                                                        .searchHotelData[index]
                                                        .hotelAddress,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: kblue),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ksizedbox10,
                                            InkWell(
                                              // onTap: () {
                                              //   Get.to(ResortBooking());
                                              // },
                                              child: Container(
                                                height: 30,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    color: kOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(5)),
                                                child: Center(
                                                  child: Text(
                                                    'Couple  Friendly',
                                                    style:
                                                        TextStyle(color: kwhite),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text('Per Night')
                                                    .text
                                                    .white
                                                    .make(),
                                                Text('₹ 3,499').text.white.make(),
                                                Text('₹ 2,490').text.white.make(),
                                                Text(
                                                  '₹ ${hotelController.searchHotelData[index].price.publishedPrice}',
                                                ).text.white.make(),
                                                Text('Saving ₹ 1,009')
                                                    .text
                                                    .white
                                                    .make(),
                                                InkWell(
                                                  onTap: () async {
                                                    final prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    var searchtocken = prefs
                                                        .getString("searchtoken");
                                                    Get.to(ResortDetailsScreen(
                                                      hotelCode: hotelController
                                                          .searchHotelData[index]
                                                          .hotelCode,
                                                      resultIndex: hotelController
                                                          .searchHotelData[index]
                                                          .resultIndex
                                                          .toString(),
                                                      searchToken:
                                                          searchtocken ?? "",
                                                      userIp: '122.160.83.78',
                                                    ));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 3.5),
                                                    child: Container(
                                                      height: 18,
                                                      width: 90,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: kOrange),
                                                      child: Center(
                                                        child: Text(
                                                          'Book Now',
                                                          style: TextStyle(
                                                              color: kwhite),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          color: kblue,
                                          width: size.width * 0.1,
                                          height: size.height,
                                        ),
                                      )
                                    ],
                                  ),
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: kwhite,
                                      boxShadow: [
                                        new BoxShadow(
                                          color:
                                              Color.fromARGB(255, 186, 182, 182),
                                          blurRadius: 20.0,
                                        ),
                                      ]),
                                  width: size.width * 0.6,
                                  height: size.height * 0.3,
                                ),
                              );
                            },
                          ),
                        ),
                ),
              );
            }),
            ksizedbox10,
            ksizedbox40,
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}
