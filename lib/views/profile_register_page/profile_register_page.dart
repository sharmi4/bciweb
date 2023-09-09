import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/constans.dart';
import '../members/homescreens/wallet_deposit_screen.dart';

class ProfileWalletScreen extends StatelessWidget {
  const ProfileWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  
                  width: MediaQuery.of(context).size.width - 195,
                  child: Column(
                    children: [
                      Container(
                
                        child: Stack(
                          children: [
                            Image.asset(
                                'assets/images/walletbackgroundimage.png'),
                            Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Center(
                                  child: Text(
                                    'Wallet Us',
                                    style: displayfont,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 50),
                        child: Row(
                          children: [
                            Text(
                              'Total Wallet',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: kblue),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 50),
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.29,
                              width: MediaQuery.of(context).size.width * 0.65,
                              decoration: BoxDecoration(
                                  color: korange,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(0.0, 0.75),
                                      color: kyellow,
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Total Wallet Amounts',
                                    style:TextStyle(
                                      color: Colors.white.withOpacity(0.91),
                                    fontSize: 23
                                    )
                                    ),
                                    Text('₹1990.00',
                                    style:TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color:Colors.white
                                    )),
                                    Text('Last Transaction Amount ₹1.00',
                                    style:TextStyle(
                                      fontSize: 23,
                                      color: Colors.white.withOpacity(0.91)
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20),
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
                                    InkWell(
                                      onTap: (){
                                        Get.to(WalletDepositScreen());
                                      },
                                      child: CircleAvatar(
                                        radius: 29,
                                        backgroundColor: kwhite.withOpacity(0.8),
                                        child: Image.asset('assets/icons/depositwalleticon.png',
                                        height: 30,fit:BoxFit.fitHeight,)),
                                    ),
                                    Text('Deposit \nCash',
                                    style: TextStyle(
                                      color:kwhite,
                                      fontSize: 20
                                    ),)
                                  ]
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 50, right: 42, top: 50),
                        child: Container(
                          height:550,
                          
                          decoration:BoxDecoration(
                            color:kwhite,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  offset: Offset(0.0, 0.75),
                                  blurRadius: 3,
                                  color: kgrey)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
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
                                      padding: const EdgeInsets.only(top:30),
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
                              Padding(
                                padding: const EdgeInsets.only(left:20),
                                child: Row(
                                  children:[
                                    Text('Today Transaction',)
                                  ]
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:2),
                                child: Divider(
                                  color: kblue,
                                ),
                              ),
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
                                             
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Luck Draw registration...',
                                                  style:TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold
                                                  )),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:7),
                                                    child: Row(
                                                      children: [
                                                        Text('20/04/2023'),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left:30),
                                                           child: Text('Ref.no:654'),
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
                                        Text('-₹4500',
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
                              Divider(),
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
                                             
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Wallet Using Withdraw Atm',
                                                  style:TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold
                                                  )),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:7),
                                                    child: Row(
                                                      children: [
                                                        Text('20/04/2023'),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left:30),
                                                           child: Text('Ref.no:654'),
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
                                        Text('₹5000',
                                        style:TextStyle(
                                          color:kblue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ))
                                      ]
                                    )
                                  ],
                                ),
                              ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 20,top:10),
                                 child: Row(
                                  children: [
                                    Text('Yesterday Transaction')
                                  ],
                                 ),
                               ),
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
                                             
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Money sent to Ankit',
                                                  style:TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold
                                                  )),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:7),
                                                    child: Row(
                                                      children: [
                                                        Text('20/04/2023'),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left:30),
                                                           child: Text('Ref.no:654'),
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
                                        Text('-₹4500',
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
                                             
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Money Received from Tom',
                                                  style:TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold
                                                  )),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:7),
                                                    child: Row(
                                                      children: [
                                                        Text('20/04/2023'),
                                                         Padding(
                                                           padding: const EdgeInsets.only(left:30),
                                                           child: Text('Ref.no:654'),
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
                                        Text('test',
                                        style:TextStyle(
                                           color:kblue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ))
                                      ]
                                    )
                                  ],
                                ),
                              ),
                            ]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
  }
}