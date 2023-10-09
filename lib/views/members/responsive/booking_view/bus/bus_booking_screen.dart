import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constant/constans.dart';
import '../../../../../controller/bus_controllers.dart';
import '../../../../../models/busbookingmodels/bus_booking_history_model.dart';
import '../../../bookins/history/views/widgets/orders.dart';
import 'liqour_order.dart';

class MobileBusBooking extends StatefulWidget {
  const MobileBusBooking({super.key});

  @override
  State<MobileBusBooking> createState() => _MobileBusBookingState();
}

class _MobileBusBookingState extends State<MobileBusBooking> {
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
    return GetBuilder<BusController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: busController.bookingHistoryList.isEmpty
            ?  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20),
                       child: Image.asset('assets/images/busbookingnotavailableimage.png'),
                     ),
                     ksizedbox20,
                     Text('Not Booking In Bus Tickets',
                     style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kblue
                     ),)
                  ],
                ),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: busController.bookingHistoryList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        dialogBuilder(context,
                            busBookingData:
                                busController.bookingHistoryList[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: size.width,
                          decoration: BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: ClipRRect(
                              //       borderRadius: BorderRadius.circular(5),
                              //       child: Image.network(
                              //         holidayPackageController.enquiryData[index].packageDetails.image.first,
                              //         height: 100,
                              //         width: 100,
                              //         fit: BoxFit.cover,
                              //       )),
                              // ),
                              kwidth10,
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ksizedbox10,
                                  Container(
                                    width: 200,
                                    child: Text(
                                      busController
                                          .bookingHistoryList[index].busName
                                          .toString(),
                                      maxLines: 2,
                                      style: const TextStyle(fontSize: 21),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      '${busController.bookingHistoryList[index].fromCityname} to ${busController.bookingHistoryList[index].toCityname}',
                                      maxLines: 4,
                                      style: TextStyle(color: kblue),
                                    ),
                                  ),

                                  Text(
                                    'Booking Date :${busController.bookingHistoryList[index].bookingDate.split(" ").first}',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  // Text(
                                  //   'Total Person : 5 Members',
                                  //   style: TextStyle(color: kblue),
                                  // ),
                                  // Text(
                                  //   'Ac Rooms',
                                  //   style: TextStyle(color: kblue),
                                  // ),
                                  ksizedbox10
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
      );
    });
  }

  Future<void> dialogBuilder(
    BuildContext context, {
    required BookingHistoryData busBookingData,
  }) {
    return showDialog<void>(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          title: Container(
            height: 400,
            width: 300,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: kblue,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Details',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(Icons.bus_alert),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            busBookingData.remarks == ""
                                ? "Bus Booking"
                                : busBookingData.remarks,
                            style: TextStyle(
                                fontSize: 16,
                                color: kblue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Date : ${busBookingData.bookingDate.split(" ").first}',
                          style: TextStyle(
                              fontSize: 12,
                              color: kblue,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'From city',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      busBookingData.fromCityname,
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'To City',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      busBookingData.toCityname,
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Booking Ref.no',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      busBookingData.bookingRefno,
                      style: TextStyle(
                          fontSize: 15,
                          color: kblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bus Name',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 120,
                      child: Text(
                        busBookingData.busName,
                        style: TextStyle(
                            fontSize: 15,
                            color: kblue,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),

                // const Divider(
                //   thickness: 1,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Quantity',
                //       style: TextStyle(
                //           fontSize: 16,
                //           color: kblue,
                //           fontWeight: FontWeight.bold),
                //     ),
                //     Text(
                //       qty,
                //       style: TextStyle(
                //           fontSize: 15,
                //           color: kblue,
                //           fontWeight: FontWeight.w500),
                //     ),
                //   ],
                // ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                      showDialog(context: context, 
                      builder: (BuildContext context){
                        return mAlertItem2;
                      });
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.find<BusController>().busTicketDownload(
                            refernceNo: busBookingData.bookingRefno);
                      },
                      child: Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
    AlertDialog mAlertItem2 = AlertDialog(
    backgroundColor: Colors.white,
    title: Text("Cancel Booking", style: TextStyle(color: Colors.black)),
    content: Text(
      "Are you sure you want to Cancel?",
      style: TextStyle(color: Colors.black),
    ),
    actions: [
      TextButton(
        child: Text(
          "Yes",
          style: TextStyle(color: kblue),
        ),
        onPressed: () {
          Get.back();
          //Get.find<AuthController>().logout();
        },
      ),
      TextButton(
        child: Text("No", style: TextStyle(color: kblue)),
        onPressed: () {
          Get.back();
        },
      ),
    ],
  );
  }
