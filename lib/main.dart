// import 'dart:html';
import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/controller/flaight_payment_controller.dart';
import 'package:bciweb/controller/home_controller.dart';
import 'package:bciweb/controller/profile_show_controller.dart';
import 'package:bciweb/controller/reg_home_controller.dart';
import 'package:bciweb/controller/reg_profile_controller.dart';
import 'package:bciweb/controller/seat_controller.dart';
import 'package:bciweb/controller/subscribe_controllers.dart';
// import 'package:bciweb/registerhomescreen/common_reg_homescreen.dart';
import 'package:bciweb/responsive/authentications/contact%20us/respo_contact.dart';
import 'package:bciweb/responsive/res_controller/yours_coupon_controller.dart';
import 'package:bciweb/responsive/respo%20gallery/respo_gallery.dart';
import 'package:bciweb/responsive/respo_services/respo_coupens.dart';
import 'package:bciweb/responsive/respo_services/respo_offers.dart';
import 'package:bciweb/responsive/respo_services/widgets/resprofile/mobile_profile_screen.dart';
import 'package:bciweb/responsive/responsive_homescreen/responsive_homescreen.dart';
import 'package:bciweb/responsive/specialized/respo_specialized.dart';
import 'package:bciweb/routes/app_pages.dart';
import 'package:bciweb/routes/route_generator.dart';
import 'package:bciweb/splash_screen/Splash_screen.dart';
import 'package:bciweb/views/business/bookins/flight/options_booking.dart';
import 'package:bciweb/views/business/bookins/flight/payment_screen.dart';
import 'package:bciweb/views/business/bookins/history/views/history.dart';
import 'package:bciweb/views/business/services/views/offerce.dart';
import 'package:bciweb/views/business/subscribe/views/subscribe.dart';
import 'package:bciweb/views/members/home_screen.dart';
import 'package:bciweb/views/members/homescreens/reg_profile.dart';
import 'package:bciweb/views/register_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bciweb/views/authentication/Verification_done.dart';
import 'package:bciweb/views/authentication/landing_screen.dart';
import 'package:bciweb/views/authentication/generate_otp_screen.dart';
import 'package:bciweb/views/authentication/office_address.dart';
import 'package:bciweb/views/authentication/otp_verification.dart';
import 'package:bciweb/views/authentication/residential_Address.dart';
import 'package:bciweb/views/authentication/signup.dart';
//import 'package:bciweb/views/business/home_screen.dart';
import 'package:bciweb/views/business/services/views/coupons.dart';
import 'package:bciweb/views/business/services/views/servicescart/services.dart';
import 'package:bciweb/views/business/subscribe/views/add_wallet.dart';
import 'package:url_strategy/url_strategy.dart';
// import 'package:bciweb/views/business/subscribe/views/payment.dart';
// import 'package:bciweb/views/business/subscribe/views/subscribe.dart';

import 'controller/flaibooking_option.dart';
import 'controller/flaight _controller.dart';
import 'controller/flaight_show_controller.dart';
import 'controller/flaightdate_controller.dart';
import 'controller/historycontroller.dart';
import 'controller/profile_controller.dart';
import 'controller/specialized_controller.dart';
import 'controller/subscription_controller/home_controller.dart';
import 'controller/subscription_controller/subscription_controller.dart';
// import 'responsive/responsive_homescreen/responsive_homescreen.dart';/
// MobileHomeScreen()
// MobileHome()
//  MemberHomeScreen()
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
//   initialRoute: TRoutes.HOME_PAGE,
      initialRoute: Routes.SPLASH,
      // initialRoute: '/',
      // getPages: [
      //     GetPage(name: '/', page: () => splash()),
      //   GetPage(name: '/', page: () => MobileHomeScreen()),
      //   GetPage(name: '/', page: () => MemberHomeScreen()),
      //   GetPage(name: '/', page: () => RegisterProfileScreen()),
      //   GetPage(name: '/landing-screen', page: () => LandingScreen()),
      //   GetPage(name: '/otp-verification', page: () => MobileVerification()),
      //   GetPage(name: '/final-otp-verification', page: () => OtpVerification(otp: '', phoneNumber: '',)),
      //   GetPage(name: '/verification-done', page: () => Verification_Done()),
      //   GetPage(name: '/office-addreass', page: () => OfficeAddress()),
      //   GetPage(name: '/signin', page: () => SignUpView()),
      //   GetPage(name: '/residential-address', page: () => ResidentialAddress( )),
      //    GetPage(name: '/subscribe', page: () => Subscribe()),
      //   // GetPage(name: '/payment', page: () => Payment(
      //   //  image: "assets/images/Group 38637.png",
      //   //  )),
      //   GetPage(name: '/add-wallet', page: () => AddWallet()),
        // GetPage(name: '/services', page: () => Services()),
      //   GetPage(name: '/coupones', page: () => Coupones()),
      //   GetPage(name: '/reghome', page: () => BusinessRegisterHomeScreen()),
      //   GetPage(name: '/offer-screen', page: () => OfferScreen()),
      //   GetPage(name: '/respo-coupon', page: () => RespoCoupones()),
      //   GetPage(name: '/respo-offer', page: () => RespOffer()),
      //   GetPage(name: '/respo-contact', page: () => RespoContact()),
      //   GetPage(name: '/respo-specialised', page: () => RespoSpecialized()),
      //   GetPage(name: '/respo-gallery', page: () => RespoGallery()),
      //   GetPage(name: '/history-screen', page: () => History()),
      //   GetPage(name: '/respo-gallery', page: () => RespoGallery()),
      //   GetPage(name: '/reg-profile', page: () => RegisterProfileScreen()),
      //   GetPage(name: '/respo-profile', page: () => MobileProfileScreen()),
      //   GetPage(name: '/booking_option', page: ()=>BookingOptionsScreen()),
      //   GetPage(name: '/payment-screen', page: ()=>FlaightPaymentScreen())
      //   //  GetPage(name: '/history-screen', page: () => History()),
      // ],
    );
  }
}
