
import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/routes/app_pages.dart';
import 'package:bciweb/views/members/common_widget/common_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../../registerhomescreen/common_reg_homescreen.dart';
import '../../registerhomescreen/business_comm_homecontainer.dart';
import '../members/common_widget/business_common_screen.dart';

class BusinessAboutUsScreen extends StatefulWidget {
  const BusinessAboutUsScreen({super.key});

  @override
  State<BusinessAboutUsScreen> createState() => _BusinessAboutUsScreenState();
}


class _BusinessAboutUsScreenState extends State<BusinessAboutUsScreen> {
  Future<void>? _launched;
  final Uri toLaunch =
      Uri(scheme: 'https', host: 'www.portal.bcipvtltd.com', path: 'headers/');
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
       appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 110),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const BusinessCommonScreen(),
              BusinessCommonhomeContainer(),
            ],
          ),
          ),
      body: ListView(
        children: [
          // RegisterCommonContainer(),
          // CommonContainer(),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration:const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/aboutbackground.png',
                    ),
                    fit: BoxFit.cover)),
            child: Center(
              child: Text('ABOUT US',
                  textAlign: TextAlign.center, style: displayfont),
            ),
          ),
          ksizedbox30,
          Stack(
            children: [
              const Image(
                  image: AssetImage("assets/images/homebackground.png")),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Row(
                    children: [
                      const Image(
                          height: 480,
                          width: 600,
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/aboutimage.png")),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get About Us",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kblue,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: size.width * 0.4,
                            child: Column(
                              children: [
                                Text(
                                  '''"BENZE CLUB INTERNATIONAL - One of the pioneers in the
Hospitality-Family entertainment industry." 
Formerly Benze Vaccations Club with around 50000 members, We are now transformed to BCI, with a Rejuvenated-empowered Board of directors and progressing towards a 6 digit membership inthe Year 2023 with a strong Marketing, Technical,CRM, Media & PR teams.''',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: kblue,
                                      height: 1.8,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 600,
            color: const Color(0xffE6E6E6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "The Perfect membership\nFor You & Your Family",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: kblue,
                          height: 2,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Look into what benefits are included with\nthe membership. Does it offer discounts on\nproducts or services that you regularly use?\nDoes it provide access to exclusive events\nor experiences?",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: kblue,
                          height: 1.8,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const Image(
                    height: 480,
                    width: 600,
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/aboutimage2.png")),
              ],
            ),
          ),
          Container(
            height: 260,
            color: const Color(0xffF9F8FD),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 80, right: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            "11K",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kblue,
                                height: 2,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "AMAZING BUSINESS",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kblue,
                                height: 2,
                                fontSize: 16.5,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Dash(
                          direction: Axis.vertical,
                          length: 130,
                          dashLength: 15,
                          dashColor: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            "41K",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kblue,
                                height: 2,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "AMAZING MEMBERS",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kblue,
                                height: 2,
                                fontSize: 16.5,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Dash(
                          direction: Axis.vertical,
                          length: 130,
                          dashLength: 15,
                          dashColor: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            "3K",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kblue,
                                height: 2,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "TOTAL SUPPORT",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kblue,
                                height: 2,
                                fontSize: 16.5,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Dash(
                          direction: Axis.vertical,
                          length: 130,
                          dashLength: 15,
                          dashColor: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            "77K",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kblue,
                                height: 2,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "TOTAL USERS",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kblue,
                                height: 2,
                                fontSize: 16.5,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ksizedbox10,
          Stack(
            children: [
              Container(
                height: 450,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kgrey.withOpacity(0.1),
                ),
                child: Image.asset(
                  "assets/images/homebackground.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Most Popular Business',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Container(
                        height: 10,
                        width: 70,
                        color: kOrange,
                      ),
                    ),
                    ksizedbox20,
                    Text(
                      'Special coupons are promotional discounts offered by businesses to encourage \ncustomers to make a purchase or use their services. These coupons may be available \nin various forms such as printed coupons, digital coupons, or promo codes.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, height: 2),
                    ),
                    ksizedbox30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    blurRadius: 5,
                                    offset: Offset(0.0, 0.5),
                                    color: kgrey)
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 130,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/travelimage.png',
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text('TRAVEL',
                                    style: TextStyle(color: kblue)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    blurRadius: 5,
                                    offset: Offset(0.0, 0.5),
                                    color: kgrey)
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 130,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/retailimage.png'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  'RETAIL',
                                  style: TextStyle(color: kblue),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    blurRadius: 5,
                                    offset: Offset(0.0, 0.5),
                                    color: kgrey)
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 130,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/gymimage.png'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  'GYM',
                                  style: TextStyle(color: kblue),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    blurRadius: 5,
                                    offset: Offset(0.0, 0.5),
                                    color: kgrey)
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 130,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/entertaiment.png'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  'ENTERTAIMENT',
                                  style: TextStyle(color: kblue),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),

          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: kwhite,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    '- - - - - - - Watch Our Story - - - - - - - - -',
                    style: TextStyle(
                        fontSize: 22,
                        color: kOrange,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ksizedbox20,
                Text(
                  'Unforgettable subscription Experiences \nGet Your Guide',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30, color: kblue, fontWeight: FontWeight.bold),
                ),
                ksizedbox30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kblue,
                            minimumSize: const Size(200, 47)),
                        onPressed: () {
                          Get.toNamed(Routes.contact_screen);
                        },
                        child: const Text(
                          'Contact Us',
                          style: TextStyle(fontSize: 18),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kOrange,
                              minimumSize: Size(200, 47)),
                          onPressed: () async {
                            Uri url = Uri.parse(
                                "youtube.com/watch?v=KDjmKFjxXt0");
                            _launched = _launchInBrowser(url);
                            _launched!.then((value) {
                              //print("Current url state-------------------->>${value}");
                            });
                          },
                          child: const Text(
                            'Book Now',
                            style: TextStyle(fontSize: 18),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
          RegisterCommonBottom()
        ],
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
