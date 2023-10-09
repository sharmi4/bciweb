import 'package:bciweb/views/members/responsive/authentications/sign_up_view/residential_address_screen.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../../../constant/constans.dart';
import '../../../../../models/create_account_model.dart';
import '../generate_otp/generate_otp.dart';

class MemberSignUpScreen extends StatefulWidget {
  const MemberSignUpScreen({super.key});

  @override
  State<MemberSignUpScreen> createState() => _MemberSignUpScreenState();
}

class _MemberSignUpScreenState extends State<MemberSignUpScreen> {
  bool isChecked = false;
  bool isvalue = false;
  bool showreferal = false;
  bool ischecvalue = false;

  var usernamecontroller = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var occupationController = TextEditingController();
  var fatherNameController = TextEditingController();
  var motherNameController = TextEditingController();
  var referalcodeController = TextEditingController();

  DateTime date = DateTime.now().subtract(const Duration(days: 6570));

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(1910),
      locale: const Locale('en', 'IN'),
      lastDate: DateTime.now().subtract(const Duration(days: 6570)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: kblue, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: kblue, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null)
      setState(() {
        date = picked;
        dateOfBirthController.text = formatDate(date, [dd, "/", mm, "/", yyyy]);
      });
  }

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF9F8FD),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                "Sign Up Now",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600, color: kblue),
              ),
              ksizedbox10,
              Text(
                "Please fill the details and create account",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w400, color: kblue),
              ),
              ksizedbox30,
              const Image(
                  height: 200,
                  image: AssetImage("assets/images/Group 6011.png")),
              ksizedbox30,
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: usernamecontroller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "User name can't be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      isCollapsed: false,
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      hintText: "User Name",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email can't be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      isCollapsed: false,
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: mobileController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Mobile Number can't be empty";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      isCollapsed: false,
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: const Color(0xff707070))),
                      hintText: "Mobile Number",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              ischecvalue == true
                  ? Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        controller: referalcodeController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Occupation can't be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  color: const Color(0xff707070))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  color: const Color(0xff707070))),
                          isCollapsed: false,
                          isDense: true,
                          contentPadding: const EdgeInsets.only(
                              top: 12, bottom: 12, left: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  color: const Color(0xff707070))),
                          hintText: "Referal Code",
                          hintStyle: TextStyle(
                            color: kblue,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  : ksizedbox10,
              Row(
                children: [
                  Checkbox(
                      value: ischecvalue,
                      onChanged: (value) {
                        setState(() {
                          ischecvalue = value!;
                        });
                      }),
                ],
              ),
              ksizedbox20,
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    CreateAccountModel memberRegisterModel = CreateAccountModel(
                      referalcode: referalcodeController.text,
                      name: emailController.text,
                      email: emailController.text,
                      mobilenumber: mobileController.text,
                      aadharNo: '123',
                      panNo: '1233',
                      password: '2333',
                      passwordConfirmation: '4567',
                      dateofbirth: '09867',
                      roleId: '123',
                      fatherName: 'riyas',
                      motherName: '',
                      occupation: '',
                      isMarried: '',
                      unmarried: '',

                      // aadharNo: "",
                      // email: emailController.text,
                      // fatherName: fatherNameController.text,
                      // isMarried: isChecked ? "1" : "0",
                      // mobile: mobileController.text,
                      // motherName: motherNameController.text,
                      // name: usernamecontroller.text,
                      // occupation: occupationController.text,
                      // panNo: "",
                      // password: "12345678",
                      // passwordConfirmation: "12345678",
                      // roleId: "3"
                    );
                    Get.to(ResidentialAddressScreen(
                      memberRegisterModel: memberRegisterModel,
                    ));
                  }
                },
                child: Container(
                  height: 50,
                  width: size.width,
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
                      "Next",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              ksizedbox10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have account? ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: kblue),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const MemberLoginScreenrespo());
                    },
                    child: Text(
                      'Log In',
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


// //import 'package:bci/authentications/generate_otp/generate_otp.dart';

// //import 'package:bci/authentications/otp_verification/otp_verification.dart';
// //import 'package:bci/constands/constands.dart';
// //import 'package:bci/screens/members/sign_up_view/residential_address_screen.dart';
// import 'package:bciweb/responsive/authentications/sign_up_view/residential_address_screen.dart';
// import 'package:flutter/material.dart';
// //import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../../constant/constans.dart';
// import '../../../models/create_account_model.dart';
// import '../generate_otp/generate_otp.dart';

// class MemberSignUpScreen extends StatefulWidget {
//   const MemberSignUpScreen({super.key});

//   @override
//   State<MemberSignUpScreen> createState() => _MemberSignUpScreenState();
// }

// class _MemberSignUpScreenState extends State<MemberSignUpScreen> {
//     var usernameController=TextEditingController();
//    var dobController=TextEditingController();
//   var emailController=TextEditingController();
//   var mobilenumberController=TextEditingController();
//   var occupationController=TextEditingController();
//   var fathernameController=TextEditingController();
//   var mothernameController=TextEditingController();
//    var marriedController=TextEditingController();
//     var _formKey = GlobalKey<FormState>();

//        bool ismarried= false;
//     bool isunmarried=false;
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: const Color(0xffF9F8FD),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               Text(
//                 "Sign Up Now",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 32, fontWeight: FontWeight.w600, color: kblue),
//               ),
//               ksizedbox10,
//               Text(
//                 "Please fill the details and create account",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 18, fontWeight: FontWeight.w400, color: kblue),
//               ),
//               ksizedbox30,
//               const Image(
//                   height: 200, image: AssetImage("assets/images/Group 6011.png")),
//               ksizedbox30,
//               Padding(
//                 padding: const EdgeInsets.only(top: 15),
//                 child: Container(
//                   height: 40,
//                   width: size.width,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(2),
//                       border: Border.all(color: const Color(0xff707070)),
//                       color: Colors.white),
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15, right: 10),
//                     child: TextFormField(
//                     controller:usernameController ,
//                       decoration: InputDecoration(
//                           isCollapsed: true,
//                           isDense: true,
//                           border: InputBorder.none,
//                           hintText: "User Name",
//                           hintStyle: TextStyle(
//                             color: kblue,
//                             fontWeight: FontWeight.w400,
//                           )),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 15),
//                 child: Container(
//                   height: 40,
//                   width: size.width,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(2),
//                       border: Border.all(color: const Color(0xff707070)),
//                       color: Colors.white),
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15, right: 10),
//                     child: TextFormField(
//                       controller: dobController,
//                       //controller: usernamecontroller,
//                       decoration: InputDecoration(
//                           isCollapsed: true,
//                           isDense: true,
//                           border: InputBorder.none,
//                           hintText: "Date of birth",
//                           hintStyle: TextStyle(
//                             color: kblue,
//                             fontWeight: FontWeight.w400,
//                           )),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 15),
//                 child: Container(
//                   height: 40,
//                   width: size.width,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(2),
//                       border: Border.all(color: const Color(0xff707070)),
//                       color: Colors.white),
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15, right: 10),
//                     child: TextFormField(
//                       controller: emailController,
//                       //controller: usernamecontroller,
//                       decoration: InputDecoration(
//                           isCollapsed: true,
//                           isDense: true,
//                           border: InputBorder.none,
//                           hintText: "Email",
//                           hintStyle: TextStyle(
//                             color: kblue,
//                             fontWeight: FontWeight.w400,
//                           )),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 15),
//                 child: Container(
//                   height: 40,
//                   width: size.width,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(2),
//                       border: Border.all(color: const Color(0xff707070)),
//                       color: Colors.white),
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15, right: 10),
//                     child: TextFormField(
//                       controller: mobilenumberController,
//                       //controller: usernamecontroller,
//                       decoration: InputDecoration(
//                           isCollapsed: true,
//                           isDense: true,
//                           border: InputBorder.none,
//                           hintText: "Mobile Number",
//                           hintStyle: TextStyle(
//                             color: kblue,
//                             fontWeight: FontWeight.w400,
//                           )),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 15),
//                 child: Container(
//                   height: 40,
//                   width: size.width,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(2),
//                       border: Border.all(color: const Color(0xff707070)),
//                       color: Colors.white),
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15, right: 10),
//                     child: TextFormField(
//                       controller: occupationController,
//                       //controller: usernamecontroller,
//                       decoration: InputDecoration(
//                           isCollapsed: true,
//                           isDense: true,
//                           border: InputBorder.none,
//                           hintText: "Occupation",
//                           hintStyle: TextStyle(
//                             color: kblue,
//                             fontWeight: FontWeight.w400,
//                           )),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 15),
//                 child: Container(
//                   height: 40,
//                   width: size.width,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(2),
//                       border: Border.all(color: const Color(0xff707070)),
//                       color: Colors.white),
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15, right: 10),
//                     child: TextFormField(
//                       controller: fathernameController,
//                       //controller: usernamecontroller,
//                       decoration: InputDecoration(
//                           isCollapsed: true,
//                           isDense: true,
//                           border: InputBorder.none,
//                           hintText: "Father Name",
//                           hintStyle: TextStyle(
//                             color: kblue,
//                             fontWeight: FontWeight.w400,
//                           )),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 15),
//                 child: Container(
//                   height: 40,
//                   width: size.width,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(2),
//                       border: Border.all(color: const Color(0xff707070)),
//                       color: Colors.white),
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15, right: 10),
//                     child: TextFormField(
//                       controller: mothernameController,
//                       //controller: usernamecontroller,
//                       decoration: InputDecoration(
//                           isCollapsed: true,
//                           isDense: true,
//                           border: InputBorder.none,
//                           hintText: "Mother Name",
//                           hintStyle: TextStyle(
//                             color: kblue,
//                             fontWeight: FontWeight.w400,
//                           )),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 15),
//                 child: Container(
//                   height: 40,
//                   width: size.width,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(2),
//                       border: Border.all(color: const Color(0xff707070)),
//                       color: Colors.white),
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15, right: 10),
//                     child: TextFormField(
//                       controller: marriedController,
//                       //controller: usernamecontroller,
//                       decoration: InputDecoration(
//                           isCollapsed: true,
//                           isDense: true,
//                           border: InputBorder.none,
//                           hintText: "Married",
//                           hintStyle: TextStyle(
//                             color: kblue,
//                             fontWeight: FontWeight.w400,
//                           )),
//                     ),
//                   ),
//                 ),
//               ),
//               ksizedbox40,
//            InkWell(
//                         onTap: () {
//                           if(_formKey.currentState!.validate()){
//                             CreateAccountModel memberRegisterModel=
//                             CreateAccountModel(
//                               name: usernameController.text, 
//                               email: emailController.text, 
//                               mobilenumber: mobilenumberController.text,
//                                aadharNo: '123',
//                                panNo: '1233',
//                                password: '2333',
//                                passwordConfirmation: '4567',
//                                dateofbirth: '09867',
//                                roleId: '123',
//                                fatherName: 'riyas',
//                                motherName: '',
//                                occupation: '',
//                                isMarried: '',
//                                unmarried: '',
//                                );
//                               Get.to(ResidentialAddressScreen(memberRegisterModel: memberRegisterModel,));
//                           }
//                         },
//                         child: Container(
//                           width: size.width * 0.25,
//                           height: 45,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                               6,
//                             ),
//                             border: Border.all(color: const Color(0xffFFBF7E)),
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Color(0xFFFF5C29),
//                                 blurRadius: 3.0,
//                               )
//                             ],
//                             gradient: const LinearGradient(
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight,
//                               colors: [
//                                 Color(0xFFFF5C29),
//                                 Color(0xFFFFCD38),
//                               ],
//                             ),
//                           ),
//                           child: Text(
//                             'Next',
//                             style: TextStyle(
//                                 fontSize: 22,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//               ksizedbox10,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Already have account? ",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 18, color: kblue),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.to( MemberLoginScreenrespo());
//                     },
//                     child: Text(
//                       'Log In',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w600,
//                           decoration: TextDecoration.underline,
//                           color: kOrange),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
