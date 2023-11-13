import 'package:bciweb/controller/plans_controller.dart';
import 'package:bciweb/controller/subscription_controller/subscription_controller.dart';
import 'package:bciweb/models/get_plansmodel.dart';
import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/constans.dart';
//import '../../../../registerhomescreen/common_reg_appbar';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../common_widget/common.dart';

class Payment extends StatefulWidget {
  PlansData plansData;
  String image;
  String htext;
  String text;
  dynamic id;
  Payment(
      {super.key,

      required this.plansData,
      required this.image,
      required this.htext,
      required this.text,
      required this.id
      });

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int temindex = 0;

  @override
  void initState() {
    super.initState();
    subsciptionController.getplansList();
    // setDefault();
  }

  final planController = Get.find<PlanController>();

  final subsciptionController = Get.find<SubscriptionApiController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: ListView(
        children: [
          RegisterCommonContainer(),
          Container(
            child: Image.asset('assets/images/Group .png'),
          ),
          ksizedbox20,
          // Text(
          //  'OTC Payment' ,
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //       color: Color(0xff003366),
          //       fontSize: 35,
          //       fontWeight: FontWeight.bold),
          // ),
          ksizedbox10,
          // const Text(
          //   "All Select Membership Cards Choose Anything",
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //       fontSize: 17,
          //       fontWeight: FontWeight.w500,
          //       height: 1.4,
          //       color: Color(0xff003366)),
          // ),
          ksizedbox40,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: size.width * 0.4,
                  child: Image(image: NetworkImage(widget.image))),
              ksizedbox10,
              Container(
                width: size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.htext,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: kblue,
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                    ksizedbox20,
                    Text(
                      widget.text,
                      style: TextStyle(color: kblue, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ksizedbox30,
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: [
                  // TextField(
                  //   // controller: _controller,

                  //   decoration: InputDecoration(
                  //       hintText: 'Enter Coupon',
                  //       hintStyle: TextStyle(fontSize: 17, color: kgrey),
                  //       fillColor: kwhite,
                  //       focusColor: kwhite,
                  //       isDense: true,
                  //       filled: true,
                  //       border: OutlineInputBorder(
                  //         borderSide: BorderSide(color: kblue),
                  //         borderRadius: BorderRadius.circular(4.0),
                  //       ),

                  //       ),
                  // ),

                  ksizedbox40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
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

                          // subsciptionController.addPaymentSubscription(id:widget.id!.toString(),
                          // showpayment: true);

                          // Get.toNamed('/add-wallet');
                        },
                        child: Container(
                          width: 500,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16,
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
                          child:const Text(
                            'Proceed To Payment',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ksizedbox40,
          const RegisterCommonBottom(),
        ],
      ),
    );
  }
}
