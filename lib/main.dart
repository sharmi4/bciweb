import 'dart:html';

import 'package:bciweb/controller/home_controller.dart';
import 'package:bciweb/controller/profile_show_controller.dart';
import 'package:bciweb/controller/reg_home_controller.dart';
import 'package:bciweb/controller/reg_profile_controller.dart';
import 'package:bciweb/controller/subscribe_controllers.dart';
import 'package:bciweb/registerhomescreen/common_reg_homescreen.dart';
import 'package:bciweb/views/business/bookins/history/views/history.dart';
import 'package:bciweb/views/business/services/views/offerce.dart';
import 'package:bciweb/views/members/home_screen.dart';
import 'package:bciweb/views/members/homescreens/reg_profile.dart';
import 'package:bciweb/views/register_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bciweb/views/authentication/Verification_done.dart';
import 'package:bciweb/views/authentication/landing_screen.dart';
import 'package:bciweb/views/authentication/mobile_verification.dart';
import 'package:bciweb/views/authentication/office_address.dart';
import 'package:bciweb/views/authentication/otp_verification.dart';
import 'package:bciweb/views/authentication/residential_Address.dart';
import 'package:bciweb/views/authentication/signup.dart';
//import 'package:bciweb/views/business/home_screen.dart';
import 'package:bciweb/views/business/services/views/coupons.dart';
import 'package:bciweb/views/business/services/views/services.dart';
import 'package:bciweb/views/business/subscribe/views/add_wallet.dart';
import 'package:bciweb/views/business/subscribe/views/payment.dart';
import 'package:bciweb/views/business/subscribe/views/subscribe.dart';

import 'controller/historycontroller.dart';
import 'responsive/responsive_homescreen/responsive_homescreen.dart';

void main() {
  Get.put(HomeController());
  Get.put(SubscribeController());
  Get.put(RegisterHomeController());
  Get.put(RegisterProfileController());
  Get.put(ProfileShowController());
  Get.put(BookingHistoryController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //  home: BusinessHomeScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        // GetPage(name: '/', page: () => RegisterProfileScreen()),
        GetPage(name: '/landing-screen', page: () => LandingScreen()),
        GetPage(name: '/otp-verification', page: () => MobileVerification()),
        GetPage(name: '/final-otp-verification', page: () => OtpVerification()),
        GetPage(name: '/verification-done', page: () => Verification_Done()),
        GetPage(name: '/office-addreass', page: () => OfficeAddress()),
        GetPage(name: '/signin', page: () => signUp()),
        GetPage(name: '/residential-address', page: () => ResidentialAddress()),
        GetPage(name: '/subscribe', page: () => Subscribe()),
        // GetPage(name: '/payment', page: () => Payment(
        //  image: "assets/images/Group 38637.png",
        //  )),
        GetPage(name: '/add-wallet', page: () => AddWallet()),
        GetPage(name: '/services', page: () => Services()),
        GetPage(name: '/coupones', page: () => Coupones()),
        GetPage(name: '/reghome', page: () => BusinessRegisterHomeScreen()),
        GetPage(name: '/offer-screen', page: () => OfferScreen()),
        GetPage(name: '/history-screen', page: () => History()),
      ],
    );
  }
}
