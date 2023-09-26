import 'package:bciweb/responsive/responsive_homescreen/responsive_homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/image.dart';




class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    checkForAuth();
  }

  // toHomePage() async {
  //   await Future.delayed(const Duration(seconds: 2));

  //   Get.offAll(
  //     () => HomeBottomnavigationBar(),
  //   );
  // }

  toHomePageMember() async {
    print("---------------------->> fro splash");
    await Future.delayed(const Duration(seconds: 2));

    Get.offAll(
      () =>MobileHomeScreen(),
    );
  }

  // toLoginPage() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Get.offAll(
  //     () => MobileVerification(),
  //   );
  // }

  checkForAuth() async {
    final prefs = await SharedPreferences.getInstance();
    String? authtoken = prefs.getString("auth_token");
    String? role = prefs.getString("role");
    print("Token is here");
    print(authtoken);
    if (authtoken == "null" || authtoken == null) {
      toHomePageMember();
    } else {
      toHomePageMember();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(splashImage),
      ),
    );
  }
}
