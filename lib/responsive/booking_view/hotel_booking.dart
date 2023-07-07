import 'package:flutter/material.dart';

import '../../constant/constans.dart';

class MobileHotelBooking extends StatefulWidget {
  const MobileHotelBooking({super.key});

  @override
  State<MobileHotelBooking> createState() => _MobileHotelBookingState();
}

class _MobileHotelBookingState extends State<MobileHotelBooking> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 180,
                width: 380,
                color: kwhite,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/Rectangle 1877.png'),
                    ),
                    kwidth10,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ksizedbox10,
                        Row(
                          children: [
                            Text(
                              'Rich Hotels, Chennai',
                              style: TextStyle(fontSize: 21),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Image.asset(
                                'assets/images/Icon material-location-on.png')
                          ],
                        ),
                        Text(
                          'Date : 15/04/2023 to 16/04/2023',
                          style: TextStyle(color: kblue),
                        ),
                        Text(
                          'Check in : 03:44PM Check Out \n03:43 PM',
                          style: TextStyle(color: kblue),
                        ),
                        Text(
                          'Total Person : 5 Members',
                          style: TextStyle(color: kblue),
                        ),
                        Text(
                          'Ac Rooms',
                          style: TextStyle(color: kblue),
                        ),
                        ksizedbox10
                      ],
                    )
                  ],
                ),
              ),
             
            ],
          ),
          ksizedbox40,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 180,
                width: 380,
                color: kwhite,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/Rectangle 1877.png'),
                    ),
                    kwidth10,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ksizedbox10,
                        Row(
                          children: [
                            Text(
                              'Rich Hotels, Chennai',
                              style: TextStyle(fontSize: 21),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Image.asset(
                                'assets/images/Icon material-location-on.png')
                          ],
                        ),
                        Text(
                          'Date : 15/04/2023 to 16/04/2023',
                          style: TextStyle(color: kblue),
                        ),
                        Text(
                          'Check in : 03:44PM Check Out 03:43 PM',
                          style: TextStyle(color: kblue),
                        ),
                        Text(
                          'Total Person : 5 Members',
                          style: TextStyle(color: kblue),
                        ),
                        Text(
                          'Ac Rooms',
                          style: TextStyle(color: kblue),
                        ),
                        ksizedbox10
                      ],
                    )
                  ],
                ),
              ),
      
            ],
          ),
          ksizedbox40,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 180,
                width: 380,
                color: kwhite,
                child: Row(
                  children: [
                    Image.asset('assets/images/Rectangle 1877.png'),
                    kwidth10,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ksizedbox10,
                        Row(
                          children: [
                            Text(
                              'Rich Hotels, Chennai',
                              style: TextStyle(fontSize: 21),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Image.asset(
                                'assets/images/Icon material-location-on.png')
                          ],
                        ),
                        Text(
                          'Date : 15/04/2023 to 16/04/2023',
                          style: TextStyle(color: kblue),
                        ),
                        Text(
                          'Check in : 03:44PM Check Out 03:43 PM',
                          style: TextStyle(color: kblue),
                        ),
                        Text(
                          'Total Person : 5 Members',
                          style: TextStyle(color: kblue),
                        ),
                        Text(
                          'Ac Rooms',
                          style: TextStyle(color: kblue),
                        ),
                        ksizedbox10
                      ],
                    )
                  ],
                ),
              ),
            
            ],
          ),
         
          
        ],
      ),
      ),
    );
  }
}