import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/constans.dart';
import '../../controller/auth_controller/auth_profile_controller.dart';
import '../../controller/setting_controller/setting_controller.dart';
import '../members/homescreens/wallet_deposit_screen.dart';

class ProfileWalletScreen extends StatefulWidget {
  const ProfileWalletScreen({super.key});

  @override
  State<ProfileWalletScreen> createState() => _ProfileWalletScreenState();
}

class _ProfileWalletScreenState extends State<ProfileWalletScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apisettingController.transactionHistoryDetails();
  }
    final apisettingController = Get.find<ApiSettingController>();
     final authprofileController = Get.find<AuthProfileController>();
  @override
  Widget build(BuildContext context) {
    return  Padding(
                padding: const EdgeInsets.only(top: 0),
                child:Container(
                  
                  width: MediaQuery.of(context).size.width - 195,
                  child: Column(
                    children: [
                      Container(
                
                        child: Stack(
                          children: [
                            Image.asset('assets/images/walletbackgroundimage.png'),
                            Positioned(
                              top:0,
                              left:0,
                              right:0,
                              bottom:0,
                              child: Center(
                                child: Text('Wallet',
                                   style: displayfont,
                                                          
                                ),
                              ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:40,left:50),
                        child: Row(
                          children: [
                            Text('Total Wallet',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color:kblue
                            ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30,left:50),
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.29,
                              width: MediaQuery.of(context).size.width*0.65,
                              decoration: BoxDecoration(
                               color:korange,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(0.0,0.75),
                                  color:kyellow,

                                )
                              ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left:20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Total Wallet Amounts',
                                    style:TextStyle(
                                      color: Colors.white.withOpacity(0.91),
                                    fontSize: 23
                                    )
                                    ),
                                   authprofileController.profileData.isNotEmpty? 
                                   Text('₹${authprofileController.profileData.first.walletAmount}',
                                    style:TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color:Colors.white
                                    )):Text(''),
                                    // Text('Last Transaction Amount ₹1.00',
                                    // style:TextStyle(
                                    //   fontSize: 23,
                                    //   color: Colors.white.withOpacity(0.91)
                                    // ))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20),
                              child: InkWell(
                                    onTap: (){
                                          Get.to(WalletDepositScreen());
                                        },
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.29,
                                  width:MediaQuery.of(context).size.width*0.11,
                                  decoration: BoxDecoration(
                                    color:kyellow,
                                    border: Border.all(
                                      color:korange
                                    )
                                  ),
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children:[
                                      CircleAvatar(
                                        radius: 29,
                                        backgroundColor: kwhite.withOpacity(0.8),
                                        child: Image.asset('assets/icons/depositwalleticon.png',
                                        height: 30,fit:BoxFit.fitHeight,)),
                                      Text('Deposit \nCash',
                                      style: TextStyle(
                                        color:kwhite,
                                        fontSize: 20
                                      ),)
                                    ]
                                  )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 20,left: 48,right: 40),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), color: kblue),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Reward points",
                                  style: primaryFont.copyWith(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons/reward_coin.png",
                                      height: 17,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                   if(authprofileController.profileData.isNotEmpty) Text(
                                      authprofileController.profileData.first.rewardPoints,
                                      style: primaryFont.copyWith(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:50,right:42,),
                        child: Container(
                          height:MediaQuery.of(context).size.height * 1.9,
                          decoration:BoxDecoration(
                            color:kwhite,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                offset: Offset(0.0, 0.75),
                                blurRadius: 3,
                                color:kgrey
                              )
                            ]
                          ),
                          child: 
                              Column(
                                children: [
                                    Padding(
                                padding: const EdgeInsets.only(left:20,right:20,top:0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Transaction History',
                                    style:TextStyle(
                                      fontSize: 20,
                                      color:kblue
                                    )),
                                    Padding(
                                      padding:  EdgeInsets.only(top:30),
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color:kwhite.withOpacity(0.6),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              offset: Offset(0.0,0.5),
                                               blurRadius: 1,
                                               color:kgrey
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(4)
                                        ),
                                        child: Center(
                                          child: Image.asset('assets/icons/historywalleticon.png',
                                          height: 30,fit:BoxFit.fitHeight,),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                                GetBuilder<ApiSettingController>(
                                  builder: (_) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: apisettingController.transactionhistorydata.length,
                                      itemBuilder: (context,index){
                                      return  Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children:[
                                                          
                                      Padding(
                                      padding: const EdgeInsets.only(left:10,right:20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                               
                                                children: [
                                                  Image.asset('assets/icons/amounticon.png',
                                                  height: 90,fit:BoxFit.fitHeight,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:20),
                                                    child: Column(
                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(apisettingController.transactionhistorydata[index].type,
                                                        style:TextStyle(
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.bold
                                                        )),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top:7),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            children: [
                                                               Text(formatDate(apisettingController.transactionhistorydata[index].createdAt,
                                         [dd ,'-',mm,'-',yyyy]), style: TextStyle(
                                                                  fontSize: 16
                                                                 ),),
                                                               Padding(
                                                                 padding: const EdgeInsets.only(left:40),
                                                                 child: Text(apisettingController.transactionhistorydata[index].transactionId,
                                                                 style: TextStyle(
                                                                  fontSize: 16
                                                                 ),),
                                                               )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ), 
                                                     ),  
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children:[
                                              Text('₹${apisettingController.transactionhistorydata[index].amount}',
                                              style:TextStyle(
                                                color:Colors.red,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold
                                              ))
                                            ]
                                          )
                                        ],
                                      ),
                                    ),
                                                          ]
                                      );
                              
                                    });
                                  }
                                ),
                                ]
                              ),
                         
                        ),
                      )
                    ],
                  ),
                )
              );
  }
}