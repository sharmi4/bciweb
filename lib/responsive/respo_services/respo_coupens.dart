import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:bciweb/registerhomescreen/common_reg_homescreen.dart';
import 'package:bciweb/responsive/mobile_wdgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/constans.dart';
import '../mobile_wdgets/comomappbar.dart';
import '../mobile_wdgets/mobile_common_bottom/bottom.dart';
//import '../../../members/common_widget/common.dart';
//import '../../../../registerhomescreen/common_reg_appbar';

class RespoCoupones extends StatelessWidget {
  const RespoCoupones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(),
          preferredSize: Size(double.infinity, 40)),
          drawer: MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
      
            Container(
              child: Stack(
                children: [
                  Image.asset('assets/images/Group 39745.png'),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'COUPONS US',
                        style: GoogleFonts.lato(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: kwhite),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ksizedbox20,
            Text(
              'ALL COUPONS AVAILABLE',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff003366),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset('assets/images/Scroll Group 7.png'),
            ),
            ksizedbox40,
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.arrow_back,size: 16,
                      color: kwhite,
                    ),
                    Text(
                      'BACK',
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
                height: 45,
                width: 150,
                decoration: BoxDecoration(
                    color: kOrange, borderRadius: BorderRadius.circular(15)),
              ),
            ),
            ksizedbox30,
     //      RegisterCommonBottom()
       MobileCommonBottom()   ],
        ),
      ),
    );
  }
}
