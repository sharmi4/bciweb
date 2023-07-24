import 'package:bciweb/registerhomescreen/privacy_policy.dart';
import 'package:bciweb/views/clubhouse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




import '../../../constant/constans.dart';
import '../responsive/responsive_homescreen/responsive_homescreen.dart';
import '../views/members/services/views/servicescart/services.dart';
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
        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(
                    "assets/images/logo1.png",
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
            Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               ksizedbox20,
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
                ),
        ksizedbox20,      ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
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
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(Canslation());
                  },
                  child: Text('Refund and Cancellation Policy',
                  //  "REFUND AND CANCELLATION POLICY",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
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
                  "Fight Booking",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   "Hotel Booking",
                //   textAlign: TextAlign.start,
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 17,
                //       fontWeight: FontWeight.w400),
                // ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Holidays Trip Booking",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                // Text(
                //   "Liquor Booking",
                //   textAlign: TextAlign.start,
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 17,
                //       fontWeight: FontWeight.w400),
                // ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ksizedbox20,
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
                  "+91 9884551551  ",
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
                  "+91 9884660660",
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
          ],
        ),
      ),
    );
  }
}
