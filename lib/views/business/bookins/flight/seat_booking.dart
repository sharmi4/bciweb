import 'package:bciweb/controller/seat_controller.dart';
import 'package:bciweb/views/business/bookins/flight/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constans.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';
import '../../../members/common_widget/common_buttom.dart';

class FlaightSeatsBookingScreen extends StatefulWidget {
  const FlaightSeatsBookingScreen({super.key});

  @override
  State<FlaightSeatsBookingScreen> createState() => _FlaightSeatsBookingScreenState();
}

class _FlaightSeatsBookingScreenState extends State<FlaightSeatsBookingScreen> {
  @override
  Widget build(BuildContext context) {
    final seatController=Get.find<SeatController>();
    return Scaffold(
        appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
          body: Obx(()=> ListView(
            children: [Column(
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
                                  child:seatController.seatindex.value==0? Text('Flight Seats Choose',
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: kwhite,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2
                                  ),):Text('Boarding Pass',
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: kwhite,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2
                                  ),),
                                )),
                                if(seatController.seatindex.value==0)
                                Padding(
                                  padding: const EdgeInsets.only(left: 90,top:40),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: MediaQuery.of(context).size.width*0.84,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        color: kwhite,
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              offset: Offset(0.0, 0.75),
                                              blurRadius: 5,
                                              color: kgrey
                                            )
                                          ]
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                           GestureDetector(
                                            onTap: (){
                                              seatController.seatindex(0);
                                              seatController.update();
                                            },
                                             child: Container(
                                              height: 55,
                                              width: MediaQuery.of(context).size.width*0.25,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                               color: seatController.seatindex.value==0? kyellow:kwhite
                                              ),
                                              child: Center(child: Text('Economy',
                                              style: TextStyle(
                                                 fontSize: 20,
                                                color: seatController.seatindex.value==0?kwhite:Colors.black
                                              ),)),
                                             ),
                                           ),
                                            GestureDetector(
                                              onTap: (){
                                                seatController.seatindex(1);
                                                seatController.update();
                                              },
                                              child: Container(
                                              height: 55,
                                              width: MediaQuery.of(context).size.width*0.25,
                                              decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(10),
                                               color:seatController.seatindex.value==1? kyellow:kwhite
                                              ),
                                              child: Center(child: Text('Business',
                                              style: TextStyle(
                                                fontSize: 20,
                                             color: seatController.seatindex.value==1?kwhite:Colors.black
                                              ),)),
                                                                                       ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                if(seatController.seatindex.value==0)
                               Padding(
                                 padding: const EdgeInsets.only(top:20),
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text('Economy ',
                                     style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: kblue
                                     ),),
                                     Text('72 Seats Available',
                                     style: TextStyle(
                                      fontSize: 20,
                                    color: kblue
                                     ),)
                                   ],
                                 ),
                               ),
                                 if(seatController.seatindex.value==0)
                                   Container(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                          Image.asset('assets/images/seatwhite.jpg',
                                          ),
                                           Image.asset('assets/images/seatwhite.jpg',
                                          ),
                                           Image.asset('assets/images/seatwhite.jpg',
                                         ),
                                         Image.asset('assets/images/seatorange.jpg',
                                          )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                               ),
                               if(seatController.seatindex.value==1)
                               Padding(
                                 padding: const EdgeInsets.only(top:30,left: 60),
                                 child: Row(
                                  children: [
                                    Text('Boarding Pass',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: kblue,
                                      fontWeight: FontWeight.bold
                                    ),)
                                  ],
                                 ),
                               ),
                               if(seatController.seatindex.value==1)
                               Padding(
                                 padding: const EdgeInsets.only(left: 60,right: 60,top:20),
                                 child: Container(
                                  height: MediaQuery.of(context).size.height*0.8,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                    padding: const EdgeInsets.only(left: 20,top: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('From',
                                        style: TextStyle(
                                          fontSize:20,
                                          color: kblue,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold
                                        ),),
                                        Padding(
                                          padding: const EdgeInsets.only(top:35),
                                          child: Text('CHE',
                                          style: TextStyle(
                                               color: kblue,
                                            fontSize: 17
                                          ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:35),
                                          child: Text('John F. Kennedy Airport',
                                          style: TextStyle(
                                               color: kblue,
                                            fontSize: 17
                                          ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 35),
                                          child: Text('Terminal \n02',
                                          style: TextStyle(
                                               color: kblue,
                                            fontSize: 17,
                                               height: 2
                                          ),),
                                        ),
                                        
                                        Padding(
                                          padding: const EdgeInsets.only(top:20),
                                          child: Text('Seat \n24H',
                                          style: TextStyle(
                                               color: kblue,
                                               height: 2,
                                            fontSize: 17
                                          ),),
                                        ),
                                        
                                        Padding(
                                          padding: const EdgeInsets.only(top:35),
                                          child: Text('Date \n05.05.2023',
                                          style: TextStyle(
                                            fontSize: 18,
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
                                          fontSize:20,
                                          color: kblue,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold
                                        ),),
                                        Padding(
                                          padding: const EdgeInsets.only(top:35),
                                          child: Text('DEL',
                                          style: TextStyle(
                                               color: kblue,
                                            fontSize: 17
                                          ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:35),
                                          child: Text('Abbotsford National Airport',
                                          style: TextStyle(
                                               color: kblue,
                                            fontSize: 17
                                          ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 35),
                                          child: Text('Gate \n01',
                                          style: TextStyle(
                                               color: kblue,
                                            fontSize: 17,
                                               height: 2
                                          ),),
                                        ),
                                        
                                        Padding(
                                          padding: const EdgeInsets.only(top:20),
                                          child: Text('Boarding \n01:25',
                                          style: TextStyle(
                                               color: kblue,
                                               height: 2,
                                            fontSize: 17
                                          ),),
                                        ),
                                        
                                        Padding(
                                          padding: const EdgeInsets.only(top:35),
                                          child: Text('Flight \nTK 2411',
                                          style: TextStyle(
                                            fontSize: 18,
                                               color: kblue,
                                            height: 2
                                          ),),
                                        )
                                  
                                      ],
                                     ),
                                     Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top:50),
                                          child: Container(
                                            height: 180,
                                            width: 200,
                                            
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
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset('assets/images/boardingimage.png',
                                                height: 130,fit: BoxFit.contain,),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 70),
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.offAll(FlaightPaymentScreen());
                                            },
                                            child: Container(
                                              height: 45,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(colors: [
                                                  kyellow,
                                                  kOrange
                                                ]),
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              width: MediaQuery.of(context).size.width*0.16,
                                              child: Center(
                                                child: Text('Confirmation',
                                                style: TextStyle(
                                                  color: kwhite,
                                                  fontSize: 16
                                                ),),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                     )
                                      ],
                                    ),
                                  ),
                                 ),
                               ),
                               ksizedbox20,
                                 CommonBottom()
                ],
              ),
            ]
          ),
          ),
    );
  }
}