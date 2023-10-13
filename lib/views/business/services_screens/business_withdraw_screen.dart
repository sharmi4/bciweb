
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constant/constans.dart';
import '../../../registerhomescreen/business_comm_homecontainer.dart';
import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../members/common_widget/business_common_screen.dart';

class EnterAmountForWithdrawalScreen extends StatefulWidget {
  const EnterAmountForWithdrawalScreen({super.key});

  @override
  State<EnterAmountForWithdrawalScreen> createState() =>
      _EnterAmountForWithdrawalScreenState();
}

class _EnterAmountForWithdrawalScreenState
    extends State<EnterAmountForWithdrawalScreen> {
  var amountController = TextEditingController();

  final profileController = Get.find<AuthProfileController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                        child: Text('Withdraw Money',
                           style: displayfont,
                                                  
                        ),
                      ))
                  ],
                ),
                ksizedbox40,
                Column(
                  children: [
                        Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text('Available Balance  :',
                  style: TextStyle(
                    fontSize: 20,
                    color: kblue
                
                  ),),
                ),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.4,
                 decoration: BoxDecoration(
                  border: Border.all(
                    color: kgrey,
                  )
                 ),
                 child: profileController.profileData.isNotEmpty? 
                           Text('₹${profileController.profileData.first.walletAmount}',
                            style:TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color:kblue
                            )):Text('₹ 0.0',
                            style:TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color:kblue
                            )
                            ),
                ),
              ),
              
             
            ],
          ),
          ksizedbox40,
                     Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text('Withdraw Amount :',
                  style: TextStyle(
                    fontSize: 20,
                    color: kblue
                
                  ),),
                ),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.4,
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 18, color: kblue),
                        prefix: Text(
                          "₹ ",
                          style: primaryFont.copyWith(),
                        ),
                        border: const OutlineInputBorder(
                          
                        )),
                  ),
                ),
              ),
              ksizedbox40,
             
            ],
          ),
          
           Obx(()=>
         
             Padding(
               padding: const EdgeInsets.only(left: 190,top: 50),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   profileController.isLoading.isTrue?
                     Container(
                        height: 55,
                        width: size.width*0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40), color: kOrange),
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                     )
                     : InkWell(
                      onTap: () {
                        if (amountController.text.isNotEmpty) {
                          profileController.withdrawAmountFromWallet(
                              amount: amountController.text);
                        }
                      },
                      child:Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width*0.4,
                        decoration: BoxDecoration(
                          color: kOrange,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child:  Center(
                          child: Text(
                                  "Withdraw",
                                  style: TextStyle(
                                    color: kwhite,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                        ),
                            
                        
                      ),
                    ),
                 ],
               ),
             )
              
           ),
            ksizedbox40,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width*0.67 ,
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        
                          Text('Withdraw Money To',
                          style: TextStyle(
                            color: kblue,
                            fontSize: 19,
                            fontWeight: FontWeight.w600
                          ),),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width*0.1,
                            decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Add Bank',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: kwhite,
                                  fontWeight: FontWeight.w600
                                ),),
                                Icon(Icons.add_circle,
                                color: kwhite,)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(

                            children: [
                                Image.asset('assets/images/withdrawbankimage.png'),
                              Text('Primary Bank Account',
                              style: TextStyle(
                                fontSize: 20,
                                color: kblue
                              ),),
                            ],
                          ),
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                                   color: kOrange
                            ),
                            child: Center(
                              child: Icon(Icons.check,
                              color: kwhite,),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
                  ],
                ),
                
         
           
            ksizedbox30,
            RegisterCommonBottom()
         
        ],
      ),
    );
  }
}
