import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/registerhomescreen/business_comm_homecontainer.dart';
import 'package:bciweb/views/members/common_widget/business_common_screen.dart';
import 'package:bciweb/views/members/common_widget/common.dart';

import 'package:flutter/material.dart';

import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../../registerhomescreen/common_reg_homescreen.dart';

class BusinessContactScreen extends StatefulWidget {
  const BusinessContactScreen({super.key});

  @override
  State<BusinessContactScreen> createState() => _BusinessContactScreenState();
}

class _BusinessContactScreenState extends State<BusinessContactScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var subjectController = TextEditingController();
  var messageController = TextEditingController();
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
      body: ListView(children: [
        Column(
          children: [
            //RegisterCommonContainer(),
            // CommonContainer(),
            Container(
              height: 235,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/contactbackground.png',
                      ),
                      fit: BoxFit.cover)),
              child: Center(
                child: Text('CONTACT US', style: displayfont),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                'Get In Touch With Contact Us',
                style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold, color: kblue),
              ),
            ),
            //  Padding(
            //    padding: const EdgeInsets.only(top: 10),
            //    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, \nsed do eiusmod tempor incididunt ut labore et \ndolore magna aliqua',
            //    style: TextStyle(fontSize: 15,),
            //    textAlign: TextAlign.center,),
            //  ),
            ksizedbox20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/locationcontainer.png',
                      height: 184,
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
                              'Corporate Office',
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

                 

//  Stack(
//                     children: [
//                       Image.asset(
//                         'assets/images/gmailcontainer.png',
//                         height: 190,
//                         fit: BoxFit.fitHeight,
//                       ),
//                       Positioned(
//                           top: 80,
//                           left: 0,
//                           right: 0,
//                           child: Column(
//                             children: [
//                               Text(
//                                 'Contact Us',
//                                 style: TextStyle(fontSize: 19, color: kwhite),
//                                 textAlign: TextAlign.center,
//                               ),
//                              // ksizedbox10,
//                               Text(
//                                 'customercare@bcipvtltd.com',
//                                 style: TextStyle(fontSize: 14, color: kwhite),
//                               ),   ksizedbox10,
//                               Text(
//                                 '+91  9884 551 551',
//                                 style: TextStyle(fontSize: 13, color: kwhite),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 2),
//                                 child: Text(
//                                   '+91  9884 660 660',
//                                   style: TextStyle(fontSize: 13, color: kwhite),
//                                 ),
//                               )
//                             ],
//                           ))
//                     ],
//                   ),

                Stack(
                  children: [
                    Image.asset(
                       'assets/images/phonecontainer.png',
                      height: 184,
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
                              'Registered office',
                              style: TextStyle(fontSize: 19, color: kwhite),
                              textAlign: TextAlign.center,
                            ),
                            ksizedbox10,
                            Text(
                              'Address : ShopNo.S101,Door No.769 , Suite #25, Spencer Plaza, Anna Road, Chennai-600002.',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14, color: kwhite),
                            )
                          ],
                        ))
                  ],
                ),
                Stack(
                  children: [
                    Image.asset( 'assets/images/locationcontainer.png',
                    
                      height: 184,
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
                              'Club house',
                              style: TextStyle(fontSize: 19, color: kwhite),
                              textAlign: TextAlign.center,
                            ),
                            //  ksizedbox10,
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '414/2B3, Bollineni Hillside West, Perumbakkam Main Road, Nookampalayam, Arasankazhani, Sithalapakkam, Chennai 600126.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14, color: kwhite),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ))
                  ],
                ),
               
               Stack(
                  children: [
                    Image.asset(
                      'assets/images/phonecontainer.png',
                      height: 184,
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
                              'Contact Us',
                              style: TextStyle(fontSize: 19, color: kwhite),
                              textAlign: TextAlign.center,
                            ),
                           // ksizedbox10,
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                'customercare@bcipvtltd.com',
                                style: TextStyle(fontSize: 14, color: kwhite),
                              ),
                            ), 
                            Text(
                              '+91  9884 551 551',
                              style: TextStyle(fontSize: 13, color: kwhite),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text(
                                '+91  9884 660 660',
                                style: TextStyle(fontSize: 13, color: kwhite),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.86,
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
                child: Row(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/contactbackground2.png')
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 130, right: 40, top: 40),
                            child: TextField(
                              textInputAction: TextInputAction.next,
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
                                left: 130, right: 40, top: 25),
                            child: TextField(
                              textInputAction: TextInputAction.next,
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
                                left: 130, right: 40, top: 40),
                            child: TextField(
                              textInputAction: TextInputAction.next,
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
                                left: 130, right: 40, top: 40),
                            child: Container(
                              color: kwhite,
                              height: 120,
                              width: MediaQuery.of(context).size.width,
                              child: TextField(
                                maxLines: 120,
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
                                    style:
                                        TextStyle(color: kwhite, fontSize: 16),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ksizedbox40,
            RegisterCommonBottom()
          ],
        ),
      ]),
    );
  }
}
