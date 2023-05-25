import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/constans.dart';
import '../../../../registerhomescreen/common_reg_appbar';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: RegisterCommonAppbar(),
          preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterCommonContainer(),
            Container(
              child: Stack(
                children: [
                  Image.asset('assets/images/offer.png'),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'OFFERS US',
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
            ksizedbox20,
            Text(
              'All Offers Available',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff003366),
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            ksizedbox40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                offers_container(),
                offers_container(),
              ],
            ),
            ksizedbox30,
            ksizedbox40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                offers_container(),
                offers_container(),
              ],
            ),
            ksizedbox30,
            ksizedbox40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                offers_container(),
                offers_container(),
              ],
            ),
            ksizedbox30,
            ksizedbox40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                offers_container(),
                offers_container(),
              ],
            ),
            ksizedbox30,
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: kwhite,
                    ),
                    Text(
                      'BACK',
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 19,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
                height: 45,
                width: 150,
                decoration: BoxDecoration(
                    color: kOrange, borderRadius: BorderRadius.circular(15)),
              ),
            ),
            ksizedbox40,
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}

class offers_container extends StatelessWidget {
  const offers_container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(125, 158, 158, 158).withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: kwhite,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: 450,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/NoPath - Copy (7).png'),
          ),
          kwidth10,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ksizedbox10,
              Text(
                'JK Stores Offer For ',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                'Casual Shirts',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                '25% Offer',
                style: TextStyle(fontSize: 25, color: Colors.grey),
              ),
              Text(
                '5 Days Only',
                style: TextStyle(fontSize: 25, color: Colors.grey),
              ),
              ksizedbox10,
            ],
          ),
        ],
      ),
    );
  }
}
