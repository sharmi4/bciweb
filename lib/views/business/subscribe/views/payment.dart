import 'package:bciweb/controller/subscription_controller/subscription_controller.dart';
import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/constans.dart';
//import '../../../../registerhomescreen/common_reg_appbar';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';

class Payment extends StatefulWidget {
  String image;String htext;String text;
  dynamic id;
   Payment({super.key,required this.image,required this.htext,required this.text,
   required this.id});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
void initState() {
  super.initState();
  subsciptionController.getplansList();
  // setDefault();
}
  final subsciptionController = Get.find<SubscriptionApiController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(),
          preferredSize: Size(double.infinity, 40)),
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
                  child: Image(image: NetworkImage(widget.image))
                  ),
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
                  TextField(
                    // controller: _controller,

                    decoration: InputDecoration(
                        hintText: 'Enter Coupon',
                        hintStyle: TextStyle(fontSize: 17, color: kgrey),
                        fillColor: kwhite,
                        focusColor: kwhite,
                        isDense: true,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: kblue),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        suffixIcon: Container(
                          child: Center(
                              child: Text(
                            'Verify',
                            style: TextStyle(color: kwhite, fontSize: 17),
                          )),
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(10)),
                        )),
                  ),
              
                  ksizedbox40,
                  InkWell(
                    onTap: () {
                     
                      subsciptionController.addPaymentSubscription(id:widget.id!.toString(),
                      showpayment: true);
                      
                     // Get.toNamed('/add-wallet');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          4,
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
                ],
              ),
            ),
          ),
          ksizedbox40,
          RegisterCommonBottom()
        ],
      ),
    );
  }
}
