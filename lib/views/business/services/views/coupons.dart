import 'dart:math';

import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:bciweb/registerhomescreen/common_reg_homescreen.dart';
import 'package:clipboard/clipboard.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/constans.dart';
import '../../../../controller/subscription_controller/subscription_controller.dart';
import '../../../members/common_widget/common.dart';
//import '../../../../registerhomescreen/common_reg_appbar';

class Coupones extends StatefulWidget {
  const Coupones({super.key});

  @override
  State<Coupones> createState() => _CouponesState();
}

class _CouponesState extends State<Coupones> {
  final subscripeController=Get.find<SubscriptionApiController>();
  @override
  void initState() {
    super.initState();
    subscripeController.getcouponsList();
  }
   List colors = [const Color(0xffFCE2E2),const Color(0xffE4E4E4),
  const Color(0xffF8AC61),const Color(0xff8DC6FF),
   const Color(0xffEDD076), const Color(0xff90E79C), 
   const Color(0xff00D8E0), const Color(0xff396DB4), const Color(0xffD9908A),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(),
          preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: GetBuilder<SubscriptionApiController>(
          builder: (_) {
          return Column(
            children: [
              RegisterCommonContainer(),
              ksizedbox30,
              Container(
                
                width: 1000,
             child: GridView.builder(
              shrinkWrap: true,
              itemCount: subscripeController.couponsdatalist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 7,
              crossAxisCount: 2), 
              itemBuilder:(context,index){
                return Padding(
                      padding: const EdgeInsets.only(top:30,left: 20,right: 20),
                      child:            ClipPath(
              clipper: TicketPassClipper(),
              
        
                         child: Container(
                          
                          color: colors[Random().nextInt(9)],
                           child: Column(
                            children: [
                              ksizedbox10,
                             Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
                                child: Row(
                                  
                                  children: [
                                    Text(subscripeController.couponsdatalist[index].createdAt.toString()),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 50),
                                       child: Text(subscripeController.couponsdatalist[index].name),
                                     ),
                                    
                                  ],
                                ),
                              ),
                               ksizedbox10,
                              Padding(
                                padding: const EdgeInsets.only(top: 10,left:10,right: 80),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(subscripeController.couponsdatalist[index].couponcode),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0,left: 10),
                                      child: InkWell(

                                        onTap: (){
                                          FlutterClipboard.copy(subscripeController.couponsdatalist[index].couponcode).then((value) => 
                                          Fluttertoast.showToast(
                                           msg: "Copy to clipboard",
                                           toastLength: Toast.LENGTH_SHORT,
                                           gravity: ToastGravity.CENTER,
                                           timeInSecForIosWeb: 1,
                                           backgroundColor: Colors.white,
                                           textColor: Colors.black,
                                           fontSize: 16.0
                                            ),
                                          //print("code copied")
                                          );
                                        },
                                        child: Icon(Icons.copy),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            
                            
                            ],
                           ),
                         ),
                        ),
                    );
              }),
            
              ),
              ksizedbox30,
              RegisterCommonBottom()
            ],
          );
          }
        ),
      ),
    );
  }
}
