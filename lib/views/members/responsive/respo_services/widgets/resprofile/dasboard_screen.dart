import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constant/constans.dart';
import '../../../../../../controller/profile_show_controller.dart';
import '../../../../../../controller/reg_profile_controller.dart';
import '../../../mobile_wdgets/comomappbar.dart';
class DasBoardScreen extends StatefulWidget {
  const DasBoardScreen({super.key});

  @override
  State<DasBoardScreen> createState() => _DasBoardScreenState();
}

class _DasBoardScreenState extends State<DasBoardScreen> {
  final reghomeController=Get.find<RegisterProfileController>();
  final regshowController=Get.find<ProfileShowController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
          body: Column(
            children: [
      
                       Padding(
                         padding: const EdgeInsets.only(top: 50),
                         child: Container(
                      
                           child: Column(
                            children: [
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:20),
                                    child: Text('Hello, Benze',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: kblue,
                                      fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                 Padding(
                                   padding: const EdgeInsets.only(right: 20),
                                   child: Image.asset('assets/images/profileimage.png',
                                   height: 70,fit: BoxFit.fitHeight,),
                                 ),
                                ],
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 20),
                                 child: Row(
                                   children: [
                                     Text('View Profile',
                                     style:TextStyle(color: kblue) ,),
                                   ],
                                 ),
                               ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 1,
                                      width: 80,
                                      color: kgrey,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50,top: 80),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width*0.73,
                                      decoration: BoxDecoration(
                                        color: kwhite,
                                        border: Border.all(
                                          color: kblue
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                         boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        offset: Offset(0.0, 0.75),
                                                        blurRadius: 5,
                                                        color: kgrey
                                                      )
                                                    ]
                                      ),
                                      child: Row(
                                        children: [
                                         Padding(
                                           padding: const EdgeInsets.only(left: 30),
                                           child: Text('Wallet Amount',
                                           style: TextStyle(
                                            fontSize: 17,
                                            color: kblue
                                           ),),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 50),
                                           child: Text('₹ 1.00',textAlign: TextAlign.end,
                                           style: TextStyle(
                                            fontSize: 17,
                                            color: kblue,
                                           ),),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 13),
                                           child: CircleAvatar(
                                            radius: 15,
                                            backgroundColor: kblue,
                                            child: Icon(Icons.chevron_right,color: kwhite,),
                                           ),
                                         )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50,top: 25),
                                    child: Text('Your Coupons',
                                    style: TextStyle(
                                      fontSize:22,
                                      color: kblue
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 50,top: 25),
                                    child: Text('View',style: TextStyle(
                                      fontSize: 22,
                                      color: kyellow
                                    ),),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50,top:35),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 140,
                                      width: MediaQuery.of(context).size.width*0.73,
                                      decoration: BoxDecoration(
                                        color: kwhite,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: kgrey,
                                            blurRadius: 5,
                                            offset: Offset(0.0,0.75)
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 0,top: 15),
                                                child: Container(
                                                  height:70,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: kwhite,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: kblue)
                                                  ),
                                                      child: Center(child: Text('0',
                                                       style: TextStyle(
                                                        fontSize: 22
                                                      ),textAlign: TextAlign.center,)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top:15,left: 5),
                                                child: Container(
                                                  height:70,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: kwhite,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: kblue)
                                                  ),
                                                      child: Center(child: Text('0',
                                                       style: TextStyle(
                                                        fontSize: 22
                                                      ),textAlign: TextAlign.center,)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 0,top:15),
                                                child: Container(
                                                  height:70,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: kwhite,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: kblue)
                                                  ),
                                                  child: Center(child: Text('0',
                                                   style: TextStyle(
                                                        fontSize: 22
                                                      ),textAlign: TextAlign.center,)),
                                                ),
                                              ),
                                              
                                            ],

                                          ),
                                         
                                          Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10,top:10),
                                                    child: Text('Total',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: kblue
                                                    ),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:10,left: 10),
                                                    child: Text('Used',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: kblue
                                                    ),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 0,
                                                    top:10),
                                                    child: Text('Pending',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: kblue
                                                    ),),
                                                  )
                                                ],
                                              )
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                                 Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 43,top: 45),
                                    child: Text('Your Referrals',
                                    style: TextStyle(
                                      fontSize:22,
                                      color: kblue
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 43,top: 45),
                                    child: Text('Invite',style: TextStyle(
                                      fontSize: 22,
                                      color: kyellow
                                    ),),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50,top:35),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 140,
                                      width: MediaQuery.of(context).size.width*0.73,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                        color: kwhite,
                                         boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        offset: Offset(0.0, 0.75),
                                                        blurRadius: 5,
                                                        color: kgrey
                                                      )
                                                    ]
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 0,top: 15),
                                                child: Container(
                                                  height:70,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: kwhite,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: kblue)
                                                  ),
                                                      child: Center(child: Text('0',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 22
                                                      ),)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top:15),
                                                child: Container(
                                                  height:70,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: kwhite,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: kblue),
                                                   
                                                  ),
                                                      child: Center(child: Text('0',
                                                      style: TextStyle(
                                                        fontSize: 22
                                                      ),textAlign: TextAlign.center,)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 0,top:15),
                                                child: Container(
                                                  height:70,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: kwhite,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: kblue)
                                                  ),
                                                  child: Center(child: Text('0',
                                                   style: TextStyle(
                                                        fontSize: 22
                                                      ),textAlign: TextAlign.center,)),
                                                ),
                                              ),
                                              
                                            ],

                                          ),
                                         
                                          Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10,top:5),
                                                    child: Text('Total',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: kblue
                                                    ),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:5,left: 5),
                                                    child: Text('Used',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: kblue
                                                    ),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 5,
                                                    top:5),
                                                    child: Text('Pending',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: kblue
                                                    ),),
                                                  )
                                                ],
                                              )
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                         
                            ],
                           ),
                         ),
                       ),
            ],
          ),
    );
  }
}