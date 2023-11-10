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

          body: Column(
            children: [
              ksizedbox20,
              Row(
                children: [
                  Text('Time Slot',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: kblue
                  ),)
                ],
              ),
              Divider(),

              ksizedbox10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Days'),
                  Text('From'),
                  Text('To')
                ],
              )
            ],
          ),
    );
  }
}