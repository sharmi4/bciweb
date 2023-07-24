import 'package:bciweb/controller/flaight_payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constans.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';

class FlaightPaymentScreen extends StatefulWidget {
  const FlaightPaymentScreen({super.key});

  @override
  State<FlaightPaymentScreen> createState() => _FlaightPaymentScreenState();
}

class _FlaightPaymentScreenState extends State<FlaightPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final paymentController=Get.find<PaymentController>();
    return Scaffold(
             appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: Obx(()=>
       ListView(
          children: [
            Column(
              children: [
                 RegisterCommonContainer(),
                    Container(
                                   height: 405,
                                          width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image:AssetImage('assets/images/Group 39747.png',
                                    ),fit: BoxFit.cover )
                                  ),
                                      child:Center(
                                        child:paymentController.paymentindex.value==0? Text('Flight Book Confirmation',
                                        style: TextStyle(
                                          fontSize: 40,
                                          color: kwhite,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2
                                        ),):Text('',
                                        style: TextStyle(
                                          fontSize: 40,
                                          color: kwhite,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2
                                        ),),
                                      )),

                                      Padding(
                                        padding: const EdgeInsets.only(top:20,left: 50),
                                        child: Row(
                                          children: [
                                          Text('Confirmation',
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: kblue,
                                            fontWeight: FontWeight.bold
                                          ),)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 60,right: 60,top:40),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context).size.height*0.7,
                                                  width: MediaQuery.of(context).size.width*0.29,
                                                  decoration: BoxDecoration(
                                                    color: kwhite,
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        offset: Offset(0.0, 0.75),
                                                        color: kgrey,
                                                        blurRadius: 5
                                                      )
                                                    ],
                                                    borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top:20),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                            Column(
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text('From',
                                                                                          style: TextStyle(
                                                                                            fontSize:19,
                                                                                            color: kblue,
                                                                                            letterSpacing: 1,
                                                                                            fontWeight: FontWeight.bold
                                                                                          ),),
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.only(top:35),
                                                                                            child: Text('CHE',
                                                                                            style: TextStyle(
                                                                                                 color: kblue,
                                                                                              fontSize: 16
                                                                                            ),),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.only(top:35),
                                                                                            child: Text('John F. Kennedy Airport',
                                                                                            style: TextStyle(
                                                                                                 color: kblue,
                                                                                              fontSize: 13
                                                                                            ),),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.only(top: 35),
                                                                                            child: Text('Terminal \n02',
                                                                                            style: TextStyle(
                                                                                                 color: kblue,
                                                                                              fontSize: 16,
                                                                                                 height: 2
                                                                                            ),),
                                                                                          ),
                                                                                          
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.only(top:20),
                                                                                            child: Text('Seat \n24H',
                                                                                            style: TextStyle(
                                                                                                 color: kblue,
                                                                                                 height: 2,
                                                                                              fontSize: 16
                                                                                            ),),
                                                                                          ),
                                                                                          
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.only(top:20),
                                                                                            child: Text('Date \n05.05.2023',
                                                                                            style: TextStyle(
                                                                                              fontSize: 16,
                                                                                                 color: kblue,
                                                                                              height: 2
                                                                                            ),),
                                                                                          )
                                                                                    
                                                                                        ],
                                                                                       ),
                                                        Column(
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text('To',
                                                                                          style: TextStyle(
                                                                                            fontSize:19,
                                                                                            color: kblue,
                                                                                            letterSpacing: 1,
                                                                                            fontWeight: FontWeight.bold
                                                                                          ),),
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.only(top:35),
                                                                                            child: Text('DEL',
                                                                                            style: TextStyle(
                                                                                                 color: kblue,
                                                                                              fontSize: 16
                                                                                            ),),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.only(top:35),
                                                                                            child: Text('Abbotsford National Airport',
                                                                                            style: TextStyle(
                                                                                                 color: kblue,
                                                                                              fontSize: 13
                                                                                            ),),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.only(top: 35),
                                                                                            child: Text('Gate \n12',
                                                                                            style: TextStyle(
                                                                                                 color: kblue,
                                                                                              fontSize: 16,
                                                                                                 height: 2
                                                                                            ),),
                                                                                          ),
                                                                                          
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.only(top:20),
                                                                                            child: Text('Boarding \n14:54',
                                                                                            style: TextStyle(
                                                                                                 color: kblue,
                                                                                                 height: 2,
                                                                                              fontSize: 16
                                                                                            ),),
                                                                                          ),
                                                                                          
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.only(top:20),
                                                                                            child: Text('Flight \nTK 2411',
                                                                                            style: TextStyle(
                                                                                              fontSize: 16,
                                                                                                 color: kblue,
                                                                                              height: 2
                                                                                            ),),
                                                                                          )
                                                                                    
                                                                                        ],
                                                                                       ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context).size.height*0.26,
                                                  width: MediaQuery.of(context).size.width*0.27,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                   boxShadow: <BoxShadow>[
                                                    BoxShadow(
                                                      offset: Offset(0.0, 0.75),
                                                      blurRadius: 5,
                                                      color: kgrey
                                                    )
                                                   ],
                                                    color: kwhite
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top:20,left: 20),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Mr. Bugra Dere',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: kblue
                                                        ),),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top:40),
                                                          child: Text('bugra@dere.com'),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top:20),
                                                          child: Row(children: [
                                                            Text('(+1)'),
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 10),
                                                              child: Text('81280089900'),
                                                            )
                                                          ],),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                 Padding(
                                                   padding: const EdgeInsets.only(top:60),
                                                   child: Container(
                                                      height: 45,
                                                       width: MediaQuery.of(context).size.width*0.27,
                                                       decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                     gradient: LinearGradient(colors: [
                                                    kyellow,
                                                    kOrange
                                                   ])
                                                    ),
                                                     child:Center(
                                                    child: Text('Payments',
                                                    style: TextStyle(
                                                    color: kwhite,
                                                    fontSize: 17
                                                     ),),
                                                     ) ,
                                                    ),
                                                 )
                                              ],
                                            ),

                                           
                                          ],
                                        ),
                                      ),
                                      ksizedbox20,
              ],
            ),
          ],
        ),
      ),
    );
  }
}