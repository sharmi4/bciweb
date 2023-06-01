import 'package:flutter/material.dart';

import '../../../../constant/constans.dart';
import '../../../mobile_wdgets/comomappbar.dart';

class MobileReferalScreen extends StatefulWidget {
  const MobileReferalScreen({super.key});

  @override
  State<MobileReferalScreen> createState() => _MobileReferalScreenState();
}

class _MobileReferalScreenState extends State<MobileReferalScreen> {
  var mobilereferalCOntroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
          body: Column(
            children: [
               Container(
                                 
                                   child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top:150,left: 25,right: 25),
                                        child: Center(
                                          child: Container(
                                            height:MediaQuery.of(context).size.height*0.6,
                                        
                                            decoration: BoxDecoration(
                                              color:kwhite,
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                  offset: Offset(0.0, 0.75),
                                                  blurRadius: 3,
                                                  color:kgrey
                                                )
                                              ],
                                              borderRadius: BorderRadius.circular(15)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 20),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Image.asset('assets/images/referalimage.png',
                                                       height: 180,
                                                       fit:BoxFit.fitHeight
                                                      ),
                                                      
                                                    ],
                                                  ),
                                                 ksizedbox10,
                                                  Text('Referral Code',
                                                  style: TextStyle(
                                                    fontSize: 23,
                                                    color: kblue
                                                  ),),
                                              
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:60,right:60,top:15),
                                                    child: Container(
                                                    
                                                      decoration: BoxDecoration(
                                                        color:kwhite,
                                                       
                                                        boxShadow: <BoxShadow>[
                                                          BoxShadow(
                                                            offset: Offset(0.0,0.75),
                                                            blurRadius: 2,
                                                            color:kgrey
                                                          )
                                                        ]
                                                      ),
                                                      child: TextField(
                                                        controller:mobilereferalCOntroller,
                                                        decoration: InputDecoration(
                                                          hintText: 'ABCDEF',
                                                          hintStyle: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w600,
                                                            color: kblue
                                                          ),
                                                          suffixIcon: Icon(Icons.file_copy,
                                                          color: kblue,size:40),
                                                          border: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: kblue
                                                            )
                                                          )
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:25,left: 40),
                                                    child: Row(
                                                      children: [
                                                        Text('Referral Count :',
                                                        style:TextStyle(
                                                          fontSize:23,
                                                          color:kblue
                                                        )),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left:20 ),
                                                          child: Container(
                                                            height: 30,
                                                            width:30,
                                                            decoration:BoxDecoration(
                                                              color:kOrange,
                                                              borderRadius: BorderRadius.circular(3)
                                                            ),
                                                            child:Center(child: Text('0',
                                                            style: TextStyle(
                                                              fontSize:20,
                                                              color:kwhite
                                                            ),),)
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                            left: 20
                                                          ),
                                                          child: Container(
                                                            height: 30,
                                                            width:30,
                                                            decoration:BoxDecoration(
                                                              color:kOrange,
                                                              borderRadius: BorderRadius.circular(3)
                                                            ),
                                                            child:Center(child: Text('0',
                                                            style: TextStyle(
                                                              color: kwhite,
                                                              fontSize: 20),),)
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 8),
                                                          child: Container(
                                                            height: 30,
                                                            width:30,
                                                            decoration:BoxDecoration(
                                                              color:kOrange,
                                                              borderRadius: BorderRadius.circular(3)
                                                            ),
                                                            child:Center(child: Text('0',
                                                            style: TextStyle(
                                                              color: kwhite
                                                            ),),)
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  ksizedbox40,
                                                 Container(
                                                  height: 38,
                                                  width: MediaQuery.of(context).size.width*0.33,
                                                  decoration: BoxDecoration(
                                                    color:korange,
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        offset: Offset(0.0, 0.75),
                                                        blurRadius: 5,
                                                        color: kyellow
                                                      )
                                                    ],
                                                  borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  child:Center(child: Text('Share Now',
                                                  style:TextStyle(
                                                    color:kwhite,
                                                    fontSize: 20
                                                  )))
                                                 )
                                                ]
                                              ),
                                            )),
                                        ),
                                      )
                                    ],
                                   ),
                               ),
            ],
          ),
    );
  }
}