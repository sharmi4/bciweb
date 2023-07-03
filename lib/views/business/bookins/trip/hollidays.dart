import 'package:bciweb/constant/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';

class HolidaysScreen extends StatefulWidget {
  const HolidaysScreen({super.key});

  @override
  State<HolidaysScreen> createState() => _HolidaysScreenState();
}

class _HolidaysScreenState extends State<HolidaysScreen> {
  int holidayindex=0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
          child: Column(children: [
        RegisterCommonContainer(),
        Container(
          height: 450,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/5545.png',
                width: size.width,
              ),
              Positioned(bottom: 0,top: 0,
                  left: 0,
                  right: 0,
                 // top: 0,
                  child: Center(
                      child: Text('Turn Your Dream Holiday\n Into A Reality')
                          .text
                          .bold
                          .xl6
                          .white
                          .make())),
                          Positioned(
                            bottom: -1,
                           
                            child: Padding(
                              padding: const EdgeInsets.only(left: 40,top: 30),
                              child: Container(
                                height: 95,width: MediaQuery.of(context).size.width*0.92,
                                decoration: BoxDecoration(
                                  color: kwhite,
                                 border: Border.all(
                                color: kOrange,  // Border color
                                width: 2.0,          // Border width
                              ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text('Incredible Mauritius (EX - Delhi)',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5),
                                            child: Text('Starting From',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 19.5
                                            ),),
                                          ),
                                          Text('₹82990',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold
                                          ),),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 5),
                                            child: Text('Per Person On Twin Sharing',
                                            style: TextStyle(
                                              fontSize: 13.5
                                            ),),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                               //child: YourChildWidget(),  // Replace with your actual child widget
                              ),
                            ),
                          ),
        
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40,right: 50,top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.45,
                  decoration: BoxDecoration(
                    color: kOrange
                  ),
                  child: Column(
                    
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text('OVERVIEW',textAlign: TextAlign.center,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text('HOTEL DETAILS'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text('DAY WISE ITINERARY'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text('ADDITIONAL INFO'),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                holidayindex=0;
                              });
                            },
                            child: Container(
                                height: 2,
                                width: 68,
                                color:holidayindex==0?kwhite:kOrange,
                              ),
                          ),
                             InkWell(
                              onTap: (){
                                setState(() {
                                  holidayindex=1;
                                });
                              },
                               child: Container(
                                height: 2,
                                width:100,
                                color:holidayindex==1? kwhite:kOrange,
                                                         ),
                             ),
                             Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width*0.1,
                              color: kwhite,
                            ),
                             Container(
                              height:2,
                              width: MediaQuery.of(context).size.width*0.1,
                              color: kwhite,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
              
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10,top: 20),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width*0.4,
                      decoration: BoxDecoration(
                    color: kOrange
                      ),
              
                    ),
                  ],
                ),
              )
            ],
          ),
        ),


ksizedbox40,

        RegisterCommonBottom()
      ])),
    );
  }
}
