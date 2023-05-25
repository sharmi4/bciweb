import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:bciweb/views/business/services/views/widgets/containors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constant/constans.dart';
import '../../../../registerhomescreen/common_reg_appbar';
import '../../../../registerhomescreen/common_reg_homescreen.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

CarouselController curouselController = CarouselController();

class _ServicesState extends State<Services> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: RegisterCommonAppbar(),
          preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterCommonContainer(),
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
                        'SERVICES US',
                        style: GoogleFonts.lato(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: kwhite),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ksizedbox20,
            Text(
              'SPECIAL COUPONS',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff003366),
                  fontSize: 70,
                  fontWeight: FontWeight.bold),
            ),
            ksizedbox10,
            Container(
              height: 10,
              width: 100,
              color: korange,
            ),
            ksizedbox10,
            Container(
                width: 800,
                child: Text(
                  'Special coupons are promotional discounts offered by businesses to encourage customers to make a purchase or use their services. These coupons may be available in various forms such as printed coupons, digital coupons, or promo codes.',
                  style: TextStyle(color: ktextblue),
                )),
            ksizedbox20,
            Column(
              children: [
                CarouselSlider(
                  carouselController: curouselController,
                  items: [
                    InkWell(
                      child: servicecontainer(),
                      onTap: () {
                        Get.toNamed('/coupones');
                      },
                    ),
                    InkWell(
                      child: servicecontainer(),
                      onTap: () {
                        Get.toNamed('/coupones');
                      },
                    ),
                    InkWell(
                      child: servicecontainer(),
                      onTap: () {
                        Get.toNamed('/coupones');
                      },
                    ),
                  ],
                  options: CarouselOptions(
                    height: 150.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 3200),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        pageIndex = index;
                      });
                    },
                  ),
                ),
                ksizedbox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSmoothIndicator(
                      activeIndex: pageIndex,
                      count: 3,
                      effect: ScaleEffect(
                          dotHeight: 9.0,
                          dotWidth: 9.0,
                          dotColor: kgrey,
                          activeDotColor: Colors.yellow),
                    ),
                  ],
                ),
              ],
            ),
            ksizedbox30,
            InkWell(
              onTap: () {
                Get.toNamed('/coupones');
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0XFFE4E4E6),
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                    child: Text(
                  'More Coupons',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: ktextblue),
                )),
                height: 30,
                width: 180,
              ),
            ),
            ksizedbox30,
            Image.asset('assets/images/Group 38585.png'),
            ksizedbox30,
            Text(
              'SPECIAL Offers',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff003366),
                  fontSize: 70,
                  fontWeight: FontWeight.bold),
            ),
            ksizedbox10,
            Container(
              height: 20,
              width: 100,
              color: korange,
            ),
            ksizedbox10,
            Container(
                width: 800,
                child: Text(
                  'Special coupons are promotional discounts offered by businesses to encourage customers to make a purchase or use their services. These coupons may be available in various forms such as printed coupons, digital coupons, or promo codes.',
                  style: TextStyle(color: ktextblue),
                )),
            ksizedbox40,
            ksizedbox30,
            Column(
              children: [
                CarouselSlider(
                  carouselController: curouselController,
                  items: [
                    InkWell(
                      child: offercontainer(),
                      onTap: () {
                        Get.toNamed('/offer-screen');
                      },
                    ),
                    InkWell(
                      child: offercontainer(),
                      onTap: () {
                        Get.toNamed('/offer-screen');
                      },
                    ),
                    InkWell(
                      child: offercontainer(),
                      onTap: () {
                        Get.toNamed('/offer-screen');
                      },
                    ),
                  ],
                  options: CarouselOptions(
                    height: 170.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 3200),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        pageIndex = index;
                      });
                    },
                  ),
                ),
                ksizedbox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSmoothIndicator(
                      activeIndex: pageIndex,
                      count: 3,
                      effect: ScaleEffect(
                          dotHeight: 9.0,
                          dotWidth: 9.0,
                          dotColor: kgrey,
                          activeDotColor: Colors.yellow),
                    ),
                  ],
                ),
              ],
            ),
            //  offercontainer(),
            ksizedbox30,
            InkWell(
              onTap: () {
                Get.toNamed('/offer-screen');
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0XFFE4E4E6),
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                    child: Text(
                  'More Offers',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: ktextblue),
                )),
                height: 30,
                width: 180,
              ),
            ),
            ksizedbox40,
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}
