import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../constant/constans.dart';
import '../../../../../../controller/hotel_controller/hotel_controller.dart';
// import '../../../../../../models/hotel_model/block_room_api_model.dart';
import '../../../../../../models/hotel_model/hotel_booking_list_model.dart';
import '../../../../../../models/hotel_model/hotel_detials_model.dart';

class HotelHistory extends StatefulWidget {
  const HotelHistory({super.key});

  @override
  State<HotelHistory> createState() => _HotelHistoryState();
}

class _HotelHistoryState extends State<HotelHistory> {
  final hotelBookingController = Get.find<HotelController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hotelBookingController.hotelBookingList();
  }

  Future<void> dialogBuilder(
      BuildContext context, BookingList bookingData, Result result) {
    return showDialog<void>(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          title: Container(
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
                    bookingData.hotelImage == "null"
                        ? Image.asset(
                            "assets/icons/no-photo.png",
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            bookingData.hotelImage,
                            height: 50,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookingData.hotelName,
                          style: TextStyle(
                              fontSize: 16,
                              color: kblue,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // Text(
                        //    'Date : ${formatDate(enquiryDatas.packageDetails.createdAt,
                        //            [dd ,'-',mm,'-',yyyy])}',
                        //   style: TextStyle(
                        //       fontSize: 12,
                        //       color: kblue,
                        //       fontWeight: FontWeight.w500),
                        // ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Booking Date',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingData.bookingDate,
                      style: TextStyle(
                          fontSize: 15,
                          color: kgrey,
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
                      'Booking Id',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingData.bookingId,
                      style: TextStyle(
                          fontSize: 15,
                          color: kgrey,
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
                      'Address',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 150,
                      child: Text(
                        result.addressLine1,
                        style: TextStyle(
                            fontSize: 15,
                            color: kgrey,
                            fontWeight: FontWeight.w500),
                      ),
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
                      'Location',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     launchGoogleMaps(result.latitude, result.longitude);
                    //   },
                    //   child: Container(
                    //     height: 50,
                    //     width: 70,
                    //     alignment: Alignment.center,
                    //     child: Icon(
                    //       Icons.directions,
                    //       color: Colors.blue,
                    //       size: 26,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Contact',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 120,
                      child: Text(
                        result.addressLine2,
                        style: TextStyle(
                            fontSize: 15,
                            color: kgrey,
                            fontWeight: FontWeight.w500),
                      ),
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
                      'Booking Status',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingData.hotelBookingStatus,
                      style: TextStyle(
                          fontSize: 15,
                          color: kgrey,
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
                      'No Of Days',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingData.noOfDays,
                      style: TextStyle(
                          fontSize: 15,
                          color: kgrey,
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
                      'No Of Peoples',
                      style: TextStyle(
                          fontSize: 16,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingData.noOfPeople,
                      style: TextStyle(
                          fontSize: 15,
                          color: kgrey,
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
                    const Text(
                      'Price',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹ ${bookingData.price}",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelController>(builder: (_) {
      return Column(
        children: [
          hotelBookingController.bookingList.isEmpty
              ? const Center(
                  child: Text("No bookings found"),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    //height: 500,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: hotelBookingController.bookingList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 5,
                          crossAxisCount: 2),
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () async {
                            Result result = await hotelBookingController
                                .getHotelDetails(hotelBookingController
                                    .bookingList[index].bookingId);
                            dialogBuilder(
                                context,
                                hotelBookingController.bookingList[index],
                                result);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      blurRadius: 5,
                                      color: kgrey),
                                ],
                                borderRadius: BorderRadius.circular(5)),
                            height: 150,
                            width: 259,
                            //color: kwhite,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: hotelBookingController
                                              .bookingList[index].hotelImage ==
                                          "null"
                                      ? Image.asset(
                                          'assets/images/Rectangle 1877.png')
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Image.network(
                                            hotelBookingController
                                                .bookingList[index].hotelImage,
                                            height: 130,
                                            width: 150,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                                kwidth10,
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ksizedbox10,
                                    Row(
                                      children: [
                                        Text(
                                          hotelBookingController
                                              .bookingList[index].hotelName
                                              .toString(),
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 21),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Image.asset(
                                            'assets/images/Icon material-location-on.png')
                                      ],
                                    ),
                                    Text(
                                      'Booking Date : ${hotelBookingController.bookingList[index].bookingDate}',
                                      style: TextStyle(color: kblue),
                                    ),
                                    // Text(
                                    //   'Check in : 03:44PM Check Out 03:43 PM',
                                    //   style: TextStyle(color: kblue),
                                    // ),
                                    Text(
                                      'Price :${hotelBookingController.bookingList[index].price}',
                                      style: TextStyle(color: kblue),
                                    ),
                                    Text(
                                      'Total Person :${hotelBookingController.bookingList[index].noOfPeople}',
                                      style: TextStyle(color: kblue),
                                    ),
                                    ksizedbox10
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
          ksizedbox40
        ],
      );
    });
  }
}
