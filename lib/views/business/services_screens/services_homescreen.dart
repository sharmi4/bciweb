import 'package:bciweb/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';

import '../../../constant/constans.dart';
import '../../../controller/business_controller/business_service_controller.dart';
import '../../../registerhomescreen/business_comm_homecontainer.dart';
import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../members/common_widget/business_common_screen.dart';
import 'package:dotted_line/dotted_line.dart';

import 'coupon_redemtion_screen.dart';

class BusinessServicesScreen extends StatefulWidget {
  const BusinessServicesScreen({super.key});

  @override
  State<BusinessServicesScreen> createState() => _BusinessServicesScreenState();
}

class _BusinessServicesScreenState extends State<BusinessServicesScreen> {
  bool containerindex =false;
  bool containerindex2 =false;
  bool containerindex3 =false;
  bool containerindex4 =false;
  var busiserviceController =Get.find<BusinessServiceController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BusinessCommonScreen(),
              BusinessCommonhomeContainer(),
            ],
          ),
          preferredSize: const Size(double.infinity, 110)),
          body: Obx(()=>
           ListView(
                  children: [
            Column(
              children: [
                  Container(
                child: Stack(
                  children: [
                    Image.asset('assets/images/Group 39744.png',),
                    Positioned(
                      top: 0,
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Center(
                        child: Text('SERVICES', style: displayfont),
                      ),
                    )
                  ],
                ),
              ),
              ksizedbox10,
                Container(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    
                    children: [
                      Text('AVAILABLE SERVICES',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kblue
                      ),),
                    
                      Container(
                        height: 9,
                        width: 60,
                        color: kOrange,
                      ),
                      Text('I can help you research market trends,complittors,customer behaviour,and other relevant\n business information.Vendors Can put Offers&Discount on the Website,Showing vendors \nslide for our member to view offers and available form the some Vendors',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5
                      
                      ),)
                
                    ],
                  ),
                ),
              
                  Stack(
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/images/bservicehomebackground.png',
                  fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 50,
                  child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                       busiserviceController.Containerindex(0);
                       busiserviceController.update();
                      Get.to(BusinessCouponRedementionScreen());
                        
                      },
                      child: Container(
                        height: 130,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color:busiserviceController.Containerindex==0?kOrange:kblue
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Coupon\nRedemption',
                            style: TextStyle(
                              fontSize: 17,
                              color: kwhite
                            ),)
                          ],
                        ),
                      ),
                    ),
                     Dash(
                      direction: Axis.vertical,
                      length: 125,
                      dashLength: 10,
                      dashColor: kgrey),
              
                     GestureDetector(
                      onTap: (){
                       busiserviceController.Containerindex(1);
                       busiserviceController.update();
                       Get.toNamed(Routes.BUSINESSCREATECOUPONS);
                        
                      },
                      child: Container(
                        height: 130,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          color:busiserviceController.Containerindex==1?korange:kblue
                        ),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Create Coupons',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: kwhite
                                ),),
                          ],
                        ),
                      ),
                    ),
                      Dash(
                      direction: Axis.vertical,
                      length: 125,
                      dashLength: 10,
                      dashColor: kgrey),
                    GestureDetector(
                      onTap: (){
                       
                        busiserviceController.Containerindex(2);
                        busiserviceController.update();
                        Get.toNamed(Routes.BusinessOffersScreen);
                      },
                      child: Container(
                        height: 130,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          color:busiserviceController.Containerindex==2?kOrange:kblue
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Text('Offers',
                            style: TextStyle(
                              fontSize: 17,
                              color: kwhite
                            ),)
                        ]),
                      ),
                    ),
                      Dash(
                      direction: Axis.vertical,
                      length: 125,
                      dashLength: 10,
                      dashColor: kgrey),
                    GestureDetector(
                      onTap: (){
                      busiserviceController.Containerindex(3);
                        busiserviceController.update();
                        Get.toNamed(Routes.BusinessAvailabilityScreen);
                      },
                      child: Container(
                        height: 130,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          color:busiserviceController.Containerindex==3?kOrange:kblue
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text('Availability',
                            style: TextStyle(
                              fontSize: 17,
                              color: kwhite
                            ),)
                          ],
                        ),
                      ),
                    ),
                
                  ],
                )
                ),
               
               
              ],
            ),
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
                          'Paid Ads Avalibales',
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
               ksizedbox40,
            RegisterCommonBottom()
              ],
            ),
            ksizedbox40
                  ],
            ),
          ),
    );
  }
  
}