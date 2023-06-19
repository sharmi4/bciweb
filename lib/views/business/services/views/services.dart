import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:bciweb/views/business/bookins/history/views/widgets/widgetsdemo.dart';
import 'package:bciweb/views/business/services/views/widgets/containors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constant/constans.dart';
//import '../../../../registerhomescreen/common_reg_appbar';
import '../../../../controller/auth_controller/auth_controller.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../../services/networks/services/service_list_apiservice.dart';
import '../../../members/common_widget/common.dart';
import 'offerce.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

CarouselController curouselController = CarouselController();

class _ServicesState extends State<Services> {

@override
void initState() {
  super.initState();
  authController.getservice();
}
  int pageIndex = 0;

  final authController=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
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
                      child: Text('SERVICE', style: displayfont),
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
            GetBuilder<AuthController>(
              
              builder: (_){
              print(authController.dataList);
        return  Column(
                children: [
                  CarouselSlider(
                    
                    carouselController: curouselController,
                    items: [
            
              
                  for( var i=0;i<authController.dataList.length;i++)  
                    InkWell(
                      
                        child: servicecontainer(
                          
                          image: authController.dataList[i].image,
                        
                          title: authController.dataList[i].title,
                          description: authController.dataList[i].description,
                        ),
                        
                        onTap: () {
                          Get.toNamed('/coupones');
                        },
                      ),
                      // InkWell(
                      //   child: servicecontainer(),
                      //   onTap: () {
                      //     Get.toNamed('/coupones');
                      //   },
                      // ),
                      // InkWell(
                      //   child: servicecontainer(),
                      //   onTap: () {
                      //     Get.toNamed('/coupones');
                      //   },
                      // ),
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
              );
              }
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
            Stack(children: [
              Image.asset('assets/images/homebackground6.png'),
              Padding(
                padding: const EdgeInsets.only(top: 150, right: 260),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'More Available Offers',
                          style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: kblue),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kblue,
                                  minimumSize: Size(200, 45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {},
                              child: Text(
                                'Click Now',
                                style: TextStyle(fontSize: 20),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
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
            GetBuilder<AuthController>(
   builder: (_){
              return Column(
                children: [
                  
                  CarouselSlider(
                    carouselController: curouselController,
                    
                    items: [
                      for(var j=0 ; j< authController.dataList.length;j++)
                      InkWell(
                        child: offers_container(
                          image: authController.dataList[j].image,
                          description: authController.dataList[j].description,
                        ),
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
              );
   }
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
