import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/registerhomescreen/business_comm_homecontainer.dart';
import 'package:bciweb/views/members/common_widget/business_common_screen.dart';
import 'package:flutter/material.dart';

class AddserviceTimeslotScreen extends StatefulWidget {
  const AddserviceTimeslotScreen({super.key});

  @override
  State<AddserviceTimeslotScreen> createState() => _AddserviceTimeslotScreenState();
}

class _AddserviceTimeslotScreenState extends State<AddserviceTimeslotScreen> {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              Column(
                children: [
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Container(
                          width: size.width*0.21,
                          child: Text('Time Slot',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: kblue
                          ),),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Divider(),
                  ),

                  ksizedbox10,
                  Padding(
                    padding: const EdgeInsets.only(left: 40,right: 100),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width*0.21,
                          child: Text('Days',
                          style: TextStyle(
                            fontSize: 18,
                            color: kgrey,
                            fontWeight: FontWeight.w500
                          ),),
                        ),
                        Container(
                          width: size.width*0.21,
                          child: Text('From',
                          style: TextStyle(
                            fontSize: 18,
                            color: kgrey,
                            fontWeight: FontWeight.w500
                          ),
                          ),
                        ),
                         Container(
                          width: size.width*0.21,
                           child: Text('To',
                           style: TextStyle(
                            fontSize: 18,
                            color: kgrey,
                            fontWeight: FontWeight.w500
                                             ),),
                         ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.circular(2)
                          ),
                         
                        )
                      ],
                    ),
                  ),
                   ksizedbox20,
                     Padding(
                    padding: const EdgeInsets.only(left: 40,right: 100),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width*0.21,
                          child: Text('Sunday',
                          style: TextStyle(
                            fontSize: 18,
                            color: kgrey,
                            fontWeight: FontWeight.w500
                          ),),
                        ),
                        Container(
                          height: 45,
                          width: size.width*0.21,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kwhite,
                            border: Border.all(
                              width: 1,
                              color: kgrey
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                Icon(Icons.schedule,
                                color: kgrey,)
                              ],
                            ),
                          ),
                        ),
                         Container(
                          height: 45,
                          width: size.width*0.21,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kwhite,
                            border: Border.all(
                              width: 1,
                              color: kgrey
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                Icon(Icons.schedule,
                                color: kgrey,)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: kOrange,
                            borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(
                            child: Icon(Icons.add,
                            color: kwhite,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  ksizedbox20,
                     Padding(
                    padding: const EdgeInsets.only(left: 40,right: 100),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width*0.21,
                          child: Text('Monday',
                          style: TextStyle(
                            fontSize: 18,
                            color: kgrey,
                            fontWeight: FontWeight.w500
                          ),),
                        ),
                        Container(
                          height: 45,
                          width: size.width*0.21,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kwhite,
                            border: Border.all(
                              width: 1,
                              color: kgrey
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                Icon(Icons.schedule,
                                color: kgrey,)
                              ],
                            ),
                          ),
                        ),
                         Container(
                          height: 45,
                          width: size.width*0.21,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kwhite,
                            border: Border.all(
                              width: 1,
                              color: kgrey
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                Icon(Icons.schedule,
                                color: kgrey,)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: kOrange,
                            borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(
                            child: Icon(Icons.add,
                            color: kwhite,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  ksizedbox20,
                     Padding(
                    padding: const EdgeInsets.only(left: 40,right: 100),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width*0.21,
                          child: Text('Tuesday',
                          style: TextStyle(
                            fontSize: 18,
                            color: kgrey,
                            fontWeight: FontWeight.w500
                          ),),
                        ),
                        Container(
                          height: 45,
                          width: size.width*0.21,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kwhite,
                            border: Border.all(
                              width: 1,
                              color: kgrey
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                Icon(Icons.schedule,
                                color: kgrey,)
                              ],
                            ),
                          ),
                        ),
                         Container(
                          height: 45,
                          width: size.width*0.21,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kwhite,
                            border: Border.all(
                              width: 1,
                              color: kgrey
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                Icon(Icons.schedule,
                                color: kgrey,)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: kOrange,
                            borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(
                            child: Icon(Icons.add,
                            color: kwhite,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  ksizedbox20,
                     Padding(
                    padding: const EdgeInsets.only(left: 40,right: 100),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width*0.21,
                          child: Text('Wednesday',
                          style: TextStyle(
                            fontSize: 18,
                            color: kgrey,
                            fontWeight: FontWeight.w500
                          ),),
                        ),
                        Container(
                          height: 45,
                          width: size.width*0.21,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kwhite,
                            border: Border.all(
                              width: 1,
                              color: kgrey
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                Icon(Icons.schedule,
                                color: kgrey,)
                              ],
                            ),
                          ),
                        ),
                         Container(
                          height: 45,
                          width: size.width*0.21,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kwhite,
                            border: Border.all(
                              width: 1,
                              color: kgrey
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                Icon(Icons.schedule,
                                color: kgrey,)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: kOrange,
                            borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(
                            child: Icon(Icons.add,
                            color: kwhite,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  ksizedbox20,
                     Padding(
                    padding: const EdgeInsets.only(left: 40,right: 100),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width*0.21,
                          child: Text('Thursday',
                          style: TextStyle(
                            fontSize: 18,
                            color: kgrey,
                            fontWeight: FontWeight.w500
                          ),),
                        ),
                        Container(
                          height: 45,
                          width: size.width*0.21,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kwhite,
                            border: Border.all(
                              width: 1,
                              color: kgrey
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                Icon(Icons.schedule,
                                color: kgrey,)
                              ],
                            ),
                          ),
                        ),
                         Container(
                          height: 45,
                          width: size.width*0.21,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kwhite,
                            border: Border.all(
                              width: 1,
                              color: kgrey
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                Icon(Icons.schedule,
                                color: kgrey,)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: kOrange,
                            borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(
                            child: Icon(Icons.add,
                            color: kwhite,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  ksizedbox20,
                     Padding(
                    padding: const EdgeInsets.only(left: 40,right: 100),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width*0.21,
                          child: Text('Friday',
                          style: TextStyle(
                            fontSize: 18,
                            color: kgrey,
                            fontWeight: FontWeight.w500
                          ),),
                        ),
                        Container(
                          height: 45,
                          width: size.width*0.21,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kwhite,
                            border: Border.all(
                              width: 1,
                              color: kgrey
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                Icon(Icons.schedule,
                                color: kgrey,)
                              ],
                            ),
                          ),
                        ),
                         Container(
                          height: 45,
                          width: size.width*0.21,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kwhite,
                            border: Border.all(
                              width: 1,
                              color: kgrey
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                Icon(Icons.schedule,
                                color: kgrey,)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: kOrange,
                            borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(
                            child: Icon(Icons.add,
                            color: kwhite,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  ksizedbox20,
                     Padding(
                    padding: const EdgeInsets.only(left: 40,right: 100),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width*0.21,
                          child: Text('saturday',
                          style: TextStyle(
                            fontSize: 18,
                            color: kgrey,
                            fontWeight: FontWeight.w500
                          ),),
                        ),
                        Container(
                          height: 45,
                          width: size.width*0.21,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kwhite,
                            border: Border.all(
                              width: 1,
                              color: kgrey
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                Icon(Icons.schedule,
                                color: kgrey,)
                              ],
                            ),
                          ),
                        ),
                         Container(
                          height: 45,
                          width: size.width*0.21,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kwhite,
                            border: Border.all(
                              width: 1,
                              color: kgrey
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                Icon(Icons.schedule,
                                color: kgrey,)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: kOrange,
                            borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(
                            child: Icon(Icons.add,
                            color: kwhite,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider()
                ],
              ),
            ],
          ),
    );
  }
}