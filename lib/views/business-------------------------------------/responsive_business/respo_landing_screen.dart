import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/routes/app_pages.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/authentication/businness_login.dart';
import 'package:bciweb/views/responsive------------------------------------/responsive_homescreen/responsive_homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RespoLanding extends StatelessWidget {
  const RespoLanding({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/01 Login Screen Options.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('assets/images/onbording2.png'),
              ksizedbox40,
              InkWell(
                onTap: () {
                  //Get.to(MobileHomeScreenMembers());
                  Get.toNamed(Routes.MobLogin);
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
                    child:const Center(
                      child: Text(
                        "Members Login",
                        style: TextStyle(
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
                onTap: () async {
                  //Get.to(MobileHomeScreenbusiness());
                  Get.to(BussinessLoginScreenRespo());
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
                    child:const Center(
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
              ksizedbox30,
              ksizedbox30,
              ksizedbox30
            ],
          ),
          backgroundColor: Colors.transparent),
    );
  }
}
