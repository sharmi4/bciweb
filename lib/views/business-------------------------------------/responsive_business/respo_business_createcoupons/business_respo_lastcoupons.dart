
import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/controller/business_controller/business_service_controller.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/drawer_business.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:clipboard/clipboard.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CouponsListView extends StatefulWidget {
  const CouponsListView({super.key});

  @override
  State<CouponsListView> createState() => _CouponsListViewState();
}

class _CouponsListViewState extends State<CouponsListView> {
  var couponController = TextEditingController();

  final authController = Get.find<AuthController>();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    businessserviceController.addedCouponsList();
  }

  var businessserviceController = Get.find<BusinessServiceController>();
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarMob(),
        preferredSize: Size(double.infinity, 40),
      ),
      drawer: DrawerBusiness(),
      body: Column(
        children: [
          ksizedbox20,
          GetBuilder<AuthController>(builder: (_) {
            return Container(
              height: _mediaQuery.height * 0.70,
              child: authController.addedCouponList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Container(
                              height: 200,
                              child: Image.asset("assets/images/Voucher.png",
                              fit: BoxFit.cover,)),
                          ksizedbox20,
                          Text(
                            'No Coupons Available',
                            style: TextStyle(
                                fontSize: 16,
                                color: kblue,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: authController.addedCouponList.length,
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
                              child: Image.network(
                                      authController
                                          .addedCouponList[index].image,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            secondChild: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(
                                    authController
                                        .addedCouponList[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Coupon Amount : ₹${authController.addedCouponList[index].couponAmount}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Start At : ${formatDate(authController.addedCouponList[index].startsAt, [
                                          dd,
                                          "-",
                                          mm,
                                          "-",
                                          yyyy
                                        ])}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                    fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "End At : ${formatDate(authController.addedCouponList[index].endsAt,[dd,"-",mm,"-",yyyy])}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  // Container(
                                  //   height: 25,
                                  //   width: 120,
                                  //   decoration: BoxDecoration(
                                  //       color: Colors.green,
                                  //       borderRadius: BorderRadius.circular(4)),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                  //     children: [
                                  //       Text(
                                  //         "Redeemed",
                                  //         style: primaryFont.copyWith(
                                  //             color: Colors.white,
                                  //             fontWeight: FontWeight.w500),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
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
    );
  }
}
