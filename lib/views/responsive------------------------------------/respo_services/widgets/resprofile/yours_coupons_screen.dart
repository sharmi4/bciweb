import 'package:bciweb/controller/subscription_controller/subscription_controller.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/drawer.dart';
import 'package:clipboard/clipboard.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:math'as math;
import '../../../../../constant/constans.dart';
import '../../../mobile_wdgets/comomappbar.dart';
import '../../../res_controller/yours_coupon_controller.dart';

class YoursCouponsScreen extends StatefulWidget {
  const YoursCouponsScreen({super.key});

  @override
  State<YoursCouponsScreen> createState() => _YoursCouponsScreenState();
}

class _YoursCouponsScreenState extends State<YoursCouponsScreen> {
  final couponsContoller=Get.find<YourCouponController>();
 int yoursindex=0;
 List mobilecouponsimage=[
  'assets/images/offersimage.png',
  'assets/images/couponsimage.png',
  'assets/images/offersimage.png',
  'assets/images/couponsimage.png',
  'assets/images/couponsimage2.png',
  'assets/images/couponsimage3.png',
   'assets/images/couponsimage2.png',
   'assets/images/couponsimage3.png',

 ];
 List mobilecoupontitle=[
  'Lorem Ipsum',
  'Lorem Ipsum',
  'Lorem Ipsum',
  'Lorem Ipsum',
  'Lorem Ipsum',
  'Lorem Ipsum',
  'Lorem Ipsum',
  'Lorem Ipsum',
 ];
 List mobilecoupondescription=[
   'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
  'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
  'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
  'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
  'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
  'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
  'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
  'Reference site about Lorem Ipsum,giving information on its origins, as well as a random Lipsum generator.',
 ];
 List mobilevendorimage=[
  'assets/images/vendorimage1.png',
  'assets/images/vendorimage2.png',
  'assets/images/vendorimage1.png',
  'assets/images/vendorimage2.png',
  'assets/images/vendorimage3.png',
  'assets/images/vendorimage4.png',
  'assets/images/vendorimage3.png',
  'assets/images/vendorimage4.png',




 ];
  final couponController=Get.find<SubscriptionApiController>();
   @override
  void initState() {
    super.initState();
    couponController.getcouponsList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:
          PreferredSize(child: AppBarMob(), preferredSize: Size.fromHeight(50)),
      drawer: MobileDrawer(),
          body:
           ListView(
             children:[
              ksizedbox40,
               Padding(
                 padding: const EdgeInsets.only(left: 20),
                 child: Row(
                  children: [
                    Text('Member Coupon',
                    style: TextStyle(
                      fontSize: 22,
                      color: kblue,
                      fontWeight: FontWeight.w600
                    ),)
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
                    ksizedbox40,
                    ksizedbox40,
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
                                  
             ]
           ),
          
    );
  }
}