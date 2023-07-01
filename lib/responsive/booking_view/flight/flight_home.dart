import 'package:flutter/material.dart';

import '../../../constant/constans.dart';
import '../booking_screen.dart';

class MobileFlightHome extends StatefulWidget {
  const MobileFlightHome({super.key});

  @override
  State<MobileFlightHome> createState() => _MobileFlightHomeState();
}

class _MobileFlightHomeState extends State<MobileFlightHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        children: [
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TO',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: kblue),
                        ),
                        ksizedbox10,
                        Text(
                          'CHE',
                          style: TextStyle(color: kblue, fontSize: 19),
                        ),
                        ksizedbox10,
                        Text(
                          'John F. \nKennedy Airport',
                          style: TextStyle(fontSize: 15, color: kblue),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10,right: 20),
                    child: Image.asset(
                      'assets/images/Group 39716.png',
                      height: 55,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10,top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'FROM',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: kblue),
                        ),
                        ksizedbox10,
                        Text(
                          'DEL',
                          style: TextStyle(fontSize: 19, color: kblue),
                        ),
                        ksizedbox10,
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(
                            'Abbotsford \nNational Airport',
                            style: TextStyle(color: kblue, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                height: 150,
                width: 390,
                decoration: BoxDecoration(
                    color: kwhite,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: Offset(0.0, 0.75), blurRadius: 5, color: kgrey),
                    ],
                    borderRadius: BorderRadius.circular(5)),
              ),
          ),
                    ksizedbox40,
        Padding(
          padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
          child: Container(
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TO',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: kblue),
                    ),
                    ksizedbox10,
                    Text(
                      'CHE',
                      style: TextStyle(color: kblue, fontSize: 19),
                    ),
                    ksizedbox10,
                    Text(
                      'John F. Kennedy \nAirport',
                      style: TextStyle(fontSize: 15, color: kblue),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/Group 39716.png',
                height: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FROM', 
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: kblue),
                    ),
                    ksizedbox10,
                    Text(
                      'DEL',
                      style: TextStyle(fontSize: 19, color: kblue),
                    ),
                    ksizedbox10,
                    Text(
                      'Abbotsford \nNational Airport',
                      style: TextStyle(color: kblue, fontSize: 15),
                    ),
                  ],
                ),
              ),  
            ]),  
            height: 150,
            width: 700,
            decoration: BoxDecoration(
                color: kwhite,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: Offset(0.0, 0.75), blurRadius: 5, color: kgrey),
                ],
                borderRadius: BorderRadius.circular(5)),
          ),
        ),
        ],
      ),

    );
        
       
   
  }
}