import 'package:bciweb/views/business-------------------------------------/business_home_screen.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/home_respo/busimess_home_respo.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_body/mobile_home.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_body/mobile_homescreen.dart';
import 'package:bciweb/views/members/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MobileHomeScreenMembers extends StatefulWidget {
  const MobileHomeScreenMembers({super.key});

  @override
  State<MobileHomeScreenMembers> createState() =>
      _MobileHomeScreenMembersState();
}

class _MobileHomeScreenMembersState extends State<MobileHomeScreenMembers> {
  @override
  Widget build(BuildContext context) {
    //  final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ResponsiveLayout(
          mobilebody: MobileHome(), desktopbody: MemberHomeScreen()),
    );
  }
}

class MobileHomeScreenbusiness extends StatelessWidget {
  const MobileHomeScreenbusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
          mobilebody: BusinesHomeRespo(), desktopbody: BusinessHomeScreen()),
    );
  }
}

class CommonScreenRedirection extends StatefulWidget {
  const CommonScreenRedirection({super.key});

  @override
  State<CommonScreenRedirection> createState() =>
      _CommonScreenRedirectionState();
}

class _CommonScreenRedirectionState extends State<CommonScreenRedirection> {
  int roleIndex = 0;

  @override
  void initState() {
    super.initState();

    checkForAuth();
  }

  checkForAuth() async {
    final prefs = await SharedPreferences.getInstance();
    String? role = prefs.getString("role");

    if (role != null && role == "5") {
      print(
          '----------------------------print-on-business${role}-----------------------------');
      setState(() {
        roleIndex = 1;
      });
    } else if (role != null && role == "3") {
      print(
          '----------------------------print on member${role}-----------------------------');
      setState(() {
        roleIndex = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: roleIndex == 1
          ? MobileHomeScreenbusiness()
          : roleIndex == 2
              ? MobileHomeScreenMembers()
              : Center(
                  child: MobileHomeScreenMembers(),
                ),
    );
  }
}
