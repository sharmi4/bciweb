import 'package:bciweb/responsive/booking_view/flight/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import '../../../constant/constans.dart';
import '../../../controller/business_controller/business_service_controller.dart';
import '../../../registerhomescreen/business_comm_homecontainer.dart';
import '../../members/common_widget/business_common_screen.dart';

class BusinessCouponRedementionScreen extends StatefulWidget {
  const BusinessCouponRedementionScreen({super.key});

  @override
  State<BusinessCouponRedementionScreen> createState() => _BusinessCouponRedementionScreenState();
}

class _BusinessCouponRedementionScreenState extends State<BusinessCouponRedementionScreen> {
    
   var servicecouponredeemtionController =Get.find<BusinessServiceController>(); 
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    servicecouponredeemtionController.redeemptionCoupon();
  }
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
          body: ListView(children: [
            Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                       Container(
                        height: 205,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset('assets/images/couponredemtionbackgroundimage.png',fit: BoxFit.cover)),
                    Positioned(
                      top: 0,
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Center(
                        child: Text('SERVICES', style: displayfont),
                      ),
                    )
                    ],
                  ),
                ),
               Stack(
                children: [
                    Container(
                  height: 240,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/images/bservicehomebackground.png',
                  fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  
                  children: [
                    Text('Coupon Redemtion',
                    style: TextStyle(
                      color: kblue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),),
                    Container(
                        height: 9,
                        width: 60,
                        color: kOrange,
                      ),

                      Text('When the customer recive a coupon,they can redeem it by presenting \nat the point purchase the coupon may provide a specific discount such \na presentange of purchase price or dollor amount discount',
                       style: TextStyle(
                        fontSize: 18,
                        height: 1.5
                      
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(left: 150),
                        child: Row(
                          children: [
                            Text('List of coupons',
                            style: TextStyle(
                              fontSize: 30,
                              color: kblue,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      )
                  ],
                ))
                ],
               ),
                ksizedbox20,
          GetBuilder<BusinessServiceController>(builder: (_) {
            return Container(
              //height: _mediaQuery.height * 0.70,
              child: servicecouponredeemtionController.couponRedeemptionData.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/Voucher.png",
                          //height: _mediaQuery.height*0.4,
                          ),
                          ksizedbox30,
                          Text(
                            'No Coupons History',
                            style: TextStyle(
                                fontSize: 20,
                                color: kblue,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: servicecouponredeemtionController.couponRedeemptionData.length,
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
                                  servicecouponredeemtionController.couponRedeemptionData.isEmpty
                                      ? Container()
                                      : Image.network(
                                          servicecouponredeemtionController
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
                                  servicecouponredeemtionController
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
            )
          ]),
    );
  }
}