import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/members/bookins/bus/bus_seats.dart';
import 'package:bciweb/views/members/bookins/bus/wigets/wiget_buslist.dart';
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

class BusList extends StatefulWidget {
  const BusList(   {super.key, required String fromCityName, required String toCityName, required String tdate, required String searchKey, });

  @override
  State<BusList> createState() => _BusListState();
}

DateTime flaight2selectedDate = DateTime.now();
DateTime flaightselectedDate = DateTime.now();

class _BusListState extends State<BusList> {
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
                               //   Get.to(
                                 //   BusList()
                                 //   );
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
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          kwidth10,
                          Text('we have got 03 results')
                              .text
                              .semiBold
                              .blue900
                              .xl2
                              .make()
                        ],
                      ),
                      //  ksizedbox10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Operator').text.semiBold.orange500.make(),
                          Text('Departure').text.semiBold.orange500.make(),
                          Text('Total Duration').text.semiBold.orange500.make(),
                          Text('Arrival').text.semiBold.orange500.make(),
                          Text('Rating').text.semiBold.orange500.make(),
                          Text('Price').text.semiBold.orange500.make(),
                          Text('Select Seats').text.semiBold.orange500.make()
                        ],
                      )
                    ],
                  ),
                  width: size.width * 0.8,
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    color: kwhite,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 198, 198, 198)
                            .withOpacity(0.3), // Shadow color
                        spreadRadius: 1, // The spread radius of the shadow
                        blurRadius: 5, // The blur radius of the shadow
                        offset: Offset(0, 3), // The offset of the shadow
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 0.2, // Border width
                    ),
                  ),
                ),
                ksizedbox10,
                InkWell(
                    onTap: () {
                      Get.to(BusSeats());
                    },
                    child: Buslist()),
                ksizedbox10,
                Buslist()
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
