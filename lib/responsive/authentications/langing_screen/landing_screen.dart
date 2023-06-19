
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constant/constans.dart';
import '../generate_otp/generate_otp.dart';

class landing_screen extends StatelessWidget {
  const landing_screen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/q.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          body: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                      Image.asset('assets/images/Group 5814.png'),ksizedbox40,
                  GestureDetector(
                    onTap: () {
                     Get.to( MemberLoginScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Container(
                        height: 40,
                        width: size.width*0.43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
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
                            style: TextStyle(shadows: [
                            Shadow(
                            blurRadius: 5.0,
                             color: Color(0xff0000007A),
                             offset: Offset(3.0, 3.0),
                              ),
        ],
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 65,
                  //   width: double.infinity,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 20, right: 20),
                  //     child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(// primary: Colors.teal,
                  //  // onPrimary: Colors.green,
                  // //onSurface: Colors.orange,
                  // //backgroundColor: Color.fromARGB(255, 177, 126, 60),
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(4.0),
                  //           ),
                  //         ),
                  //         onPressed: () {
                  //           Get.off(Generate_otp());
                  //         },
                  //         child: Text(
                  //           'Member Login',
                  //           style: TextStyle(
                  //               fontSize: 22,
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold),
                  //         )),
                  //   ),
                  // ),
                  ksizedbox40,
                  GestureDetector(
                    onTap: () {
//Get.to(const BusinessLoginScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Container(
                         height: 40,
                        width: size.width*0.43,
                        decoration: BoxDecoration(
                          color: kblue,
                          borderRadius: BorderRadius.circular(8),
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
                            style: TextStyle(shadows: [
                            Shadow(
                            blurRadius: 5.0,
                             color: Color(0xff707070),
                             offset: Offset(3.0, 3.0),
                              ),
        ],
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 50.h,
                  //   width: double.infinity,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 20, right: 20),
                  //     child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor:const Color.fromARGB(0, 246, 246, 246),
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(4.0),
                  //           ),
                  //         ),
                  //         onPressed: () {
                  //           Get.to(const BusinessLoginScreen());
                  //         },
                  //         child: Text(
                  //           'Bussiness login',
                  //           style: TextStyle(
                  //               fontSize: 22.sp,
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold),
                  //         )),
                  //   ),
                  // ),
                  ksizedbox30,
                  ksizedbox30,
                  ksizedbox30
                ],
              ),
            ],
          ),
          backgroundColor: Colors.transparent),
    );
  }
}
