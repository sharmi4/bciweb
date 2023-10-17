import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../constant/constans.dart';
import '../../controller/auth_controller/auth_controller.dart';

class OtpVerification extends StatefulWidget {
   OtpVerification({super.key, this.phoneNumber='',this.otp=''});
  String phoneNumber;
  String otp;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  String otpString = "";
  
int _start = 60; // Timer duration in seconds
  bool _isActive = false;
  late Timer _timer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 1) {
          _isActive = false;
          timer.cancel();
          _start = 60;
        } else {
          _start--;
        }
      });
    });
  }
//  @override
//   void dispose() {
//     _timer.cancel(); // Cancel the timer to avoid memory leaks
//     super.dispose();
//   }
  final authController = Get.find<AuthController>();
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
                ksizedbox20,
                Text(
                  'OTP Verification',
                style: TextStyle(
                fontSize: 22, color: kblue, fontWeight: FontWeight.w700),
                ),
                ksizedbox30,
                Text(
                  'Enter the OTP send to ${widget.phoneNumber}',
                   style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    //   decoration: TextDecoration.underline,
                    color: kblue),
                ),
                // ksizedbox20,
                // Text(
                //     'OTP is ${widget.otp}',
                //     style: TextStyle(
                //         fontSize: 14,
                //         fontWeight: FontWeight.w500,
                //         //   decoration: TextDecoration.underline,
                //         color: kblue),
                //   ),
                ksizedbox30,
                SingleChildScrollView(
                  child: Column(
                    children: [
                      OtpTextField(
                        numberOfFields: 4,
                        borderColor: Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                             setState(() {
                               otpString=verificationCode;
                             });

                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return AlertDialog(
                          //         title: Text("Verification Code"),
                          //         content:
                          //             Text('Code entered is $verificationCode'),
                          //       );
                          //     });
                        }, // end onSubmit
                      ),
                      ksizedbox20,
                        Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Text(
                    "Didn't Receive OTP ",
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                    ),
                  ),
                  _isActive
                      ? Text(
                          "Resend in $_start",
                          style: primaryFont.copyWith(color: Colors.blue),
                        )
                      : InkWell(
                          onTap: () async {
                            String tempOtp =
                                await authController.rendOtpFunction(
                                    mobileNumber: widget.phoneNumber);
                            setState(() {
                              _isActive = true;
                              widget.otp = tempOtp;
                            });
                            startTimer();
                          },
                          child: Text(
                            "Resend",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                color: kOrange),
                          ),
                        ),
                ],
              ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Obx(()=>
                  authController.isLoading.isTrue?
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width:  size.width*0.3,
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
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ):
                     InkWell(
                      onTap: () {
                        authController.loginUsers(mobile: widget.phoneNumber, 
                        otp: otpString,screen: false);
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
