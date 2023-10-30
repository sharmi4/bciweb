import 'package:bciweb/controller/profile_controller.dart';
import 'package:bciweb/registerhomescreen/business_common_reg_bottom.dart';
import 'package:bciweb/views/business/services_screens/business_withdraw_screen.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/constans.dart';
import '../../controller/auth_controller/auth_profile_controller.dart';
import '../../controller/setting_controller/setting_controller.dart';
import '../../registerhomescreen/business_comm_homecontainer.dart';
import '../../registerhomescreen/common_reg_bottom.dart';
import '../members/common_widget/business_common_screen.dart';
import '../members/homescreens/wallet_deposit_screen.dart';

class BusinessWalletScreen extends StatefulWidget {
  const BusinessWalletScreen({super.key});

  @override
  State<BusinessWalletScreen> createState() => _BusinessWalletScreenState();
}

class _BusinessWalletScreenState extends State<BusinessWalletScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authprofileController.getProfile();
    apisettingController.transactionHistoryDetails();
  }

  final apisettingController = Get.find<ApiSettingController>();
  final authprofileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BusinessCommonScreen(),
              BusinessCommonhomeContainer(),
            ],
          ),
          preferredSize: const Size(double.infinity, 110)),
      body: ListView(
        children: [
          GetBuilder<AuthProfileController>(
            builder: (_) {
              return Column(
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
                            child: Text('Wallet',
                               style: displayfont,
                                                      
                            ),
                          ))
                      ],
                    ),
                
                  Padding(
                    padding: const EdgeInsets.only(top:40,left:50),
                    child: Row(
                      children: [
                        Text('Total Wallet',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color:kblue
                        ),),
                      ],
                    ),
                  ),
                  ksizedbox40,
                  Padding(
                    padding: const EdgeInsets.only(top:0,left:0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 30),
                                  child: authprofileController.profileData.isNotEmpty
                                      ? Text(
                                          '₹${authprofileController.profileData.first.walletAmount}',
                                          style: TextStyle(
                                              fontSize: 21, color: kwhite),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 30),
                                          child: Text(
                                            '₹ 0.0',
                                            style: TextStyle(
                                                fontSize: 21, color: kwhite),
                                          ),
                                        ),
                                )
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
                                      if (authprofileController
                                      .profileData.first.bankAccountNumber !=
                                  "" &&
                              authprofileController.profileData.first.bankAccountName !=
                                  "" &&
                              authprofileController.profileData.first.ifscCode != "") {
                            Get.to(() => const EnterAmountForWithdrawalScreen());
                          } else {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, bottom: 2),
                                    child: Container(
                                      height: 130,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(top: 25),
                                                child: Text(
                                                  'Add Bank Account to Withdraw',
                                                  style: TextStyle(
                                                      fontSize: 17, color: kblue),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(170, 45),
                                                backgroundColor: kblue,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(15))),
                                            onPressed: () {
                                              //Get.to(const BankDetailsScreen());
                                            },
                                            child: const Text(
                                              'Add',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }
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
                                  Text('Withdraw \nCash',
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
                    padding: const EdgeInsets.only(left:70,right:70,top:50),
                    child: Container(
                  
                      
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
                                return apisettingController.transactionhistorydata.isEmpty?
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                     Image.asset('assets/images/nowalletimage.png',
                                     height: 300,fit: BoxFit.fitHeight,),
                                     ksizedbox30,
                                     Text('No Transaction History',
                                     style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: kblue
                                     ),)]),
                                ):  ListView.builder(
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
                                                child:  Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              apisettingController
                                                          .transactionhistorydata[
                                                              index]
                                                          .status ==
                                                      "credit"
                                                  ? Text(
                                                      "Credited",
                                                      style: primaryFont.copyWith(
                                                          color: Colors.black,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )
                                                  : Text(
                                                      "Debited",
                                                      style: primaryFont.copyWith(
                                                          color: Colors.black,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              apisettingController
                                                          .transactionhistorydata[
                                                              index]
                                                          .status ==
                                                      "credit"
                                                  ? Text(
                                                      "Credited on ${formatDate(apisettingController.transactionhistorydata[index].createdAt, [
                                                            dd,
                                                            "-",
                                                            mm,
                                                            "-",
                                                            yyyy,
                                                            " ",
                                                            hh,
                                                            ":",
                                                            nn,
                                                            " ",
                                                            am
                                                          ])}",
                                                      style: primaryFont.copyWith(
                                                          color: Colors.black45,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  : Text(
                                                      "Debited on ${formatDate(apisettingController.transactionhistorydata[index].createdAt, [
                                                            dd,
                                                            "-",
                                                            mm,
                                                            "-",
                                                            yyyy,
                                                            " ",
                                                            hh,
                                                            ":",
                                                            nn,
                                                            " ",
                                                            am
                                                          ])}",
                                                      style: primaryFont.copyWith(
                                                          color: Colors.black45,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                            ],
                                          ),
                                                 ),  
                                            ],
                                          ),
                                        ],
                                      ),
                                    apisettingController
                                                      .transactionhistorydata[index]
                                                      .status ==
                                                  "credit"
                                              ? Text(
                                                  "+ ₹${apisettingController.transactionhistorydata[index].amount}",
                                                  style: primaryFont.copyWith(
                                                      fontSize: 16,
                                                      color: Colors.green),
                                                )
                                              : Text(
                                                  "- ₹${apisettingController.transactionhistorydata[index].amount}",
                                                  style: primaryFont.copyWith(
                                                      fontSize: 16,
                                                      color: Colors.red),
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
              );
            }
          ),
          ksizedbox30,
          businessRegisterCommonBottom()
        ],
      ),
    );
  }
}
