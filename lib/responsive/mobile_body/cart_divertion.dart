//MobileCommonBottom() 
import 'package:bciweb/responsive/mobile_body/mobile_home.dart';
import 'package:bciweb/responsive/mobile_body/mobile_homescreen.dart';
import 'package:bciweb/views/members/home_screen.dart';
import 'package:flutter/material.dart';

import '../../views/business/services/views/servicescart/servicescart.dart';
import '../respo_services/cart_screen.dart';

class MobilecartDivertion extends StatefulWidget {
  const MobilecartDivertion ({super.key});

  @override
  State<MobilecartDivertion > createState() => _MobilecartDivertionState();
}

class _MobilecartDivertionState extends State<MobilecartDivertion > {
  @override
  Widget build(BuildContext context) {
    //  final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ResponsiveLayout(
          mobilebody: CartScreen(), desktopbody: ServicesCart()),
    );
  }
}
