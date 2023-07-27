import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/members/bookins/bus/wigets/bus_details_wiget.dart';
import 'package:bciweb/views/members/bookins/flight/booking_flight.dart';
import 'package:bciweb/views/members/bookins/history/views/history.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../controller/api_flightcontroller/api_flight_Controller.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../common_widget/common.dart';
import '../hotels/booking_hotels.dart';
import '../trip/trip_booking.dart';

class PssengesDetails extends StatefulWidget {
  const PssengesDetails({super.key});

  @override
  State<PssengesDetails> createState() => _PssengesDetailsState();
}

DateTime flaight2selectedDate = DateTime.now();
DateTime flaightselectedDate = DateTime.now();

class _PssengesDetailsState extends State<PssengesDetails> {
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
    return Scaffold(
      backgroundColor: kwhite,
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
                                  Get.to(PssengesDetails());
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
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          hintText: 'Enter Boarding',
                                        ),
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
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          hintText: 'Enter Designation',
                                        ),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Date',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: kblue),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.12,
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
                                                  icon: Icon(Icons
                                                      .date_range_outlined))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    //   Get.to(LiquerBrand());
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
            Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width * 0.83,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Passengers Details')
                                .text
                                .bold
                                .blue900
                                .xl4
                                .make(),
                          ],
                        ),
                      ),
                      ksizedbox10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Login(to Better offer and Services)')
                                    .text
                                    .semiBold
                                    .blue900
                                    .xl2
                                    .make(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          hintText: 'Enter Mobile Number',
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          //  color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      height: size.height * 0.06,
                                      width: size.width * 0.4,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Center(
                                              child: Text('Sent Otp')
                                                  .text
                                                  .semiBold
                                                  .xl2
                                                  .white
                                                  .make()),
                                          height: size.height * 0.06,
                                          width: 150,
                                          color: korange,
                                        ),
                                        kwidth10,
                                        Text('OR').text.xl2.make(),
                                        kwidth10,
                                        Container(
                                          child: Center(
                                              child: Text('Gmail Sign in')
                                                  .text
                                                  .semiBold
                                                  .xl2
                                                  .white
                                                  .make()),
                                          height: size.height * 0.06,
                                          width: 150,
                                          color: kgrey,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          decoration: kcontainer,
                          height: size.height * 0.2,
                          width: size.width,
                        ),
                      ),
                      ksizedbox10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Enter Contact Details (Your Booking Details Will be Sent to your email address and contact no.)')
                                    .text
                                    .semiBold
                                    .blue900
                                    .xl2
                                    .make(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          hintText: 'Enter Mobile Number',
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          //  color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      height: size.height * 0.06,
                                      width: size.width * 0.3,
                                    ),
                                    kwidth10,
                                    Container(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          hintText: 'Enter Email ID',
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          //  color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      height: size.height * 0.06,
                                      width: size.width * 0.3,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.check_box),
                                    kwidth10,
                                    Text('Sent Me booking details before making the booking')
                                        .text
                                        .semiBold
                                        .blue900
                                        .xl2
                                        .make(),
                                  ],
                                )
                              ],
                            ),
                          ),
                          decoration: kcontainer,
                          height: size.height * 0.3,
                          width: size.width,
                        ),
                      ),
                      ksizedbox10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Enter Passenger Details Please review Passenger details before making the booking')
                                    .text
                                    .semiBold
                                    .blue900
                                    .xl2
                                    .make(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              hintText: 'Enter Your Full Name',
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              //  color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          height: size.height * 0.06,
                                          width: size.width * 0.3,
                                        ),
                                        kwidth10,
                                        Container(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              hintText: 'Age',
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              //  color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          height: size.height * 0.06,
                                          width: 60,
                                        ),
                                        Icon(Icons.person)
                                      ],
                                    ),
                                    ksizedbox10,
                                    Row(
                                      children: [
                                        Container(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              hintText: 'Enter Your Full Name',
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              //  color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          height: size.height * 0.06,
                                          width: size.width * 0.3,
                                        ),
                                        kwidth10,
                                        Container(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              hintText: 'Age',
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              //  color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          height: size.height * 0.06,
                                          width: 60,
                                        ),
                                        Icon(Icons.person)
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          decoration: kcontainer,
                          height: size.height * 0.3,
                          width: size.width,
                        ),
                      ),
                      ksizedbox10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('All Coupons Code Available')
                                    .text
                                    .semiBold
                                    .blue900
                                    .xl2
                                    .make(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              hintText: 'Enter Your Full Name',
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              //  color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          height: size.height * 0.06,
                                          width: size.width * 0.3,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          decoration: kcontainer,
                          height: size.height * 0.2,
                          width: size.width,
                        ),
                      ),
                      ksizedbox10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('All Coupons Code Available')
                                    .text
                                    .semiBold
                                    .blue900
                                    .xl2
                                    .make(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              hintText: 'Enter Your Full Name',
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              //  color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          height: size.height * 0.06,
                                          width: size.width * 0.3,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          decoration: kcontainer,
                          height: size.height * 0.2,
                          width: size.width,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  kwidth10,
                                  Icon(Icons.check_circle),
                                  kwidth10,
                                  Text('CREDIT CARD').text.xl2.normal.make()
                                ],
                              ),
                              Row(
                                children: [
                                  kwidth10,
                                  Icon(Icons.check_circle),
                                  kwidth10,
                                  Text('NET BANKING').text.xl2.normal.make()
                                ],
                              ),
                              Row(
                                children: [
                                  kwidth10,
                                  Icon(Icons.check_circle),
                                  kwidth10,
                                  Text('BHIM').text.xl2.normal.make()
                                ],
                              )
                            ],
                          ),
                          width: size.width,
                          height: size.height * 0.4,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Center(
                                  child: Text('PAY 2500.3')
                                      .text
                                      .semiBold
                                      .xl2
                                      .white
                                      .make()),
                              height: size.height * 0.06,
                              width: 190,
                              color: korange,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
           BussDetails()
              ],
            ),
            ksizedbox30,
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}
