import 'package:bciweb/registerhomescreen/hidden_content_view.dart';
import 'package:bciweb/views/business/business_contact_screen.dart';
import 'package:bciweb/views/business/business_gallery_screen.dart';
import 'package:bciweb/views/business/business_profile/business_gallery.dart';
import 'package:bciweb/views/members/bookins/bus/Bus_booking_main.dart';
import 'package:bciweb/views/members/bookins/flight/booking_flight.dart';
import 'package:bciweb/views/members/bookins/hotels/booking_hotels.dart';
import 'package:bciweb/views/members/bookins/trip/trip_booking.dart';
import 'package:bciweb/views/responsive------------------------------------/authentications/generate_otp/generate_otp.dart';
import 'package:bciweb/views/responsive------------------------------------/responsive_homescreen/responsive_homescreen.dart';
import 'package:bciweb/routes/app_pages.dart';
import 'package:flutter/material.dart';

import '../registerhomescreen/privacy_policy.dart';
import '../splash_screen/Splash_screen.dart';
import '../views/authentication/business_authentication/business_generate_otp_screen.dart';
import '../views/authentication/generate_otp_screen.dart';
import '../views/authentication/landing_screen.dart';
import '../views/business-------------------------------------/business_home_screen.dart';
import '../views/business/business_about_screen.dart';
import '../views/business/business_booking_details_screen.dart';
import '../views/business/business_booking_screen.dart';
import '../views/business/business_clubhouse_screen.dart';
import '../views/business/business_speclized/business_speclized_screen.dart';
import '../views/business/services_screens/businees_lastoffers_screen.dart';
import '../views/business/services_screens/business_add_availability_screen.dart';
import '../views/business/services_screens/business_availability_screen.dart';
import '../views/business/services_screens/business_offers_screen.dart';
import '../views/business/services_screens/coupon_redemtion_screen.dart';
import '../views/business/services_screens/create_coupons_screen.dart';
import '../views/business/services_screens/lastcoupon_add_screen.dart';
import '../views/business/services_screens/services_homescreen.dart';
import '../views/business/services_screens/services_homescreen.dart';
import '../views/business/business_wallet_screen.dart';
import '../views/members/Gallery/gallery.dart';

import '../views/members/bookins/history/views/history.dart';

