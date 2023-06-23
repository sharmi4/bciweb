import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:bciweb/views/business/subscribe/views/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/subscribe_controllers.dart';
//import '../../../../registerhomescreen/common_reg_appbar';
import '../../../../controller/subscription_controller/subscription_controller.dart';
import '../../../../models/get_plansmodel.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';

import '../comomappbar.dart';
import '../drawer.dart';
import 'mobile_payment.dart';

class MobileSubscription extends StatefulWidget { 
  // PlansData ? planesdata;
   MobileSubscription({super.key,});
 
  @override
  State<MobileSubscription> createState() => _MobileSubscriptionState();
}

class _MobileSubscriptionState extends State<MobileSubscription> {
  final settingsController = Get.find<SubscribeController>();
  final subscriptionapiController = Get.find<SubscriptionApiController>();


@override
void initState() {
  super.initState();
  subscriptionapiController.getplansList();
  // setDefault();
}
bool showContainer=false;
String cardimgae='';
int temindex=0;


int button=0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
       appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      drawer: MobileDrawer(),
      body:  GetBuilder<SubscriptionApiController>(
          builder: (_){
            
            return ListView(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Container(
                child: Stack(
                  children: [
                    Image.asset('assets/images/Group 39757.png'),
                    Positioned(
                      top: 0,
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Subscribe',
                          style: GoogleFonts.lato(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: kwhite),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ksizedbox30,
              Text(
                'Select Membership',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff003366),
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              ksizedbox10,
              const Text(
                "All Select Membership Cards Choose Anything",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    color: Color(0xff003366)),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                   
                     width:300,
                      child: GridView.builder(
                       shrinkWrap: true,
                       itemCount: subscriptionapiController.plansdataList.length,
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 45,
                        childAspectRatio: 4,
                        crossAxisCount: 2), 
                      itemBuilder: (context,index){
                       return GestureDetector(
                        onTap: (){
                          print("------------------------------------------------${subscriptionapiController.plansdataList[index].cardImg}");
                          setState(() {
                            temindex= index;
                            cardimgae= subscriptionapiController.plansdataList[index].cardImg;
                          });
                        },
                         child: Container(
                          height: 30,
                        
                           alignment: Alignment.center,
                          decoration: BoxDecoration(
                             color:temindex==index ?kOrange:kwhite,
                             borderRadius: BorderRadius.circular(10),
                             border: Border.all(
                              color:temindex== index?kwhite:kblue
                             )
                          ),
                           child: Text(
                            subscriptionapiController.plansdataList[index].title,
                            style: TextStyle(
                              fontSize: 15,
                              color:temindex==index? kwhite:kblue
                            ),
                            
                           ),
                                                   ),
                       );
                      }),
                    ),
                  ),
                
                ],
              ),
      ksizedbox40,
              
                 Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
              
                InkWell(
                    onTap: () {
                      Get.to(MobilePayment(image:cardimgae , 
                      htext: subscriptionapiController.plansdataList[temindex].title, 
                      text:subscriptionapiController.plansdataList[temindex].planDescription,
                      id: subscriptionapiController.plansdataList[temindex].id));
                    },
                    child: subscriptionapiController.plansdataList.isEmpty ? Container(

                    ): Image(
                      image: cardimgae == "" ? NetworkImage(subscriptionapiController.plansdataList.first.cardImg): NetworkImage(cardimgae),
                      height: 180,
                      
                    ),
                    
                    ),
        
                ],
              ),
              ksizedbox40,
              RegisterCommonBottom()
            ]
            
            );
            
          }
        ),
    
    );
  }
}
