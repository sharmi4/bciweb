
import 'package:bciweb/controller/subscription_controller/subscription_controller.dart';
import 'package:bciweb/views/members/services/views/coupons.dart';
import 'package:clipboard/clipboard.dart';

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
    final size = MediaQuery.of(context).size;
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
                                  fontSize: 17,
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
                        Get.find<SubscriptionApiController>().merchantCoupon();
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
                                  fontSize: 17,
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
                        // Get.find<SubscriptionApiController>().get
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
                                  fontSize: 17,
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
                  width: size.width*0.8,
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
                      : GridView.builder(
                  shrinkWrap: true,
                  itemCount: couponController.categorycouponsData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: size.width*0.5,
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
                                  onTap: () {
                                    Get.to(() => Coupones()
                                        );
                                  },
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: kyellow,
                                      borderRadius: BorderRadius.circular(4),
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
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    ),
                ),
                );
              }),

              if(couponController.couponindex.value==1)
              Container(
                child: Column(
                  children: [
                    GetBuilder<SubscriptionApiController>(builder: (_) {
        return Container(
          //height: size.height * 0.55,
          child: couponController.merchantCouponData.isEmpty
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
                        'No Coupon Available',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: kblue),
                      )
                    ],
                  ),
                )
              : GridView.builder(
                  shrinkWrap: true,
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5
                    ),
                  itemCount: couponController.merchantCouponData.length,
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
                                          .merchantCouponData[index].image ==
                                      "null"
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/icons/coupon.jpg",
                                        height: 120,
                                        width: size.width,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        image: NetworkImage(couponController
                                            .merchantCouponData[index].image),
                                        height: 120,
                                        width: size.width,
                                        fit: BoxFit.fill,
                                      )),
                              const SizedBox(
                                height: 7,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  couponController.merchantCouponData[index].title,
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
                                  couponController.merchantCouponData[index].description,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: kgrey),
                                ),
                              ),
                              // Text(
                              //   profileController.couponsData[index].,
                              //   style: TextStyle(
                              //       fontSize: 20,
                              //       fontWeight: FontWeight.bold,
                              //       color: kblue),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kyellow,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Coupon Code: ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: kblue),
                                            ),
                                            Text(
                                              couponController
                                                  .merchantCouponData[index]
                                                  .couponCode,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: kwhite),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: (){
                                            FlutterClipboard.copy(
                                                    couponController.merchantCouponData[index].couponCode.toString())
                                                .then(
                                              (value) => Fluttertoast.showToast(
                                                  msg: "Copy to clipboard",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.white,
                                                  textColor: Colors.black,
                                                  fontSize: 16.0),
                                              //print("code copied")
                                            );
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: kblue,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Copy",
                                                style: primaryFont.copyWith(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
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
                ),
              ),
              if(couponController.couponindex.value==2)
              Container(
                child: Column(
                  children: [
               GetBuilder<SubscriptionApiController>(builder: (_) {
        return Container(
          //height: size.height * 0.55,
          child: couponController.redeemcouponsData.isEmpty
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
                        'No Coupon Available',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: kblue),
                      )
                    ],
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: couponController.redeemcouponsData.length,
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
                                          .redeemcouponsData[index].image ==
                                      "null"
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/icons/coupon.jpg",
                                        height: 120,
                                        width: size.width,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        image: NetworkImage(couponController
                                            .redeemcouponsData[index].image),
                                        height: 120,
                                        width: size.width,
                                        fit: BoxFit.fill,
                                      )),
                              const SizedBox(
                                height: 7,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  couponController.redeemcouponsData[index]
                                          .coupon.name ??
                                      "",
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
                                  couponController.redeemcouponsData[index]
                                      .coupon.description,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: kgrey),
                                ),
                              ),
                              // Text(
                              //   profileController.couponsData[index].,
                              //   style: TextStyle(
                              //       fontSize: 20,
                              //       fontWeight: FontWeight.bold,
                              //       color: kblue),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kyellow,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Coupon Code: ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: kblue),
                                            ),
                                            Text(
                                              couponController
                                                  .redeemcouponsData[index]
                                                  .couponcode,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: kwhite),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Redeemed",
                                              style: primaryFont.copyWith(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
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
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
