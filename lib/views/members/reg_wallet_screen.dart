import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/registerhomescreen/common_reg_homescreen.dart';
import 'package:bciweb/views/members/common_widget/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../registerhomescreen/common_reg_bottom.dart';

class RegisterWalletScreen extends StatefulWidget {
  const RegisterWalletScreen({super.key});

  @override
  State<RegisterWalletScreen> createState() => _RegisterWalletScreenState();
}

class _RegisterWalletScreenState extends State<RegisterWalletScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
          body: ListView(
            children:[ Column(
              children: [
                RegisterCommonContainer(),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/Group 39755.png',
                    ),
                    fit: BoxFit.cover)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 125),
                    child: Text('Wallet Us',textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: kwhite),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 50),
                  child: Row(
                    children: [
                      Text('Total Wallet',
                      style: TextStyle(
                        fontSize: 32,
                        color: kblue,
                
                      ),)
                    ],
                  ),
                ),
                ksizedbox20,
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Row(
                    
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width*0.75,
                        decoration:BoxDecoration(
                          color: kOrange,
                          border: Border.all(
                            color: kyellow,
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25,left: 40),
                              child: Row(
                                children: [
                                  Text('Total Wallet Amounts',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: kwhite.withOpacity(0.8)
                                  ),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 40),
                              child: Row(
                                children: [
                                  Text('₹1990.00',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: kwhite
                                  ),),
                                  
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 40),
                              child: Row(
                                children: [
                                  Text('Last Transaction Amount ₹1.00',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: kwhite.withOpacity(0.8)
                                  ),),
                                  
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Container(
                          height: 150,
                          width: 120,
                        
                          decoration: BoxDecoration(
                                   color: kyellow,
                                  border: Border.all(
                                    color: kOrange
                                  ),
                                  borderRadius: BorderRadius.circular(5)
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/icons/walleticon.png',color: kwhite,)                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0,left: 20),
                                child: Row(
                                  children: [
                                    Text('Deposit \nCash',textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: kwhite,

                                    ),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ksizedbox40,
                Padding(
                  padding: const EdgeInsets.only(left: 60,right: 90),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: kwhite
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Transaction History')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 50),
              child: Row(
                children: [
                  Text(
                    'Total Wallet',
                    style: TextStyle(
                      fontSize: 32,
                      color: kblue,
                    ),
                  )
                ],
              ),
            ),
            ksizedbox20,
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                        color: kOrange,
                        border: Border.all(color: kyellow, width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 40),
                          child: Row(
                            children: [
                              Text(
                                'Total Wallet Amounts',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: kwhite.withOpacity(0.8)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 40),
                          child: Row(
                            children: [
                              Text(
                                '₹1990.00',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: kwhite),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 40),
                          child: Row(
                            children: [
                              Text(
                                'Last Transaction Amount ₹1.00',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: kwhite.withOpacity(0.8)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/add-wallet');
                      },
                      child: Container(
                        height: 150,
                        width: 120,
                        decoration: BoxDecoration(
                            color: kyellow,
                            border: Border.all(color: kOrange),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: kwhite,
                              child: Image.asset(
                                'assets/images/add-money-wallet-icon.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              'Deposit \nCash',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: kwhite,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ksizedbox40,
            // Padding(
            //   padding: const EdgeInsets.only(left: 60,right: 90),
            //   child: Container(
            //     height: MediaQuery.of(context).size.height*0.6,
            //     width: MediaQuery.of(context).size.width,
            //     decoration: BoxDecoration(
            //       color: kwhite
            //     ),
            //     child: Column(
            //       children: [
            //         Row(
            //           children: [
            //             Text('Transaction History')
            //           ],
            //         )
            //       ],
            //     ),
            //   ),
            // ),

            Container(
              decoration: BoxDecoration(
                  color: kwhite, borderRadius: BorderRadius.circular(7)),
              height: 625,
              width: size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transaction History',
                          style: TextStyle(fontSize: 25, color: kblue),
                        ),
                        Image.asset('assets/images/transactionicon.png')
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Today Transaction',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    ksizedbox10,
                    Divider(
                      thickness: 1,
                    ),
                    ksizedbox10,
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Luck Draw registration...',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              ksizedbox10,
                              Row(
                                children: [
                                  Text('20/04/2023              Ref.no:654')
                                ],
                              )
                            ],
                          ),
                          Text(
                            '-₹4500',
                            style: TextStyle(
                                color: korange,
                                fontWeight: FontWeight.w600,
                                fontSize: 19),
                          )
                        ],
                      ),
                    ),
                    ksizedbox10,
                    Divider(
                      thickness: 0.4,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Luck Draw registration...',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              ksizedbox10,
                              Row(
                                children: [
                                  Text('20/04/2023              Ref.no:654')
                                ],
                              )
                            ],
                          ),
                          Text(
                            '-₹4500',
                            style: TextStyle(
                                color: kblue,
                                fontWeight: FontWeight.w600,
                                fontSize: 19),
                          )
                        ],
                      ),
                    ),
                    ksizedbox10,
                    Divider(
                      thickness: 0.4,
                    ),
                    ksizedbox10,
                    Row(
                      children: [
                        Text(
                          'Yesterday Transaction',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    ksizedbox10,
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Luck Draw registration...',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              ksizedbox10,
                              Row(
                                children: [
                                  Text('20/04/2023              Ref.no:654')
                                ],
                              )
                            ],
                          ),
                          Text(
                            '-₹4500',
                            style: TextStyle(
                                color: korange,
                                fontWeight: FontWeight.w600,
                                fontSize: 19),
                          )
                        ],
                      ),
                    ),
                    ksizedbox10,
                    Divider(
                      thickness: 0.4,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Luck Draw registration...',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              ksizedbox10,
                              Row(
                                children: [
                                  Text('20/04/2023              Ref.no:654')
                                ],
                              )
                            ],
                          ),
                          Text(
                            '-₹4500',
                            style: TextStyle(
                                color: kblue,
                                fontWeight: FontWeight.w600,
                                fontSize: 19),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ksizedbox30,
         RegisterCommonBottom()  ],
        ),
       
      
    );
  }
}
