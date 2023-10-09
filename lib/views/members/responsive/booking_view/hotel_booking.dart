import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constant/constans.dart';
import '../../../../controller/hotel_controller/hotel_controller.dart';
import '../../../../models/hotel_model/hotel_booking_list_model.dart';
import '../../../../models/hotel_model/hotel_detials_model.dart';

class MobileHotelBooking extends StatefulWidget {
  const MobileHotelBooking({super.key});

  @override
  State<MobileHotelBooking> createState() => _MobileHotelBookingState();
}

class _MobileHotelBookingState extends State<MobileHotelBooking> {
  
    final hotelController = Get.find<HotelController>();

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hotelController.hotelBookingList();
  }
   void launchGoogleMaps(String latitude, String longitude) async {
    final url =
        // 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

        "google.navigation:q=$latitude,$longitude&mode=d";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch Google Maps';
    }
  }
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
       var size = MediaQuery.of(context).size;
    return GetBuilder<HotelController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: hotelController.bookingList.isEmpty
            ?  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Image.asset('assets/images/hotelbookingnotavailableimage.png'),
                    ),
                    ksizedbox20,
                    Text('Not Booking In Hotel Rooms',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kblue
                    ),)
                  ],
                ),
              )
            : Stack(
                children: [
                  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: hotelController.bookingList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });
                              Result result = await hotelController
                                  .getHotelDetails(hotelController
                                      .bookingList[index].bookingId);
                              setState(() {
                                isLoading = false;
                              });
                              dialogBuilder(
                                  context,
                                  hotelController.bookingList[index],
                                  result);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 125,
                                width: size.width,
                                decoration: BoxDecoration(
                                  color: kwhite,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: hotelController
                                                      .bookingList[index]
                                                      .hotelImage ==
                                                  "null"
                                              ? Image.asset(
                                                  "assets/icons/no-photo.png",
                                                  height: 100,
                                                  width: 100,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.network(
                                                  hotelController
                                                      .bookingList[index]
                                                      .hotelImage,
                                                  height: 100,
                                                  width: 100,
                                                  fit: BoxFit.cover,
                                                )),
                                    ),
                                    kwidth10,
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ksizedbox10,
                                        Container(
                                          width: 200,
                                          child: Text(
                                            hotelController
                                                .bookingList[index].hotelName
                                                .toString(),
                                            maxLines: 2,
                                            style:
                                                const TextStyle(fontSize: 21),
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          child: Text(
                                            hotelController
                                                .bookingList[index].place,
                                            maxLines: 4,
                                            style: TextStyle(color: kblue),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Booking Date :",
                                              maxLines: 4,
                                              style: TextStyle(color: kblue),
                                            ),
                                            Text(
                                              hotelController
                                                  .bookingList[index]
                                                  .bookingDate,
                                              maxLines: 4,
                                              style: TextStyle(color: kgrey),
                                            ),
                                          ],
                                        ),
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
                if(isLoading)  Container(
                    height: size.height,
                    width: size.width,
                    decoration:
                        const BoxDecoration(color: Color.fromARGB(22, 0, 0, 0)),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: kOrange,
                    )),
                  )
                ],
              ),
      );
    });
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
                    InkWell(
                      onTap: () {
                        launchGoogleMaps(result.latitude, result.longitude);
                      },
                      child: Container(
                        height: 50,
                        width: 70,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.directions,
                          color: Colors.blue,
                          size: 26,
                        ),
                      ),
                    )
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
