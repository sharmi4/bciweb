import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../constant/constans.dart';
import '../../../mobile_wdgets/comomappbar.dart';

class MobileSuportScreen extends StatefulWidget {
  const MobileSuportScreen({super.key});

  @override
  State<MobileSuportScreen> createState() => _MobileSuportScreenState();
}

class _MobileSuportScreenState extends State<MobileSuportScreen> {
   var mobilenameController=TextEditingController();
 
  var mobilesubNameController=TextEditingController();
  var mobilesubMobileController=TextEditingController();
  var mobilesubEmailController=TextEditingController();
  var mobilesubDescriptionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
          body: Container(
          
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
                     
                     Padding(
                       padding: const EdgeInsets.only(top: 70),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               minimumSize: Size(MediaQuery.of(context).size.width*0.7, 
                               45),
                               backgroundColor: kblue
                             ),
                             onPressed: (){}, 
                           child: Text('Submit',
                           style: TextStyle(
                             fontSize: 17,
                             color: kwhite
                           ),)),
                         ],
                       ),
                     ),
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
                                        Text('+91 9876543210',
                                        style: TextStyle(
                                        color: kblue,
                                        fontSize: 13.5
                                        ),),
                                      ],
                                    ),
                                    ksizedbox10,
                                     Row(
                                       children: [
                                         Text("Customer@gmail.com",
                                    style: TextStyle(
                                          color: kblue,
                                          fontSize: 13.5
                                    ),),
                                       ],
                                     ),
                                     ksizedbox10,
                                    Row(
                                      children: [
                                        Text('No 781, Second Street, \nNew Chennai, \nTamil nadu-600021.',
                                   style: TextStyle(
                                         color: kblue,
                                         fontSize: 13.5
                                   ),),
                                      ],
                                    )
                                 ],
                               )
                         
                                                                     
                               
                             ],
                           ),
                         ),
                       ),
                     )
               ],
             ),
           ),
          ),
    );
  }
}