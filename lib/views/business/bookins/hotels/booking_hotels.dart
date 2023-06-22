import 'package:bciweb/views/business/bookins/flight/booking_flight.dart';
import 'package:bciweb/views/business/bookins/history/others/others_booking_list.dart';
import 'package:bciweb/views/business/bookins/hotels/widgets/containers.dart';
import 'package:bciweb/views/business/bookins/liquer/Liquer_booking.dart';
import 'package:bciweb/views/business/bookins/trip/trip_booking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../constant/constans.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';
import '../history/views/history.dart';

class BookingHotels extends StatefulWidget {
  const BookingHotels({super.key});

  @override
  State<BookingHotels> createState() => _BookingHotelsState();
}

class _BookingHotelsState extends State<BookingHotels> {
  get isChecked => null;

  @override
  Widget build(BuildContext context) {
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
                              // InkWell(
                              //   onTap: () {
                              //     Get.to(OthersBooking());
                              //   },
                              //   child: bookingbutton(
                              //     size: size,
                              //     text: 'Others',
                              //     colorr: kblue,
                              //   ),
                              // ),
                            ],
                          ),
                          height: 60,
                          width: size.width * 0.6,
                          decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Spacer(),
                              Container(
                                height: size.height * 0.11,
                                width: size.width * 0.15,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //     Text('CITY, PROPERTY NAME OR LOCATION',
                                      //         style: primarysmallFont),
                                      Spacer(),
                                      Text('Tamil Nadu',
                                          style: primarymediumFont),
                                      Spacer(),
                                      Text('India', style: primarysmallFont),
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
                              Container(
                                height: size.height * 0.11,
                                width: size.width * 0.09,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('CHECK-IN', style: primarysmallFont),
                                      Spacer(),
                                      Text('6 May23', style: primarymediumFont),
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
                              Spacer(),
                              Container(
                                height: size.height * 0.11,
                                width: size.width * 0.09,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('CHECK-OUT',
                                          style: primarysmallFont),
                                      Spacer(),
                                      Text('6 May23', style: primarymediumFont),
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
                              Container(
                                height: size.height * 0.11,
                                width: size.width * 0.15,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('ROOMS & GUESTS',
                                          style: primarysmallFont),
                                      Spacer(),
                                      Text('1 Room 2 Adults',
                                          style: primarymediumFont),
                                      Spacer(),
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
                              Container(
                                height: size.height * 0.11,
                                width: size.width * 0.09,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('PRICE PER NIGHT',
                                          style: primarysmallFont),
                                      Spacer(),
                                      Text('₹0-₹1500, ₹1500-',
                                          style: primarysmallFont),
                                      Spacer(),
                                      //    Text('₹2500,...',
                                      //       style: primarysmallFont),
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
                              Spacer()
                            ],
                          ),
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
            ksizedbox30,
            'Showing Properties in Tamil Nadu'
                .text
                .bold
                .xl4
                .hexColor('#0F2446')
                .make(),
            ksizedbox40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      ksizedbox30,
                      Row(
                        children: [
                          kwidth10,
                          Text('Poular Filters').text.semiBold.make(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(kgrey),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Go first                      ₹ 6,499 ')
                                .text
                                .gray500
                                .sm
                                .make()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(kgrey),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Go first                      ₹ 6,499 ')
                                .text
                                .gray500
                                .sm
                                .make()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(kgrey),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Go first                      ₹ 6,499 ')
                                .text
                                .gray500
                                .sm
                                .make()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(kgrey),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Go first                      ₹ 6,499 ')
                                .text
                                .gray500
                                .sm
                                .make()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(kgrey),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Go first                      ₹ 6,499 ')
                                .text
                                .gray500
                                .sm
                                .make()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(kgrey),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Go first                      ₹ 6,499 ')
                                .text
                                .gray500
                                .sm
                                .make()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(kgrey),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Non Stop 17             ₹ 3,499 ')
                                .text
                                .gray500
                                .sm
                                .make()
                          ],
                        ),
                      ),
                      Text('Show Less')
                          .text
                          .semiBold
                          .blue600
                          .make()
                          .objectCenterLeft()
                          .p12(),
                      ksizedbox30,
                      Text('One Way Price')
                          .text
                          .semiBold
                          .xl
                          .make()
                          .objectCenterLeft()
                          .p12(),
                      Slider(
                        value: 35,
                        onChanged: (Value) {},
                        max: 100,
                        min: 0,
                        activeColor: Vx.blue400,
                      ),
                      HStack([
                        Text('₹ 6,499 ').text.semiBold.make(),
                        Spacer(),
                        Text('₹ 12,499 ').text.semiBold.make()
                      ]).px24(),
                      ksizedbox30,
                    ],
                  ),
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: kwhite,
                      boxShadow: [
                        new BoxShadow(
                          color: Color.fromARGB(255, 186, 182, 182),
                          blurRadius: 20.0,
                        ),
                      ]),
                  // height: size.height * 0.6,
                  width: size.width * 0.18,
                ),
                Column(
                  children: [
                    ksizedbox30,
                    HottelbookingContainer(size: size),
                    ksizedbox10,
                    HottelbookingContainer(size: size),
                    ksizedbox10,
                    HottelbookingContainer(size: size),
                    ksizedbox10,
                  ],
                ),
              ],
            ),
            //   HottelbookingContainer(size: size),
            ksizedbox10,
            ksizedbox40,
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}
