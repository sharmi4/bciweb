import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/responsive/mobile_wdgets/comomappbar.dart';
import 'package:bciweb/views/members/common_widget/common.dart';
import 'package:bciweb/views/members/common_widget/commoncontainer.dart';
import 'package:flutter/material.dart';

import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../../registerhomescreen/common_reg_homescreen.dart';
import '../../mobile_wdgets/drawer.dart';
import '../../mobile_wdgets/mobile_common_bottom/bottom.dart';

//import '../common_widget/common_buttom.dart';
class RespoContact extends StatefulWidget {
  const RespoContact({super.key});

  @override
  State<RespoContact> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<RespoContact> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var subjectController = TextEditingController();
  var messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      drawer: MobileDrawer(),
      body: ListView(children: [
        Column(
          children: [
            // CommonContainer(),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/contactbackground.png',
                      ),
                      fit: BoxFit.cover)),
              child: Center(
                child: Text(
                  'CONTACT US',
                  style: TextStyle(fontSize: 30, color: kwhite),
                ),
              ),
            ),
            ksizedbox30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get In Touch With Contact Us',
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold, color: kblue),
                ),
              ],
            ),
            ksizedbox10,
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, \nsed do eiusmod tempor incididunt ut labore et \ndolore magna aliqua',
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            ksizedbox20,
            Stack(
              children: [
                Image.asset(
                  'assets/images/locationcontainer.png',
                  height: 190,
                  fit: BoxFit.fitHeight,
                ),
                Positioned(
                    top: 80,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Our Location',
                          style: TextStyle(fontSize: 19, color: kwhite),
                          textAlign: TextAlign.center,
                        ),
                        ksizedbox10,
                        Text(
                          '#781, Rayala Towers, 2nd Floor,\nAnna Salai, Mount Road, Chennai - 600002',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: kwhite),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/images/phonecontainer.png',
                  height: 190,
                  fit: BoxFit.fitHeight,
                ),
                Positioned(
                    top: 80,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Text(
                          'Phone Number',
                          style: TextStyle(fontSize: 19, color: kwhite),
                          textAlign: TextAlign.center,
                        ),
                        ksizedbox10,
                        Text(
                          '+91  9884 551 551',
                          style: TextStyle(fontSize: 13, color: kwhite),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            '+91  9884 660 660',
                            style: TextStyle(fontSize: 13, color: kwhite),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/images/gmailcontainer.png',
                  height: 190,
                  fit: BoxFit.fitHeight,
                ),
                Positioned(
                    top: 80,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Text(
                          'Email Id',
                          style: TextStyle(fontSize: 19, color: kwhite),
                          textAlign: TextAlign.center,
                        ),
                        ksizedbox10,
                        Text(
                          'customercare@bcipvtltd.com',
                          style: TextStyle(fontSize: 14, color: kwhite),
                        ),
                      ],
                    ))
              ],
            ),
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: kwhite,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: Offset(0.0, 0.75),
                          blurRadius: 4,
                          color: kgrey)
                    ],
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/contactbackground2.png',
                          height: 300,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 40),
                            child: TextField(
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  hintText: 'Your Name',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kgrey.withOpacity(0.1)))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 25),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: InputDecoration(
                                  hintText: 'Your Email',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kgrey.withOpacity(0.1)))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 40),
                            child: TextField(
                              controller: subjectController,
                              decoration: InputDecoration(
                                  hintText: 'Your Subject',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kgrey.withOpacity(0.1)))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 40),
                            child: Container(
                              color: kwhite,
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              child: TextField(
                                maxLines: 5,
                                controller: messageController,
                                decoration: InputDecoration(
                                    hintText: 'Your Message',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: kgrey.withOpacity(0.1)))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              height: 42,
                              width: MediaQuery.of(context).size.width * 0.31,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: LinearGradient(colors: [
                                    kyellow,
                                    kOrange,
                                  ])),
                              child: Center(
                                child: Text(
                                  'Send Message',
                                  style: TextStyle(color: kwhite, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ksizedbox40, ksizedbox40,
            MobileCommonBottom(),
          ],
        ),
      ]),
    );
  }
}
