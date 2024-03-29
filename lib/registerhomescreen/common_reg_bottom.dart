import 'package:bciweb/registerhomescreen/privacy_policy.dart';
import 'package:bciweb/routes/app_pages.dart';
import 'package:bciweb/views/clubhouse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constant/constans.dart';
import '../views/responsive------------------------------------/responsive_homescreen/responsive_homescreen.dart';
import '../views/members/bookins/bus/Bus_booking_main.dart';
import '../views/members/bookins/flight/booking_flight.dart';
import '../views/members/bookins/hotels/booking_hotels.dart';
import '../views/members/bookins/trip/trip_booking.dart';
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
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(
                              "https://www.facebook.com/benzeclubinternational"));
                        },
                        child: const Image(
                            image: AssetImage("assets/images/facebook.png"))),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () {
                          launchUrl(
                              Uri.parse("https://twitter.com/happybcigroup"));
                        },
                        child: const Image(
                            image: AssetImage("assets/images/twitter.png"))),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(
                              "https://www.instagram.com/benzeclubinternational"));
                        },
                        child: const Image(
                            image: AssetImage("assets/icons/eyeicon.png"))),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async{
                    await launchUrl(Uri.parse("mailto:customercare@bcipvtltd.com"));
                  },
                  child: Text(
                    "customercare@bcipvtltd.com",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ksizedbox20,
                const Text(
                  "MENU",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xffEF5323),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const MobileHomeScreenMembers());
                  },
                  child: const Text(
                    "Home",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const AboutUsScreen());
                  },
                  child: const Text(
                    "About",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const Services());
                  },
                  child: const Text(
                    "Services",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Booking",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const ClubHouse());
                  },
                  child: const Text(
                    "Club House",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const ContactScreen());
                  },
                  child: const Text(
                    "Contact",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                ksizedbox20,
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Privacy & Policy",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xffEF5323),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const PrivacyPolicy());
                  },
                  child: const Text(
                    "Disclaimer",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const Disclimer());
                  },
                  child: const Text(
                    "Privacy",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.Cancelation);
                  },
                  child: const Text(
                    'Refund and Cancellation Policy',
                    //  "REFUND AND CANCELLATION POLICY",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const Service());
                  },
                  child: const Text(
                    "Service Agreement",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const Tc());
                  },
                  child: const Text(
                    "T & C",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const Representation());
                  },
                  child: const Text(
                    "Representation",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const Faq());
                  },
                  child: const Text(
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
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Booking",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xffEF5323),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const BookingFlight());
                  },
                  child: const Text(
                    "Fight Booking",
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
                // Text(
                //   "Hotel Booking",
                //   textAlign: TextAlign.start,
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 17,
                //       fontWeight: FontWeight.w400),
                // ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const BookingTrip());
                  },
                  child: const Text(
                    "Holidays Trip Booking",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const BusBookingMain());
                  },
                  child: const Text(
                    "Bus Booking",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const BookingHotels());
                  },
                  child: const Text(
                    "Hotel Booking",
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
                ksizedbox20,
                const Text(
                  "Contact Us",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xffEF5323),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                     const  Icon(Icons.call,color: Colors.white,),
                    const SizedBox(
                      width: 7,
                    ),
                    InkWell(
                      onTap: () async{
                        await launchUrl(Uri.parse("tel:9884551551"));
                      },
                      child: const Text(
                        "+91 9884551551  ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
               const SizedBox(
                  height: 10,
                ),
               Row(
                 children: [
                   const  Icon(Icons.call,color: Colors.white,),
                    const SizedBox(
                      width: 7,
                    ),
                   InkWell(
                      onTap: () async{
                        await launchUrl(Uri.parse("tel:9884660660"));
                      },
                      child: const Text(
                        "+91 9884660660",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                 ],
               ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                   const  Icon(Icons.mail,color: Colors.white,),
                    const SizedBox(
                      width: 7,
                    ),
                    InkWell(
                      onTap: () async{
                        await launchUrl(Uri.parse("mailto:customercare@bcipvtltd.com"));
                      },
                      child: const Text(
                        "customercare@bcipvtltd.com",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
