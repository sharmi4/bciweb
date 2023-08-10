import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/members/bookins/history/views/widgets/buswigit.dart';

import 'package:bciweb/views/members/bookins/history/views/widgets/orders.dart';
import 'package:bciweb/views/members/bookins/history/views/widgets/widgetsdemo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../controller/bus_controllers.dart';
import '../../../../../controller/historycontroller.dart';
import '../../../../../controller/reg_home_controller.dart';
//import '../../../../../registerhomescreen/common_reg_appbar';
import '../../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../../members/common_widget/common.dart';
import '../../bus/Bus_booking_main.dart';
import '../../flight/booking_flight.dart';
import '../../hotels/booking_hotels.dart';
import '../../liquer/Liquer_booking.dart';
import '../../trip/trip_booking.dart';
import '../others/others_booking_list.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final historyController = Get.find<BookingHistoryController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonScreen(),
              RegisterCommonContainer(),
            ],
          ),
          preferredSize: const Size(double.infinity, 110)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //RegisterCommonContainer(),
            Stack(
              children: [
                Container(
                    width: size.width,
                    child: Image.asset('assets/images/Group 39754.png')),
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
                                  colorr: korange,
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
                        Container(
                          child: Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    historyController.hisindex(0);
                                    historyController.update();
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      'Flights',
                                      style: TextStyle(
                                          color: kwhite
                                          //  historyController.reindex == 0
                                          //     ? kOrange
                                          //     : kblue,
                                          ,
                                          fontSize: 19,
                                          fontWeight: FontWeight.w700),
                                    )),
                                    decoration: BoxDecoration(
                                        color: historyController.hisindex == 0
                                            ? kyellow
                                            : kgrey,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    height: 100,
                                    width: 200,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    historyController.hisindex(1);
                                    historyController.update();
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      'Hotels',
                                      style: TextStyle(
                                          color: kwhite,
                                          fontSize: 19,
                                          fontWeight: FontWeight.w700),
                                    )),
                                    decoration: BoxDecoration(
                                        color: historyController.hisindex == 1
                                            ? kyellow
                                            : kgrey,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    height: 100,
                                    width: 200,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    historyController.hisindex(2);
                                    historyController.update();
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      'Holiday\nPackages',
                                      style: TextStyle(
                                          color: kwhite,
                                          fontSize: 19,
                                          fontWeight: FontWeight.w700),
                                    )),
                                    decoration: BoxDecoration(
                                        color: historyController.hisindex == 2
                                            ? kyellow
                                            : kgrey,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    height: 100,
                                    width: 200,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    historyController.hisindex(3);
                                    historyController.update();
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      'Bus',
                                      style: TextStyle(
                                          color: kwhite,
                                          fontSize: 19,
                                          fontWeight: FontWeight.w700),
                                    )),
                                    decoration: BoxDecoration(
                                        color: historyController.hisindex == 3
                                            ? kyellow
                                            : kgrey,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    height: 100,
                                    width: 200,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    historyController.hisindex(4);
                                    historyController.update();
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      'Others',
                                      style: TextStyle(
                                          color: kwhite,
                                          fontSize: 19,
                                          fontWeight: FontWeight.w700),
                                    )),
                                    decoration: BoxDecoration(
                                        color: historyController.hisindex == 4
                                            ? kyellow
                                            : kgrey,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    height: 100,
                                    width: 200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          height: 140,
                          width: size.width * 0.9,
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
            Obx(() => Column(
                  children: [
                    if (historyController.hisindex.value == 0) index1(),
                    if (historyController.hisindex.value == 1) index2(),
                    if (historyController.hisindex.value == 2) index3(),
                    if (historyController.hisindex.value == 3) BussHistory(),
                    if (historyController.hisindex.value == 4) index4(),
                  ],
                )),
            ksizedbox30,
            ksizedbox30,
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}

class bookingbutton extends StatelessWidget {
  const bookingbutton({
    super.key,
    required this.size,
    required this.text,
    required this.colorr,
  });
  final Color colorr;
  final Size size;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: kwhite, fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
      height: size.height,
      width: size.width * 0.1,
      color: colorr,
    );
  }
}

class BussHistory extends StatefulWidget {
   BussHistory({
    super.key,
  });

  @override
  State<BussHistory> createState() => _BussHistoryState();
}

class _BussHistoryState extends State<BussHistory> {
  final busController = Get.find<BusController>();

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    busController.getBusBookingHistory();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [  GetBuilder<BusController>(
        builder: (_) {
          return GridView.builder(
                        itemCount: busController.bookingHistoryList.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2.5, crossAxisCount: 2),
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                           child:  Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //  kwidth10,
                  CircleAvatar(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/bus-1.png',
                          height: 30,
                        ),
                        Text(busController.bookingHistoryList[index].bookingDate).text.sm.green500.make()
                      ],
                    ),
                    backgroundColor: Colors.green.withOpacity(0.2),
                    radius: 45,
                  ),
                  Container(
                    width: size.width * 0.18,
                    height: size.height * 0.15,
                    //   color: kblue,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Status').text.gray500.semiBold.make(),
                            Text('Conformed').text.gray500.semiBold.make(),
                          ],
                        ),   Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(busController.bookingHistoryList[index].fromCityname).text.semiBold.xl2.make(), Text('-').text.semiBold.xl2.make(),
                            Text(busController.bookingHistoryList[index].toCityname).text.semiBold.xl2.make(),
                          ],
                        ),
                     Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(busController.bookingHistoryList[index].busName).text.gray500.semiBold.make(),
                           
                          ],
                        ), 
                        Divider(height: 1,)  ,
                           Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(busController.bookingHistoryList[index].bookingRefno).text.gray500.semiBold.make(),
                            Text('Rebook').text.green400.semiBold.make(),
                          ],
                        ),     ],
                    ),
                  ),
                  //    kwidth10
                  kwidth5,
                ],
              ),
            ),
            height: size.height * 0.17,
            width: size.width * 0.35,
            decoration: BoxDecoration(
              color: kwhite,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 190, 190, 190)
                      .withOpacity(0.5), // Shadow color
                  spreadRadius: 1, // The spread radius of the shadow
                  blurRadius: 5, // The blur radius of the shadow
                  //  offset: Offset(0, 3), // The offset of the shadow
                ),
              ],
            )) ,
                          );
                        }),
                      );
        }
      )
      //  ksizedbox30,
     
         
       ],
    );
  }
}

class bottle_container extends StatelessWidget {
  const bottle_container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Orders(
              bottleimg: 'assets/images/Group 5831.png',
            ),
            Orders(
              bottleimg: 'assets/images/Group 5831.png',
            ),
          ],
        ),
        ksizedbox30,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Orders(
              bottleimg: 'assets/images/Group 5831.png',
            ),
            Orders(
              bottleimg: 'assets/images/Group 5831.png',
            ),
          ],
        ),
        ksizedbox30,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Orders(
              bottleimg: 'assets/images/Group 5831.png',
            ),
            Orders(
              bottleimg: 'assets/images/Group 5831.png',
            ),
          ],
        ),
      ],
    );
  }
}
