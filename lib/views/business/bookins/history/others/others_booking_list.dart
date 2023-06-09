import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constant/constans.dart';
import '../../../../../controller/subscription_controller/subscription_controller.dart';
import '../../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../../members/common_widget/common.dart';
import '../../flight/booking_flight.dart';
import '../../hotels/booking_hotels.dart';
import '../../liquer/Liquer_booking.dart';
import '../../trip/trip_booking.dart';
import '../views/history.dart';

class OthersBooking extends StatefulWidget {
  const OthersBooking ({super.key});

  @override
  State<OthersBooking> createState() => _OthersBookingState();
}

class _OthersBookingState extends State<OthersBooking> {


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
                    child: Image.asset('assets/images/Group 39749.png')),
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
                               InkWell(
                                onTap: () {
                                  Get.to(OthersBooking());
                                },
                                child: bookingbutton(
                                  size: size,
                                  text: 'Others',
                                  colorr: kOrange,
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
           
           
      
           
            ksizedbox40,
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}