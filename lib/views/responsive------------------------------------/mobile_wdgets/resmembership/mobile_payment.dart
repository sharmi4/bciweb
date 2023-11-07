import 'package:bciweb/controller/plans_controller.dart';
import 'package:bciweb/controller/subscription_controller/subscription_controller.dart';
import 'package:bciweb/models/get_plansmodel.dart';
import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/mobile_common_bottom/bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant/constans.dart';
//import '../../../../registerhomescreen/common_reg_appbar';
import '../../../../../registerhomescreen/common_reg_homescreen.dart';

import '../comomappbar.dart';
import '../drawer.dart';

class MobilePayment extends StatefulWidget {
PlansData plansData;
  String image;
  String htext;
  String text;
  dynamic id;
   MobilePayment({super.key,
   required this.htext,
   required this.plansData,
   this.id,
   required this.image,
   required this.text});

  @override
  State<MobilePayment> createState() => _MobilePaymentState();
}

class _MobilePaymentState extends State<MobilePayment> {
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
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      drawer: MobileDrawer(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
     
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: size.width * 0.8,
                  child: Image(image: NetworkImage(widget.image),fit: BoxFit.cover,)
                  ),
              ksizedbox10,
              Container(
                width: size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                   
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Container(
                  width: 250,
                   child: Text(
                    
                        widget.text,
                    
                          style: TextStyle(
                            
                            color: kblue, fontSize: 18),
                        ),
                 ),
              ],
            ),
          ),
          ksizedbox30,
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: [
                 
              
                  ksizedbox40,
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
                      
                     // Get.toNamed('/add-wallet');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.6,
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
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ksizedbox40,
          MobileCommonBottom()
        ],
      ),
    );
  }
}
