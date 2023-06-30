import 'dart:math';

import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:bciweb/registerhomescreen/common_reg_homescreen.dart';
import 'package:clipboard/clipboard.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/constans.dart';
import '../../../../controller/subscription_controller/subscription_controller.dart';
import '../../../members/common_widget/common.dart';
//import '../../../../registerhomescreen/common_reg_appbar';

class Coupones extends StatefulWidget {
  const Coupones({super.key});

  @override
  State<Coupones> createState() => _CouponesState();
}

class _CouponesState extends State<Coupones> {
  final subscripeController=Get.find<SubscriptionApiController>();
  @override
  void initState() {
    super.initState();
    subscripeController.getcouponsList();
  }
   List colors = [const Color(0xffFCE2E2),const Color(0xffE4E4E4),
  const Color(0xffF8AC61),const Color(0xff8DC6FF),
   const Color(0xffEDD076), const Color(0xfff06292), 
   const Color(0xFFFFF59D), const Color(0xff396DB4), const Color(0xFFFFCDD2),
  ];
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(),
          preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(

        child: GetBuilder<SubscriptionApiController>(
          builder: (_) {
          return Column(
            children: [
              RegisterCommonContainer(),
              ksizedbox30,
              Container(
                
                width: 1000,
             child: subscripeController.couponsdatalist.isEmpty?Center(
              child: Text('No Coupons AVailable'),
             ):
                GridView.builder(
                shrinkWrap: true,
                itemCount: subscripeController.couponsdatalist.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 7,
                crossAxisCount: 2), 
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
                                          padding: const EdgeInsets.only(left: 65),
                                          child: CustomPaint(
                                              size: const Size(1, double.infinity),
                                              painter: DashedLineVerticalPainter()),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 45),
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
              ksizedbox30,
              RegisterCommonBottom()
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
