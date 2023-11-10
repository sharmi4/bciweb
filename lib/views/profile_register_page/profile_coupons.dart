import 'package:bciweb/controller/subscription_controller/subscription_controller.dart';
import 'package:clipboard/clipboard.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../constant/constans.dart';
import 'dart:math' as math;

class ProfileCouponsScreen extends StatefulWidget {
  const ProfileCouponsScreen({super.key});

  @override
  State<ProfileCouponsScreen> createState() => _ProfileCouponsScreenState();
}

class _ProfileCouponsScreenState extends State<ProfileCouponsScreen> {
  final couponController = Get.find<SubscriptionApiController>();
  @override
  void initState() {
    super.initState();
    couponController.getcouponsList();
    couponController.getCoupons();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        width: MediaQuery.of(context).size.width - 195,
        child: GetBuilder<SubscriptionApiController>(builder: (_) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    kwidth10,
                    InkWell(
                      onTap: () {
                        setState(() {
                          couponController.couponindex(0);
                          couponController.update();
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Center(
                          child: Text('Your Coupons',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: kwhite)),
                        ),
                        decoration: BoxDecoration(
                            color: couponController.couponindex == 0
                                ? kyellow
                                : korange,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    kwidth10,
                    InkWell(
                      onTap: () {
                        setState(() {
                          couponController.couponindex(1);
                          couponController.update();
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Center(
                          child: Text('Merchent Coupons',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: kwhite)),
                        ),
                        decoration: BoxDecoration(
                            color: couponController.couponindex == 1
                                ? kyellow
                                : korange,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    kwidth10,
                    InkWell(
                      onTap: () {
                        setState(() {
                          couponController.couponindex(2);
                          couponController.update();
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Center(
                          child: Text('Redeemed Coupons',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: kwhite)),
                        ),
                        decoration: BoxDecoration(
                            color: couponController.couponindex == 2
                                ? kyellow
                                : korange,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ],
                ),
              ),ksizedbox40,

  if( couponController.couponindex==0)
                         
                        
                       


              GetBuilder<SubscriptionApiController>(builder: (_) {
                return Container(
                  // height: size.height * 0.55,
                  child: couponController.couponsdatalist.isEmpty
                      ? Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/couponnotavailaimage.png',
                                  height: 180,
                                  fit: BoxFit.fitHeight,
                                ),
                                ksizedbox20,
                                Text(
                                  'No Coupon Availablee',
                                  style: TextStyle(
                                      color: kblue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ]),
                        )
                      : ListView.builder(
                  shrinkWrap: true,
                  itemCount: couponController.categorycouponsData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: kgrey.withOpacity(0.6),
                                ),
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              couponController
                                          .categorycouponsData[index].image ==
                                      "null"
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/icons/coupon.jpg",
                                        height: 120,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        image: NetworkImage(couponController
                                            .categorycouponsData[index].image),
                                        height: 120,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      )),
                              const SizedBox(
                                height: 7,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  couponController
                                      .categorycouponsData[index].name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  couponController
                                      .categorycouponsData[index].description,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: kgrey),
                                ),
                              ),
                              // Text(
                              //   couponController.couponsData[index].,
                              //   style: TextStyle(
                              //       fontSize: 20,
                              //       fontWeight: FontWeight.bold,
                              //       color: kblue),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  // onTap: () {
                                  //   Get.to(() => CouponsListScreen(
                                  //         category: couponController
                                  //             .categorycouponsData[index].name,
                                  //       ));
                                  // },
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: kyellow,
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "View Coupons",
                                        style: primaryFont.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                ),
                );
              }),
            ],
          );
        }),
      ),
    );
  }
}
