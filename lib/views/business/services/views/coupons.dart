import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:bciweb/registerhomescreen/common_reg_homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/constans.dart';
import '../../../members/common_widget/common.dart';
//import '../../../../registerhomescreen/common_reg_appbar';

class Coupones extends StatelessWidget {
  const Coupones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(),
          preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterCommonContainer(),
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
                        style: displayfont
                        //GoogleFonts.lato(
                          //  fontSize: 80,
                            //fontWeight: FontWeight.bold,
                            //color: kwhite),
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
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  height: 500,
                  child: Image.asset('assets/images/Scroll Group 7.png')),
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
                      Icons.arrow_back,
                      color: kwhite,
                    ),
                    Text(
                      'BACK',
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 19,
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
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}
