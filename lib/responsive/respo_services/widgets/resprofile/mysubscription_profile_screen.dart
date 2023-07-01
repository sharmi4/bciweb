import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constans.dart';
import '../../../../controller/auth_controller/auth_profile_controller.dart';
import '../../../../controller/subscription_controller/subscription_controller.dart';
import '../../../mobile_wdgets/comomappbar.dart';
import '../../../mobile_wdgets/drawer.dart';

class MySubscriptionMobileScreen extends StatefulWidget {
  const MySubscriptionMobileScreen({super.key});

  @override
  State<MySubscriptionMobileScreen> createState() => _MySubscriptionMobileScreenState();
}

class _MySubscriptionMobileScreenState extends State<MySubscriptionMobileScreen> {

  //  @override
  // void initState() {
  //   super.initState();
 
  // }


@override
void initState() {
  super.initState();
     
_getPlanDetails();
}


_getPlanDetails() async{

 var tempplanId = await authprofileController.getProfile();
  int planId = int.parse(tempplanId);
  print("------------type-------------${planId}--");

  plansController.getPlanDetails(id: planId);
  
}





 final plansController=Get.find<SubscriptionApiController>();
 final authprofileController = Get.find<AuthProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
            drawer: MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
           children: [
           Container(
           height: 130,
          decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/subscriptionbackimage.png',
         ), fit: BoxFit.cover,)
                                                ),
                                                width: MediaQuery.of(context).size.width*0.999,
                                                child:     Center(
                                                child: Text(
                                                  'SUBSCRIBE',
                                                  style: TextStyle(
                             letterSpacing:1,
                               fontSize: 23,
                               fontWeight: FontWeight.bold,
                               color: kwhite),
                                                ),
                                              ),
                                              ),
                                              // Image.asset('assets/images/Group 39757.png'),
                                          
                                                Padding(
                                                  padding: const EdgeInsets.only(left:30,right:30,top:40),
                                                  child: GetBuilder<SubscriptionApiController>(
                                                   builder: (_){
                                                    return Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        plansController.subscriptionplan.isEmpty?Center(
                                                          child: CircularProgressIndicator(
                                                            color: kblue,
                                                          ),
                                                        ):Image.network(plansController.subscriptionplan.first.cardImg,
                                                         height: 200,fit:BoxFit.fitHeight),
                                                               Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                    plansController.subscriptionplan.isEmpty?Container():Text(plansController.subscriptionplan.first.title,
                                                             style:TextStyle(
                                                               letterSpacing: 1,
                                                              color: kblue,
                                                              fontSize: 25,
                                                               fontWeight: FontWeight.w700
                                                              )),
                                                                ],
                                                               ),                                       
                                                        Column(
                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                        
                                                            ksizedbox10,
                                                            Text('Subscribe Details :',
                                                            style:TextStyle(
                                                             fontSize: 17,
                                                             color:kblue,
                                                             fontWeight: FontWeight.w500
                                                            )),
                                                            ksizedbox20,
                                                            plansController.subscriptionplan.isEmpty?Container():Container(
                                                             width: 420,
                                                              child: Text(plansController.subscriptionplan.first.planDescription,
                                                              style: TextStyle(
                                                               
                                                               fontSize: 18,
                                                                                                                            
                                                              ),),
                                                            ),
                                                        
                                                          ],
                                                        ),
                                                        ksizedbox20,
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                             height: 40,
                                                             width: 120,
                                                             decoration: BoxDecoration(
                                                               color: kblue,
                                                            borderRadius: BorderRadius.circular(5)
                                                             ),
                                                             child:Center(
                                                               child:plansController.subscriptionplan.isEmpty?Container():Text(plansController.subscriptionplan.first.saleAmount,
                                                               style: TextStyle(
                                                                 fontSize: 17,
                                                                 color:kwhite,
                                                                 
                                                               ),)
                                                             )
                                                                                    
                                                            ),
                                                          ],
                                                        ),
                                                        ksizedbox20,
                                                      ],
                                                    );
                                                   }
                                                  ),
                                                )
                                              
                                            ],
                                          ),
      ),
    );
  }
}