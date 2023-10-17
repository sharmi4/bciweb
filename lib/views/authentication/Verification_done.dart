import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import '../../constant/constans.dart';
import '../members/home_screen.dart';

class Verification_Done extends StatelessWidget {
  const Verification_Done({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Row(
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
                    fontSize: 25, color: kblue, fontWeight: FontWeight.w700),
                    ),
                    ksizedbox20,
                    Text(
                      'Your account has been verified ',
                       style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        //   decoration: TextDecoration.underline,
                        color: kblue),
                    ),     Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'successfully',
                         style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          //   decoration: TextDecoration.underline,
                          color: kblue),
                      ),
                    ),
                    Column(
                      children: [
                  Padding(
                    padding: const EdgeInsets.only(top:50),
                    child: InkWell(
                      onTap: () {
                        Get.to((const MemberHomeScreen()));
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
                        child:const Text(
                          'Done',
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
        ],
      ),
    );
  }
}
