import 'package:bciweb/views/members/contacs/contact_screen.dart';
import 'package:bciweb/views/members/home_screen.dart';
import 'package:bciweb/views/members/homescreens/specialized_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constans.dart';
import '../../controller/home_controller.dart';

class CommonContainer extends StatefulWidget {
   CommonContainer({super.key});

  @override
  State<CommonContainer> createState() => _CommonContainerState();
}

class _CommonContainerState extends State<CommonContainer> {
  @override
  final _homeController=Get.find<HomeController>();

  Widget build(BuildContext context) {
    return  Container(
      child: Padding(
              padding: const EdgeInsets.only(top: 0,left: 0),
              child: Row(
                children: [
                  Container(
                    height: 70,width: 170,color:Colors.deepOrange[50],
                    child: Image.asset('assets/images/logo.png') 
                  ),
                  // ClipPath(
                  //   clipper: ClipClipper(),
                  //   child: Container(height: 70,width: 60,color:Colors.deepOrange[50],
                  //   ),
                  // ),
          
             Obx(()=>
                Padding(
                 padding: const EdgeInsets.only(left: 40),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     TextButton(onPressed: (){
                     _homeController.index(0);
                     _homeController.update();
                     }, 
                     child: Text('HOME',style: TextStyle(
                      color: _homeController.index==0?kOrange:kblue
                     ),)),
                     Padding(
                       padding: const EdgeInsets.only(left: 30),
                       child: TextButton(onPressed: (){
                                   _homeController.index(1);
                                   _homeController.update();
                                  }, 
                                  child: Text('ABOUT',style: TextStyle(
                      color: _homeController.index==1?kOrange:kblue
                     ),)),
                     ),
                 Padding(
                   padding: const EdgeInsets.only(left: 30),
                   child: TextButton(onPressed: (){

                    _homeController.index(2);
                    _homeController.update();
                    
                      Get.to(SpecializedScreen());
                    
                   }, 
                   child: Text('SPECIALIZED',style: TextStyle(
                      color: _homeController.index==2?kOrange:kblue
                     ),)),
                 ),
                  
                 Padding(
                   padding: const EdgeInsets.only(left: 30),
                   child: TextButton(onPressed: (){
                    _homeController.index(3);
                    _homeController.update();
                    Get.to(ContactScreen());
                   }, 
                   child: Text('CONTACT',style: TextStyle(
                      color: _homeController.index==3?kOrange:kblue
                     ),)),
                 )
                   ],
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 370),
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
                     padding: const EdgeInsets.only(left: 30),
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
                     padding: const EdgeInsets.only(left: 30),
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
                      child: Center(child: Text('Register Now',
                      style: TextStyle(fontSize: 15,color: kwhite),)),
                     ),
                   )
                 ],
               ),
             ),
           
                   
                ],
              ),
            ),
    );
  }
}