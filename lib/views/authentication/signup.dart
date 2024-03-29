import 'package:bciweb/views/responsive------------------------------------/authentications/generate_otp/generate_otp.dart';
import 'package:bciweb/views/authentication/residential_Address.dart';
import 'package:bciweb/views/authentication/widgets/formfield.dart';
import 'package:bciweb/views/members/home_screen.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../constant/constans.dart';
import '../../controller/auth_controller/auth_controller.dart';
import '../../models/create_account_model.dart';
import 'landing_screen.dart';
import 'otp_verification.dart';

class SignUpView extends StatefulWidget {
   CreateAccountModel? memberRegisterModel;
  
   SignUpView({super.key, this.memberRegisterModel,required String isMobile});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  var usernameController=TextEditingController();
   var dobController=TextEditingController();
  var emailController=TextEditingController();
  var mobilenumberController=TextEditingController();
  var occupationController=TextEditingController();
  var fathernameController=TextEditingController();
  var mothernameController=TextEditingController();
  var referalcodeController = TextEditingController();
    var _formKey = GlobalKey<FormState>();

       bool ismarried= false;
    bool isunmarried=false;
    bool isvalue = false;

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
        dobController.text = formatDate(date, [dd, "/", mm, "/", yyyy]);
      });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   authcontroller.memberRegister(memberRegisterModel:widget.memberRegisterModel, isMobile:false,
  //   referalcode: referalcodeController.text );
  // }

  var dateOfBirthController = TextEditingController();
   final authcontroller = Get.find<AuthController>();
   bool checkvalue = false;
   
  @override
  Widget build(BuildContext context) {
 
    var size = MediaQuery.of(context).size;

    return SelectionArea(
      child: Scaffold(
        body: ListView(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          'Sign Up Now',
                          style: TextStyle(
                              fontSize: 27, color: kblue, fontWeight: FontWeight.w700),
                        ),
                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:30),
                                        child: Text(
                                                        'Please fill the details and create account ',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w600,
                                                            //   decoration: TextDecoration.underline,
                                                            color: kblue),
                                                      ),
                                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                            width: size.width * 0.3,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Formfield(
                                    text: 'User Name',
                                    controller: usernameController,
                                    
                                  ),
                                  
                //                   Padding(
                //   padding: const EdgeInsets.only(top: 15),
                //   child: TextFormField(
                //  controller: dobController,
                //  readOnly: true,
                //  onTap: () {
                //       _selectDate(context);
                //     },
                //     autovalidateMode: AutovalidateMode.onUserInteraction,
                //     validator: (value) {
                //       if (value!.isEmpty) {
                //         return "DOB can't be empty";
                //       }
                //       return null;
                //     },
                //     decoration: InputDecoration(
                //         fillColor: Colors.white,
                //         filled: true,
                //         enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide:
                //                 const BorderSide(color: const Color(0xff707070))),
                //         focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide:
                //                 const BorderSide(color: const Color(0xff707070))),
                //         isCollapsed: false,
                //         isDense: true,
                //         contentPadding:
                //             const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide:
                //                 const BorderSide(color: const Color(0xff707070))),
                //         hintText: "Date Of Birth",
                //         hintStyle: TextStyle(
                //           color: kblue,
                //           fontWeight: FontWeight.w400,
                //         )),
                //   ),
                // ),
                                 
                                  ksizedbox20,
                                  Formfield(
                                    text: 'Email',
                                    controller: emailController,
                                  ),
                                  ksizedbox20,
                                  Formfield(
                                    text: 'Mobile Number',
                                    controller: mobilenumberController,
                                  ),
                                  ksizedbox10,
                                 checkvalue==true? Formfield(
                                    text: 'Referal Code',
                                    controller: referalcodeController,
                                  ):Text(''),
                                  ksizedbox20,
                                  Row(
                                    children: [
                                      Checkbox(value: checkvalue, 
                                      onChanged: (value){
                                        setState(() {
                                          checkvalue = value!;
                                        });
                                      }),
                                      Text('Referal Code')
                                    ],
                                  )
                                  // ksizedbox20,
                                  // Formfield(
                                  //   text: 'Father Name',
                                  //   controller: fathernameController,
                                  // ),
                                  // ksizedbox20,
                                  // Formfield(
                                  //   text: 'Mother Name',
                                  //   controller: mothernameController,
                                  // ),
        //                           ksizedbox20,
      
        //                           Padding(
        //                             padding: const EdgeInsets.only(top: 10),
        //                             child: Container(
                                     
        //                               height: 40,
        //                               decoration: BoxDecoration(
        //                                   borderRadius: BorderRadius.circular(5),
        //                                   border: Border.all(color: Color(0xff707070))),
        //                                    child: Row(
        //                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,                            
        //                                           children: [
        //                                              Padding(
        //                                                padding: const EdgeInsets.only(left: 15),
        //                                                child: Row(
        //                                                 mainAxisAlignment: MainAxisAlignment.start,
        //                                                  children: [
        //                                                    Text('Married',
        //                                                    style: TextStyle(
        //                                                     color: kblue
        //                                                    ),),
        //                                                    Checkbox(
        //                                                 activeColor: Colors.white,
        //                                                    checkColor: kblue,
                                                           
        //                                                    value: ismarried,
        //                                                    onChanged: (bool? value) {
        //                                                      setState(() {
        //                                                        ismarried = value!;
        //                                                      });
                                                           
        //                                                    },
        //                                                  ),
        //                                                  ],
        //                                                ),
        //                                              ),
                                                    
        // Padding(
        //   padding: const EdgeInsets.only(right: 10),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       Text('Unmarried',
        //       style: TextStyle(
        //                                                     color: kblue
        //                                                    ),),
        //        Padding(
        //                                                 padding: const EdgeInsets.only(left: 10),
        //                                                 child: Checkbox(
        //                                                    activeColor: Colors.white,
        //                                                    checkColor: kblue,
        //                                                   value: isunmarried, 
        //                                                 onChanged: (value){
        //                                                   setState(() {
        //                                                     isunmarried=value!;
        //                                                   });
        //                                                 }),
        //                                               ),
        //     ],
        //   ),
        // ),
                                                   
                                                   
                                                  
        //                                           ],
        //                                         ),
        //                             ),
        //                           ),
                                ],
                              ),
                            )),
                      ),
            
                      //   ksizedbox30,
                      ksizedbox30,
                      InkWell(
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            CreateAccountModel memberRegisterModel=
                            CreateAccountModel(
                              referalcode: referalcodeController.text,
                              name: usernameController.text, 
                              email: emailController.text, 
                              mobilenumber: mobilenumberController.text,
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
                               );
                               authcontroller.memberRegister(memberRegisterModel: memberRegisterModel,
                                isMobile: false,referalcode:referalcodeController.text );
    
                                // Get.to(MemberHomeScreen());
                              //Get.to(ResidentialAddress(memberRegisterModel: memberRegisterModel,));
                          }
                        },
                        child: Container(
                          width: size.width * 0.25,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              6,
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
                            'Register',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                     
                      ksizedbox20,
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
                              // Get.to(MemberLoginScreen());
                              // Get.to(OtpVerification());
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
                       ksizedbox20,
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
                ),
               
              ],
            ),
          ],
        ),
      ),
    );
  }
}
