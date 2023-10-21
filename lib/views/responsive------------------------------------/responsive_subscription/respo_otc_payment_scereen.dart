import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/home_controller.dart';
import 'package:bciweb/controller/plans_controller.dart';
import 'package:bciweb/controller/profile_controller.dart';
import 'package:bciweb/models/get_plansmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RespoOtcPayment extends StatefulWidget {
  PlansData plansData;
   RespoOtcPayment({super.key,required this.plansData});

  @override
  State<RespoOtcPayment> createState() => _RespoOtcPaymentState();
}



class _RespoOtcPaymentState extends State<RespoOtcPayment> {



  final homeController = Get.find<HomeController>();
  var redeemCouponController = TextEditingController();
  final profileController = Get.find<ProfileController>();
  final planController = Get.find<PlanController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  Padding(
        padding: const EdgeInsets.fromLTRB(15, 11, 15, 11),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Image.network(
              widget.plansData.cardImg,
              height: 200,
            ),
            ksizedbox30,
            Row(
              children: [
                Text(
                  widget.plansData.title,
                  style:
                      TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            ksizedbox10,
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "₹${widget.plansData.saleAmount}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ksizedbox20,
            Text(
              widget.plansData.planDescription,
              style: TextStyle(fontSize: 16),
            ),
            ksizedbox30,
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     // controller: _controller,
            //     decoration: InputDecoration(
            //         hintText: 'Enter Coupon',
            //         hintStyle: TextStyle(fontSize: 17.sp, color: kgrey),
            //         fillColor: kwhite,
            //         focusColor: kwhite,
            //         isDense: true,
            //         filled: true,
            //         border: OutlineInputBorder(
            //           borderSide: BorderSide(color: kblue),
            //           borderRadius: BorderRadius.circular(4.0),
            //         ),
            //         // suffixIcon:
            //         //     Image.asset('assets/images/Icon awesome-copy.png'),
            //             ),
            //   ),
            // ),
            // ksizedbox10,
            ksizedbox10,
            Text(
              'Promo Code',
              style: TextStyle(
                  fontSize: 16.5, color: kblue, fontWeight: FontWeight.w500),
            ),
            ksizedbox10,
            TextField(
              controller: redeemCouponController,
              decoration: InputDecoration(
                disabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                hintText: 'Enter Your Coupon code',
                fillColor: kwhite,
                focusColor: kwhite,
                isDense: true,
                filled: true,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 20,
                    width: 130,
                    decoration: BoxDecoration(
                      color: kblue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(




                      // onTap: () 
                      //  {
                      //   String tempSaleAmount = widget.plansData.saleAmount;
                      //   String amount =
                      //       await profileController.redeemSubscriptionCoupon(
                      //           couponcode: redeemCouponController.text);

                      //   double tAmount = double.parse(amount);
                      //   double tempSaleAmounz = double.parse(tempSaleAmount);

                      //   if (tAmount < tempSaleAmounz) {
                      //     double totalAmountTobeAdded =
                      //         tempSaleAmounz - tAmount;

                      //     setState(() {
                      //       widget.plansData.saleAmount =
                      //           totalAmountTobeAdded.toStringAsFixed(0);
                      //     });
                      //   } else {
                      //     Get.rawSnackbar(
                      //         message:
                      //             "Coupon is not applicable for this subscription",
                      //         backgroundColor: Colors.red);
                      //   }
                      // },
                      child: Center(
                        child: Text(
                          'Redeem Now',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ksizedbox40,
            InkWell(
              onTap: ()  {


    planController.initiatePayment(
                            id: widget.plansData.id,
                            amount: double.parse(widget.plansData.saleAmount),
                            gstPercentage: widget.plansData.gst,
                            percentageAmount: widget
                                .plansData.gstPercentageAmount
                                .toStringAsFixed(2),
                           
                            totalAmount:
                                widget.plansData.totalAmount.toStringAsFixed(2),
                          );



                // print(
                //     ">>>>>>>>>>>>>>>>>..............payment start..........>>>>>>>>>>${widget.plansData.id}");

           //     bool isValid = await planController.checkUserPlan();
                // bool isValid = true;

                // if (isValid) {
                //   Get.to(() => PaymentScreenView(
                //         id: widget.plansData.id,
                //         amount: double.parse(widget.plansData.saleAmount),
                //         gstPercentage: widget.plansData.gst,
                //         percentageAmount: widget.plansData.gstPercentageAmount
                //             .toStringAsFixed(2),
                //         totalAmount:
                //             widget.plansData.totalAmount.toStringAsFixed(2),
                //       ));
                // }

                // profileController.payUseingEaseBuzzSubs(
                //     id: widget.plansData.id,
                //     amount: widget.plansData.saleAmount,
                //     customerName: profileController.profileData.first.name
                //         .trim()
                //         .split(" ")
                //         .first,
                //     email: profileController.profileData.first.email,
                //     phone: profileController.profileData.first.mobile,
                //     status: "");
                // print(
                //     ">>>>>>>>>>>>>>>>>..............payment end..........>>>>>>>>>>");
                // {
                //  String access_key = "Access key generated by the Initiate Payment API";
                //  String pay_mode = """This will either be "test" or "production""";
                //  Object parameters =
                //   {
                //     "access_key":access_key,
                //     "pay_mode":pay_mode
                //    };
                //  final payment_response = await _channel.invokeMethod("payWithEasebuzz", parameters);
                //  }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFFF5C29),
                        Color(0xFFFFCD38),
                      ],
                    ),
                  ),
                  child: Text(
                    'Proceed To Payment',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            ksizedbox40
          ],
        ),
      ),);
  }
}