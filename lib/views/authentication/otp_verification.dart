import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../constant/constans.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

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
                Image.asset('assets/images/3534.png'),
                Text(
                  'OTP Verification',
                style: TextStyle(
                fontSize: 22, color: kblue, fontWeight: FontWeight.w700),
                ),
                ksizedbox10,
                Text(
                  'Enter the OTP sent to +91 9633749714',
                   style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    //   decoration: TextDecoration.underline,
                    color: kblue),
                ),
                ksizedbox20,
                SingleChildScrollView(
                  child: OtpTextField(
                    numberOfFields: 5,
                    borderColor: Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Verification Code"),
                              content:
                                  Text('Code entered is $verificationCode'),
                            );
                          });
                    }, // end onSubmit
                  ),
                ),
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
                  onTap: () {Get.toNamed('/verification-done');
                    //     Get.to(BusinessverifiedScreen());
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
                      'Verify',
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
                'assets/images/564.png',
                height: size.height,
              ),
            ),
          )
        ],
      ),
    );
  }
}
