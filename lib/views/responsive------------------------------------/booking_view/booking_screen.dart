import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/historycontroller.dart';
import 'package:bciweb/views/responsive------------------------------------/booking_view/flight/flight_home.dart';
import 'package:bciweb/views/responsive------------------------------------/booking_view/others_booking.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'holiday_booking.dart';
import 'hotel_booking.dart';
import 'bus/bus_booking_screen.dart';


class MembersBookingCommonContainer extends StatefulWidget {
  const MembersBookingCommonContainer({super.key});

  @override
  State<MembersBookingCommonContainer> createState() => _MembersBookingCommonContainerState();
}

class _MembersBookingCommonContainerState extends State<MembersBookingCommonContainer> {
  int index = 0;

  final historyController = Get.find<BookingHistoryController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBarMob(), 
            preferredSize: Size(double.infinity, 40)),
      drawer: MobileDrawer(),
        // body: TabBarView(
        //   children: [
        //   //Flight_widget (), 
        //   //bookings_containers(),
        //   //Holiays_containors(),
        //   //OthersBookingsView(),
        // ]),
        body: Obx(() =>  Column(
            children: [
              ksizedbox20,
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
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      )),
                                      decoration: BoxDecoration(
                                          color: historyController.hisindex == 0
                                              ? kyellow
                                              : kgrey,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      height: 35,
                                      width: 70,
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
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      )),
                                      decoration: BoxDecoration(
                                          color: historyController.hisindex == 1
                                              ? kyellow
                                              : kgrey,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      height: 35,
                                      width: 70,
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
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      )),
                                      decoration: BoxDecoration(
                                          color: historyController.hisindex == 2
                                              ? kyellow
                                              : kgrey,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      height: 35,
                                      width: 70,
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
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      )),
                                      decoration: BoxDecoration(
                                          color: historyController.hisindex == 3
                                              ? kyellow
                                              : kgrey,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      height: 35,
                                      width: 70,
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
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      )),
                                      decoration: BoxDecoration(
                                          color: historyController.hisindex == 4
                                              ? kyellow
                                              : kgrey,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      height: 35,
                                      width: 70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // height: 140,
                            // width: size.width * 0.9,
                            // decoration: BoxDecoration(
                            //     color: kwhite,
                            //     borderRadius: BorderRadius.only(
                            //         topLeft: Radius.zero,
                            //         bottomLeft: Radius.circular(15),
                            //         topRight: Radius.circular(15),
                            //         bottomRight: Radius.circular(15))),
                          ),
                          if(historyController.hisindex.value == 4)
                          const OthersBookingsView(),  
                          ksizedbox40,
                          ksizedbox40,

                          if(historyController.hisindex.value == 0)
                          MobileFlightHome(),

                          if(historyController.hisindex.value==1)
                           MobileHotelBooking(),

                           if(historyController.hisindex.value==2)
                           MobileHolidaysBooking(),

                           if(historyController.hisindex.value==3)
                           MobileBusBooking()
        
            ],
          ),
        ),
      ),
    );
  }
}
