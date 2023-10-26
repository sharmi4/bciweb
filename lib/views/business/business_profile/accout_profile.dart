import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../../constant/constans.dart';
import '../../../controller/auth_controller/auth_profile_controller.dart';
import '../../../controller/business_controller/business_service_controller.dart';
import '../../../controller/profile_controller.dart';
import '../../../models/business_model/business_update_model.dart';

class BusinessProfileSettings extends StatefulWidget {
  const BusinessProfileSettings({super.key});

  @override
  State<BusinessProfileSettings> createState() =>
      _BusinessProfileSettingsState();
}

class _BusinessProfileSettingsState extends State<BusinessProfileSettings> {
  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(1910),
      locale: const Locale('en', 'IN'),
      lastDate: DateTime.now(),
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
    // if (picked != null) {
    //   setState(() {
    //     selectedDate = picked;
    //     dateofbirthController.text =
    //         formatDate(selectedDate, [dd, "/", mm, "/", yyyy]);
    //   });
    // }
  }

  File? image;
  File? image2;

  TextfieldTagsController? _controller;

  DateTime selectedDate2 = DateTime.now();
  _selectDate2(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate2,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(1910),
      locale: const Locale('en', 'IN'),
      lastDate: DateTime.now(),
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

    // if (picked != null && picked != selectedDate2) {
    //   setState(() {
    //     selectedDate2 = picked;
    //     wedingnameController.text =
    //         formatDate(selectedDate2, [dd, "/", mm, "/", yyyy]);
    //   });
    // }
  }

  bool isMarried = false;
  bool isUnmarried = false;
  int offersindex = 0;
  bool isLoading = false;

  final businessprofileController = Get.find<ProfileController>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();
  var alternumberController = TextEditingController();
  var gstController = TextEditingController();
  var businessaddressController = TextEditingController();
  var banknameController = TextEditingController();
  var accountholdernameController = TextEditingController();
  var accounttype = TextEditingController();
  var bankaccountnumber = TextEditingController();
  var ifscController = TextEditingController();
  var mapurlController = TextEditingController();
  var categoryController = TextEditingController();
  dynamic selectedGender = '';
  dynamic imageprofile;
  dynamic aadharimage;
  dynamic panimage;

  setDefauld() async {
    await businessprofileController.getProfile();

    if (businessprofileController.profileData.isNotEmpty) {
      nameController.text = businessprofileController.profileData.first.name;
      numberController.text =
          businessprofileController.profileData.first.mobile;
      alternumberController.text =
          businessprofileController.profileData.first.alternateMobile;
      emailController.text = businessprofileController.profileData.first.email;
      categoryController.text =
          businessprofileController.profileData.first.category;
      gstController.text = businessprofileController.profileData.first.gstNo;
      bankaccountnumber.text =
          businessprofileController.profileData.first.bankAccountNumber;
      banknameController.text =
          businessprofileController.profileData.first.bankName;
      accountholdernameController.text =
          businessprofileController.profileData.first.bankAccountName;
      accounttype.text =
          businessprofileController.profileData.first.accountType;
      businessaddressController.text =
          businessprofileController.profileData.first.address;
      ifscController.text =
          businessprofileController.profileData.first.ifscCode;
      mapurlController.text = businessprofileController
          .profileData.first.locationAddress
          .toString();
    }
  }

  @override
  void initState() {
    super.initState();
    setDefauld();

    _controller = TextfieldTagsController();
  }

  double? _distanceToField;
  // TextfieldTagsController? _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    // _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Obx(
        () => businessprofileController.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              )
            : Column(
                children: [
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, left: 75),
                      child: GetBuilder<AuthProfileController>(builder: (_) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(""),
                            if (businessprofileController
                                .profileData.isNotEmpty)
                              GestureDetector(
                                onTap: () async {
                                  PickedFile? pickedFile =
                                      await ImagePicker().getImage(
                                    source: ImageSource.gallery,
                                  );

                                  var tempCont =
                                      await pickedFile!.readAsBytes();
                                  setState(
                                    () {
                                      imageprofile = tempCont;
                                    },
                                  );
                                  businessprofileController
                                      .updateProfilePic(imageprofile);
                                },
                                child: imageprofile != null
                                    ? Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  child: Image.memory(
                                                    imageprofile!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            left: 55,
                                            top: 55,
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                color: kblue,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : businessprofileController
                                            .profileData.isNotEmpty
                                        ? businessprofileController.profileData
                                                    .first.profilePicture ==
                                                null
                                            ? Stack(
                                                children: [
                                                  Image.asset(
                                                      'assets/images/prfl.png'),
                                                  Positioned(
                                                    left: 85,
                                                    top: 95,
                                                    child: Container(
                                                      height: 25,
                                                      width: 25,
                                                      decoration: BoxDecoration(
                                                        color: kblue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: const Center(
                                                        child: Icon(
                                                          Icons.camera_alt,
                                                          color: Colors.white,
                                                          size: 17,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Stack(
                                                children: [
                                                  Container(
                                                    height: 80,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                          businessprofileController
                                                              .profileData
                                                              .first
                                                              .profilePicture,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 55,
                                                    top: 55,
                                                    child: Container(
                                                      height: 25,
                                                      width: 25,
                                                      decoration: BoxDecoration(
                                                        color: kblue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      child: const Center(
                                                        child: Icon(
                                                          Icons.camera_alt,
                                                          color: Colors.white,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                        //  Container(
                                        //     height: 60,
                                        //     width: 60,
                                        //     decoration: BoxDecoration(
                                        //         borderRadius:
                                        //             BorderRadius
                                        //                 .circular(
                                        //                     90),
                                        //         image: DecorationImage(
                                        //             image: NetworkImage(
                                        //                 authprofileController
                                        //                     .profileData
                                        //                     .first
                                        //                     .profilePicture,))),
                                        //   )
                                        : Container(
                                            height: 20,
                                          ),
                              ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 40),
                              child: Text(
                                "",
                                style: TextStyle(
                                    color: Color(0xffFF5003),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        );
                      }),
                    )
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 70, top: 30, bottom: 30),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                                hintText: 'Merchant display name',
                                labelText: 'Merchant display name',
                                fillColor: Color(0xffF9F8FD),
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 70, right: 50, top: 30, bottom: 30),
                          child: Container(
                            child: Column(
                              children: [
                                TextField(
                                    controller: businessaddressController,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                        hintText: 'Business Address',
                                        labelText: 'Business Address',
                                        fillColor: const Color(0xffF9F8FD),
                                        border: const OutlineInputBorder())),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 70, top: 0, bottom: 30),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            controller: mapurlController,
                            decoration: const InputDecoration(
                                hintText: 'Map Url',
                                labelText: 'Map Url',
                                fillColor: Color(0xffF9F8FD),
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 70, right: 50, top: 0, bottom: 30),
                          child: Container(
                            child: Column(
                              children: [
                                TextField(
                                    textInputAction: TextInputAction.next,
                                    controller: numberController,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                      FilteringTextInputFormatter.digitsOnly,
                                      FilteringTextInputFormatter.deny(
                                          RegExp(r'\s')),
                                    ],
                                    decoration: InputDecoration(
                                        hintText: 'Mobile Number',
                                        labelText: 'Mobile Number',
                                        fillColor: const Color(0xffF9F8FD),
                                        border: const OutlineInputBorder())),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 70, top: 0, bottom: 30),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            controller: alternumberController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter.digitsOnly,
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                            decoration: const InputDecoration(
                                hintText: 'Alternative Number',
                                labelText: 'Alternative Number',
                                fillColor: Color(0xffF9F8FD),
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 70, right: 50, top: 0, bottom: 30),
                          child: Container(
                            child: Column(
                              children: [
                                TextField(
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        hintText: 'Email Address',
                                        labelText: 'Email Address',
                                        fillColor: const Color(0xffF9F8FD),
                                        border: const OutlineInputBorder())),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 70, top: 0, bottom: 30),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            controller: gstController,
                            decoration: const InputDecoration(
                                hintText: 'GST NO',
                                labelText: 'GST NO',
                                fillColor: Color(0xffF9F8FD),
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 70, right: 50, top: 0, bottom: 30),
                          child: Container(
                            child: Column(
                              children: [
                                TextField(
                                    textInputAction: TextInputAction.next,
                                    controller: banknameController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        hintText: 'Bank Name',
                                        labelText: 'Bank Name',
                                        fillColor: const Color(0xffF9F8FD),
                                        border: const OutlineInputBorder())),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  ksizedbox10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 70, top: 0, bottom: 30),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            controller: accountholdernameController,
                            decoration: const InputDecoration(
                                hintText: 'Account Holder Name',
                                labelText: 'Account Holder Name',
                                fillColor: Color(0xffF9F8FD),
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 70, right: 50, top: 0, bottom: 30),
                          child: Container(
                            child: Column(
                              children: [
                                TextField(
                                  textInputAction: TextInputAction.next,
                                  controller: accounttype,
                                  decoration: const InputDecoration(
                                      hintText: ' Account Type',
                                      labelText: ' Account Type',
                                      fillColor: Color(0xffF9F8FD),
                                      border: OutlineInputBorder()),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ksizedbox10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 70, top: 0, bottom: 30),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            controller: bankaccountnumber,
                            decoration: const InputDecoration(
                                hintText: 'Bank Account Number',
                                labelText: 'Bank Account Number',
                                fillColor: Color(0xffF9F8FD),
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 70, right: 50, top: 0, bottom: 30),
                          child: Container(
                            child: Column(
                              children: [
                                TextField(
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  controller: ifscController,
                                  decoration: const InputDecoration(
                                      hintText: 'IFSC Code',
                                      labelText: 'IFSC code',
                                      fillColor: Color(0xffF9F8FD),
                                      border: OutlineInputBorder()),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ksizedbox10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 180,
                            width: 250,
                            child: businessprofileController
                                            .profileData.first.panProof ==
                                        null &&
                                    panimage != null
                                ? panimage != null
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.memory(
                                          panimage,
                                          height: 330,
                                          width: 400,
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300]),
                                        height: 330,
                                        width: 400,
                                        child: GestureDetector(
                                          onTap: () async {
                                            PickedFile? pickedFile =
                                                await ImagePicker().getImage(
                                              source: ImageSource.gallery,
                                            );

                                            var tempCont =
                                                await pickedFile!.readAsBytes();
                                            setState(
                                              () {
                                                panimage = tempCont;
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.cloud_upload_outlined,
                                                color: kgrey,
                                              ),
                                              Text(
                                                'Upload Pan Card',
                                                style: TextStyle(
                                                  color: kgrey,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                : GestureDetector(
                                    onTap: () async {
                                      PickedFile? pickedFile =
                                          await ImagePicker().getImage(
                                        source: ImageSource.gallery,
                                      );

                                      var tempCont =
                                          await pickedFile!.readAsBytes();
                                      print("---------------------->> chRGES");

                                      setState(() {
                                        businessprofileController
                                            .profileData.first.panProof = null;
                                        panimage = tempCont;
                                      });
                                    },
                                    child: Image.network(
                                        businessprofileController
                                            .profileData.first.panProof),
                                  ),
                          ),
                          kwidth10,
                          kwidth10,
                          kwidth10,
                          businessprofileController.profileData.isEmpty
                              ? Container(
                                  height: 20,
                                )
                              : Container(
                                  height: 180,
                                  width: 250,
                                  child: businessprofileController
                                              .profileData.first.adharProof ==
                                          null
                                      ? aadharimage != null
                                          ? Image.memory(aadharimage)
                                          // : authprofileController.profileData.first.adharProof !=
                                          //         null
                                          : Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300]),
                                              height: 330,
                                              width: 400,
                                              child: GestureDetector(
                                                onTap: () async {
                                                  PickedFile? pickedFile =
                                                      await ImagePicker()
                                                          .getImage(
                                                    source: ImageSource.gallery,
                                                  );

                                                  var tempCont =
                                                      await pickedFile!
                                                          .readAsBytes();
                                                  setState(() {
                                                    aadharimage = tempCont;
                                                  });
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.memory(aadharimage),
                                                    Icon(
                                                      Icons
                                                          .cloud_upload_outlined,
                                                      color: kgrey,
                                                    ),
                                                    Text(
                                                      'Upload Adhaar Card',
                                                      style: TextStyle(
                                                        color: kgrey,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                      : GestureDetector(
                                          onTap: () async {
                                            PickedFile? pickedFile =
                                                await ImagePicker().getImage(
                                              source: ImageSource.gallery,
                                            );

                                            var tempCont =
                                                await pickedFile!.readAsBytes();
                                            setState(() {
                                              aadharimage = tempCont;
                                            });
                                          },
                                          child: Image.network(
                                              businessprofileController
                                                  .profileData
                                                  .first
                                                  .adharProof),
                                        ),
                                ),
                        ],
                      ),

                      //
                      //kwidth10  ,kwidth10 ,  kwidth10  ,kwidth10
                    ],
                  ),

                  ksizedbox30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: Colors.white,
                                  title: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/userdlt.png',
                                        height: 150,
                                        fit: BoxFit.fitHeight,
                                      ),
                                      Text("Delete Account!",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ],
                                  ),
                                  content: const Text(
                                    "Are you sure want to this Delete account?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                // ignore: unrelated_type_equality_checks
                                                color: kwhite),
                                            child: Center(
                                                child: Text("Cancel",
                                                    style: TextStyle(
                                                        color: kOrange))),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // authController.logoutindex(1);
                                            // authController.update();
                                            Get.find<
                                                    BusinessServiceController>()
                                                .deleteUser();
                                            Get.find<
                                                    BusinessServiceController>()
                                                .logout();
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                color: kOrange,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(color: kwhite),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ksizedbox10
                                  ],
                                );
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.33,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border:
                                    Border.all(color: const Color(0xffFF9021)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xffFF5003),
                                    blurRadius: 2.0,
                                  ),
                                ]),
                            child: const Center(
                              child: Text(
                                "Delete your account",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => businessprofileController.isLoading.isTrue
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(top: 0, left: 40),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        print(
                                            '------------${aadharimage}------adhaar------------------');
                                        print(
                                            '------------${panimage}}------pan------------------');
                                        print(panimage);
                                        MerchantUpdateModel
                                            merchantUpdateModel =
                                            MerchantUpdateModel(
                                          name: nameController.text,
                                          email: emailController.text,
                                          mobile: numberController.text,
                                          gstNo: gstController.text,
                                          accountType: accounttype.text,
                                          address:
                                              businessaddressController.text,
                                          alternateMobile:
                                              alternumberController.text,
                                          bankAccountName:
                                              accountholdernameController.text,
                                          bankAccountNumber:
                                              bankaccountnumber.text,
                                          bankName: banknameController.text,
                                          categoryId: categoryController.text,
                                          ifscCode: ifscController.text,
                                          shopImage: imageprofile,
                                          aadharProof: aadharimage,
                                          panProof: panimage,
                                        );

                                        businessprofileController.updateProfile(
                                            merchantUpdateModel:
                                                merchantUpdateModel);
                                      },
                                      child: Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.34,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            border: Border.all(
                                                color: const Color(0xffFF9021)),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color(0xffFF5003),
                                                blurRadius: 2.0,
                                              ),
                                            ]),
                                        child: CircularProgressIndicator(
                                          color: kwhite,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.only(top: 0, left: 40),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        print(
                                            '-----<<<<<<<<<<-----------------------------${accountholdernameController.text}------------------------------------>>>>>>');

                                        print(
                                            '-----<<<<<<<<<<-----------------------------${bankaccountnumber.text}------------------------------------>>>>>>');

                                        MerchantUpdateModel
                                            merchantUpdateModel =
                                            MerchantUpdateModel(
                                          name: nameController.text,
                                          email: emailController.text,
                                          mobile: numberController.text,
                                          gstNo: gstController.text,
                                          accountType: accounttype.text,
                                          address:
                                              businessaddressController.text,
                                          alternateMobile:
                                              alternumberController.text,
                                          bankAccountName:
                                              accountholdernameController
                                                      .text.isEmpty
                                                  ? ""
                                                  : accountholdernameController
                                                      .text,
                                          bankAccountNumber:
                                              bankaccountnumber.text.isEmpty
                                                  ? ""
                                                  : bankaccountnumber.text,
                                          bankName:
                                              banknameController.text.isEmpty
                                                  ? ""
                                                  : banknameController.text,
                                          categoryId:
                                              categoryController.text.isEmpty
                                                  ? ""
                                                  : categoryController.text,
                                          ifscCode: ifscController.text.isEmpty
                                              ? ""
                                              : ifscController.text,
                                          shopImage: imageprofile ?? "",
                                          aadharProof: aadharimage,
                                          panProof: panimage,
                                        );

                                        print("---------<<>update");

                                        businessprofileController.updateProfile(
                                            merchantUpdateModel:
                                                merchantUpdateModel);
                                      },
                                      child: Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.34,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            border: Border.all(
                                                color: const Color(0xffFF9021)),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color(0xffFF5003),
                                                blurRadius: 2.0,
                                              ),
                                            ]),
                                        child: Center(
                                            child: Text(
                                          'Update',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),

                  ksizedbox30,
                  //      Row(
                  //       mainAxisAlignment:
                  //           MainAxisAlignment.spaceAround,
                  //       children: [

                  //   ],
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 40),
                  //   child: Row(
                  //     children: [
                  //       TextField(
                  //         textInputAction: TextInputAction.next,
                  //         controller: resiperidController,
                  //         decoration: InputDecoration(
                  //             hintText: 'Personal Id',
                  //             suffixIcon: Icon(Icons.upload),
                  //             fillColor: Color(0xffF9F8FD),
                  //             border: OutlineInputBorder()),
                  //       ),
                  //       TextField(
                  //           textInputAction: TextInputAction.next,
                  //           controller: resiadaridController,
                  //           decoration: InputDecoration(
                  //               hintText: 'Adhaar Id',
                  //               suffixIcon: Icon(Icons.upload),
                  //               fillColor: Color(0xffF9F8FD),
                  //               border: OutlineInputBorder()),
                  //         ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
      ),
    );
  }
}
