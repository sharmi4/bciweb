import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import '../../../constant/constans.dart';
import '../../../controller/auth_controller/auth_controller.dart';
import '../../../models/business_model/merchants_register_model.dart';
import '../../../models/category_model.dart';
import 'business_generate_otp_screen.dart';

class BusinessSignupScreen extends StatefulWidget {
  BusinessSignupScreen({super.key, required String isMobile});

  @override
  State<BusinessSignupScreen> createState() => _BusinessSignupScreenState();
}

class _BusinessSignupScreenState extends State<BusinessSignupScreen> {
  var merchantCategory;
  var merchantSubCategory;

  var _formKey = GlobalKey<FormState>();

  var merchantDistplaynameController = TextEditingController();
  var emailIdController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var alternativeMobileController = TextEditingController();
  var businessAddressController = TextEditingController();
  var gstNoController = TextEditingController();
  var referalcodeController = TextEditingController();

  bool isReferral = false;

  File? aadharCardImage;
  File? panCardImage;

  @override
  void initState() {
    super.initState();
    authcontroller.getCategoryList();
    authcontroller.getSubCategoryList();
  }

  bool checkvalue = false;

  bool ismarried = false;
  bool isunmarried = false;
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
        //dobController.text = formatDate(date, [dd, "/", mm, "/", yyyy]);
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign Up Now",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: kblue),
                      ),
                      ksizedbox10,
                      Text(
                        "Please fill the details and create account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: kblue),
                      ),

                      ksizedbox30,
                      GetBuilder<AuthController>(builder: (_) {
                        return Container(
                          height: 55,
                          width: 220,
                          child: DropdownSearch<CategoryData>(
                            itemAsString: (CategoryData u) => u.title,
                            popupProps: PopupProps.menu(
                              showSelectedItems: false,
                              showSearchBox: true,
                              menuProps: MenuProps(
                                  borderRadius: BorderRadius.circular(15)),
                              searchFieldProps: const TextFieldProps(),
                            ),
                            items: authcontroller.categoryData,
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  // labelText: "Department *",
                                  hintText: "Category",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xff707070)),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xff707070)),
                                      borderRadius: BorderRadius.circular(5)),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xff707070)),
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                            onChanged: (value) {
                              setState(() {
                                // authController
                                //     .isDesignationSelected(false);
                                merchantCategory = value!;
                                // requiremtsSelected = null;
                              });
                            },
                            // selectedItem: selectedState,
                          ),
                        );
                      }),
                      // ksizedbox30,

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
                      //         child: DropdownButton<SubCategoryModelList>(
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
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          width: size.width * 0.3,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: merchantDistplaynameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textCapitalization: TextCapitalization.words,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[a-z A-Z]"))
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Merchant display name can't be empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color: Color(0xff707070))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color: Color(0xff707070))),
                                isCollapsed: false,
                                isDense: true,
                                contentPadding: const EdgeInsets.only(
                                    top: 12, bottom: 12, left: 15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color: Color(0xff707070))),
                                hintText: "Merchant Display Name",
                                hintStyle: TextStyle(
                                  color: kblue,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          width: size.width * 0.3,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailIdController,
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email Id can't be empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Color(0xff707070),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Color(0xff707070),
                                ),
                              ),
                              isCollapsed: false,
                              isDense: true,
                              contentPadding: const EdgeInsets.only(
                                  top: 12, bottom: 12, left: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Color(0xff707070),
                                ),
                              ),
                              hintText: "Email ID",
                              hintStyle: TextStyle(
                                color: kblue,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          width: size.width * 0.3,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: phoneNumberController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Phone Number name can't be empty";
                              } else if (value.length < 10) {
                                return "Phone Number must be 10 digit";
                              }
                              return null;
                            },
                            //  textCapitalization: TextCapitalization.characters,
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
                                    borderSide: const BorderSide(
                                        color: Color(0xff707070))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color: Color(0xff707070))),
                                isCollapsed: false,
                                isDense: true,
                                contentPadding: const EdgeInsets.only(
                                    top: 12, bottom: 12, left: 15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color: Color(0xff707070))),
                                hintText: "Phone Number",
                                hintStyle: TextStyle(
                                  color: kblue,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ),
                      ),

                      if (isReferral == true)
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            width: size.width * 0.3,
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: referalcodeController,
                              //autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Color(0xff707070))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Color(0xff707070))),
                                  isCollapsed: false,
                                  isDense: true,
                                  contentPadding: const EdgeInsets.only(
                                      top: 12, bottom: 12, left: 15),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Color(0xff707070))),
                                  hintText: "Referral Code",
                                  hintStyle: TextStyle(
                                    color: kblue,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                          ),
                        ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.all(kblue),
                            value: isReferral,
                            onChanged: (bool? value) {
                              setState(() {
                                isReferral = value!;
                              });
                            },
                          ),
                          ksizedbox20,
                          Text(
                            "Referral Code",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: kblue),
                          ),
                        ],
                      ),
                      ksizedbox40,
                      Obx(
                        () => authcontroller.isLoading.isTrue
                            ? Container(
                                height: 50,
                                width: size.width * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color: const Color(0xffFFBF7E)),
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
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (merchantCategory != null) {
                                      MerchantRegisterModel
                                          merchantRegisterModel =
                                          MerchantRegisterModel(
                                              email: emailIdController.text,
                                              mobile:
                                                  phoneNumberController.text,
                                              name:
                                                  merchantDistplaynameController
                                                      .text,
                                              roleId: "5");

                                      authcontroller.registerMerchants(
                                          referralCode:
                                              referalcodeController.text,
                                          merchantRegisterModel:
                                              merchantRegisterModel);
                                    }
                                  } else {
                                    Get.rawSnackbar(
                                        backgroundColor: Colors.red,
                                        messageText: Text(
                                          "Fill All the Fields",
                                          style: primaryFont.copyWith(
                                              color: Colors.white),
                                        ));
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: size.width * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: const Color(0xffFFBF7E)),
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
                                  child: const Center(
                                    child: Text(
                                      "Create Account",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
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
                            "Already have account? ",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: kblue),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(const BusinessMobileVerification());
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
              Container(
                height: size.height,
                color: kblue,
                child: Image(image: AssetImage("assets/images/Group 6011.png")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
