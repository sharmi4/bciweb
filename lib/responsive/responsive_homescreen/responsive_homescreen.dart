import 'package:bciweb/responsive/mobile_body/mobile_home.dart';
import 'package:bciweb/responsive/mobile_body/mobile_homescreen.dart';
import 'package:flutter/material.dart';

//import '../../views/authentication/bookins/liquer/Liquer_booking.dart';
import '../../views/business/bookins/hotels/booking_hotels.dart';
import '../../views/business/bookins/liquer/Liquer_booking.dart';
import '../../views/business/bookins/trip/trip_booking.dart';
import '../../views/members/home_screen.dart';
import '../../views/specialized/club.dart';
import '../../views/specialized/explor.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ResponsiveLayout(
          mobilebody: MobileHome(), desktopbody: SpecializedClub ()),
    );
  }
}
