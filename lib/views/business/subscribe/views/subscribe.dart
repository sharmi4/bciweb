import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/registerhomescreen/common_reg_bottom.dart';
import 'package:bciweb/views/business/subscribe/views/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/subscribe_controllers.dart';
//import '../../../../registerhomescreen/common_reg_appbar';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';

class Subscribe extends StatefulWidget {
  const Subscribe({super.key});

  @override
  State<Subscribe> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  final settingsController = Get.find<SubscribeController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(),
          preferredSize: Size(double.infinity, 40)),
      body: Obx(
        () => ListView(
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegisterCommonContainer(),
            Container(
              child: Stack(
                children: [
                  Image.asset('assets/images/Group 39757.png'),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'Subscribe',
                        style: GoogleFonts.lato(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: kwhite),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ksizedbox30,
            Text(
              'Select Membership',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff003366),
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            ksizedbox10,
            const Text(
              "All Select Membership Cards Choose Anything",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                  color: Color(0xff003366)),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            settingsController.index(0);
                            settingsController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 166,
                            decoration: BoxDecoration(
                                color: settingsController.index.value == 0
                                    ? const Color(0xff911361)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: settingsController.index.value == 0
                                        ? Colors.transparent
                                        : const Color(0xff003366)),
                                boxShadow: [
                                  if (settingsController.index.value == 0)
                                    const BoxShadow(
                                      color: const Color(0xff911361),
                                      offset: Offset(0, 1),
                                      blurRadius: 5.0,
                                    ),
                                ]),
                            child: Center(
                              child: Text(
                                "AMBASSADOR LIFE",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: settingsController.index.value == 0
                                        ? Colors.white
                                        : const Color(0xff003366)),
                              ),
                            ),
                          ),
                        ),
                        kwidth10,
                        InkWell(
                          onTap: () {
                            settingsController.index(1);
                            settingsController.update();
                            setState(() {
                              settingsController.index == true;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 166,
                            decoration: BoxDecoration(
                                color: settingsController.index.value == 1
                                    ? const Color(0xffB0002D)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: settingsController.index.value == 1
                                        ? Colors.transparent
                                        : const Color(0xff003366)),
                                boxShadow: [
                                  if (settingsController.index.value == 1)
                                    const BoxShadow(
                                      color: const Color(0xffB0002D),
                                      offset: Offset(0, 1),
                                      blurRadius: 5.0,
                                    ),
                                ]),
                            child: Center(
                              child: Text(
                                "ELITE LIFE",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: settingsController.index.value == 1
                                        ? Colors.white
                                        : const Color(0xff003366)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            settingsController.index(2);
                            settingsController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 166,
                            decoration: BoxDecoration(
                                color: settingsController.index.value == 2
                                    ? Color.fromARGB(255, 220, 121, 16)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: settingsController.index.value == 2
                                        ? Colors.transparent
                                        : const Color(0xff003366)),
                                boxShadow: [
                                  if (settingsController.index.value == 2)
                                    const BoxShadow(
                                      color: Color.fromARGB(255, 230, 99, 23),
                                      offset: Offset(0, 1),
                                      blurRadius: 5.0,
                                    ),
                                ]),
                            child: Center(
                              child: Text(
                                "GOLD",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: settingsController.index.value == 2
                                        ? Colors.white
                                        : const Color(0xff003366)),
                              ),
                            ),
                          ),
                        ),
                        kwidth10,
                        InkWell(
                          onTap: () {
                            settingsController.index(3);
                            settingsController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 166,
                            decoration: BoxDecoration(
                                color: settingsController.index.value == 3
                                    ? Color.fromARGB(255, 19, 9, 11)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: settingsController.index.value == 3
                                        ? Colors.transparent
                                        : const Color(0xff003366)),
                                boxShadow: [
                                  if (settingsController.index.value == 3)
                                    const BoxShadow(
                                      color: Color.fromARGB(255, 19, 7, 10),
                                      offset: Offset(0, 1),
                                      blurRadius: 5.0,
                                    ),
                                ]),
                            child: Center(
                              child: Text(
                                "PLATINUM LIFE",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: settingsController.index.value == 3
                                        ? Colors.white
                                        : const Color(0xff003366)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            settingsController.index(4);
                            settingsController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 166,
                            decoration: BoxDecoration(
                                color: settingsController.index.value == 4
                                    ? Color.fromARGB(255, 82, 53, 211)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: settingsController.index.value == 4
                                        ? Colors.transparent
                                        : const Color(0xff003366)),
                                boxShadow: [
                                  if (settingsController.index.value == 4)
                                    const BoxShadow(
                                      color: Color.fromARGB(255, 27, 57, 141),
                                      offset: Offset(0, 1),
                                      blurRadius: 5.0,
                                    ),
                                ]),
                            child: Center(
                              child: Text(
                                "SIGNATURE LIFE",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: settingsController.index.value == 4
                                        ? Colors.white
                                        : const Color(0xff003366)),
                              ),
                            ),
                          ),
                        ),
                        kwidth10,
                        InkWell(
                          onTap: () {
                            settingsController.index(5);
                            settingsController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 166,
                            decoration: BoxDecoration(
                                color: settingsController.index.value == 5
                                    ? Color.fromARGB(255, 149, 149, 149)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: settingsController.index.value == 5
                                        ? Colors.transparent
                                        : const Color(0xff003366)),
                                boxShadow: [
                                  if (settingsController.index.value == 5)
                                    const BoxShadow(
                                      color: Color.fromARGB(255, 156, 156, 156),
                                      offset: Offset(0, 1),
                                      blurRadius: 5.0,
                                    ),
                                ]),
                            child: Center(
                              child: Text(
                                "SILVER LIFE",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: settingsController.index.value == 5
                                        ? Colors.white
                                        : const Color(0xff003366)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                   
                  ],
                ),
                Column(
                  children: [
                    if (settingsController.index.value == 0)
                      InkWell(
                          onTap: () {
                            Get.to(Payment(image: "assets/images/a1.png", htext: 'BCI AMBASSADOR MEMBERSHIP PACKAGE - ₹5,00,000/-', text: '''Use our Photo membership card to deposit / 
withdraw cash in our BCI ATM Machine. (CA*)
₹2,50,000/-Worth of Discount Coupons to access various BCI Associate outlets. 
₹2,000/- Worth of Complementary Rejuvenate Spa 50 Coupons.
₹50,000/- Worth of Complementary Liquor Coupons.
₹50,000/- Worth of Complementary Club Rooms Stay.
₹50,000/- Worth of Complementary Food & Beverages Coupons.
₹75,000/- Cash Wallet Recharge Complimentary, To use in BCI & associate outlets.
₹1,00,000/- Complimentary Free Stay At Goa (or) Bangkok 5 Nights & 6 Days.
₹25,000/-Worth Of Complimentary Movie Tickets.
₹1,75,000/-Worth Of 25 Years Gym Complimentary @All Our BCI Clubs''',));
                          },
                          child: const Image(
                            image: AssetImage("assets/images/a1.png"),
                            height: 234,
                          )),
                    if (settingsController.index.value == 1)
                      InkWell(
                          onTap: () {
                            Get.to(Payment(image: "assets/images/e2.png", htext: 'BCI ELITE CORPORATE MEMBERSHIP PACKAGE - ₹1, 00,000/', text: '''Twenty Years Membership
Use our Photo membership card to deposit / 
withdraw cash in our BCI ATM Machine. (CA*)
₹50,000/- Worth of discount Coupons to access various BCI associates outlets. 
₹2, 000/- Worth of Complementary Rejuvenate Spa 10 Coupons.
₹10,000/- Worth of Complementary Liquor Coupons.
₹10,000/- Worth of Complementary Club Rooms Stay. 
₹70,000/- Worth of 10 Year Gym Complementary @ all Our BCI Clubs''',));
                          },
                          child: const Image(
                            image: AssetImage("assets/images/e2.png"),
                            height: 234,
                          )),
                    if (settingsController.index.value == 2)
                      InkWell(
                          onTap: () {
                            Get.to(Payment(image: "assets/images/g1.png", text: '''Two Years Membership
Use our Photo membership card to deposit / 
withdraw cash in our BCI ATM Machine. (CA*)
₹20,000/- Worth of Discount Coupons to access in various BCI Associate outlets. 
₹ 2,000/- Worth of Complementary Rejuvenate Spa 4 Coupons. 
₹ 2,000/- Worth of Complementary Liquor Coupons.
₹ 10,000/- Worth of Two Year Complementary Gym @All Our BCI Clubs.''', htext: 'GOLD MEMBERSHIP PACKAGE - ₹20,000/-',));
                          },
                          child: const Image(
                            image: AssetImage("assets/images/g1.png"),
                            height: 234,
                          )),
                    if (settingsController.index.value == 3)
                      InkWell(
                          onTap: () {
                            Get.to(Payment(image: 'assets/images/p1.png', htext: 'BCI MEMBERSHIP PACKAGE - ₹50,000', text: '''Ten Years Membership
Use our Photo membership card to deposit / 
withdraw cash in our BCI ATM Machine. (CA*)
₹30,000/- Worth of Discount Coupons to access various BCI Associates outlets. 
₹ 2,000/- Worth of Complementary Rejuvenate Spa 8 Coupons. 
₹4,000/- Worth of Complementary Liquor Coupons
₹35,000/- Worth of Five Year Gym Complementary @All Our BCI Clubs.''',));
                          },
                          child: const Image(
                            image: AssetImage("assets/images/p1.png"),
                            height: 234,
                          )),
                    if (settingsController.index.value == 4)
                      InkWell(
                          onTap: () {
                            Get.to(Payment(image: "assets/images/s1.png", text: '''Use our Photo membership card to deposit / 
withdraw cash in our BCI ATM Machine. (CA*)\n
₹ 1,00,000/- Worth of Discount Coupons to access various BCI Associates outlets. 
₹ 2,000/- Worth of Complementary Rejuvenate Spa 30 Coupons.
₹ 30,000/- Worth of Complementary Liquor Coupons.
₹ 30,000/- Worth of Complementary Club Rooms Stay.
₹ 30,000/- Worth of Complementary Food & Beverages Coupons.
₹ 20,000/- Cash Wallet Recharge Complimentary, To use in BCI & associate outlets.
₹ 1,40,000/- Worth of 20 Years Gym Complimentary @All Our BCI Clubs''', htext: 'BCI SIGNATURE MEMBERSHIP PACKAGE - ₹2,50,000/',));
                          },
                          child: const Image(
                            image: AssetImage("assets/images/s1.png"),
                            height: 234,
                          )),
                    if (settingsController.index.value == 5)
                      InkWell(
                          onTap: () {
                            Get.to(Payment(image: "assets/images/si1.png", text: '''One Year Membership
Use our Photo membership card to deposit / 
withdraw cash in our BCI ATM Machine. (CA*)
₹10,000/- Worth of Discount Coupons to access in various BCI Associate outlets. 
₹ 2,000/- Worth of Complementary Rejuvenate Spa 2 Coupons. 
₹1,000/- Worth of Liquor Complementary.
₹ 7,000/- Worth of Gym facility, Complementary @ all Our BCI Clubs''', htext: 'SILVER MEMBERSHIP PACKAGE - ₹15,000',));
                          },
                          child: const Image(
                            image: AssetImage("assets/images/si1.png"),
                            height: 234,
                          )),
                  ],
                ),
              ],
            ),
            ksizedbox40,
            RegisterCommonBottom(),
          ],
        ),
      ),
    );
  }
}
