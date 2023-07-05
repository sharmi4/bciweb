import 'package:bciweb/views/business/bookins/liquer/liquer_brand.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constant/constans.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';
import '../flight/booking_flight.dart';
import '../history/others/others_booking_list.dart';
import '../history/views/history.dart';
import '../hotels/booking_hotels.dart';
import '../trip/trip_booking.dart';

class BookingLiquer extends StatelessWidget {
  const BookingLiquer({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var searchController=TextEditingController();
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
                    child: Image.asset('assets/images/Group 39751.png')),
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
                                  colorr: korange,
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
                              //  InkWell(
                              //   onTap: () {
                              //     Get.to((OthersBooking()));
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
                          child: Center(
                              child: Container(
                                                           child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: TextField(
                                   controller: searchController,
                                   
                                   decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    hintText:  'Search Your Brand',
                                    prefixIcon:Icon(Icons.search),
                                    suffixIcon: Image.asset(
                                            'assets/images/Icon material-location-on.png',
                                            color: kblue,)
                                   ),
                                      //  
                                      //   kwidth10,
                                      //   Text(
                                      //    
                                      //     style: TextStyle(
                                      //         fontSize: 18, color: kgrey),
                                      //   ),
                                        // Spacer(),
                                        // 
                                     
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(15)),
                                  height: size.height * 0.07,
                                  width: size.width * 0.5,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(LiquerBrand());
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
              'Your Neer By Club and Bar',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF414546)),
            ),
            ksizedbox20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 400,
                  color: kwhite,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Image.asset('assets/images/NoPath - Copy (19).png'),
                      ),
                      kwidth10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Low Desk Bar &Night Club'),
                            Text('(240) Bar'),
                            Text('perambur'),
                            Text('Dine in')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: 400,
                 
                  decoration: BoxDecoration(
                         color: kwhite,
                         borderRadius: BorderRadius.circular(10),
                         boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0.0, 0.75),
                            blurRadius: 5,
                            color: kgrey
                          )
                         ]
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Image.asset('assets/images/NoPath - Copy (19).png'),
                      ),
                      kwidth10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Low Desk Bar &Night Club'),
                            Text('(240) Bar'),
                            Text('perambur'),
                            Text('Dine in')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ksizedbox30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 400,
                  color: kwhite,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Image.asset('assets/images/NoPath - Copy (19).png'),
                      ),
                      kwidth10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Low Desk Bar &Night Club'),
                            Text('(240) Bar'),
                            Text('perambur'),
                            Text('Dine in')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: 400,
                  color: kwhite,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Image.asset('assets/images/NoPath - Copy (19).png'),
                      ),
                      kwidth10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Low Desk Bar &Night Club'),
                            Text('(240) Bar'),
                            Text('perambur'),
                            Text('Dine in')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ksizedbox30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 400,
                  color: kwhite,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Image.asset('assets/images/NoPath - Copy (19).png'),
                      ),
                      kwidth10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Low Desk Bar &Night Club'),
                            Text('(240) Bar'),
                            Text('perambur'),
                            Text('Dine in')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: 400,
                  color: kwhite,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Image.asset('assets/images/NoPath - Copy (19).png'),
                      ),
                      kwidth10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Low Desk Bar &Night Club'),
                            Text('(240) Bar'),
                            Text('perambur'),
                            Text('Dine in'),
                            ksizedbox40
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}
