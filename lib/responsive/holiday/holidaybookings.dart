import 'package:bciweb/controller/holiday_package_controller.dart';
import 'package:bciweb/responsive/holiday/controllers/holidaycontroller.dart';
import 'package:bciweb/responsive/holiday/widgets/additional_info.dart';
import 'package:bciweb/responsive/holiday/widgets/day_wise_itnerary.dart';
import 'package:bciweb/responsive/holiday/widgets/enquiry_now.dart';
import 'package:bciweb/responsive/holiday/widgets/hoteldetails.dart';
import 'package:bciweb/responsive/holiday/widgets/overview.dart';
import 'package:bciweb/responsive/mobile_wdgets/comomappbar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../constant/constans.dart';
import '../mobile_wdgets/drawer.dart';




class HolidayScreen extends StatefulWidget {
  String packageId;
  HolidayScreen({super.key,required this.packageId});

  @override
  State<HolidayScreen> createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  final holidayControllerss = Get.find<HolidayyController>();

  final holidayPackageController = Get.find<HolidayPackageController>();
  
  CarouselController sliderController = CarouselController();
  int activeIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holidayPackageController.packageDetails(packageid: widget.packageId);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(child: AppBarMob(), preferredSize: Size.fromHeight(50)),
      drawer:const MobileDrawer(),
      body:SingleChildScrollView(
        child: GetBuilder<HolidayPackageController>(
          builder: (_) {
            return Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ksizedbox20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.9,
                      child: Column(
                        children: [
                          Image.asset('assets/images/overviewimage.png'),
                          // Stack(
                          //   children: [
                          //     CarouselSlider(
                          //                   carouselController: sliderController,
                          //                     items: [
                          //                       for (int i = 0;
                          //                        i < holidayPackageController.getPackageDetailsData.first.images.length;
                          //                        i++)
                          //                       Container(
                          //                         decoration:  BoxDecoration(
                          //                             image: DecorationImage(fit: BoxFit.fill,
                          //                                 image: NetworkImage(holidayPackageController.getPackageDetailsData.first.images[i]),
                          //                                 )),
                          //                       ),
                          //                       // Container(
                          //                       //   decoration: const BoxDecoration(
                          //                       //       image: DecorationImage(fit: BoxFit.fill,
                          //                       //           image: AssetImage(
                          //                       //               'assets/images/munnar2.jpg'))),
                          //                       // ),
                          //                       // Container(
                          //                       //   decoration: const BoxDecoration(
                          //                       //       image: DecorationImage(fit: BoxFit.fill,
                          //                       //           image: AssetImage(
                          //                       //               'assets/images/munnar3.jpg'))),
                          //                       // ),
                          //                     ],
                          //                     options: CarouselOptions(
                          //                       height: 170,
                          //                       onPageChanged: (index, reason) {
                          //                         setState(() {
                          //                           activeIndex = index;
                          //                         });
                          //                       },
                          //                       aspectRatio: 16 / 9,
                          //                       viewportFraction: 1,
                          //                       initialPage: 0,
                          //                       enableInfiniteScroll: true,
                          //                       reverse: false,
                          //                       autoPlay: true,
                          //                       autoPlayInterval:
                          //                           const Duration(seconds: 3),
                          //                       autoPlayAnimationDuration:
                          //                           const Duration(milliseconds: 800),
                          //                       autoPlayCurve: Curves.fastOutSlowIn,
                          //                       enlargeCenterPage: true,
                          //                       enlargeFactor: 0.3,
                          //                       scrollDirection: Axis.horizontal,
                          //                     )),
                          //                      Positioned(
                          //                       bottom: 10,
                          //                       left: 0,
                          //                       right: 0,
                          //                        child: Row(
                          //                          mainAxisAlignment: MainAxisAlignment.center,
                          //                            children: [
                          //                            AnimatedSmoothIndicator(
                          //                             activeIndex: activeIndex,
                          //                             count: holidayPackageController.getPackageDetailsData.length,
                          //                             effect: ScaleEffect(
                          //                         dotHeight: 9.0,
                          //                         dotWidth: 9.0,
                          //                         dotColor: kgrey,
                          //                         activeDotColor: Colors.white),
                          //                  ),
                          //            ],
                          //        ),
                          //   ),
                          //   ],
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Starting From ${widget.packageId} ${holidayPackageController.getPackageDetailsData.length.toString()}')
                                      .text
                                      .semiBold
                                      .blue900
                                      .make()
                                      .p2(),
                                  holidayPackageController.getPackageDetailsData.isEmpty? Text("") : (' ₹ ${holidayPackageController.getPackageDetailsData.first.amount}').text.bold.xl2.blue900.make()
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Per Person on twing Sharing')
                                      .text
                                      .semiBold
                                      .blue900
                                      .make()
                                      .p2(),
                                  InkWell(onTap: (){Get.to(EnquiryNowWidget());},
                                    child: Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: kblue,
                                          borderRadius: BorderRadius.circular(5)),
                                      child: Center(
                                          child: Text('''ENQUIRY NOW''')
                                              .text
                                              .white
                                              .make()),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                ksizedbox30,
                Obx(() => SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          kwidth10,
                          InkWell(
                              onTap: () {
                                holidayControllerss.reindex(0);
                                holidayControllerss.update();
                              },
                              child: Obxcontainers(
                                bordercolor: holidayControllerss.reindex.value == 0
                                    ? korange
                                    : kblue,
                                text: 'OVERVIEW',
                                color: holidayControllerss.reindex.value == 0
                                    ? korange
                                    : Colors.white,
                                textcolor: holidayControllerss.reindex.value == 0
                                    ? kwhite
                                    : kblue,
                              )),
                          kwidth10,
                          InkWell(
                              onTap: () {
                                holidayControllerss.reindex(1);
                                holidayControllerss.update();
                              },
                              child: Obxcontainers(
                                bordercolor: holidayControllerss.reindex.value == 1
                                    ? korange
                                    : kblue,
                                text: 'HOTEL DETAILS',
                                color: holidayControllerss.reindex.value == 1
                                    ? korange
                                    : Colors.white,
                                textcolor: holidayControllerss.reindex.value == 1
                                    ? kwhite
                                    : kblue,
                              )),
                          kwidth10,
                          InkWell(
                              onTap: () {
                                holidayControllerss.reindex(2);
                                holidayControllerss.update();
                              },
                              child: Obxcontainers(
                                bordercolor: holidayControllerss.reindex.value == 2
                                    ? korange
                                    : kblue,
                                text: 'DAY WISE ITINERARY',
                                color: holidayControllerss.reindex.value == 2
                                    ? korange
                                    : Colors.white,
                                textcolor: holidayControllerss.reindex.value == 2
                                    ? kwhite
                                    : kblue,
                              )),
                          kwidth10,
                          InkWell(
                              onTap: () {
                                holidayControllerss.reindex(3);
                                holidayControllerss.update();
                              },
                              child: Obxcontainers(
                                bordercolor: holidayControllerss.reindex.value == 3
                                    ? korange
                                    : kblue,
                                text: 'ADDITIONAL INFO',
                                color: holidayControllerss.reindex.value == 3
                                    ? korange
                                    : Colors.white,
                                textcolor: holidayControllerss.reindex.value == 3
                                    ? kwhite
                                    : kblue,
                              )),
                          kwidth10
                        ],
                      ),
                    )),ksizedbox30,
             Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      child: Column(
                        children: [
                          if (holidayControllerss.reindex.value == 0) OverviewWidget(),
                          if (holidayControllerss.reindex.value == 1) HotelDetails(),
                          if (holidayControllerss.reindex.value == 2) DayWiseItinerary(),
                          if (holidayControllerss.reindex.value == 3) AdditionalInfoWidget(),
                            
                    
                        ],
                      ),
                    ),
                  ),
                ), 
                 ],
            );
          }
        ),
      ),
    );
  }
}

class Obxcontainers extends StatelessWidget {
  const Obxcontainers({
    super.key,
    required this.text,
    required this.bordercolor,
    required this.color,
    required this.textcolor,
  });
  final String text;
  final Color bordercolor;
  final Color color;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
          border: Border.all(
            color: bordercolor,
            width: 1.0,
          ),
          color: color,
          borderRadius: BorderRadius.circular(9)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14, color: textcolor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
