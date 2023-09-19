import 'package:bciweb/views/members/bookins/hotels/resort.dart';

import 'package:bciweb/views/members/bookins/hotels/resort_details_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../../constant/constans.dart';
import '../../../../controller/hotel_controller/hotel_controller.dart';

class HotelSearchList extends StatefulWidget {
  HotelSearchList({
    super.key,
    required String checkindate,
    required String destination,
    required String countryCode,
    required String checkoutdate,
    required int adult,
    required int child,
    required String roomsno,
  });

  @override
  State<HotelSearchList> createState() => _HotelSearchListState();
}

class _HotelSearchListState extends State<HotelSearchList> {
  final hotelController = Get.find<HotelController>();

  void initState() {
    super.initState();
    hotelController.searchHotel(
        child: hotelController.child.value,
        adult: hotelController.adult.value,
        checkindate: DateFormat('dd/MM/yyyy').format(start),
        checkoutdate: DateFormat('dd/MM/yyyy').format(end),
        destination: hotelController.hotelSearchKey.value,
        //  childage: hotelController.roomno.value,
        roomsno: hotelController.roomno.string,
        countryCode: hotelController.hotelSearchKeyCode.value);
    hotelController.update();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HotelController>(builder: (_) {
      return Obx(
        () => Padding(
          padding: const EdgeInsets.all(15.0),
          child: hotelController.isLoading.isTrue
              ? Container(
                  child: const CircularProgressIndicator(
                    color: Colors.yellow,
                  ),
                )
              : Container(
                  width: size.width * 0.7,
                  // color: kblue,
                  //  height: 500,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: hotelController.searchHotelData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          child: Row(
                            children: [
                              kwidth10,
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: hotelController.searchHotelData[index]
                                            .hotelPicture ==
                                        "null"
                                    ? WebsafeSvg.asset(
                                        'assets/images/No_image_available.svg',
                                        height: 100,
                                        fit: BoxFit.fitHeight,
                                      )
                                    : Image.network(
                                        hotelController.searchHotelData[index]
                                            .hotelPicture,
                                        fit: BoxFit.cover,
                                        height: 170,
                                        width: 180,
                                      ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        hotelController.searchHotelData.isEmpty
                                            ? Text("")
                                            : Text(hotelController
                                                    .searchHotelData
                                                    .first
                                                    .starRating
                                                    .toString())
                                                .text
                                                .white
                                                .semiBold
                                                .make()
                                                .box
                                                .blue900
                                                .roundedLg
                                                .p8
                                                .make(),
                                        kwidth5,
                                        Text('Very Good Raiting')
                                            .text
                                            .semiBold
                                            .blue900
                                            .make()
                                      ],
                                    ),
                                    ksizedbox10,
                                    Text(
                                      hotelController
                                          .searchHotelData[index].hotelName,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: kOrange),
                                    ),
                                    ksizedbox10,
                                    Container(
                                      width: 420,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            hotelController
                                                .searchHotelData[index]
                                                .hotelAddress,
                                            style: TextStyle(
                                                fontSize: 15, color: kblue),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ksizedbox10,
                                    InkWell(
                                      onTap: () async {
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        var searchtocken =
                                            prefs.getString("searchtocken");
                                        Get.to(ResortBooking(
                                            hotelcode: hotelController
                                                .searchHotelData[index]
                                                .hotelCode,
                                            resultIndex: hotelController
                                                .searchHotelData[index]
                                                .resultIndex
                                                .toString(),
                                            searchtoken: searchtocken ?? "",
                                            userIp: '122.160.83.78'));
                                        hotelController.update();
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            color: kOrange,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            'Couple  Friendly',
                                            style: TextStyle(color: kwhite),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('Per Night').text.white.make(),
                                        Text('₹ 3,499').text.white.make(),
                                        Text('₹ 2,490').text.white.make(),
                                        Text(
                                          '₹ ${hotelController.searchHotelData[index].price.publishedPrice}',
                                        ).text.white.make(),
                                        Text('Saving ₹ 1,009')
                                            .text
                                            .white
                                            .make(),
                                        InkWell(
                                          onTap: () async {
                                            final prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            var searchtocken =
                                                prefs.getString("searchtoken");
                                            Get.to(ResortDetailsScreen(
                                              hotelCode: hotelController
                                                  .searchHotelData[index]
                                                  .hotelCode,
                                              resultIndex: hotelController
                                                  .searchHotelData[index]
                                                  .resultIndex
                                                  .toString(),
                                              searchToken: searchtocken ?? "",
                                              userIp: '122.160.83.78',
                                            ));
                                          },
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3.5),
                                            child: Container(
                                              height: 18,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: kOrange),
                                              child: Center(
                                                child: Text(
                                                  'Book Now',
                                                  style:
                                                      TextStyle(color: kwhite),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  color: kblue,
                                  width: size.width * 0.1,
                                  height: size.height,
                                ),
                              )
                            ],
                          ),
                          decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: kwhite,
                              boxShadow: [
                                new BoxShadow(
                                  color: Color.fromARGB(255, 186, 182, 182),
                                  blurRadius: 20.0,
                                ),
                              ]),
                          width: size.width * 0.6,
                          height: size.height * 0.3,
                        ),
                      );
                    },
                  ),
                ),
        ),
      );
    });
  }
}
