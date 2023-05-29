import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/specialized_controller.dart';
import 'package:bciweb/responsive/mobile_wdgets/comomappbar.dart';
//import 'package:bciweb/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../../registerhomescreen/common_reg_homescreen.dart';
import '../../views/members/reg_wallet_screen.dart';
import '../mobile_wdgets/drawer.dart';
import '../mobile_wdgets/mobile_common_bottom/bottom.dart';

class RespoSpecialized extends StatefulWidget {
  // ignore: constant_identifier_names
  static const Namedroutes = '/specializedscreen';

  @override
  State<RespoSpecialized> createState() => _SpecializedScreenState();
}

class _SpecializedScreenState extends State<RespoSpecialized> {
  final specialController = Get.find<SpecializedController>();

  @override
  Widget build(BuildContext context) { var size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: const PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
          drawer: MobileDrawer(),
      body: Obx(
        () => ListView(
            //physics:ScrollPhysics(),
            children: [
              // CommonContainer(),

              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/speclbackground.png',
                          ),
                          fit: BoxFit.fill)),
                  child: Center(
                      child: Text(
                    'SPECIALIZED US',
                    style: TextStyle(
                        fontSize: 30,
                        color: kwhite,
                        fontWeight: FontWeight.w700),
                  ))),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SERVICES',
                      style: TextStyle(
                          fontSize: 21.5,
                          color: kOrange,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                ),
                child: Text(
                  'FIND THE SPECIALIZED US YOU NEED',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    color: kblue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Membership features are the benefits or privileges that a member of a particular \ngroup or organization receives. These features can vary widely depending on the \ntype of membership and the goals and objectives of the \norganization. Some common membership features include:',
                      textAlign: TextAlign.center,
                      style: TextStyle(height: 2),
                    ),
                  ],
                ),
              ),
              ksizedbox30,
              InkWell(
                onTap: () {
                  Get.toNamed('/subscribe');
                },
                child: Container(
                  height: 220,
                  width: 230,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: Offset(0.0, 0.75),
                          blurRadius: 1,
                          color: kgrey)
                    ],
                    color: kwhite,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'assets/images/packages.png',
                          height: 50,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      ksizedbox20,
                      Text(
                        'SUBSCRIBE PACKAGES',
                        style: TextStyle(
                            color: kblue, fontWeight: FontWeight.bold),
                      ),
                      ksizedbox20,
                      Text(
                        'These packages can include a range \nof features and benefits, such as',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, height: 1.2),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 220,
                width: 230,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: Offset(0.0, 0.75),
                        blurRadius: 1,
                        color: kgrey)
                  ],
                  color: kwhite,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.asset(
                        'assets/images/membership.png',
                        height: 50,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text('MEMBERSHIPS',
                          style: TextStyle(
                              color: kblue, fontWeight: FontWeight.bold)),
                    ),
                    ksizedbox20,
                    Text(
                      'Memberships are typically offered by \norganizations or groups as a way for \nindividuals to gain access to specific \nbenefits or privileges.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, height: 1.2),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/respo-coupon');
                },
                child: Container(
                  height: 220,
                  width: 230,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: Offset(0.0, 0.75),
                          blurRadius: 1,
                          color: kgrey)
                    ],
                    color: kwhite,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: InkWell(
                            onTap: () {
                              Get.toNamed('/respo-offer');
                            },
                            child: Image.asset(
                              'assets/images/coupons.png',
                              height: 50,
                              fit: BoxFit.fitHeight,
                            )),
                      ),
                      ksizedbox20,
                      Text('COUPONS',
                          style: TextStyle(
                              color: kblue, fontWeight: FontWeight.bold)),
                      ksizedbox20,
                      Text(
                        'Coupons are a type of promotional \noffer that provides a discount or \nspecial deal on a product or service.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, height: 1.2),
                      )
                    ],
                  ),
                ),
              ),
           //   ksizedbox30,
              Container(
                height: 215,
                width: 230,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: Offset(0.0, 0.75),
                        blurRadius: 1,
                        color: kgrey)
                  ],
                  color: kwhite,
                ),
                child: Column(
                  children: [ksizedbox10,
                    Container(
                      child: Image.asset(
                        'assets/images/booking.png',
                        height: 50,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    ksizedbox20,
                    Text('BOOKINGS',
                        style: TextStyle(
                            color: kblue, fontWeight: FontWeight.bold)),
                    ksizedbox20,
                    Text(
                      'Bookings refer to the process of \nreserving or scheduling a particular \nservice, event, or accommodation.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, height: 1.2),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/respo-offer');
                },
                child: Container(
                  height: 220,
                  width: 230,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: Offset(0.0, 0.75),
                          blurRadius: 1,
                          color: kgrey)
                    ],
                    color: kwhite,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'assets/images/offers.png',
                          height: 50,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text('OFFERS',
                            style: TextStyle(
                                color: kblue, fontWeight: FontWeight.bold)),
                      ),
                      ksizedbox20,
                      Text(
                        'Offers are promotions or deals that \ncompanies or businesses provide to \ntheir customers in order to incentivize \nthem to make a purchase or take. advantage of a specific service.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, height: 1.2),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
              //    Get.to(RegisterWalletScreen());
                },
                child: Container(
                  height: 220,
                  width: 230,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: Offset(0.0, 0.75),
                          blurRadius: 1,
                          color: kgrey)
                    ],
                    color: kwhite,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'assets/images/wallets.png',
                          height: 50,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'WALLETS',
                          style: TextStyle(
                              color: kblue, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Digital wallets are software \napplications that allow users to securely store and manage various \npayment methods, such as bank account information.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13, height: 1.2),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Container(
              //  width: size.width,
                color: kgrey.withOpacity(0.2),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/speclbackground2.png',
                     //   height: 300,
                    //  fit: BoxFit.cover,
                 //    width: size.width,
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'CLUB SERVICES',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              color: kblue,
                              fontWeight: FontWeight.bold),
                        ),
                        ksizedbox10,
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 7,
                              width: 60,
                              color: kOrange,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Club services refer to the various \namenities and offerings provided by \nclubs to their members. These services \ncan vary widely depending on the type of \nclub and its focus, but may include.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: kblue, height: 2),
                          ),
                        ),
                        ksizedbox20,
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kblue,
                                minimumSize: Size(160, 40)),
                            onPressed: () {},
                            child: Text(
                              'Subscribe Now',
                              style: TextStyle(fontSize: 16),
                            )),ksizedbox30
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/homebackground.png'))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        'SERVICES',
                        style: TextStyle(
                            fontSize: 21.5,
                            color: kOrange,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ksizedbox20,
                    Text(
                      'FIND THE SERVICES YOU NEED',
                      style: TextStyle(
                          fontSize: 26,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    ksizedbox20,
                    Text(
                      'I"d be happy to help you find the services you need! Can you please provide me \nwith some more information about what type of services you are looking for? \nHere are some examples of services that people often search for',
                      textAlign: TextAlign.center,
                      style: TextStyle(height: 2),
                    ),
                    ksizedbox30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 90,
                          width: 100,
                          decoration: BoxDecoration(
                              color: kOrange,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: Offset(0.0, 0.75),
                                    blurRadius: 5,
                                    color: kOrange)
                              ]),
                          child: Center(
                              child: Text(
                            '01',
                            style: TextStyle(color: kwhite, fontSize: 35),
                          )),
                        ),
                        Container(
                          height: 90,
                          width: 100,
                          decoration: BoxDecoration(
                              color: kyellow,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: Offset(0.0, 0.75),
                                    blurRadius: 5,
                                    color: kyellow)
                              ]),
                          child: Center(
                              child: Text(
                            '03',
                            style: TextStyle(color: kwhite, fontSize: 35),
                          )),
                        )
                      ],
                    ),
                    ksizedbox20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'SUBSCRIBE',
                          style: TextStyle(
                              fontSize: 21,
                              color: kOrange,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'PURCHASE',
                          style: TextStyle(
                              color: kyellow,
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 90,
                          width: 100,
                          decoration: BoxDecoration(
                              color: kblue,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: Offset(0.0, 0.75),
                                    blurRadius: 5,
                                    color: kblue)
                              ]),
                          child: Center(
                            child: Text(
                              '02',
                              style: TextStyle(fontSize: 35, color: kwhite),
                            ),
                          ),
                        )
                      ],
                    ),
                    ksizedbox20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'MEMBERSHIPS',
                          style: TextStyle(
                              fontSize: 21,
                              color: kblue,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
              ksizedbox40,
              Text(
                'FREQUENTLY ASKED QUESTIONS',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: kblue),
              ),ksizedbox20,
              //starting
              specialController.specialindex.value == 0
                  ? Container(
                  //  alignment: Alignment.center,
                    height: 110,
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: kgrey.withOpacity(0.1),
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20,left: 10),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.start,
                              children: [
                                Text(
                                  'What is the Benze Club International Community?',
                                  style: TextStyle(
                                      color: Color(0xff2980B9),
                                      fontSize: 15.5),
                                ),
                              //  Icon(Icons.expand_less)
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              'The Benze Club International Community is where members can interact with other members, ask questions, share insights, learn from experiences, find answers, plan holidays better and earn Trip Coins.',
                              style: TextStyle(fontSize: 13),
                            ),
                          )
                        ]),
                  )
                  : GestureDetector(
                      onTap: () {
                        specialController.specialindex(0);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.only(top: 30, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'What is the Benze Club International Community?',
                              style: TextStyle(
                                fontSize: 15.5,
                                color: Color(0xff2980B9),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 50),
                              //  child: Icon(Icons.expand_more),
                            )
                          ],
                        ),
                      ),
                    ), //ending

              specialController.specialindex.value == 1
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 50),
                      child: Container(
                     //   alignment: Alignment.center,
                        height: 110,
                        width: MediaQuery.of(context).size.width * 0.2,
                        color: kgrey.withOpacity(0.1),
                        child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        'Are all members a part of the community?',
                                        style: TextStyle(
                                            color: Color(0xff2980B9),
                                            fontSize: 15.5),
                                      ),
                                    ),
                               //     Icon(Icons.expand_less)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, ),
                                child: Text(
                                  'Participating in the community is open only to Benze Club International members. We are in the process of extending participation invites.',
                                  style: TextStyle(fontSize: 13),
                                ),
                              )
                            ]),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        specialController.specialindex(1);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.only(top: 30, left: 10, ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Are all members a part of the community?',
                              style: TextStyle(
                                fontSize: 15.5,
                                color: Color(0xff2980B9),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 50),
                              //   child: Icon(Icons.expand_more),
                            )
                          ],
                        ),
                      ),
                    ), //ending

              specialController.specialindex.value == 2
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top:10),
                      child: Container(
//alignment: Alignment.center,
                        height: 110,
                        width: MediaQuery.of(context).size.width * 0.2,
                        color: kgrey.withOpacity(0.1),
                        child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20,left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'What is a mission?',
                                      style: TextStyle(
                                          color: Color(0xff2980B9),
                                          fontSize: 15.5),
                                    ),
                                 //   Icon(Icons.expand_less)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  'Any action you can take on the community is known as a mission. Most missions are structured to help other members as well as to help you earn Trip Coins. Missions can range from writing travel diaries to participating in forums to sharing stories. You can login to see the missions available to you.',
                                  style: TextStyle(fontSize: 13),
                                ),
                              )
                            ]),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        specialController.specialindex(2);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.only(top: 30, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'What is a mission?',
                              style: TextStyle(
                                fontSize: 15.5,
                                color: Color(0xff2980B9),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 50),
                              //    child: Icon(Icons.expand_more),
                            )
                          ],
                        ),
                      ),
                    ), //ending

              // specialController.specialindex.value == 3
              //     ? Padding(
              //         padding:
              //             const EdgeInsets.only(left: 200, right: 200, top: 50),
              //         child: Container(
              //           alignment: Alignment.center,
              //           height: 110,
              //           width: MediaQuery.of(context).size.width * 0.2,
              //           color: kgrey.withOpacity(0.1),
              //           child: const Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Padding(
              //                   padding: EdgeInsets.only(top: 20),
              //                   child: Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceAround,
              //                     children: [
              //                       Padding(
              //                         padding: EdgeInsets.only(right: 300),
              //                         child: Text(
              //                           'Why should I take up a mission?',
              //                           style: TextStyle(
              //                               color: Color(0xff2980B9),
              //                               fontSize: 15.5),
              //                         ),
              //                       ),
              //                       Icon(Icons.expand_less)
              //                     ],
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.only(top: 10, left: 80),
              //                   child: Text(
              //                     'Take up a mission so that you can share your experiences, making the community richer. Also, on completion of certain missions, you will be rewarded with Trip Coins.',
              //                     style: TextStyle(fontSize: 13),
              //                   ),
              //                 )
              //               ]),
              //         ),
              //       )
              //     : GestureDetector(
              //         onTap: () {
              //           specialController.specialindex(3);
              //         },
              //         child: const Padding(
              //           padding:
              //               EdgeInsets.only(top: 30, left: 100, right: 100),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 'Why should I take up a mission?',
              //                 style: TextStyle(
              //                   fontSize: 15.5,
              //                   color: Color(0xff2980B9),
              //                 ),
              //               ),
              //               Padding(
              //                 padding: EdgeInsets.only(right: 50),
              //                 //     child: Icon(Icons.expand_more),
              //               )
              //             ],
              //           ),
              //         ),
              //       ), //ending

              // specialController.specialindex.value == 4
              //     ? Padding(
              //         padding:
              //             const EdgeInsets.only(left: 200, right: 200, top: 50),
              //         child: Container(
              //           alignment: Alignment.center,
              //           height: 110,
              //           width: MediaQuery.of(context).size.width * 0.2,
              //           color: kgrey.withOpacity(0.1),
              //           child: const Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Padding(
              //                   padding: EdgeInsets.only(top: 20),
              //                   child: Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceAround,
              //                     children: [
              //                       Padding(
              //                         padding: EdgeInsets.only(right: 300),
              //                         child: Text(
              //                           'What are the first missions on the community?',
              //                           style: TextStyle(
              //                               color: Color(0xff2980B9),
              //                               fontSize: 15.5),
              //                         ),
              //                       ),
              //                       Icon(Icons.expand_less)
              //                     ],
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.only(top: 10, left: 80),
              //                   child: Text(
              //                     'Complete your member profile: Fill up all the blank spaces so that you can make the most of the community.',
              //                     style: TextStyle(fontSize: 13),
              //                   ),
              //                 )
              //               ]),
              //         ),
              //       )
              //     : GestureDetector(
              //         onTap: () {
              //           specialController.specialindex(4);
              //         },
              //         child: Padding(
              //           padding: const EdgeInsets.only(
              //               top: 30, left: 100, right: 100),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 'What are the first missions on the community?',
              //                 style: TextStyle(
              //                   fontSize: 15.5,
              //                   color: Color(0xff2980B9),
              //                 ),
              //               ),
              //               Padding(
              //                 padding: EdgeInsets.only(right: 50),
              //                 // child: Icon(Icons.expand_more),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),

              // specialController.specialindex.value == 5
              //     ? Padding(
              //         padding:
              //             const EdgeInsets.only(left: 200, right: 200, top: 50),
              //         child: Container(
              //           alignment: Alignment.center,
              //           height: 110,
              //           width: MediaQuery.of(context).size.width * 0.2,
              //           color: kgrey.withOpacity(0.1),
              //           child: const Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Padding(
              //                   padding: EdgeInsets.only(top: 20),
              //                   child: Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceAround,
              //                     children: [
              //                       Padding(
              //                         padding: EdgeInsets.only(right: 300),
              //                         child: Text(
              //                           'What are notifications?',
              //                           style: TextStyle(
              //                               color: Color(0xff2980B9),
              //                               fontSize: 15.5),
              //                         ),
              //                       ),
              //                       Icon(Icons.expand_less)
              //                     ],
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.only(top: 10, left: 80),
              //                   child: Text(
              //                     'You will receive notifications about the status of your stories, discussions and also about the Trip Coins you’ve earned via the community. You’ll also be notified about new happenings in the community.',
              //                     style: TextStyle(fontSize: 13),
              //                   ),
              //                 )
              //               ]),
              //         ),
              //       )
              //     : GestureDetector(
              //         onTap: () {
              //           specialController.specialindex(5);
              //         },
              //         child: Padding(
              //           padding: const EdgeInsets.only(
              //               top: 30, left: 100, right: 100),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 'What are notifications?',
              //                 style: TextStyle(
              //                   fontSize: 15.5,
              //                   color: Color(0xff2980B9),
              //                 ),
              //               ),
              //               Padding(
              //                 padding: EdgeInsets.only(right: 50),
              //                 //    child: Icon(Icons.expand_more),
              //               )
              //             ],
              //           ),
              //         ),
              //       ), //ending

              // specialController.specialindex.value == 6
              //     ? Padding(
              //         padding:
              //             const EdgeInsets.only(left: 200, right: 200, top: 50),
              //         child: Container(
              //           alignment: Alignment.center,
              //           height: 110,
              //           width: MediaQuery.of(context).size.width * 0.2,
              //           color: kgrey.withOpacity(0.1),
              //           child: const Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Padding(
              //                   padding: EdgeInsets.only(top: 20),
              //                   child: Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceAround,
              //                     children: [
              //                       Padding(
              //                         padding: EdgeInsets.only(right: 300),
              //                         child: Text(
              //                           'What is BCI Cares?',
              //                           style: TextStyle(
              //                               color: Color(0xff2980B9),
              //                               fontSize: 15.5),
              //                         ),
              //                       ),
              //                       Icon(Icons.expand_less)
              //                     ],
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.only(top: 10, left: 80),
              //                   child: Text(
              //                     'The section features sustainability and social initiatives from our resorts, experiences available at our resorts and a showcase of how the member community connects. ',
              //                     style: TextStyle(fontSize: 13),
              //                   ),
              //                 )
              //               ]),
              //         ),
              //       )
              //     : GestureDetector(
              //         onTap: () {
              //           specialController.specialindex(6);
              //         },
              //         child: Padding(
              //           padding: const EdgeInsets.only(
              //               top: 30, left: 100, right: 100),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 'What is BCI Cares?',
              //                 style: TextStyle(
              //                   fontSize: 15.5,
              //                   color: Color(0xff2980B9),
              //                 ),
              //               ),
              //               Padding(
              //                 padding: EdgeInsets.only(right: 50),
              //                 //    child: Icon(Icons.expand_more),
              //               )
              //             ],
              //           ),
              //         ),
              //       ), //ending

              // specialController.specialindex.value == 7
              //     ? Padding(
              //         padding:
              //             const EdgeInsets.only(left: 200, right: 200, top: 50),
              //         child: Container(
              //           alignment: Alignment.center,
              //           height: 110,
              //           width: MediaQuery.of(context).size.width * 0.2,
              //           color: kgrey.withOpacity(0.1),
              //           child: const Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Padding(
              //                   padding: EdgeInsets.only(top: 20),
              //                   child: Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceAround,
              //                     children: [
              //                       Padding(
              //                         padding: EdgeInsets.only(right: 300),
              //                         child: Text(
              //                           'What can I do before my holiday to get BCI Coins?',
              //                           style: TextStyle(
              //                               color: Color(0xff2980B9),
              //                               fontSize: 15.5),
              //                         ),
              //                       ),
              //                       Icon(Icons.expand_less)
              //                     ],
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.only(top: 10, left: 80),
              //                   child: Text(
              //                     'If you have taken a holiday before with us, do share your travel diary. You can also participate in Club Talk, polls, and quizzes to get BCI Coins. We also have Community contests from time to time that can help you earn BCI Coins. Keep sharing and keep accumulating BCI Coins so that you can have a better holiday.',
              //                     style: TextStyle(fontSize: 13),
              //                   ),
              //                 )
              //               ]),
              //         ),
              //       )
              //     : GestureDetector(
              //         onTap: () {
              //           specialController.specialindex(7);
              //         },
              //         child: const Padding(
              //           padding:
              //               EdgeInsets.only(top: 30, left: 100, right: 100),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 'What can I do before my holiday to get BCI Coins?',
              //                 style: TextStyle(
              //                   fontSize: 15.5,
              //                   color: Color(0xff2980B9),
              //                 ),
              //               ),
              //               Padding(
              //                 padding: EdgeInsets.only(right: 50),
              //                 //    child: Icon(Icons.expand_more),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),

              // specialController.specialindex.value == 8
              //     ? Padding(
              //         padding:
              //             const EdgeInsets.only(left: 200, right: 200, top: 50),
              //         child: Container(
              //           alignment: Alignment.center,
              //           height: 110,
              //           width: MediaQuery.of(context).size.width * 0.2,
              //           color: kgrey.withOpacity(0.1),
              //           child: const Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Padding(
              //                   padding: EdgeInsets.only(top: 20),
              //                   child: Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceAround,
              //                     children: [
              //                       Padding(
              //                         padding: EdgeInsets.only(right: 300),
              //                         child: Text(
              //                           'Where can I get answers to Booking and Membership queries?',
              //                           style: TextStyle(
              //                               color: Color(0xff2980B9),
              //                               fontSize: 15.5),
              //                         ),
              //                       ),
              //                       Icon(Icons.expand_less)
              //                     ],
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.only(top: 10, left: 80),
              //                   child: Text(
              //                     'For queries on Bookings and Membership, do visit the Contact page on the member website',
              //                     style: TextStyle(fontSize: 13),
              //                   ),
              //                 )
              //               ]),
              //         ),
              //       )
              //     : GestureDetector(
              //         onTap: () {
              //           specialController.specialindex(8);
              //         },
              //         child: const Padding(
              //           padding:
              //               EdgeInsets.only(top: 30, left: 100, right: 100),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 'Where can I get answers to Booking and Membership queries?',
              //                 style: TextStyle(
              //                   fontSize: 15.5,
              //                   color: Color(0xff2980B9),
              //                 ),
              //               ),
              //               Padding(
              //                 padding: EdgeInsets.only(right: 50),
              //                 //    child: Icon(Icons.expand_more),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),

              // specialController.specialindex.value == 9
              //     ? Padding(
              //         padding:
              //             const EdgeInsets.only(left: 200, right: 200, top: 50),
              //         child: Container(
              //           alignment: Alignment.centerLeft,
              //           height: 110,
              //           width: MediaQuery.of(context).size.width * 0.2,
              //           color: kgrey.withOpacity(0.1),
              //           child: const Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Padding(
              //                   padding: EdgeInsets.only(top: 20),
              //                   child: Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceAround,
              //                     children: [
              //                       Padding(
              //                         padding: EdgeInsets.only(right: 300),
              //                         child: Text(
              //                           'What can I do with my BCI Coins?',
              //                           style: TextStyle(
              //                               color: Color(0xff2980B9),
              //                               fontSize: 15.5),
              //                         ),
              //                       ),
              //                       Icon(Icons.expand_less)
              //                     ],
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.only(top: 10, left: 80),
              //                   child: Text(
              //                     'Once you reach 500 BCI Coins you will be able to redeem these against Resort Credit Points, which can be used during your next holiday with us at select BCI resorts.',
              //                     style: TextStyle(fontSize: 13),
              //                   ),
              //                 )
              //               ]),
              //         ),
              //       )
              //     : GestureDetector(
              //         onTap: () {
              //           specialController.specialindex(9);
              //         },
              //         child: const Padding(
              //           padding:
              //               EdgeInsets.only(top: 30, left: 100, right: 100),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 'What can I do with my BCI Coins?',
              //                 style: TextStyle(
              //                   fontSize: 15.5,
              //                   color: Color(0xff2980B9),
              //                 ),
              //               ),
              //               Padding(
              //                 padding: EdgeInsets.only(right: 50),
              //                 //    child: Icon(Icons.expand_more),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              SizedBox(
                height: 45,
              ),MobileCommonBottom(),
    //   BottomRespo()
            ]),
      ),
    );
  }
}
