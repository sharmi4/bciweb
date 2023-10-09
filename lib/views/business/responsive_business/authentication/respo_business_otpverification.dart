import 'dart:async';

import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RespoBusinessOtpVerification extends StatefulWidget {
   RespoBusinessOtpVerification({super.key, this. phoneNumber='', this. otp=''});
  String phoneNumber;
  String otp;

  @override
  State<RespoBusinessOtpVerification> createState() => _RespoBusinessOtpVerificationState();
}

class _RespoBusinessOtpVerificationState extends State<RespoBusinessOtpVerification> {

    String otpString = "";
  final authController =Get.find<AuthController>();

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

  @override
  Widget build(BuildContext context) {
        var size=MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              ksizedbox30,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/Group 5816.png'),
              ),
              Text(
                'OTP Verification',
                style: TextStyle(
                    fontSize: 22, color: kblue, fontWeight: FontWeight.w700),
              ),
              ksizedbox10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter the OTP send to ${widget.phoneNumber}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        //   decoration: TextDecoration.underline,
                        color: kblue),
                  ),
                ],
              ),
              // ksizedbox20,
              //  Text(
              //       'OTP is ${widget.otp}',
              //       style: TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.w500,
              //           //   decoration: TextDecoration.underline,
              //           color: kblue),
              //     ),
              ksizedbox40,
              SingleChildScrollView(
               child:   OtpTextField(
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
              ),
              ksizedbox10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Receive OTP ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        //   decoration: TextDecoration.underline,
                        color: kblue),
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
              ksizedbox10,
              // ksizedbox30,
              InkWell(
                onTap: () {
                  authController.loginUsers(mobile: widget.phoneNumber,
                   otp: widget.otp, screen: true);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 40,
                        width: size.width*0.43,
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
            ],
          ),
        ],
      ),
    );
  }
}