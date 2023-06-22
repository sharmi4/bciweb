import 'package:bciweb/registerhomescreen/privacy_policy.dart';
import 'package:bciweb/views/clubhouse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constans.dart';
import '../responsive/responsive_homescreen/responsive_homescreen.dart';
import '../views/business/services/views/servicescart/services.dart';
import '../views/members/about/about_screens.dart';
import '../views/members/contacs/contact_screen.dart';

class RegisterCommonBottom extends StatefulWidget {
  const RegisterCommonBottom({super.key});

  @override
  State<RegisterCommonBottom> createState() => _RegisterCommonBottomState();
}

class _RegisterCommonBottomState extends State<RegisterCommonBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kblue,
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(
                    "assets/images/logo.png",
                  ),
                  height: 70,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "The best memberships depend on individual\nneeds and interests. However, here are some\npopular and highly rated membership programs\nthat offer a range of benefits.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    height: 1.8,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image(image: AssetImage("assets/images/facebook.png")),
                    SizedBox(
                      width: 20,
                    ),
                    Image(image: AssetImage("assets/images/twitter.png")),
                    SizedBox(
                      width: 20,
                    ),
                    Image(image: AssetImage("assets/icons/eyeicon.png")),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "customercare@bcipvtltd.com",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "MENU",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xffEF5323),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.to(MobileHomeScreen());
                  },
                  child: Text(
                    "Home",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(AboutUsScreen());
                  },
                  child: Text(
                    "About",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(Services());
                  },
                  child: Text(
                    "Services",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Booking",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(ClubHouse());
                  },
                  child: Text(
                    "Club House",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(ContactScreen());
                  },
                  child: Text(
                    "Contact",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Privacy&Policy",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xffEF5323),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.to(PrivacyPolicy());
                  },
                  child: Text(
                    "Disclaimer",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(Disclimer());
                  },
                  child: Text(
                    "Privacy",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // InkWell(
                //   onTap: () {
                //     Get.to(Disclimer());
                //   },
                //   child: Text(
                //     "FAQ",
                //     textAlign: TextAlign.start,
                //     style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 17,
                //         fontWeight: FontWeight.w400),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(Service());
                  },
                  child: Text(
                    "Service Agreement",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(Tc());
                  },
                  child: Text(
                    "T&C",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(Representation());
                  },
                  child: Text(
                    "Representation",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(Faq());
                  },
                  child: Text(
                    "FAQ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 0,
                  ),
                  Text(
                    "Booking",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xffEF5323),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Fight Book",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hotel Book",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "holidays Trip Book",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Liquor Book",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Us",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xffEF5323),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "+91 8939 804 805  ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "+91 8939 806 807",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "customercare@bcipvtltd.com",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
