import 'package:bciweb/views/authentication/widgets/formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../constant/constans.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Container(
            child: Column(
              children: [
                Text(
                  'Sign Up Now',
                  style: TextStyle(
                      fontSize: 30, color: kblue, fontWeight: FontWeight.w700),
                ),
                ksizedbox10,
                Text(
                  'Please fill the details and create account ',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      //   decoration: TextDecoration.underline,
                      color: kblue),
                ),
                Container(
                    width: size.width * 0.3,
                    child: Column(
                      children: [
                        Formfield(
                          text: 'User Name',
                        ),
                        Formfield(
                          text: 'Date Of Birth',
                        ),
                        Formfield(
                          text: 'Email',
                        ),
                        Formfield(
                          text: 'Mobile Number',
                        ),
                        Formfield(
                          text: 'Occupation',
                        ),
                        Formfield(
                          text: 'Father Name',
                        ),
                        Formfield(
                          text: 'Mother Name',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            child: Row(
                              children: [
                                kwidth10,
                                Text(
                                  "Married :",
                                  style: TextStyle(color: kblue, fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.all(kblue),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                                kwidth10,
                                kwidth10,
                                Text(
                                  "UnMarried :",
                                  style: TextStyle(color: kblue, fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.all(kblue),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Color(0xff707070))),
                          ),
                        ),
                      ],
                    )),

                //   ksizedbox30,
                ksizedbox30,
                InkWell(
                  onTap: () {Get.toNamed('/office-addreass');},
                  child: Container(
                    width: size.width * 0.3,
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
                      'Create Account',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ksizedbox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account? ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          //   decoration: TextDecoration.underline,
                          color: kblue),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/otp-verification');
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            color: kOrange),
                      ),
                    ),
                    ksizedbox20,
                  ],
                ),
              ],
            ),
          )),
          Expanded(
            child: Container(
              color: kblue,
              child: Image.asset(
                'assets/images/Group 6011.png',
                height: size.height,
              ),
            ),
          )
        ],
      ),
    );
  }
}
