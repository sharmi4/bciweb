import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/registerhomescreen/common_reg_homescreen.dart';
import 'package:flutter/material.dart';

import '../../registerhomescreen/common_reg_appbar';

class RegisterWalletScreen extends StatefulWidget {
  const RegisterWalletScreen({super.key});

  @override
  State<RegisterWalletScreen> createState() => _RegisterWalletScreenState();
}

class _RegisterWalletScreenState extends State<RegisterWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: RegisterCommonAppbar(), preferredSize: Size(double.infinity, 40)),
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
            ]
          ),
    );
  }
}