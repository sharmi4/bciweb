import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/models/service_model.dart';

import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:bciweb/views/responsive------------------------------------/respo_services/respo_coupens.dart';
import 'package:bciweb/views/responsive------------------------------------/respo_services/respo_offers.dart';
import 'package:bciweb/views/responsive------------------------------------/respo_services/respo_service_cart_list.dart';
import 'package:bciweb/views/responsive------------------------------------/respo_services/responvendor_details_screen.dart';


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../constant/constans.dart';
//import '../../../../registerhomescreen/common_reg_appbar';

import '../../../controller/service_controller/home_controller.dart';
import '../../../models/vendor_list_model.dart';
import '../mobile_wdgets/drawer.dart';
import '../mobile_wdgets/mobile_common_bottom/bottom.dart';
import '../../members/services/vendor_details_screen.dart';
//import '../../../members/common_widget/common.dart';

class RespoServices extends StatefulWidget {

   RespoServices({super.key,});

  @override
  State<RespoServices> createState() => _ServicesState();
}

CarouselController curouselController = CarouselController();

class _ServicesState extends State<RespoServices> {
  int pageIndex = 0;
  final authController = Get.find<AuthController>();
  final serviceController= Get.find<HomeServiceController>();

  @override
  void initState() {
    super.initState();
    authController.getservice();
    serviceController.gettodayoffersList();
  serviceController.getVendorsList();
   // authController.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(child: AppBarMob(), preferredSize: Size.fromHeight(50)),
      drawer: MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Image.asset('assets/images/Group 39744.png'),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'SERVICES',
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kwhite),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // ksizedbox20,
            // Text(
            //   'SPECIAL COUPONS',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //       color: Color(0xff003366),
            //       fontSize: 25,
            //       fontWeight: FontWeight.bold),
            // ),
            // ksizedbox10,
            // Container(
            //   height: 10,
            //   width: 60,
            //   color: korange,
            // ),
            // ksizedbox10,
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Container(
            //       //width: 800,
            //       child: Text(
            //     'Special coupons are promotional discounts offered by businesses to encourage customers to make a purchase or use their services. These coupons may be available in various forms such as printed coupons, digital coupons, or promo codes.',
            //     style: TextStyle(color: ktextblue),
            //   )),
            // ),
            // ksizedbox20,

            Container(
              height: 500,
              child: GetBuilder<HomeServiceController>(
                builder: (context) {
                  return ListView.builder(
                                itemCount: serviceController.vendorList.length,
                                shrinkWrap: true,
                             
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 2.5,
                                                color: Colors.grey.withOpacity(0.5))
                                          ]),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child: serviceController.vendorList[index]
                                                        .profilePicture !=
                                                    null
                                                ? Container(
                                                  height: 100,
                                                  width: 150,
                                                  child: Image.network(
                                                      serviceController.vendorList[index]
                                                          .profilePicture!,
                                                      //height: 125,
                                                     
                                                      fit: BoxFit.cover,
                                                    ),
                                                )
                                                : Image.asset(
                                                    "assets/icons/no.jpg",
                                                    //height: 125,
                                                    height: 100,
                                                    width: 150,
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  width: 150,
                                                  child: Text(
                                                    serviceController
                                                        .vendorList[index].name,
                                                    style: primaryFont.copyWith(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                ksizedbox20,
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(
                                                      ResVendorDetailsScreen(
                                                        vendorListModelData:
                                                            serviceController
                                                                .vendorList[index],
                                                        userid: serviceController
                                                            .vendorList[index].id
                                                            .toString(),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                      color: kblue,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                      child: Text(
                                                        "Click now",
                                                        style: primaryFont.copyWith(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              );
                }
              ),
            ),
       

//             ksizedbox10,
            
//             ksizedbox30,
//             Image.asset('assets/images/Group 38585.png'),
//             ksizedbox30,
//             Text(
//               'TODAYS OFFERS',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color: Color(0xff003366),
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold),
//             ),
//             ksizedbox10,
//             Container(
//               height: 10,
//               width: 60,
//               color: korange,
//             ),
//             ksizedbox10,
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Container(
//                   //  width: 800,
//                   child: Text(
//                 'Special coupons are promotional discounts offered by businesses to encourage customers to make a purchase or use their services. These coupons may be available in various forms such as printed coupons, digital coupons, or promo codes.',
//                 style: TextStyle(color: ktextblue),
//               )),
//             ),

//             ksizedbox30,
//             GetBuilder<HomeServiceController>(builder: (_) {
//               return CarouselSlider(
//                 carouselController: curouselController,
//                 items: [
//                   for (var j = 0; j < serviceController.todayofferslist.length; j++)
//                     InkWell(
//                       child: offercontainermob(
//                         image: serviceController.todayofferslist[j].image,
//                         title: serviceController.todayofferslist[j].title,
//                         description: serviceController.todayofferslist[j].description,
//                       ),
//                       onTap: () {
//                         Get.to(RespOffer(
//                           image: serviceController.todayofferslist[j].image,
//                           title: serviceController.todayofferslist[j].title,
//                           description: serviceController.todayofferslist[j].description,
//                         ));
//                       },
//                     ),
//                   // InkWell(
//                   //   child: offercontainermob(),
//                   //   onTap: () {
//                   //     Get.toNamed('/respo-offer');
//                   //   },
//                   // ),
//                   // InkWell(
//                   //   child:offercontainermob(),
//                   //   onTap: () {
//                   //     Get.toNamed('/respo-offer');
//                   //   },
//                   // ),
//                 ],
//                 options: CarouselOptions(
//                   height: 150.0,
//                   enlargeCenterPage: true,
//                   autoPlay: true,
//                   aspectRatio: 16 / 9,
//                   enableInfiniteScroll: true,
//                   autoPlayAnimationDuration: Duration(milliseconds: 3000),
//                   viewportFraction: 0.8,
//                   onPageChanged: (index, reason) {
//                     setState(() {
//                       pageIndex = index;
//                     });
//                   },
//                 ),
//               );
//             }),

//             ksizedbox10,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 AnimatedSmoothIndicator(
//                   activeIndex: pageIndex,
//                   count: 3,
//                   effect: ScaleEffect(
//                       dotHeight: 9.0,
//                       dotWidth: 9.0,
//                       dotColor: kgrey,
//                       activeDotColor: Colors.yellow),
//                 ),
//               ],
//             ),
//             //  offercontainer(),
//             ksizedbox30,
//             InkWell(
//               onTap: () {
// Get.to(RespOffer(description: serviceController.todayofferslist.first.description,
// image: serviceController.todayofferslist.first.image,
// title: serviceController.todayofferslist.first.title,));
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Color(0XFFE4E4E6),
//                     borderRadius: BorderRadius.circular(4)),
//                 child: Center(
//                     child: Text(
//                   'TODAY OFFERS',
//                   style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                       color: ktextblue),
//                 )),
//                 height: 30,
//                 width: 140,
//               ),
//             ),
            ksizedbox40,
            MobileCommonBottom()
          ],
        ),
      ),
    );
  }
}
