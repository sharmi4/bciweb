import 'package:bciweb/views/business/bookins/hotels/booking_hotels.dart';
import 'package:bciweb/views/business/bookins/liquer/Liquer_booking.dart';
import 'package:bciweb/views/business/bookins/trip/hollidays.dart';
import 'package:bciweb/views/business/bookins/trip/trip_about.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../constant/constans.dart';
import '../../../../controller/holiday_package_controller.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';
import '../flight/booking_flight.dart';
import '../history/views/history.dart';

class BookingTrip extends StatefulWidget {
  const BookingTrip({super.key});

  @override
  State<BookingTrip> createState() => _BookingTripState();
}

class _BookingTripState extends State<BookingTrip> {
   final holidayPackageController = Get.find<HolidayPackageController>();


     @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holidayPackageController.getPackageCategory();
   // holidayPackageController.getPackage();
   // searchController.addListener(searchUsers);
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
                                  colorr: korange,
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
                              //  InkWell(
                              //   onTap: () {
                              //     Get.to(History());
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
                          child: HStack([
                            VStack([
                              Text('WHERE YOU WANT TO GO').text.xl2.bold.make(),
                              HStack([
                                Icon(
                                  Icons.search,
                                  color: kgrey,
                                ),
                                Text('Search your Location')
                                    .text
                                    .semiBold
                                    .gray400
                                    .make()
                              ])
                            ]).px24(),
                            Spacer(),
                            VStack(
                              [
                                Text('Check-in').text.xl2.bold.make(),
                                HStack(
                                  [
                                    Text('Add Date')
                                        .text
                                        .semiBold
                                        .gray400
                                        .make()
                                  ],
                                )
                              ],
                            ).px24(),
                            Spacer(),
                            VStack([
                              Text('Check-OUT').text.xl2.bold.make(),
                              HStack([
                                Text('Add Date').text.semiBold.gray400.make()
                              ])
                            ]),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Get.to(HolidaysScreen());
                              },
                              child: VxBox(
                                      child: Text('Explore Now')
                                          .text
                                          .xl2
                                          .semiBold
                                          .white
                                          .make()
                                          .px12())
                                  .color(Vx.orange500)
                                  .roundedLg
                                  .p24
                                  .make()
                                  .px20(),
                            )
                          ]),
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
            Row(
              children: [
                Text('Search city , Country, Place for Travel advisory')
                    .text
                    .thin
                    .gray600
                    .make()
                    .box
                    .p12
                    .rounded
                    .pink300
                    .width(context.percentWidth * 70)
                    .make()
                    .pSymmetric(v: 40, h: 20),
              ],
            ),
            Container(
              height: 120,
              child: GetBuilder<HolidayPackageController>(
                builder: (_) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: holidayPackageController.packageCategoryData.length, // Replace witsh your desired number of items
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 200,
                          width: 200,
                          color: Colors.blue, // Replace with your desired color
                          child: Center(
                            child: Text(
                              holidayPackageController.packageCategoryData[index].name,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      });
                }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Places for Vacation')
                    .text
                    .xl3
                    .color(Color.fromARGB(255, 5, 67, 143))
                    .semiBold
                    .make()
                    .px16()
                    .objectCenterLeft(),
                HStack(
                  [
                    Text('Sort By')
                        .text
                        .semiBold
                        .make()
                        .box
                        .border(color: kblue, width: 2)
                        .p12
                        .make()
                        .objectCenterRight(),
                    kwidth10,
                    Text('Filter')
                        .text
                        .semiBold
                        .make()
                        .box
                        .border(color: kblue, width: 2)
                        .p12
                        .make()
                        .objectCenterRight(),
                  ],
                ).p64()
              ],
            ),
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 12,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: ((context, index) {
                    return tripcontainer();
                  })),
            ),
            'Happy Customers'.text.semiBold.xl3.make(),
            ksizedbox30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HappyCostomer(size: size),
                HappyCostomer(size: size),
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

class HappyCostomer extends StatelessWidget {
  const HappyCostomer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kwhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(7)),
      width: size.width * 0.4,
      child: Column(
        children: [
          ksizedbox20,
          Container(
            width: size.width * 0.3,
            child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ultricies mi eget mauris pharetra. Amet risus nullam eget felis eget nunc lobortis. Purus in massa tempor nec. Porta nibh venenatis cras sed. Viverra ipsum nunc aliquet bibendum enim. Risus pretium quam vulputate dignissim suspendisse in. Non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor. Facilisi cras fermentum odio eu feugiat pretium nibh ipsum. Risus sed vulputate odio ut enim blandit volutpat maecenas. Netus et malesuada fames ac turpis egestas. Sed arcu non odio euismod lacinia at quis risus sed. Praesent elementum facilisis leo vel fringilla est ullamcorper. Ullamcorper dignissim cras tincidunt lobortis feugiat vivamus. Elit pellentesque habitant morbi tristique senectus et netus. Morbi tincidunt augue interdum velit.')
                .text
                .thin
                .sm
                .color(Colors.grey)
                .make(),
          ),
          ksizedbox20,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              kwidth10,
              Image.asset(
                'assets/images/Ellipse 24.png',
                height: 50,
              ),
              kwidth5,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Shalini Singh').text.bold.make(),
                  Text('Project Manger flyhigh')
                      .text
                      .thin
                      .gray400
                      .caption(context)
                      .make()
                ],
              )
            ],
          ),
          ksizedbox10
        ],
      ),
    );
  }
}

class tripcontainer extends StatelessWidget {
  const tripcontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        Get.to(HolidaysScreen());
      },
      child: Container(
        color: kwhite,
        height: size.height * 0.1,
        width: size.width * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/bb43ca378d39364475632277f516c341.png',
              //   height: 230,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Kololamba').text.semiBold.sm.make(),
                        ],
                      ),
                      //  .objectCenterLeft(),
                      ksizedbox10,
                      Text('Price starts from ₹49,999.00')
                          .text
                          .sm
                          .color(Colors.grey)
                          .make(),
                      //  .objectCenterLeft(),
                    ],
                  ),
                ),
                Spacer(),
                VxBox(
                  child: Center(
                    child: Text('Details')
                        .text
                        .semiBold
                        .sm
                        .color(const Color.fromARGB(255, 255, 111, 0))
                        .make(),
                  ),
                )
                    .shadow
                    .roundedLg
                    //    .px20
                    // .py12
                    .white
                    .make()
                    .h(
                      context.percentHeight * 5,
                    )
                    .w(context.percentWidth * 6)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
