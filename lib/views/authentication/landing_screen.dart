import 'package:bciweb/constant/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblue,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Image.asset('assets/images/img22.png'),
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      child: Image.asset('assets/images/Group 5814.png')),
                ),
                ksizedbox20,
                InkWell(
                  onTap: () {
                    // Get.toNamed('/otp-verification');
                    //  Get.to(const MemberLoginScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
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
                      child: Center(
                        child: Text(
                          "Members Login",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Color(0xff0000007A),
                                  offset: Offset(3.0, 3.0),
                                ),
                              ],
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
                ksizedbox20,
                InkWell(
                  onTap: () {
                    Get.toNamed('/otp-verification');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kblue,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.white),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 3.0,
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Bussiness login",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Color(0xff707070),
                                  offset: Offset(3.0, 3.0),
                                ),
                              ],
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            height: 600,
            width: 450,
            decoration: BoxDecoration(
                color: kwhite, borderRadius: BorderRadius.circular(13)),
          )
        ],
      ),
    );
  }
}
