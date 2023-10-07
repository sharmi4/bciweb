import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constans.dart';
import '../../../controller/business_controller/business_service_controller.dart';
import '../../../registerhomescreen/business_comm_homecontainer.dart';
import '../../members/common_widget/business_common_screen.dart';

class BusinessLastCouponAddedScreen extends StatefulWidget {
  const BusinessLastCouponAddedScreen({super.key});

  @override
  State<BusinessLastCouponAddedScreen> createState() => _BusinessLastCouponAddedScreenState();
}

class _BusinessLastCouponAddedScreenState extends State<BusinessLastCouponAddedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    businessserviceController.addedCouponsList();
  }

  var businessserviceController = Get.find<BusinessServiceController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BusinessCommonScreen(),
              BusinessCommonhomeContainer(),
            ],
          ),
          preferredSize: const Size(double.infinity, 110)),
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView(
              children: [
                
                    GetBuilder<BusinessServiceController>(builder: (_) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: businessserviceController.addedCouponList.isEmpty
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
                    : GridView.builder(
                        itemCount: businessserviceController.addedCouponList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(15),
                            child: CouponCard(
                              shadow: const Shadow(),
                              height: 150,
                              width: 250,
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
                                        businessserviceController
                                            .addedCouponList[index].image,
                                            fit: BoxFit.cover,
                                
                                      ),
                              ),
                              secondChild: Padding(
                                padding: const EdgeInsets.only(left: 70),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text(
                                      businessserviceController
                                          .addedCouponList[index].title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Coupon Amount : ₹${businessserviceController.addedCouponList[index].couponAmount}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Start At : ${formatDate(businessserviceController.addedCouponList[index].startsAt, [
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
                                      "End At : ${formatDate(businessserviceController.addedCouponList[index].endsAt,[dd,"-",mm,"-",yyyy])}",
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
                        }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3.5),
                      ),
              );
            }),
                
              ],
            ),
          ),
    );
  }
}