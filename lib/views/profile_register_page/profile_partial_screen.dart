import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/setting_controller/setting_controller.dart';
import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePartialScreen extends StatefulWidget {
  const ProfilePartialScreen({super.key});

  @override
  State<ProfilePartialScreen> createState() => _ProfilePartialScreenState();
}

class _ProfilePartialScreenState extends State<ProfilePartialScreen> {

  final settingController = Get.find<ApiSettingController>();
  bool hotelbool = false;
  bool busbool = false;
  bool flightbool = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
       width: MediaQuery.of(context).size.width - 195,
       child: Column(
        children: [
           Stack(
                      children: [
                        Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset('assets/images/businesswalletbackgroundimage.png',
                          fit: BoxFit.cover,)),
                        Positioned(
                          top:0,
                          left:0,
                          right:0,
                          bottom:0,
                          child: Center(
                            child: Text('Partial Collect',
                               style: displayfont,
                                                      
                            ),
                          ))
                      ],
                    ),
                    ksizedbox20,
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Text('Details',
                          style: TextStyle(
                            fontSize: 22,
                            color: kblue,
                            fontWeight: FontWeight.w600
                          ),),
                        ],
                      ),
                    ),
                    ksizedbox30,
                    Padding(
                      padding: const EdgeInsets.only(left: 40,right: 40),
                      child: Container(
                        height: 250,
                        width:size.width ,

                        decoration: BoxDecoration(
                          color: kwhite,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 5,
                              color: kgrey
                            )
                          ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                  
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Plan Name',
                                      style: TextStyle(
                                        color: kblue
                                      ),),
                                      Text('Platinum',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500
                                      ),)
                                    ],
                                  ),
                                                                    Column(
                                  
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Plan Amount',
                                      style: TextStyle(
                                        color: kblue
                                      ),),
                                      Text('₹ 15,000',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500
                                      ),)
                                    ],
                                  ),
                                ],
                              ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Paid',
                                      style: TextStyle(
                                        color: kblue
                                      ),),
                                      Text('₹ 10,700',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500
                                      ),)
                                    ],
                              ), Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Unpaid',
                                      style: TextStyle(
                                        color: kblue
                                      ),),
                                      Text('₹ 10,700',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: kblue,
                                        fontWeight: FontWeight.w500
                                      ),)
                                    ],
                              ),
                              
                                  ],
                                ),
                                Divider(),
                              
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Status',
                                    style: TextStyle(
                                      color: kblue
                                    ),),
                                    Container(
                                      height: 25,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color:Colors.yellow[200],
                                          boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                  offset: Offset(0.0, 0.75),
                                                  color: kgrey,
                                                
                                                )
                                              ],
                                              borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                            
                                              color: kOrange,
                                              shape: BoxShape.circle
                                            ),
                                          ),
                                          Text('Pending',
                                          style: TextStyle(
                                            color: kblue
                                          ),),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                      ksizedbox30,
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Text('Transactions Details',
                          style: TextStyle(
                            fontSize: 22,
                            color: kblue,
                            fontWeight: FontWeight.w600
                          ),),
                        ],
                      ),
                    ),
                    ksizedbox30,
                    Padding(
                      padding: const EdgeInsets.only(left: 40,right: 40),
                      child: Container(
                        height: 180,
                        width:size.width ,

                        decoration: BoxDecoration(
                          color: kwhite,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 5,
                              color: kgrey
                            )
                          ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                      
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(

                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Checkbox(
                                                    shape: CircleBorder(),
                                                    value:hotelbool, 
                                                  onChanged:(value){
                                                    setState(() {
                                                      hotelbool = value!;
                                                    });
                                                  }),
                                                   Container(
                                            height:20,
                                            width: 1.5,
                                            color: kgrey,
                                          ),
                                                ],
                                              ),
                                              Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Payment 1',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color: kblue
                                                ),),
                                                Text('Remaining Amount',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: kblue
                                                ),)
                                              ],
                                            ),
                                            ],
                                          ),
                                         
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Checkbox(
                                                    shape: CircleBorder(),
                                                    value:flightbool, 
                                          onChanged:(value){
                                                    setState(() {
                                                      flightbool = value!;
                                                    });
                                          }),
                                           Container(
                                            height:20,
                                            width: 1.5,
                                            color: kgrey,
                                          ),
                                                  ],
                                                ),
                                           Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Payment 2',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color: kblue
                                                ),),
                                                Text('paid on 03 Nov,2023',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: kblue
                                                ),)
                                              ],
                                            ),
                                              ],
                                            ),
                                         
                                          Row(
                                            children: [
                                              Checkbox(
                                                focusColor: Color(0xff4BAE4F)
                                                //MaterialStatePropertyAll(Color(0xff4BAE4F)),
                                              ,
                                                shape: CircleBorder(),
                                                value:busbool, 
                                              onChanged:(value){
                                                setState(() {
                                                  busbool = value!;
                                                });
                                              }),
                                               Row(
                                                 children: [
                                                   Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                    Text('Payment 3',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w500,
                                                      color: kblue
                                                    ),),
                                                    Text('paid on 03 Oct,2023',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: kblue
                                                    ),)
                                              ],
                                            ),
                                                 ],
                                               ),
                                               
                                            ],
                                          ),
                                        ],
                                      ),
                                    
                                    ],
                                  ),
                                
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          ksizedbox10,
                                          Text('₹ 50,700',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: kblue,
                                            fontWeight: FontWeight.w500
                                          ),),
                                          ksizedbox20,
                                          Text('₹ 1,700',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: kblue,
                                            fontWeight: FontWeight.w500
                                          ),),
                                          ksizedbox20,
                                          Text('₹ 1,700',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color:kblue,
                                            fontWeight: FontWeight.w500
                                          ),),
                                        ],
                                      )
                                ],
                              ),
                            
                            ],
                          ),
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