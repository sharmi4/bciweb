// 'package:bci/constands/constands.dart';
//import 'package:bci/screens/members/sign_up_view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/constans.dart';
import '../../../controller/auth_controller/auth_controller.dart';
import '../../../views/authentication/signup.dart';
import '../otp_verification/otp_verification.dart';
import '../sign_up_view/sign_up_screen.dart';

class MemberLoginScreenrespo extends StatefulWidget {
  const MemberLoginScreenrespo({super.key});

  @override
  State<MemberLoginScreenrespo> createState() => _MemberLoginScreenrespoState();
}

class _MemberLoginScreenrespoState extends State<MemberLoginScreenrespo> {
  final authController = Get.find<AuthController>();
   var phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/images/a.png',
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Enter Your Phone Number',
                style: TextStyle(
                    fontSize: 22, color: kblue, fontWeight: FontWeight.w700),
              ),
              ksizedbox20,
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
              ksizedbox40,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        
                        prefixIcon: Image.asset('assets/images/Image 8.png'),
                        //suffixIcon: Image.asset('assets/images/Path 471.png'),
                        hintText: 'Enter your Number',
                      
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
              ksizedbox10,
             Obx(()=>
                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: authController.isLoading.isTrue ?
                        Container(
                           height: 40,
                        width: size.width*0.43,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              8,
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
                        ):InkWell(
                          onTap: () {
                             if (phoneNumberController.text.isNotEmpty) {
                              authController.getOtpFunction(
                                  mobileNumber: phoneNumberController.text, isMobile: true);
                            } else {
                              Get.rawSnackbar(
                                backgroundColor: Colors.red,
                                messageText: Text(
                                  "Please Enter your number",
                                  style:
                                      primaryFont.copyWith(color: Colors.white),
                                ),
                              );
                            }
                            //Get.toNamed('/final-otp-verification');
                          },
                          //   Get.to(const BusinessOtpvarification());},
                          child: Container(
                           width: size.width*0.42,
                          height: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                8,
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
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
              ksizedbox10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: kblue),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to( MemberSignUpScreen());
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
    );
  }
}
