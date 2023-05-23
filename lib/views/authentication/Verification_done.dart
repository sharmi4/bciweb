import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../constant/constans.dart';

class Verification_Done extends StatelessWidget {
  const Verification_Done({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Container(
            child: Column(
              children: [
                ksizedbox30,
                Container(child: Image.asset('assets/images/3534.png')),ksizedbox20,
                Text(
                  'WELCOME :)',
                style: TextStyle(
                fontSize: 27, color: kblue, fontWeight: FontWeight.w700),
                ),
                ksizedbox10,
                Text(
                  'Your account has been verified ',
                   style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    //   decoration: TextDecoration.underline,
                    color: kblue),
                ),     Text(
                  'successfully',
                   style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    //   decoration: TextDecoration.underline,
                    color: kblue),
                ),
                ksizedbox20,
              
                ksizedbox30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Recive OTP ",
                    style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    //   decoration: TextDecoration.underline,
                    color: kblue),
                    ),
                    Text(
                      "Resent",
                     style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    color: kOrange),
                    ),
                    ksizedbox20,
                  ],
                ),
                ksizedbox30,
                InkWell(
                  onTap: () {
                   
                  },
                  child: Container(
                    width: size.width*0.3,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      border: Border.all(color: const Color(0xffFFBF7E)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFFF5C29),
                          blurRadius: 3.0,
                        )
                      ],
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
                      'Done',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Container(color: kblue,
              child: Image.asset(
                'assets/images/45t3.png',
                height: size.height,
              ),
            ),
          )
        ],
      ),
    );
  }
}
