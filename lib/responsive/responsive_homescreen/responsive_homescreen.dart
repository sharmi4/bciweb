
import 'package:bciweb/responsive/mobile_body/mobile_home.dart';
import 'package:bciweb/responsive/mobile_body/mobile_homescreen.dart';
import 'package:flutter/material.dart';

import '../../views/members/home_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ResponsiveLayout(
          mobilebody: MobileHome(),
          desktopbody: BusinessHomeScreen()),
    );
  }
}