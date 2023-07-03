import 'dart:math';

import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:bciweb/registerhomescreen/common_reg_homescreen.dart';
import 'package:bciweb/responsive/mobile_wdgets/drawer.dart';
import 'package:clipboard/clipboard.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/constans.dart';
import '../../controller/subscription_controller/subscription_controller.dart';
import '../mobile_wdgets/comomappbar.dart';
import '../mobile_wdgets/mobile_common_bottom/bottom.dart';
//import '../../../members/common_widget/common.dart';
//import '../../../../registerhomescreen/common_reg_appbar';

class RespoCoupones extends StatefulWidget {
  const RespoCoupones({super.key});

  @override
  State<RespoCoupones> createState() => _RespoCouponesState();
}

class _RespoCouponesState extends State<RespoCoupones> {
   
   final subscripeController=Get.find<SubscriptionApiController>();
    @override
  void initState() {
    super.initState();
    subscripeController.getcouponsList(); 
  }
  List colors = [const Color(0xffFCE2E2),const Color(0xffE4E4E4),
  const Color(0xffF8AC61),const Color(0xff8DC6FF),
   const Color(0xffEDD076), const Color(0xff90E79C), 
   const Color(0xff00D8E0), const Color(0xff396DB4), const Color(0xffD9908A),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      drawer: MobileDrawer(),
      body: SingleChildScrollView(
        child: GetBuilder<SubscriptionApiController>(
          builder: (_){
          return Column(
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
                          'COUPONS',
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
                child: Container(
                  
                  width: 1000,
               child: GridView.builder(
                shrinkWrap: true,
                itemCount: subscripeController.couponsdatalist.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 7,
                crossAxisCount: 1), 
                itemBuilder:(context,index){
                  return Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: ClipPath(
                                clipper: TicketPassClipper(),
                                child: Container(
                                    height: 90,
                                    decoration: BoxDecoration(
                                        color: colors[Random().nextInt(9)],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  width:200,
                                                  child: Text(
                                                    subscripeController.couponsdatalist
                                                        [index].name
                                                        .toString(),
                                                    maxLines: 2,
                                                    style: primaryFont.copyWith(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                         if(subscripeController.couponsdatalist[index].isRedeemed == "1")     Container(
                                                height: 30,
                                                width: 85,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(255, 75, 133, 76),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Redeemed",
                                                  style: primaryFont.copyWith(
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 0),
                                          child: CustomPaint(
                                              size: const Size(1, double.infinity),
                                              painter: DashedLineVerticalPainter()),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8,top: 3,bottom: 3),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                "Coupon Code :",
                                                style: primaryFont.copyWith(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                              Text(
                                                 subscripeController.couponsdatalist[index]
                                                    .couponcode,
                                                style: primaryFont.copyWith(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(255, 235, 145, 10),
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  FlutterClipboard.copy(
                                                          subscripeController.couponsdatalist[index]
                                                              .couponcode)
                                                      .then(
                                                    (value) =>
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "Copy to clipboard",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity: ToastGravity
                                                                .CENTER,
                                                            timeInSecForIosWeb: 1,
                                                            backgroundColor:
                                                                Colors.white,
                                                            textColor:
                                                                Colors.black,
                                                            fontSize: 16.0),
                                                    //print("code copied")
                                                  );
                                                },
                                                child: Container(
                                                  height: 25,
                                                  width: 90,
                                                  decoration: BoxDecoration(
                                                      color: kblue,
                                                      borderRadius:
                                                          BorderRadius.circular(4)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "Copy",
                                                        style: primaryFont.copyWith(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      const Icon(
                                                        Icons.copy,
                                                        color: Colors.white,
                                                        size: 15,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            );
                }),
              
                ),
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
                        size: 16,
                        color: kwhite,
                      ),
                      Text(
                        'BACK',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 16,
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
              MobileCommonBottom()
            ],
          );
          }
        ),
      ),
    );
  }
}
class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = Color.fromARGB(255, 233, 230, 230)
      ..strokeWidth = size.width;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
