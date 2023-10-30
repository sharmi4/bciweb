import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/drawer_business.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RespoBusinessCouponredemption extends StatefulWidget {
  const RespoBusinessCouponredemption({super.key});

  @override
  State<RespoBusinessCouponredemption> createState() => _RespoBusinessCouponredemptionState();
}

class _RespoBusinessCouponredemptionState extends State<RespoBusinessCouponredemption> {

  var couponController = TextEditingController();

  final authController = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.redeemptionCoupon();
  }




  @override
  Widget build(BuildContext context) {
    var  _mediaQuery=MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarMob(),
        preferredSize: Size(double.infinity, 40),
      ),
      drawer: DrawerBusiness(),


      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'VIEW HISTORY',
                  style: TextStyle(
                      fontSize: 20, color: kblue, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          ksizedbox20,
          GetBuilder<AuthController>(builder: (_) {
            return Container(
              height: _mediaQuery.height * 0.70,
              child: authController.couponRedeemptionData.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/Voucher.png",height: _mediaQuery.height*0.4,),
                          ksizedbox20,
                          Text(
                            'No Coupons History',
                            style: TextStyle(
                                fontSize: 22,
                                color: kblue,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: authController.couponRedeemptionData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: CouponCard(
                            shadow: const Shadow(),
                            height: 150,
                            backgroundColor: Colors.white,
                            curveAxis: Axis.vertical,
                            firstChild: Container(
                              decoration: const BoxDecoration(
                                  // color: Color((math.Random().nextDouble() *
                                  //             0xFFFFFF)
                                  //         .toInt())
                                  //  .withOpacity(1.0)
                                  ),
                              child:
                                  authController.couponRedeemptionData.isEmpty
                                      ? Container()
                                      : Image.network(
                                          authController
                                              .couponRedeemptionData[index]
                                              .image,
                                          fit: BoxFit.cover,
                                        ),
                            ),
                            secondChild: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Coupon Code :",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  authController
                                      .couponRedeemptionData[index].couponcode,
                                  style: primaryFont.copyWith(
                                      fontSize: 14,
                                      // color: Color(
                                      //         (math.Random().nextDouble() *
                                      //                 0xFFFFFF)
                                      //             .toInt())
                                      //     .withOpacity(1.0),
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  height: 25,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Redeemed",
                                        style: primaryFont.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            );
          }),
        ],
      ),
    );
  }
}
