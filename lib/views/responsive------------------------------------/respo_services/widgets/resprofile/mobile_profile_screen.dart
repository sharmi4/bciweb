import 'dart:io';

import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/controller/reg_home_controller.dart';
import 'package:bciweb/controller/reg_profile_controller.dart';
import 'package:bciweb/views/members/subscribe/views/subscribe.dart';
import 'package:bciweb/views/responsive------------------------------------/respo_services/widgets/resprofile/offers_screen.dart';
import 'package:bciweb/views/responsive------------------------------------/respo_services/widgets/resprofile/partner_screen.dart';
import 'package:bciweb/views/responsive------------------------------------/respo_services/widgets/resprofile/referal_screen.dart';
import 'package:bciweb/views/responsive------------------------------------/respo_services/widgets/resprofile/suport_screen.dart';
import 'package:bciweb/views/responsive------------------------------------/respo_services/widgets/resprofile/yours_coupons_screen.dart';
import 'package:bciweb/views/authentication/landing_screen.dart';
import 'package:bciweb/views/responsive------------------------------------/responsive_subscription/responsive_subscription.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

//import '../../../registerhomescreen/common_reg_appbar';
import '../../../../../controller/profile_show_controller.dart';
import '../../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../mobile_wdgets/comomappbar.dart';
import '../../../mobile_wdgets/mobile_common_bottom/bottom.dart';
import '../../respo_coupens.dart';
import 'additional_coupons_screen.dart';
import 'dasboard_screen.dart';
import 'myaccount_screen.dart';
import 'mysubscription_profile_screen.dart';

class MobileProfileScreen extends StatefulWidget {
  const MobileProfileScreen({super.key});

  @override
  State<MobileProfileScreen> createState() => _MobileProfileScreenState();
}

class _MobileProfileScreenState extends State<MobileProfileScreen> {
  final reghomeController = Get.find<RegisterProfileController>();
  final regshowController = Get.find<ProfileShowController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40,left: 20),
              child: GestureDetector(
                onTap: (){
                  Get.to(MyAccountScreen());
                },
                child: Row(
                 //ZZZZZZ mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/icons/myaccount.png"),
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'My Account',
                        style: TextStyle(color: kblue,
                        fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),  const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 20),
              child: GestureDetector(
                onTap: (){
                  Get.to(DasBoardScreen());
                },
                child: Row(
              
                  children: [
                    Image(
                    image: AssetImage("assets/icons/dashboard.png"),
                    width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Dashboard',
                        style: TextStyle(color: kblue, fontSize: 18,
                        fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),  const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 20),
              child: GestureDetector(
                onTap: (){
                  Get.to(MobileOffersScreen());
                },
                child: Row(
          
                  children: [
                    Image(
                    image: AssetImage("assets/icons/offers.png"),
                    width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Offers',
                        style: TextStyle(color: kblue, fontSize: 18,
                        fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
              const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 20),
              child: GestureDetector(
                onTap: (){
                  Get.to(YoursCouponsScreen());
                },
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                    image: AssetImage("assets/icons/coupans.png"),
                    width: 20,
                    ),
                          Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Text(
                       'Your Coupons',
                       style: TextStyle(color: kblue,
                       fontWeight: FontWeight.w500, fontSize: 18),
                     ),
                          ),
                  ],
                ),
              ),
            ),
              const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 20),
              child: GestureDetector(
                onTap: (){
                  Get.to(MySubscriptionMobileScreen());
                },
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                    image: AssetImage("assets/icons/subscrib.png"),
                    width: 20,
                    ),
                     Padding(
                       padding: const EdgeInsets.only(left: 10),
                       child: Text(
                         "My Subscription",
                         //'Additional Coupons',
                         style: TextStyle(color: kblue,
                         fontWeight: FontWeight.w500, fontSize: 18),
                       ),
                     ),
                  ],
                ),
              ),
            ),
              const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 20),
              child: GestureDetector(
                onTap: (){
                  Get.to(MobileReferalScreen());
                },
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                    image: AssetImage("assets/icons/refferels.png"),
                    width: 20,
                    ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Your Referrals',
                          style: TextStyle(color: kblue,
                          fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                  ],
                ),
              ),
            ),
              const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 20),
              child: GestureDetector(
                onTap: (){
                  Get.to(MobilePartnerScreen());
                },
                child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     Image(
                image: AssetImage("assets/icons/ourpartnericon.png"),
                width: 20,
                ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Our Partner',
                          style: TextStyle(color: kblue,
                          fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                    ]),
              ),
            ),
              const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,left: 20
              ),
              child: GestureDetector(
                onTap: (){
                  Get.to(Subscribe1());
                },
                child: Row(
                 //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/icons/upgradicon.png"),
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Upgrade',
                        style: TextStyle(color: kblue,
                        fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ),
              const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 20),
              child: GestureDetector(
                onTap: (){
                  Get.to(MobileSuportScreen());
                },
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/icons/supporticon.png"),
                      width: 20),
                     Padding(
                       padding: const EdgeInsets.only(left:10 ),
                       child: Text(
                         'Support',
                         style: TextStyle(color: kblue,
                         fontWeight: FontWeight.w500, fontSize: 18),
                       ),
                     ),
                  ],
                ),
              ),
            ),
              const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,
              left: 20),
              child: GestureDetector(
                onTap: (){
                   showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.white,
                        title: Column(
                          children: [
                            Image.asset('assets/images/logoutimage.png'),
                            Text("Comeback Soon!",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                        content:const Text(
                          "Are you sure want to logout?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      // ignore: unrelated_type_equality_checks
                                      color: kwhite),
                                  child: Center(
                                      child: Text("Cancel",
                                          style: TextStyle(
                                              color: kOrange))),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // authController.logoutindex(1);
                                  // authController.update();
                                  Get.find<AuthController>().logout();
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: kOrange,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ksizedbox10
                        ],
                      );
                    });
                },
                child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Image(
                image: AssetImage("assets/icons/logouticon.png"),
                width: 20,
                ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Logout',
                          style: TextStyle(color: kblue,
                          fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
        ksizedbox10,
        MobileCommonBottom()
      ]),
    );
  }
}
