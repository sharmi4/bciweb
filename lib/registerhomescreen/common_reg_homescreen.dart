

import 'package:bciweb/views/business/bookins/history/views/history.dart';
import 'package:bciweb/views/business/subscribe/views/subscribe.dart';
import 'package:bciweb/views/members/homescreens/reg_profile.dart';
import 'package:bciweb/views/members/reg_wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:bciweb/views/members/about/about_screens.dart';
import 'package:bciweb/views/members/contacs/contact_screen.dart';
import 'package:bciweb/views/members/home_screen.dart';
import 'package:bciweb/views/members/homescreens/specialized_screen.dart';
import 'package:get/get.dart';

import '../../../constant/constans.dart';
import '../../../controller/home_controller.dart';
import '../controller/reg_home_controller.dart';
import '../views/authentication/landing_screen.dart';
import '../views/business/Gallery/gallery.dart';
import '../views/business/services/views/services.dart';

class RegisterCommonContainer extends StatefulWidget {
   RegisterCommonContainer({super.key});

  @override
  State<RegisterCommonContainer> createState() => _RegisterCommonContainerState();
}

class _RegisterCommonContainerState extends State<RegisterCommonContainer> {
  @override
  final reghomeController=Get.find<RegisterHomeController>();
  // final _homeController=Get.find<HomeController>();

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Container(
      child: Padding(
              padding: const EdgeInsets.only(top: 0,left: 0),
              child: Row(
                children: [
                  Container(
                    height: 70,width: 180,color:Colors.deepOrange[50],
                    child: Image.asset('assets/images/logo.png') 
                  ),
                  // ClipPath(
                  //   clipper: ClipClipper(),
                  //   child: Container(height: 70,width: 60,color:Colors.deepOrange[50],
                  //   ),
                  // ),
          
             Obx(()=>
                Padding(
                 padding: const EdgeInsets.only(left: 20),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     TextButton(onPressed: (){
                     reghomeController.reindex(0);
                     reghomeController.update();
                     Get.offAll(BusinessHomeScreen());
                     }, 
                     child: Text('HOME',style: TextStyle(
                      color: reghomeController.reindex==0?kOrange:kblue
                     ),)),
                     Padding(
                       padding: const EdgeInsets.only(left: 20),
                       child: TextButton(onPressed: (){
                        Get.offAll(AboutUsScreen());
                        print("-------------------------");
                                   reghomeController.reindex(1);
                                   reghomeController.update();
                                   
                                  }, 
                                  child: Text('ABOUT',style: TextStyle(
                      color: reghomeController.reindex==1?kOrange:kblue
                     ),)),
                     ),
                      Padding(
                   padding: const EdgeInsets.only(left: 20),
                   child: TextButton(onPressed: (){
                
                    reghomeController.reindex(2);
                    reghomeController.update();
                    
                      Get.to(SpecializedScreen());
                    
                   }, 
                   child: Text('SPECIALIZED',style: TextStyle(
                      color: reghomeController.reindex==2?kOrange:kblue
                     ),)),
                 ),
                  
                 Padding(
                   padding: const EdgeInsets.only(left: 30),
                   child: TextButton(onPressed: (){
                
                    reghomeController.reindex(3);
                    reghomeController.update();
                     Get.to(Services());
                    
                    
                   }, 
                   child: Text('SERVICE',style: TextStyle(
                      color: reghomeController.reindex==3?korange:kblue
                     ),)),
                 ),
                  Padding(
                   padding: const EdgeInsets.only(left: 20),
                   child: TextButton(onPressed: (){
                   
                    reghomeController.reindex(4);
                    reghomeController.update();
                    Get.offAll(History());
                    
                    
                   }, 
                   child: Text('BOOKINGS',style: TextStyle(
                      color: reghomeController.reindex==4?kOrange:kblue
                     ),)),
                 ),
                   Padding(
                   padding: const EdgeInsets.only(left: 20),
                   child: TextButton(onPressed: (){
                
                    reghomeController.reindex(5);
                    reghomeController.update();
                    Get.offAll(Gallery());
                    
                      
                    
                   }, 
                   child: Text('GALLERY',style: TextStyle(
                      color: reghomeController.reindex==5?kOrange:kblue
                     ),)),
                 ),
                  
                  
                 Padding(
                   padding: const EdgeInsets.only(left: 20),
                   child: TextButton(onPressed: (){
                    reghomeController.reindex(6);
                    reghomeController.update();
                    Get.offAll(ContactScreen());
                   }, 
                   child: Text('CONTACT',style: TextStyle(
                      color: reghomeController.reindex==6?kOrange:kblue
                     ),)),
                 )
                   ],
                 ),
                             ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 50),
               child: Row(
                     
                 children: [
                   Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                     color: kwhite,
                     shape: BoxShape.circle,
                     boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0.0, 0.75),
                        blurRadius: 2,
                        color: kgrey
                      )
                     ]
                    ),
                    child: Icon(Icons.search,color: kblue,),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 20),
                     child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                         color: kwhite,
                         shape: BoxShape.circle,
                         boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0.0, 0.75),
                            blurRadius: 2,
                            color: kgrey
                          )
                         ]
                      ),
                      
                      child: Icon(Icons.notifications,color: kblue,),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 20),
                     child: InkWell(
                      onTap: (){
                        Get.to(Subscribe());
                      },
                       child: Container(
                        height: 35,
                        width:120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors:[
                            korange,
                            kyellow
                          ]),
                          borderRadius: BorderRadius.circular(15)
                                
                        ),
                        child: Center(child: Text('Subscription',
                        style: TextStyle(fontSize: 15,color: kwhite),)),
                       ),
                     ),
                   ),
                     Padding(
                     padding: const EdgeInsets.only(left: 30),
                     child: InkWell(
                      onTap: (){
                        Get.to(LandingScreen());
                      },
                       child: Container(
                        height: 35,
                        width:120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors:[
                            korange,
                            kyellow
                          ]),
                          borderRadius: BorderRadius.circular(15)
                                
                        ),
                        child: Center(child: Text('Registration',
                        style: TextStyle(fontSize: 15,color: kwhite),)),
                       ),
                     ),
                   ) ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Row(children:[ 
                Text('Raja Ram'),
                  Icon(Icons.expand_more),     
                InkWell(
                  onTap: () {
                    Get.offAll(RegisterProfileScreen());
                  },
                  child: Image.asset('assets/images/nick.png',height: 35,fit: BoxFit.fitHeight,))]),
             )
                   
                ],
              ),
            ),
    );
  }
}