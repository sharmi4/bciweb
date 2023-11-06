import 'package:bciweb/controller/subscription_controller/subscription_controller.dart';
import 'package:clipboard/clipboard.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../constant/constans.dart';
import '../../controller/service_controller/home_controller.dart';
import 'dart:math'as math;
class ProfileCouponsScreen extends StatefulWidget {
  const ProfileCouponsScreen({super.key});

  @override
  State<ProfileCouponsScreen> createState() => _ProfileCouponsScreenState();
}

class _ProfileCouponsScreenState extends State<ProfileCouponsScreen> {
   final couponController=Get.find<SubscriptionApiController>();
   @override
  void initState() {
    super.initState();
    couponController.getcouponsList();
  }
  @override
  Widget build(BuildContext context) {
    return    Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: MediaQuery.of(context).size.width - 195,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: [
                            Text('Member Coupons',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: kblue)),
                          ],
                        ),
                      ),
                     GetBuilder<SubscriptionApiController>(builder: (_) {
        return Container(
         // height: size.height * 0.55,
          child: couponController.couponsdatalist.isEmpty
              ?  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[ 
                    Image.asset('assets/images/couponnotavailaimage.png',
                    height: 180,
                    fit: BoxFit.fitHeight,),
                  ksizedbox20,
                  Text('No Coupon Available',
                  style: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),)
              
                  ]),
              )
              : ListView.builder(
                shrinkWrap: true,
                  itemCount: couponController.couponsdatalist.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: CouponCard(
                        shadow:const Shadow(),
                        height: 150,
                        backgroundColor: Colors.white,
                        curveAxis: Axis.vertical,
                        firstChild: Container(
                          decoration: BoxDecoration(
                              color: Color((math.Random().nextDouble() *
                                          0xFFFFFF)
                                      .toInt())
                                  .withOpacity(1.0)),
                          child:couponController.couponsdatalist[index].image == "null" ? 
                          Image.asset("assets/icons/coupon.jpg",fit: BoxFit.cover,) :
                           Image.network(
                            couponController.couponsdatalist[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        secondChild: Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                couponController
                                    .couponsdatalist[index].name ?? "Coupon Code:",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                                         ),
                              Text(
                                "Coupon code: ${couponController
                                    .couponsdatalist[index].couponcode}",
                                style: primaryFont.copyWith(
                                    fontSize: 14,
                                    color: Color(
                                            (math.Random().nextDouble() *
                                                    0xFFFFFF)
                                                .toInt())
                                        .withOpacity(1.0),
                                    fontWeight: FontWeight.w500),
                              ),
                              InkWell(
                                onTap: () {
                                  FlutterClipboard.copy(couponController
                                          .couponsdatalist[index].couponcode)
                                      .then(
                                    (value) => Fluttertoast.showToast(
                                        msg: "Copy to clipboard",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.white,
                                        textColor: Colors.black,
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
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      }),
                    ],
                  ),
                ),
              );
  }
}