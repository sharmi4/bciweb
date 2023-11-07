import 'dart:math';

import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/controller/profile_controller.dart';
import 'package:bciweb/controller/setting_controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../constant/constans.dart';
import '../../../mobile_wdgets/comomappbar.dart';

class MobileSuportScreen extends StatefulWidget {
  const MobileSuportScreen({super.key});

  @override
  State<MobileSuportScreen> createState() => _MobileSuportScreenState();
}

class _MobileSuportScreenState extends State<MobileSuportScreen> {
  @override
  void initState() {
    super.initState();
    apisettingController.supportAdminDetail();
    setDefault();
  }

  setDefault() async {
    await authprofileController.getProfile();
    mobilesubNameController.text = authprofileController.profileData.first.name;
    mobilesubMobileController.text = authprofileController.profileData.first.mobile;
    mobilesubEmailController.text = authprofileController.profileData.first.email;
  }
 
   var mobilenameController=TextEditingController();
 
  var mobilesubNameController=TextEditingController();
  var mobilesubMobileController=TextEditingController();
  var mobilesubEmailController=TextEditingController();
  var mobilesubDescriptionController=TextEditingController();
  final titleController = TextEditingController();
  final authprofileController = Get.find<AuthProfileController>();
  final profileController = Get.find<ProfileController>();
  final apisettingController = Get.find<ApiSettingController>();
  @override
  Widget build(BuildContext context) {
      var size = MediaQuery.of(context).size;
    return Scaffold(
       appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
          body: GetBuilder<ApiSettingController>(
            builder: (_) {
              return Container(
              
               child: Padding(
                 padding: const EdgeInsets.only(top: 50),
                 child: Column(
                         
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 22,right: 22),
                       child: Container(
                         height: 35,
                          width: MediaQuery.of(context).size.width,
                         decoration: BoxDecoration(
                           color: kgrey.withOpacity(0.3),
                           
                         ),
                         child: TextField(
                            textInputAction: TextInputAction.next,
                           controller: mobilesubNameController,
                           decoration: InputDecoration(
                             hintText: 'Your Name',
                             hintStyle: TextStyle(
                               fontSize: 14.5
                             ),
                             border: OutlineInputBorder(
                              borderSide: BorderSide.none
                               
                             
                             )
                           ),
                           
                         ),
                       ),
                     ),
                      Padding(
                             padding: const EdgeInsets.only(left: 22,top: 45,right: 22),
                             child: Container(
                             height: 35,
                             width: MediaQuery.of(context).size.width,
                             decoration: BoxDecoration(
                               color: kgrey.withOpacity(0.3),
                               
                             ),
                             child: TextField(
                                textInputAction: TextInputAction.next,
                               controller: mobilesubMobileController,
                               decoration: InputDecoration(
                                 hintText: 'Mobile',
                                 hintStyle: TextStyle(
                                   fontSize: 13.5
                                 ),
                                 border: OutlineInputBorder(
                                  borderSide: BorderSide.none
                                   
                                 
                                 )
                               ),
                               
                             ),
                                                                   ),
                           ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22,top:45,right: 22),
                        child: Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: kgrey.withOpacity(0.3),
                            
                          ),
                          child: TextField(
                              textInputAction: TextInputAction.next,
                            controller: mobilesubEmailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                fontSize: 14.5
                              ),
                              border: OutlineInputBorder(
                               borderSide: BorderSide.none
                                
                              
                              )
                            ),
                            
                          ),
                        ),
                      ),
                          Padding(
                            padding: const EdgeInsets.only(left: 22,top:45,right: 22),
                            child: Container(
                            
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: kgrey.withOpacity(0.3),
                                
                              ),
                              child: TextField(
                                
                                maxLines: 4,
                                controller: mobilesubDescriptionController,
                                decoration: InputDecoration(
                                  hintText: 'Description',
                                  hintStyle: TextStyle(
                                    fontSize: 14.5
                                  ),
                                  border: OutlineInputBorder(
                                   borderSide: BorderSide.none
                                    
                                  
                                  )
                                ),
                                
                              ),
                            ),
                          ),
                         
                         Obx(()=>
                           Padding(
                             padding: const EdgeInsets.only(top: 70),
                             child:profileController.isLoading.isTrue?Container(
                                  height: 50,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      border: Border.all(color: const Color(0xffFF9021)),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0xffFF5003),
                                          blurRadius: 2.0,
                                        ),
                                      ]),
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                ): Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                     minimumSize: Size(MediaQuery.of(context).size.width*0.7, 
                                     45),
                                     backgroundColor: kblue
                                   ),
                                   onPressed: (){
                                    apisettingController.createSupport(
                                              title: titleController.text,
                                              message: mobilesubDescriptionController.text);
                                   }, 
                                 child: Text('Submit',
                                 style: TextStyle(
                                   fontSize: 17,
                                   color: kwhite
                                 ),)),
                               ],
                             ),
                           ),
                         ),
                         apisettingController.contactDetailsData!=null?
                         Padding(
                           padding: const EdgeInsets.only(top: 80,left:22,right: 22),
                           child: Container(
                             height: 150,
                             width: MediaQuery.of(context).size.width*0.9,
                             decoration: BoxDecoration(
                               color: kwhite,
                               boxShadow: <BoxShadow>[
                                 BoxShadow(
                                   offset: Offset(0.0,0.75),
                                   blurRadius: 3,
                                   color: kgrey,
               
                                 )
                               ],
                               border: Border.all(
                                 color: Colors.black.withOpacity(0.3)
                               )
                             ),
                             
                             child: Padding(
                               padding: const EdgeInsets.only(top: 30),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                   Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Row(
                                         children: [
                                           Text('Contact Admin :',
                                           
                                           style: TextStyle(
                                             fontSize: 14.5
                                           ),),

                                         ],
                                       ),
                                       ksizedbox10,
                                        Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('Admin Email :',
                                        style: TextStyle(
                                          fontSize: 14.5
                                        ),),
                                        
                                      ],
                                    ),
                                    ksizedbox10,
                                       Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                     children: [
                                       Text('Head Office Address :',
                                       style: TextStyle(
                                           fontSize: 14.5
                                       ),),
                                       
                                     ],
                                   )  
                                     ],
                                   ),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                        Row(
                                          children: [
                                               apisettingController
                                            .contactDetailsData!.appPhone.isEmpty
                                        ? const Text("")
                                        : InkWell(
                                          onTap: (){
                                            launch("tel:${apisettingController.contactDetailsData!.appPhone}");
                                          },
                                          child: Text(
                                              apisettingController
                                                  .contactDetailsData!.appPhone,
                                              style: TextStyle(
                                                  fontSize: 13.5, color: kblue)),
                                        ),
                                          ],
                                        ),
                                        ksizedbox10,
                                         Row(
                                           children: [
 apisettingController.contactDetailsData!.appEmail.isEmpty?
                                            Text(''):
                                             Container(
                                                child: Text(
                                                    apisettingController
                                                        .contactDetailsData!.appEmail,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 13.5, color: kblue)),
                                              ),
                                           ],
                                         ),
                                         ksizedbox10,
                                        Row(
                                          children: [
                                          apisettingController.contactDetailsData!.appAddress.isEmpty?
                                            Text(''):
                                             Container(
                                              width: 150,
                                                child: Text(
                                                    apisettingController
                                                        .contactDetailsData!.appAddress,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 13.5, color: kblue)),
                                              ),
                                          ],
                                        )
                                     ],
                                   )
                             
                                                                         
                                   
                                 ],
                               ),
                             ),
                           ),
                         ):Container()
                   ],
                 ),
               ),
              );
            }
          ),
    );
  }
}