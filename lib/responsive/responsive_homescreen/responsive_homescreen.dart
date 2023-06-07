import 'package:bciweb/responsive/mobile_body/mobile_home.dart';
import 'package:bciweb/responsive/mobile_body/mobile_homescreen.dart';
import 'package:flutter/material.dart';

import '../../views/business/bookins/hotels/resort.dart';


class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  @override
  Widget build(BuildContext context) {
  //  final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ResponsiveLayout(
          mobilebody: MobileHome(), desktopbody: ResortBooking()),
    );
  }
}
