import 'package:bciweb/views/members/bookins/hotels/resort.dart';

import 'package:bciweb/views/members/bookins/hotels/resort_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:selectable/selectable.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:date_format/date_format.dart';
import '../../../../constant/constans.dart';
import '../../../../controller/hotel_controller/hotel_controller.dart';
import '../../../../models/hotel_model/hotel_search_model.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../common_widget/common.dart';

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
  //  searchUsers() {
  //   if (searchController.text.trim().isNotEmpty) {
  //     holidayPackageController.searchPackageList(
  //         name: searchController.text,
  //         categoryid: holidayPackageController.searchInt.value.toString());
  //   } else {
  //     holidayPackageController.getPackage(
  //         categoryId:
  //             holidayPackageController.packageCategoryData.first.id.toString());
  //     holidayPackageController.update();
  //   }
  // }
  var searchController =TextEditingController();
   List<SearchHotelData> _searchResult = [];
   onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    hotelController.searchHotelData.forEach((searchController) {
      if (searchController.hotelName.contains(text) || searchController.hotelAddress.contains(text)) {
        _searchResult.add(searchController);
      }
    });
   
    

    
    setState(() {});
  }
  _getFilteredList() {
    print("searching .........${searchController.text}");
    hotelController.searchHotelData = hotelController
        .searchHotelData
        .where((value) => value.hotelName
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();

    if (searchController.text.isEmpty) {
      hotelController.searchHotelData =
          hotelController.tempSearchHotelData;
    }

    hotelController.update();
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(_getFilteredList);
  }

   
 var  start =DateTime.now();
var end = DateTime.now();

  final hotelController = Get.find<HotelController>();

  // void initState() {
  //   super.initState();
  //   hotelController.searchHotel(
  //       child: hotelController.child.value,
  //       adult: hotelController.adult.value,
  //       checkindate: DateFormat('dd/MM/yyyy').format(start),
  //       checkoutdate: DateFormat('dd/MM/yyyy').format(end),
  //       destination: hotelController.hotelSearchKey.value,
  //       //  childage: hotelController.roomno.value,
  //       roomsno: hotelController.roomno.string,
  //       countryCode: hotelController.hotelSearchKeyCode.value);
  //   hotelController.update();
  // }

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
          ), preferredSize:const Size(double.infinity, 110)),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50,right: 50),
            child: Column(
              children:[ 
                ksizedbox20,
                Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 50,
                        width: size.width * 0.66,
                        child: TextFormField(
                          controller: searchController,
                          decoration: InputDecoration(
                              hintText: "Search for hotels",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        )),
          
                        Padding(
                          padding: const EdgeInsets.only(left: 150,right: 150,top: 40),
                          child: GetBuilder<HotelController>(
                            builder: (_) {
                              return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: hotelController.searchHotelData.length,
                                  itemBuilder: (context, index) {
                                    return hotelController.searchHotelData.isEmpty?
                                    Text('No Found Data'):
                                     Padding(
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
                                              padding: const EdgeInsets.only(left: 15,top: 15,bottom: 15),
                                              child: Selectable(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      hotelController
                                                          .searchHotelData[index].hotelName,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          color: kOrange),
                                                    ),
                                                    ksizedbox20,
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
                                                    // ksizedbox10,
                                                    // InkWell(
                                                    //   onTap: () async {
                                                    //     final prefs = await SharedPreferences
                                                    //         .getInstance();
                                                    //     var searchtocken =
                                                    //         prefs.getString("searchtocken");
                                                    //     Get.to(ResortBooking(
                                                    //         hotelcode: hotelController
                                                    //             .searchHotelData[index]
                                                    //             .hotelCode,
                                                    //         resultIndex: hotelController
                                                    //             .searchHotelData[index]
                                                    //             .resultIndex
                                                    //             .toString(),
                                                    //         searchtoken: searchtocken ?? "",
                                                    //         userIp: '122.160.83.78'));
                                                    //     hotelController.update();
                                                    //   },
                                                    //   child: Container(
                                                    //     height: 30,
                                                    //     width: 120,
                                                    //     decoration: BoxDecoration(
                                                    //         color: kOrange,
                                                    //         borderRadius:
                                                    //             BorderRadius.circular(5)),
                                                    //     child: Center(
                                                    //       child: Text(
                                                    //         'Couple  Friendly',
                                                    //         style: TextStyle(color: kwhite),
                                                    //       ),
                                                    //     ),
                                                    //   ),
                                                    // )
                                                  ],
                                                ),
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
                                                      //Text('₹ ${hotelController.searchHotelData[index].price.offeredPrice}').text.white.make(),
                                                      //Text('₹ ${hotelController.searchHotelData[index].price.offeredPriceRoundedOff}').text.white.make(),
                                                      Text(
                                                        '₹ ${hotelController.searchHotelData[index].price.publishedPrice}',
                                                      ).text.white.make(),
                                                      // Text('Saving ₹${hotelController.searchHotelData[index].price.roomPrice}')
                                                      //     .text
                                                      //     .white
                                                      //     .make(),
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
                                                            height: 25,
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
                                                width: size.width * 0.12,
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
                                            height: 200,
                                               // width:500,
                                        width: size.width * 0.6,
                                        // height: 1000,
                                      ),
                                    );
                                  },
                                );
                            }
                          ),
                        ),
              //   Padding(
              //      padding: const EdgeInsets.only(top: 20,left: 10,right: 10,),
              //      child: GetBuilder<HotelController>(
              //        builder: (_) {
              //          return Container(
              //   decoration: BoxDecoration(
              //           color: Colors.white,
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   height: 55,
              //   width: size.width * 0.68,
              //   child: TextFormField(
              //     controller: searchController,
              //     decoration: InputDecoration(
              //           hintText: "Search for hotels",
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(10)
              //           )
              //     ),
              //   )
              // );
              //        }
              //      ),
              //                ),
              //                ksizedbox20,
              //   GetBuilder<HotelController>(builder: (_) {
          
              // return hotelController.searchHotelData.isEmpty?Text('No Found Data'): Padding(
              //     padding: const EdgeInsets.all(15.0),
              //     child: hotelController.isLoading.isTrue
              //         ? Container(
              //             child: const CircularProgressIndicator(
              //               color: Colors.yellow,
              //             ),
              //           )
              //         : Container(
                         
              //             // color: kblue,
              //             //  height: 500,
              //             child: 
              //           ),
                
              // );
              //   }),
              ]
            ),
          ),
        ],
      )
    );
  }
}

