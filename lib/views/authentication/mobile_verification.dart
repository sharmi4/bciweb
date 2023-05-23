import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../constant/constans.dart';

class MobileVerification extends StatelessWidget {
  const MobileVerification({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                height: 600,
                width: 450,
                child: Column(
                  children: [ksizedbox30,
                    Container(child: Image.asset('assets/images/3534.png')),ksizedbox30,
                    Text(
                      'WELCOME',
                      style: TextStyle(
                          fontSize: 27, color: kblue, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Enter Your Phone Number',
                      style: TextStyle(
                          fontSize: 22, color: kblue, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'We will send you an ',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: kblue),
                        ),
                        Text(
                          'One Time Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: kblue),
                        ),
                      ],
                    ),
                    Text(
                      'on this mobile number',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: kblue),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: size.width*0.3,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Image.asset('assets/images/Image 8.png'),
                            suffixIcon: Image.asset(
                                'assets/images/flaightcorrectimage.png'),
                            hintText: 'Enter your username',
                            labelText: '+91 9633749714',
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    ksizedbox20,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {Get.toNamed('/final-otp-verification');},
                        //   Get.to(const BusinessOtpvarification());},
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
                          child: const Text(
                            'Genarate OTP',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    ksizedbox10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont't have an account? ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: kblue),
                        ),
                        InkWell(
                          onTap: () { Get.toNamed('/signin');
                  
                          },
                          child: Text(
                            'Sign up',
                            textAlign: TextAlign.center,
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
            ),
            Expanded(
              child: Container(color: kblue,
                    //    height: 600,width: 450,
                child: Image.asset('assets/images/4563.png',height: size.height,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
