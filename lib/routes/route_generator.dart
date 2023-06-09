import 'package:bciweb/responsive/authentications/generate_otp/generate_otp.dart';
import 'package:bciweb/routes/app_pages.dart';
import 'package:flutter/material.dart';

import '../splash_screen/Splash_screen.dart';
import '../views/authentication/generate_otp_screen.dart';
import '../views/authentication/landing_screen.dart';
import '../views/business/Gallery/gallery.dart';
import '../views/business/Gallery/gallery.dart';
import '../views/business/bookins/history/views/history.dart';
import '../views/business/services/views/servicescart/service_list.dart';
import '../views/business/services/views/servicescart/services.dart';
import '../views/business/subscribe/views/subscribe.dart';
import '../views/clubhouse.dart';
import '../views/members/about/about_screens.dart';
import '../views/members/contacs/contact_screen.dart';
import '../views/members/home_screen.dart';
import '../views/specialized/specialized_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SPLASH:
        return _GeneratePageRoute(widget: splash(), routeName: settings.name);

      case Routes.MEMBHOME:
        return _GeneratePageRoute(
            widget: MemberHomeScreen(), routeName: settings.name);

      case Routes.landing_screen:
        return _GeneratePageRoute(
            widget: LandingScreen(), routeName: settings.name);

      case Routes.about_screens:
        return _GeneratePageRoute(
            widget: AboutUsScreen(), routeName: settings.name);

      case Routes.Service:
        return _GeneratePageRoute(widget: Services(), routeName: settings.name);

      case Routes.SpecializedScreen:
        return _GeneratePageRoute(
            widget: SpecializedScreen(), routeName: settings.name);

      case Routes.contact_screen:
        return _GeneratePageRoute(
            widget: ContactScreen(), routeName: settings.name);

      case Routes.Subscrib:
        return _GeneratePageRoute(
            widget: Subscribe(), routeName: settings.name);

      case Routes.BOOKINGS:
        return _GeneratePageRoute(widget: History(), routeName: settings.name);

      case Routes.MobileVerification:
        return _GeneratePageRoute(
            widget: MobileVerification(), routeName: settings.name);

      case Routes.ClubHouse:
        return _GeneratePageRoute(
            widget: ClubHouse(), routeName: settings.name);

      case Routes.History:
        return _GeneratePageRoute(widget: History(), routeName: settings.name);

     case Routes.MobLogin:
       return _GeneratePageRoute(widget: MemberLoginScreenrespo(), routeName: settings.name);

      case Routes.Gallery:
        return _GeneratePageRoute(widget: Gallery(), routeName: settings.name);

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

      default:
        return _GeneratePageRoute(widget: splash(), routeName: settings.name);
    }
  }
} // Navigator.pushNamed(context, RoutesName.name);

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
