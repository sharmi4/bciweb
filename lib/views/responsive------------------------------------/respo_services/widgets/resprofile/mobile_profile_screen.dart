import 'dart:io';

import 'package:bciweb/constant/constans.dart';
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
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 100)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                      ),
                      onPressed: () {
                        Get.offAll(const MyAccountScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.person,
                            size: 35,
                            color: kblue,
                          ),
                          Text(
                            'My Account',
                            style: TextStyle(color: kblue, fontSize: 16),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 95)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    onPressed: () {
                      Get.offAll(DasBoardScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/icons/profiledashboard.png',
                              height: 35,
                              fit: BoxFit.fitHeight,
                              color: kblue,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 11),
                              child: Text(
                                'Dashboard',
                                style: TextStyle(color: kblue, fontSize: 16),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 104)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    onPressed: () {
                      Get.offAll(MobileOffersScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/icons/profileoffers.png',
                            height: 35,
                            fit: BoxFit.fitHeight,
                            color: kblue,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 11),
                            child: Text(
                              'Offers',
                              style: TextStyle(color: kblue, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 70)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    onPressed: () {
                      Get.offAll(RespoCoupones()
                          //YoursCouponsScreen()
                          );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: Image.asset(
                              'assets/icons/profilecuopons.png',
                              height: 25,
                              fit: BoxFit.fitHeight,
                              color: kblue,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 11),
                            child: Text(
                              'Your Coupons',
                              style: TextStyle(color: kblue, fontSize: 16),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 35)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    onPressed: () {
                      Get.offAll(MySubscriptionMobileScreen());
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 64),
                            child: Image.asset(
                              'assets/icons/proaditionaloffer.png',
                              height: 35,
                              fit: BoxFit.fitHeight,
                              color: kblue,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 11),
                            child: Text(
                              "My Subscription",
                              //'Additional Coupons',
                              style: TextStyle(color: kblue, fontSize: 16),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 80)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.offAll(MobileReferalScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Image.asset(
                            'assets/icons/profilerefferal.png',
                            height: 30,
                            fit: BoxFit.fitHeight,
                            color: kblue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            'Your Referrals',
                            style: TextStyle(color: kblue, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 91)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    onPressed: () {
                      Get.offAll(MobilePartnerScreen());
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 12),
                            child: Image.asset(
                              'assets/icons/profilepartner.png',
                              height: 25,
                              fit: BoxFit.fitHeight,
                              color: kblue,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Text(
                              'Our Partner',
                              style: TextStyle(color: kblue, fontSize: 16),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 100)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                      ),
                      onPressed: () {Get.to(Subscribe1());},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Image.asset(
                              'assets/icons/profileupgrade.png',
                              height: 32,
                              fit: BoxFit.fitHeight,
                              color: kblue,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              'Upgrade',
                              style: TextStyle(color: kblue, fontSize: 16),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 100)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    onPressed: () {
                      Get.offAll(MobileSuportScreen());
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(
                              'assets/icons/profilesubort.png',
                              height: 35,
                              fit: BoxFit.fitHeight,
                              color: kblue,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text(
                              'Support',
                              style: TextStyle(color: kblue, fontSize: 16),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 100)),
                    ),
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Image.asset(
                              'assets/icons/profilelogout.png',
                              height: 28,
                              fit: BoxFit.fitHeight,
                              color: kblue,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text(
                              'Logout',
                              style: TextStyle(color: kblue, fontSize: 16),
                            ),
                          ),
                        ]),
                  ),
                ],
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
