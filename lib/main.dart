import 'package:bciweb/controller/home_controller.dart';
import 'package:bciweb/views/members/home_screen.dart';
import 'package:bciweb/views/members/homescreens/specialized_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(HomeController());
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BusinessHomeScreen(),
      // routes: {
      //   SpecializedScreen.Namedroutes:(context) => SpecializedScreen() 
      // }
    );
  }
}

