// import 'dart:html';
import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/controller/flaight_payment_controller.dart';
import 'package:bciweb/controller/holiday_package_controller.dart';
import 'package:bciweb/controller/holiday_controller.dart';
import 'package:bciweb/controller/home_controller.dart';
import 'package:bciweb/controller/redeem_controller/redeem_controller.dart';
import 'package:bciweb/controller/profile_show_controller.dart';
import 'package:bciweb/controller/reg_home_controller.dart';
import 'package:bciweb/controller/reg_profile_controller.dart';
import 'package:bciweb/controller/seat_controller.dart';
import 'package:bciweb/controller/subscribe_controllers.dart';
// import 'package:bciweb/registerhomescreen/common_reg_homescreen.dart';

import 'package:bciweb/responsive/holiday/controllers/holidaycontroller.dart';
import 'package:bciweb/responsive/res_controller/yours_coupon_controller.dart';
import 'package:bciweb/routes/app_pages.dart';

import 'package:bciweb/routes/route_generator.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'package:bciweb/views/business/home_screen.dart';

import 'package:url_strategy/url_strategy.dart';
// import 'package:bciweb/views/business/subscribe/views/payment.dart';
// import 'package:bciweb/views/business/subscribe/views/subscribe.dart';

import 'controller/api_flightcontroller/api_flight_Controller.dart';
import 'controller/bus_controllers.dart';
import 'controller/flaibooking_option.dart';
import 'controller/flaight _controller.dart';
import 'controller/flaight_booking_controller.dart';
import 'controller/flaight_show_controller.dart';
import 'controller/flaightdate_controller.dart';

import 'controller/historycontroller.dart';
import 'controller/hotel_controller/hotel_controller.dart';
import 'controller/profile_controller.dart';

import 'controller/setting_controller/setting_controller.dart';
import 'controller/specialized_controller.dart';
import 'controller/service_controller/home_controller.dart';
import 'controller/subscription_controller/subscription_controller.dart';

// import 'responsive/responsive_homescreen/responsive_homescreen.dart';/
// MobileHomeScreen()
// MobileHome()
//  MemberHomeScreen()
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  Get.put(RedeemController());
  Get.put(HomeServiceController());
  Get.put(HomeController());
  Get.put(SubscribeController());
  Get.put(RegisterHomeController());
  Get.put(RegisterProfileController());
  Get.put(ProfileShowController());
  Get.put(BookingHistoryController());
  Get.put(SpecializedController());
  Get.put(YourCouponController());
  Get.put(ProfileController());
  Get.put(FlaightController());
  Get.put(Flaight2Controller());
  Get.put(Flaight3Controller());
  Get.put(FlaightShowController());
  Get.put(FlaightDateSCotroller());
  Get.put(FlaightBookingOptionController());
  Get.put(SeatController());
  Get.put(PaymentController());
  Get.put(AuthController());
  Get.put(AuthProfileController());
  Get.put(SubscriptionApiController());
  Get.put(FlaightBookingController());
  Get.put(HolidayController());
  Get.put(Holiday2Controller());
  Get.put(Holiday3Controller());
  Get.put(HolidayyController());
  Get.put(ApiflightsController());
  Get.put(HolidayPackageController());
  Get.put(BusController());
  Get.put(ApiSettingController());
  Get.put(HotelController());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> secondFocusMarkerKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: secondFocusMarkerKey,
      debugShowCheckedModeBanner: false,
      title: "BCI Member",
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Routes.MobLogin,
    );
  }
}
