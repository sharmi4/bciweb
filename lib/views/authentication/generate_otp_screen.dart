import 'package:bciweb/views/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../constant/constans.dart';
import '../../controller/auth_controller/auth_controller.dart';

class MobileVerification extends StatefulWidget {
  const MobileVerification({super.key});

  @override
  State<MobileVerification> createState() => _MobileVerificationState();
}

class _MobileVerificationState extends State<MobileVerification> {
   var phoneNumberController = TextEditingController();

  final authController = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.getCategoryList();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 600,
                    width: 450,
                    child: Column(
                      children: [
                        ksizedbox30,
                        Container(child: Image.asset('assets/images/3534.png')),
                        ksizedbox30,
                        Text(
                          'WELCOME',
                          style: TextStyle(
                              fontSize: 27,
                              color: kblue,
                              fontWeight: FontWeight.w700),
                        ),
                        ksizedbox30,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'We will send you an ',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18, color: kblue),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'One Time Password',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: kblue),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'on this mobile number',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: kblue),
                          ),
                        ),
                           // GetBuilder<AuthController>(builder: (_) {
              //   return Padding(
              //     padding: const EdgeInsets.only(top: 15),
              //     child: Container(
              //       height: 44,
              //       width: 330,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(3),
              //           border: Border.all(
              //               color: const Color.fromARGB(255, 5, 5, 5)
              //                   .withOpacity(0.8))),
              //       child: Padding(
              //         padding:
              //             const EdgeInsets.only(left: 10, right: 10, top: 10),
              //         child: DropdownButton<SubCategoryModelListR>(
              //           value: merchantSubCategory,
              //           isExpanded: true,
              //           icon: const Icon(Icons.keyboard_arrow_down_outlined),
              //           elevation: 0,
              //           itemHeight: 55,
              //           isDense: true,
              //           dropdownColor: Colors.grey[250],
              //           style: const TextStyle(color: Colors.black54),
              //           hint: Text(
              //             "Sub Category",
              //             style: TextStyle(fontSize: 16, color: kblue),
              //           ),
              //           onChanged: (SubCategoryModelList? value) {
              //             // This is called when the user selects an item.
              //             setState(() {
              //               // authController.isDesignationSelected(false);
              //               merchantSubCategory = value!;
              //             });
              //           },
              //           items: authController.subCategoryList
              //               .map<DropdownMenuItem<SubCategoryModelList>>(
              //                   (SubCategoryModelList value) {
              //             return DropdownMenuItem<SubCategoryModelList>(
              //               value: value,
              //               child: Text(value.title),
              //             );
              //           }).toList(),
              //         ),
              //       ),
              //     ),
              //   );
              // }),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                            width: size.width * 0.3,
                            height: 50,
                            child: TextFormField(
                              controller: phoneNumberController,
                               keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                              decoration: InputDecoration(
                                prefixIcon:
                                    Image.asset('assets/images/Image 8.png'),
                                // suffixIcon: Image.asset(
                                //     'assets/images/flaightcorrectimage.png'),
                                hintText: 'Enter your Number',
                              
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        ksizedbox20,
                        Obx(()=>
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: authController.isLoading.isTrue ?
                            Container(
                              width: size.width*0.25,
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
                            ):InkWell(
                              onTap: () {
                                 if (phoneNumberController.text.isNotEmpty) {
                                  authController.getOtpFunction(
                                      mobileNumber: phoneNumberController.text, isMobile: false);
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
                                width: size.width * 0.25,
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
                                Get.to(SignUpView(isMobile: '',));
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
                  child: Container(
                    color: kblue,
                    //    height: 600,width: 450,
                    child: Image.asset(
                      'assets/images/4563.png',
                      height: size.height,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
