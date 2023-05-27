
import 'package:bciweb/responsive/mobile_body/mobile_home.dart';
import 'package:bciweb/responsive/mobile_body/mobile_homescreen.dart';
import 'package:flutter/material.dart';

import '../../views/members/home_screen.dart';
import '../respo_services/respo_service.dart';
import '../specialized/respo_specialized.dart';


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
          mobilebody: RespoSpecialized(),
          desktopbody: BusinessHomeScreen()),
    );
  }
}