import '../views/members/services/views/servicescart/services.dart';
import '../views/members/subscribe/views/subscribe.dart';
import '../views/clubhouse.dart';
import '../views/members/about/about_screens.dart';
import '../views/members/contacs/contact_screen.dart';
import '../views/members/home_screen.dart';
import '../views/members/specialized/specialized_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.Cancelation:
        return _GeneratePageRoute(
            widget: Canslation(), routeName: settings.name);

      case Routes.SPLASH:
        return _GeneratePageRoute(
            widget: CommonScreenRedirection(), routeName: settings.name);

      case Routes.MEMBHOME:
        return _GeneratePageRoute(
            widget: MemberHomeScreen(), routeName: settings.name);

       case Routes.BCIContents:
        return _GeneratePageRoute(
            widget: HiddenContentView(), routeName: settings.name);
      
      case Routes.LANDINGSCREEN:
        return _GeneratePageRoute(
            widget: LandingScreen(), routeName: settings.name);

       case Routes.FLIGHTBOOKING:
        return _GeneratePageRoute(
            widget: BookingFlight(), routeName: settings.name);
      
       case Routes.HOTELBOOKING:
        return _GeneratePageRoute(
            widget: BookingHotels(), routeName: settings.name);

       case Routes.BUSBOOKING:
        return _GeneratePageRoute(
            widget: BusBookingMain(), routeName: settings.name);

      case Routes.HOLIDAYBOOKING:
        return _GeneratePageRoute(
            widget: BookingTrip(), routeName: settings.name);
      
      case Routes.HISTORY:
        return _GeneratePageRoute(
            widget: History(), routeName: settings.name);

      case Routes.LOGIN:
        return _GeneratePageRoute(
            widget: MobileVerification(), routeName: settings.name);

       case Routes.LOGINBUSINESS:
        return _GeneratePageRoute(
            widget: BusinessMobileVerification(), routeName: settings.name);
      

       case Routes.BusinessHome:
         return _GeneratePageRoute(
            widget:BusinessHomeScreen (), routeName: settings.name);

            case Routes.BusinessMobileVerification:
            return _GeneratePageRoute(
              widget: BusinessMobileVerification(), routeName: settings.name);
            
            case Routes.BUSINESSSERVICE:
            return _GeneratePageRoute(widget:BusinessServicesScreen() , routeName:settings.name);

            case Routes.BusinessLastCouponAddedScreen:
            return _GeneratePageRoute(widget: BusinessLastCouponAddedScreen(), routeName: settings.name);

            case Routes.BUSINESSCOUPONREDEMTIONSCREEN:
            return _GeneratePageRoute(widget: BusinessCouponRedementionScreen(), routeName: settings.name);

            case Routes.BusinessBookingScreen:
            return _GeneratePageRoute(widget: BusinessBookingScreen(), routeName: settings.name);

          

            case Routes.BUSINESSCREATECOUPONS:
            return _GeneratePageRoute(widget: BusinessCreateCouponsScreen(), routeName:settings.name);
            
            case Routes.BusinessOffersScreen:
            return _GeneratePageRoute(widget: BusinessOffersScreen(), routeName: settings.name);

            case Routes.BusinessLastOffersScreen:
            return _GeneratePageRoute(widget: BusinessLastOffersScreen(), routeName: settings.name);

            case Routes.BusinessAvailabilityScreen:
            return _GeneratePageRoute(widget: BusinessAvailabilityScreen(), routeName: settings.name);

            case Routes.BusinessAddAvailabilityScreen:
            return _GeneratePageRoute(widget: BusinessAddAvailabilityScreen(), routeName: settings.name);
            
            case Routes.BusinessWalletScreen:
            return _GeneratePageRoute(widget: BusinessWalletScreen(), routeName: settings.name);

      case Routes.about_screens:
        return _GeneratePageRoute(
            widget: AboutUsScreen(), routeName: settings.name);

      case Routes.Service:
        return _GeneratePageRoute(widget: Services(), routeName: settings.name);

        case Routes.BusinessAddGallery:
        return _GeneratePageRoute(widget: BusinessAddGallery(userid: '',), routeName:settings.name);

        case Routes.BusinessSpecializedScreen:
        return _GeneratePageRoute(widget: BusinessSpecializedScreen(), routeName: settings.name);

        case Routes.BusinessClubHouse:
        return _GeneratePageRoute(widget: BusinessClubHouse(), routeName:settings.name);

        case Routes.BusinessHomeScreen:
        return _GeneratePageRoute(widget: BusinessHomeScreen(), routeName: settings.name);

        case Routes.BusinessAboutUsScreen:
        return _GeneratePageRoute(widget: BusinessAboutUsScreen(),
         routeName: settings.name);

         case Routes.BusinessGallery:
         return _GeneratePageRoute(widget: BusinessGallery(), 
         routeName: settings.name);

      case Routes.SpecializedScreen:
        return _GeneratePageRoute(
            widget: SpecializedScreen(), routeName: settings.name);

      case Routes.contact_screen:
        return _GeneratePageRoute(
            widget: ContactScreen(), routeName: settings.name);

      case Routes.BusinessContactScreen:
      return _GeneratePageRoute(widget: BusinessContactScreen(), routeName: settings.name);      

      case Routes.Subscrib:
        return _GeneratePageRoute(
            widget: Subscribe(), routeName: settings.name);

      case Routes.BOOKINGS:
        return _GeneratePageRoute(widget: BookingFlight(), routeName: settings.name);

      case Routes.MobileVerification:
        return _GeneratePageRoute(
            widget: MobileVerification(), routeName: settings.name);

      case Routes.ClubHouse:
        return _GeneratePageRoute(
            widget: ClubHouse(), routeName: settings.name);

      case Routes.MobLogin:
        return _GeneratePageRoute(
            widget: MemberLoginScreenrespo(), routeName: settings.name);

      case Routes.Gallery:
        return _GeneratePageRoute(widget: Gallery(), routeName: settings.name);

      default:
        return _GeneratePageRoute(
            widget: const CommonScreenRedirection(), routeName: settings.name);
    }
  }
} // Navigator.pushNamed(context, RoutesName.name);

//       case Routes.OTP_VIEWS:
//         return _GeneratePageRoute(
//             widget: OTPVIEWS(
//               phoneNumber: "",
//               otp: "",
//             ),
//             routeName: settings.name);

//       case Routes.SIGN_IN:
//         return _GeneratePageRoute(
//             widget: const HomeView(), routeName: settings.name);

//       case Routes.RESP:
//         return _GeneratePageRoute(widget: HomeView(), routeName: settings.name);

//       case Routes.REGISTER_VIEWS:
//         return _GeneratePageRoute(
//             widget: const RegisterViews(), routeName: settings.name);

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String? routeName;
  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                key: UniqueKey(),
                opacity: Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(animation),
                child: child,
              );
            });
}
