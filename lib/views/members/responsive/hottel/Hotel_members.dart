
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import '../../../../constant/constans.dart';
import '../../../../controller/home_controller.dart';
import '../../../../controller/hotel_controller/hotel_controller.dart';
import '../../../../models/hotel_model/hotel_search_model.dart';
import 'final_booking.dart';

class HotelListScreen extends StatefulWidget {
  HotelListScreen({
    super.key,
  });

  @override
  State<HotelListScreen> createState() => _HotelListScreenState();
}

class _HotelListScreenState extends State<HotelListScreen> {
  final homeController = Get.find<HomeController>();
  final hotelController = Get.find<HotelController>();
  final destinationcontrolr = TextEditingController();

  List<SearchHotelData> _searchResult = [];

    
  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    hotelController.searchHotelData.forEach((searchData) {
      if (searchData.hotelName.contains(text) || searchData.hotelAddress.contains(text)) {
        _searchResult.add(searchData);
      }
    });

    setState(() {});
  }




  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8FD),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(332),
            child: Column(children: [
              Stack(
                children:[ 
                Container(
                  height: size.height*0.39,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Container(
                      height: size.height*0.34,
                      width: size.width,
                      child: Image.asset('assets/icons/hotelbanner.png',
                      height: size.height*0.34,
                      width: size.width,
                      fit: BoxFit.fill,)),
                  ),
                ),
                  InkWell(
            onTap: () {
              Get.back();
            },
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: kOrange,
                        borderRadius: BorderRadius.circular(7)
                      ),
                      child: Center(
                        child: Icon(Icons.arrow_back_ios_new,color: kwhite,size: 16,))),
                        kwidth10,
                        Text(
                  'Find your hotel',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700,color: kwhite),
                ),
                  ],
                ),
              ))),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                 padding: const EdgeInsets.only(top: 10,left: 10,right: 10,),
                 child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: size.height * 0.06,
              width: size.width * 0.2,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search for hotels",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              )
            ),
                           ),
              ),
              ]),
            ])),
      body: ListView.builder(
        itemCount: hotelController.searchHotelData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 120,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          child: Image.network(
                            hotelController
                                .searchHotelData[index].hotelPicture,
                            width: 100,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                hotelController
                                    .searchHotelData[index].hotelName,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              width: 200,
                              child: Text(
                                hotelController
                                    .searchHotelData[index].hotelAddress,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '₹ ${hotelController.searchHotelData[index].price.publishedPrice}',
                                  style: TextStyle(color: kblue),
                                ),
                                Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10,left: 30),
                      child: InkWell(
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();
                          var searchtocken = prefs.getString("searchtoken");
                          Get.to(HotelInfobooking(
                            hotelCode: hotelController
                                .searchHotelData[index].hotelCode,
                            resultIndex: hotelController
                                .searchHotelData[index].resultIndex
                                .toString(),
                            searchToken: searchtocken ?? "",
                            userIp: '122.160.83.78',

                            // hotelBookingController.blockroomdata[index].hotelRoomsDetails.toString(),
                          ));
                          hotelController.update();
                          // print(
                          //     'hotel code${hotelBookingController.searchHotelData[index].hotelCode}');
                          // print(
                          //     'result index${hotelBookingController.searchHotelData[index].resultIndex}');
                          // print(
                          //     'search tocken${searchtocken}');
                          // print(
                          //     'hotel code${hotelBookingController.searchHotelData[index].hotelCode}');
                        },
                        child: Container(
                            height: 35,
                            width: 80,
                            decoration: BoxDecoration(
                                color: kblue,
                                borderRadius: BorderRadius.circular(16)),
                            alignment: Alignment.center,
                            child: Text(
                                "Booking",
                                style: TextStyle(
                                    color: Color(0xFFD1D1D1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                            ),
                      )),
                              ],
                            ),
                            ksizedbox10,
                          ],
                        ),
                      ),
                    ],
                  ),
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5, color: Colors.grey.withOpacity(0.5)),
                    ],
                  ),
                ),

                // Positioned(
                //   right: 5,
                //   top: 0,
                //   bottom: 0,
                //   child: 
                // ),
                //
              ],
            ),
          );
        },
      ),
    );
  }
}
