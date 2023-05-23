import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/constans.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Image.asset('assets/images/Group .png'),
          ),
          ksizedbox20,
          Text(
            'OTC Payment',
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
          ksizedbox40,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: size.width * 0.4,
                  child: Image.asset('assets/images/Group 38622.png')),
              ksizedbox10,
              Container(
                width: size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OTC PAYMENTS',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: kblue, fontSize: 28,fontWeight: FontWeight.w600),
                    ),
                    ksizedbox20,
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and \ntypesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                      style: TextStyle(color: kblue, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ksizedbox30,
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: [
                  TextField(
                    // controller: _controller,
            
                    decoration: InputDecoration(
                        hintText: 'Enter Coupon',
                        hintStyle: TextStyle(fontSize: 17, color: kgrey),
                        fillColor: kwhite,
                        focusColor: kwhite,
                        isDense: true,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: kblue),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        suffixIcon: Container(
                          child: Center(
                              child: Text(
                            'Verify',
                            style: TextStyle(color: kwhite, fontSize: 17),
                          )),
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                              color: kblue, borderRadius: BorderRadius.circular(10)),
                        )),
                  ),
                  ksizedbox10,
                  TextField(
                    // controller: _controller,
            
                    decoration: InputDecoration(
                        hintText: 'Enter Coupon',
                        hintStyle: TextStyle(fontSize: 17, color: kgrey),
                        fillColor: kwhite,
                        focusColor: kwhite,
                        isDense: true,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: kblue),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        suffixIcon: Container(
                          child: Center(
                              child: Text(
                            'Verify',
                            style: TextStyle(color: kwhite, fontSize: 17),
                          )),
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                              color: kblue, borderRadius: BorderRadius.circular(10)),
                        )),
                  ),
                  ksizedbox40,
                  InkWell(
                    onTap: () {
                     Get.toNamed('/add-wallet');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          4,
                        ),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFFF5C29),
                            Color(0xFFFFCD38),
                          ],
                        ),
                      ),
                      child: Text(
                        'Proceed To Payment',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ksizedbox40,
        ],
      ),
    );
  }
}
