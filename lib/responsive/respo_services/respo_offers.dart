import 'package:bciweb/responsive/mobile_wdgets/comomappbar.dart';
import 'package:bciweb/responsive/respo_services/widgets/offerccontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/constans.dart';
//import '../../../../registerhomescreen/common_reg_appbar';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../mobile_wdgets/drawer.dart';
import '../mobile_wdgets/mobile_common_bottom/bottom.dart';
//import '../../../members/common_widget/common.dart';

class RespOffer extends StatelessWidget {
  const RespOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(),
          preferredSize: Size(double.infinity, 40)),
          drawer:    MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
          
            Container(
              child: Stack(
                children: [
                  Image.asset('assets/images/offer.png'),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'OFFERS US',
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
              'All Offers Available',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff003366),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            ksizedbox40,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Respooffers_container(),
                        //    Respooffers_container(),
                    ksizedbox30,
                        //  ksizedbox40,
                    Respooffers_container(),
                        //      Respooffers_container(),
                    ksizedbox30,
                     //     ksizedbox40,
                    Respooffers_container(),
                      //  Respooffers_container(),
                    ksizedbox30,
                       //   ksizedbox40,
                    //Respooffers_container(),
                     Respooffers_container(),
                  ],
                ),
              ),
            ),
            ksizedbox30,
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
                      Icons.arrow_back,size: 18,
                      color: kwhite,
                    ),
                    Text(
                      'BACK',
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 15,
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
            ksizedbox40,
         //   RegisterCommonBottom()
      MobileCommonBottom()    ],
        ),
      ),
    );
  }
}


