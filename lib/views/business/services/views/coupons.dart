import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:bciweb/registerhomescreen/common_reg_homescreen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
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
                      child:          ClipPath(
            clipper: TicketPassClipper(),
            

                       child: Container(
                        color: kOrange,
                         child: Column(
                          children: [
                            ksizedbox10,
                         
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(subscripeController.couponsdatalist[index].couponcode)
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15,left: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(subscripeController.couponsdatalist[index].name),
                                  Text(subscripeController.couponsdatalist[index].amount)
                                ],
                              ),
                            ),
                            ksizedbox10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(subscripeController.couponsdatalist[index].createdAt.toString()),
                                
                              ],
                            )
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
