import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../constant/constans.dart';
import '../../../../../controller/auth_controller/auth_profile_controller.dart';
import '../../../../../controller/profile_controller.dart';
import '../../../../../controller/profile_show_controller.dart';
import '../../../../../controller/reg_profile_controller.dart';
import '../../../../../models/create_account_model.dart';
import '../../../../../models/member profileupdate.dart';
import '../../../../profile_register_page/my_account/wigits.dart';
import '../../../mobile_wdgets/comomappbar.dart';
import '../../../mobile_wdgets/drawer.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final reghomeController = Get.find<RegisterProfileController>();
  final regshowController = Get.find<ProfileShowController>();
  var mobilenameController = TextEditingController();
  var alternativeController = TextEditingController();
  var mobiledobController = TextEditingController();
  var mobileemailController = TextEditingController();
  var mobilenumberController = TextEditingController();
  var mobileoccupationController = TextEditingController();
  var mobilefathernameController = TextEditingController();
  var mobilemothernameController = TextEditingController();
  var mobilewedingnameController = TextEditingController();
  var mobilespousenameController = TextEditingController();
  var mobiledateofbirthController = TextEditingController();
  var mobilechildrensController = TextEditingController();
  var mobilereferalCOntroller = TextEditingController();
  var submobileNameController = TextEditingController();
  var subMobileController = TextEditingController();
  var submobileEmailController = TextEditingController();
  var submobileDescriptionController = TextEditingController();
  var mobileofficedoornumber = TextEditingController();
  var mobileofficebnumber = TextEditingController();
  var mobileofficeaddress = TextEditingController();
  var mobileofficecity = TextEditingController();
  var mobileofficestate = TextEditingController();
  var mobilebranchController = TextEditingController();
  var mobileadharno = TextEditingController();
  var mobileresibnameController = TextEditingController();
  var mobileresidoornumberController = TextEditingController();
  var mobileresibcityController = TextEditingController();
  var mobileresistateController = TextEditingController();
  var mobileresiperidController = TextEditingController();
  var mobileresiadaridController = TextEditingController();
  var mobileresiaddressController = TextEditingController();
  var mobilegestnoController = TextEditingController();
  var mobilepannoController = TextEditingController();
  var mobileproofidController = TextEditingController();
  var mobilepincodeController = TextEditingController();
  var mobilequalificationController = TextEditingController();
  var nameController = TextEditingController();
  var dobController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();
  var alternumberController = TextEditingController();
  var occupationController = TextEditingController();
  var fathernameController = TextEditingController();
  var mothernameController = TextEditingController();
  var wedingnameController = TextEditingController();
  var spousenameController = TextEditingController();
  var dateofbirthController = TextEditingController();
  var childrensController = TextEditingController();
  var referalCOntroller = TextEditingController();
  var subDescriptionController = TextEditingController();
  var subtitleController = TextEditingController();
  var adharController = TextEditingController();
  var gstnoController = TextEditingController();
  var pannoController = TextEditingController();
  var branchController = TextEditingController();
  var qualificationController = TextEditingController();
  var officebnameController = TextEditingController();
  var officedoornoController = TextEditingController();
  var officeaddressController = TextEditingController();
  var officeaddresController = TextEditingController();
  var officecityController = TextEditingController();
  var officestateController = TextEditingController();
  var resibnameController = TextEditingController();
  var residoornumberController = TextEditingController();
  var resibcityController = TextEditingController();
  var resistateController = TextEditingController();
  var resiperidController = TextEditingController();
  var resiadaridController = TextEditingController();
  var resiaddressController = TextEditingController();
  var subNameController = TextEditingController();
  var subEmailController = TextEditingController();
  // var subMobileController = TextEditingController();
  var panController = TextEditingController();
  var aadhaarController = TextEditingController();
  var gstController = TextEditingController();
  TextfieldTagsController? _controller;

  // Future pickerimage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imagetemp = File(image.path);
  //     setState(() {
  //       this.image = imagetemp;
  //     });
  //   } catch (e) {
  //     print('Failed to pick image:$e');
  //   }
  // }
  dynamic imageprofile;
  File? image;
  File? image2;

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        mobiledobController.text =
            '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
      });
    }
  }

  DateTime selectedDate2 = DateTime.now();
  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        mobiledobController.text =
            '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
      });
    }
  }

  Future imagepic() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imagetemp = File(image.path);
      setState(() {
        this.image = imagetemp;
      });
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }

  Future pickerimage2() async {
    try {
      final image2 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image2 == null) return;
      final imagetemp2 = File(image2.path);
      setState(() {
        this.image2 = imagetemp2;
      });
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }

  Future imagepic2() async {
    try {
      final image2 = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image2 == null) return;
      final imagetemp2 = File(image2.path);
      setState(() {
        this.image2 = imagetemp2;
      });
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }

  Future pickerimage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imagetemp = File(image.path);
      setState(() {
        this.image = imagetemp;
      });
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }

  int tempCont = 0;
  int offersindex = 0;
  List partnerimage = [
    'assets/images/partnerimage1.png',
    'assets/images/partnerimage2.png',
    'assets/images/partnerimage3.png',
    'assets/images/partnerimage4.png',
    'assets/images/partnerimage5.png',
    'assets/images/partnerimage6.png'
  ];
  final authprofileController = Get.find<AuthProfileController>();
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    setDefauld();
  }

  setDefauld() async {
    await authprofileController.getProfile();
    if (authprofileController.profileData.isNotEmpty) {
      mobilenameController.text = authprofileController.profileData.first.name;
      mobilenumberController.text =
          authprofileController.profileData.first.mobile;
      mobileemailController.text =
          authprofileController.profileData.first.email;
      mobileoccupationController.text =
          authprofileController.profileData.first.occupation;
      mobilefathernameController.text =
          authprofileController.profileData.first.fatherName;
      mobilemothernameController.text =
          authprofileController.profileData.first.motherName;
      mobileadharno.text = authprofileController.profileData.first.aadharNo;
      mobilebranchController.text =
          authprofileController.profileData.first.branch;
      mobilegestnoController.text =
          authprofileController.profileData.first.gstNo;
      mobilepannoController.text =
          authprofileController.profileData.first.panNo;
      mobilequalificationController.text =
          authprofileController.profileData.first.qualification;
      mobileofficedoornumber.text =
          authprofileController.profileData.first.officialAddress.doorNo;
      mobileresibnameController.text =
          authprofileController.profileData.first.officialAddress.buildingName;
      mobilepincodeController.text =
          authprofileController.profileData.first.pincode;
      mobileproofidController.text =
          authprofileController.profileData.first.id.toString();
      mobileofficeaddress.text =
          authprofileController.profileData.first.officialAddress.address;
      alternativeController.text =
          authprofileController.profileData.first.alternateMobile;
      mobileresibnameController.text =
          authprofileController.profileData.first.officialAddress.city;
      mobileofficestate.text =
          authprofileController.profileData.first.officialAddress.state;

      setState(() {
        isMarried = authprofileController.profileData.first.isMarried == "0"
            ? false
            : true;
        isUnmarried = authprofileController.profileData.first.isMarried == "0"
            ? false
            : true;
      });
      mobiledateofbirthController.text =
          authprofileController.profileData.first.dob;
    }
  }

  String selectedGender = '';
  bool isMarried = false;
  bool isUnmarried = false;
  dynamic aadharimage;
  dynamic panimage;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
          child: AppBarMob(),
          preferredSize: Size(double.infinity, 40),
        ),
        drawer: const MobileDrawer(),
        body: Obx(
          () => ListView(children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              'Profile Setting',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: kblue),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150, top: 20),
                            child: InkWell(
                              onTap: () {
                                regshowController.showindex(0);
                                regshowController.update();
                              },
                              child: Image.asset(
                                'assets/icons/profiledropdown.png',
                                height: 10,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 1, left: 10, right: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              'Office Address',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: kblue),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150, top: 20),
                            child: InkWell(
                              onTap: () {
                                regshowController.showindex(1);
                                regshowController.update();
                              },
                              child: Image.asset(
                                'assets/icons/profiledropdown.png',
                                height: 10,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 1, left: 10, right: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 30),
                            child: Text(
                              'Residential Address',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: kblue),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150, top: 20),
                            child: InkWell(
                              onTap: () {
                                regshowController.showindex(2);
                                regshowController.update();
                              },
                              child: Image.asset(
                                'assets/icons/profiledropdown.png',
                                height: 10,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 1, left: 10, right: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      if (regshowController.showindex.value == 0)
                        Column(
                          children: [
                            Stack(children: [
                              GetBuilder<AuthProfileController>(builder: (_) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(""),
                                    if (authprofileController
                                        .profileData.isNotEmpty)
                                      InkWell(
                                        onTap: () async {
                                          PickedFile? pickedFile =
                                              await ImagePicker().getImage(
                                            source: ImageSource.gallery,
                                          );

                                          var tempCont =
                                              await pickedFile!.readAsBytes();
                                          setState(() {
                                            imageprofile = tempCont;
                                          });
                                          authprofileController
                                              .updateProfilePic(imageprofile);
                                        },
                                        child: imageprofile != null
                                            ? Image.memory(imageprofile!)
                                            : authprofileController.profileData
                                                        .first.profilePicture ==
                                                    null
                                                ? Image.asset(
                                                    'assets/images/profileimage.png')
                                                : Container(
                                                    height: 60,
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                authprofileController
                                                                    .profileData
                                                                    .first
                                                                    .profilePicture))),
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
                            ]),
                            ksizedbox10,
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Container(
                                height: 35,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  controller: mobilenameController,
                                  decoration: InputDecoration(
                                      hintText: 'User Name',
                                      hintStyle: TextStyle(fontSize: 12),
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: TextField(
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  controller: mobileemailController,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          bottom: 1, top: 1),
                                      hintText: 'Email Id',
                                      hintStyle: TextStyle(fontSize: 12),
                                      fillColor: Color(0xffF9F8FD),
                                      border: OutlineInputBorder())),
                            ),
                            ksizedbox10,
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35,
                                    child: TextField(
                                      textInputAction:
                                          TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      controller: mobilenumberController,
                                      decoration: InputDecoration(
                                          hintText: 'Mobile Number',
                                          hintStyle:
                                              TextStyle(fontSize: 12),
                                          fillColor: Color(0xffF9F8FD),
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35,
                                    child: TextField(
                                        textInputAction:
                                            TextInputAction.next,
                                        keyboardType:
                                            TextInputType.number,
                                        controller: alternativeController,
                                        decoration: InputDecoration(
                                            hintText:
                                                'AlerterNative Number',
                                            hintStyle:
                                                TextStyle(fontSize: 12),
                                            fillColor: Color(0xffF9F8FD),
                                            border:
                                                OutlineInputBorder())),
                                  ),
                                ],
                              ),
                            ),
                            ksizedbox10,
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35,
                                    child: TextField(
                                      textInputAction:
                                          TextInputAction.next,
                                      controller: mobiledobController,
                                      decoration: InputDecoration(
                                          hintText: 'Date Of Birth',
                                          hintStyle:
                                              TextStyle(fontSize: 12),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              _selectDate2(context);
                                            },
                                            icon: Icon(
                                              Icons.date_range,
                                              size: 14,
                                            ),
                                          ),
                                          fillColor: Color(0xffF9F8FD),
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Container(
                                height: 35,
                                child: TextField(
                                    textInputAction: TextInputAction.next,
                                    controller:
                                        mobileoccupationController,
                                    decoration: InputDecoration(
                                        hintText: 'Occupation',
                                        hintStyle:
                                            TextStyle(fontSize: 12),
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder())),
                              ),
                            ),
                            ksizedbox10,
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8)),
                                    child: TextField(
                                        textInputAction:
                                            TextInputAction.next,
                                        controller:
                                            mobilequalificationController,
                                        decoration: InputDecoration(
                                            hintText: 'Qualification',
                                            hintStyle:
                                                TextStyle(fontSize: 12),
                                            fillColor: Color(0xffF9F8FD),
                                            border:
                                                OutlineInputBorder())),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Container(
                                height: 35,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  controller: mobilefathernameController,
                                  decoration: InputDecoration(
                                      hintText: 'Father Name',
                                      hintStyle: TextStyle(fontSize: 12),
                                      fillColor: Color(0xffF9F8FD),
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ),
                            ksizedbox10,
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35,
                                    child: TextField(
                                        textInputAction:
                                            TextInputAction.next,
                                        controller:
                                            mobilemothernameController,
                                        decoration: InputDecoration(
                                            hintText: 'Mother Name',
                                            hintStyle:
                                                TextStyle(fontSize: 12),
                                            fillColor: Color(0xffF9F8FD),
                                            border:
                                                OutlineInputBorder())),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35,
                                    child: TextField(
                                        textInputAction:
                                            TextInputAction.next,
                                        controller:
                                            mobiledateofbirthController,
                                        decoration: InputDecoration(
                                            hintText: 'Wedding Date',
                                            hintStyle:
                                                TextStyle(fontSize: 12),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                _selectDate2(context);
                                              },
                                              icon: Icon(
                                                Icons.date_range,
                                                size: 14,
                                              ),
                                            ),
                                            fillColor: Color(0xffF9F8FD),
                                            border:
                                                OutlineInputBorder())),
                                  ),
                                ],
                              ),
                            ),
                            ksizedbox10,
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: kwhite,
                                    border: Border.all(color: kgrey),
                                    borderRadius:
                                        BorderRadius.circular(5)),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: isMarried,
                                              onChanged: (value) {
                                                setState(() {
                                                  isMarried = value!;
                                                });
                                              }),
                                          Text(
                                            'Married',
                                            style:
                                                TextStyle(fontSize: 12),
                                          ),
                                        
                                         
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Container(
                                height: 35,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  controller: mobilespousenameController,
                                  decoration: InputDecoration(
                                      hintText: 'Spouse Name',
                                      hintStyle: TextStyle(fontSize: 12),
                                      fillColor: Color(0xffF9F8FD),
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ),
                            ksizedbox10,
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35,
                                    child: TextField(
                                      textInputAction:
                                          TextInputAction.next,
                                      controller: mobileadharno,
                                      decoration: InputDecoration(
                                          hintText: 'Aadhar Number',
                                          hintStyle:
                                              TextStyle(fontSize: 12),
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35,
                                    child: TextField(
                                      controller: mobilepannoController,
                                      decoration: InputDecoration(
                                          hintText: 'Pan Number',
                                          hintStyle:
                                              TextStyle(fontSize: 12),
                                          fillColor: Color(0xffF9F8FD),
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                                 ksizedbox20,
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text('GENDER')
                                        .text
                                        .gray500
                                        .semiBold
                                        .make(),
                                  ],
                                ),
                              ),
                               RadioListTile(
                                title: const Text('Male'),
                                value: 'Male',
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value!;
                                  });
                                },
                              ),
                              RadioListTile(
                                title: const Text('Female'),
                                value: 'Female',
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value!;
                                  });
                                },
                              ),
                            ksizedbox40,
                            ksizedbox10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    height: 100,
                                    width: 100,
                                    child: authprofileController
                                            .profileData.first.panProof.isEmpty
                                        ? panimage != null
                                            ? Image.memory(panimage)
                                            : Container(
                                                height: 150,
                                                width: 150,
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    PickedFile? pickedFile =
                                                        await ImagePicker()
                                                            .getImage(
                                                      source:
                                                          ImageSource.gallery,
                                                    );

                                                    var tempCont =
                                                        await pickedFile!
                                                            .readAsBytes();
                                                    setState(() {
                                                      panimage = tempCont;
                                                    });
                                                  },
                                                  child: Text(
                                                    'Upload Pan Card',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                              )
                                        : Image.network(authprofileController
                                            .profileData.first.panProof)),
                                Container(
                                    height: 100,
                                    width: 100,
                                    child: authprofileController.profileData
                                            .first.adharProof.isEmpty
                                        ? aadharimage != null
                                            ? Image.memory(aadharimage!)
                                            : Container(
                                                height: 150,
                                                width: 150,
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    PickedFile? pickedFile =
                                                        await ImagePicker()
                                                            .getImage(
                                                      source:
                                                          ImageSource.gallery,
                                                    );

                                                    var tempCont =
                                                        await pickedFile!
                                                            .readAsBytes();
                                                    setState(() {
                                                      aadharimage = tempCont;
                                                    });
                                                  },
                                                  child: Text(
                                                      'Upload Aadhar Card',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                              )
                                        : Image.network(authprofileController
                                            .profileData.first.adharProof)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35,
                                    child: TextField(
                                      controller: mobilegestnoController,
                                      decoration: InputDecoration(
                                          hintText: 'GST Number',
                                          hintStyle:
                                              TextStyle(fontSize: 12),
                                          fillColor: Color(0xffF9F8FD),
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35,
                                    child: TextField(
                                      controller: mobilebranchController,
                                      decoration: InputDecoration(
                                          hintText: 'No Of Children',
                                          hintStyle:
                                              TextStyle(fontSize: 12),
                                          fillColor: Color(0xffF9F8FD),
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ksizedbox10,
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35,
                                    child: TextField(
                                      controller: mobilebranchController,
                                      decoration: InputDecoration(
                                          hintText: 'Branch',
                                          hintStyle:
                                              TextStyle(fontSize: 12),
                                          fillColor: Color(0xffF9F8FD),
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //  Padding(
                            //    padding: const EdgeInsets.only(left: 10,top: 30),
                            //    child: Row(
                            //      children: [
                            //        Container(
                            //               height: 35,
                            //               width: MediaQuery.of(context).size.width*0.42,
                            //               decoration: BoxDecoration(
                            //                 color: kwhite,
                            //               border: Border.all(
                            //                 color: kgrey
                            //               ),
                            //               borderRadius: BorderRadius.circular(5)
                            //               ),
                            //                 child: Column(
                            //                   crossAxisAlignment: CrossAxisAlignment.center,
                            //                   children: [
                            //                     Padding(
                            //                       padding: const EdgeInsets.only( ),
                            //                       child: Row(

                            //                         children: [
                            //                           Text('18 Yrs',
                            //                           style: TextStyle(
                            //                             fontSize: 12
                            //                           ),),
                            //                           Padding(
                            //                             padding: const EdgeInsets.only(),
                            //                             child: Checkbox(value: _value3,
                            //                             onChanged: (value){
                            //                                setState(() {
                            //                                    _value3=value!;
                            //                                });
                            //                             }),
                            //                           ),
                            //                           Text('Above',
                            //                           style: TextStyle(
                            //                             fontSize: 12
                            //                           ),),
                            //                           Padding(
                            //                             padding: const EdgeInsets.only(),
                            //                             child: Checkbox(value: _value4,
                            //                             onChanged: (value){
                            //                               setState(() {
                            //                                 _value4=value!;
                            //                               });
                            //                             }),
                            //                           ),
                            //                           Text('Blove',style: TextStyle(
                            //                             fontSize: 12
                            //                           ),)
                            //                         ],
                            //                       ),
                            //                     )
                            //                   ],
                            //                 ),

                            //             ),
                            //      ],
                            //    ),
                            //  ),
                            Obx(
                              () => authprofileController.isLoading.isTrue
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: 50, left: 60),
                                      child: Row(
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: korange,
                                                  minimumSize: Size(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.42,
                                                      40)),
                                              onPressed: () {
                                                MemberProfileUpdateModel
                                                    memberProfileUpdateModel =
                                                    MemberProfileUpdateModel(
                                                  name: nameController.text,
                                                  email: emailController.text,
                                                  dateOfBirth:
                                                      dateofbirthController
                                                          .text,
                                                  fatherName:
                                                      fathernameController.text,
                                                  isMarried: isMarried == true
                                                      ? "1"
                                                      : "0",
                                                  mobile: numberController.text,
                                                  motherName:
                                                      mothernameController.text,
                                                  occupation:
                                                      occupationController.text,
                                                  branch: branchController.text,
                                                  children:
                                                      _controller!.getTags,
                                                  panNo: panController.text,
                                                  spouse:
                                                      spousenameController.text,
                                                  gender:
                                                      selectedGender == "Male"
                                                          ? "Male"
                                                          : "Female",
                                                  adharNo:
                                                      aadhaarController.text,
                                                  adharproofimg: '',
                                                  alternateMob: '',
                                                  gstNo: gstController.text,
                                                  panproofimg: '',
                                                  qualification:
                                                      qualificationController
                                                          .text,
                                                  weddingDate:
                                                      wedingnameController.text, spousedateOfBirth: '',
                                                );

                                                authprofileController.updateProfile(
                                                    memberProfileUpdateModel:
                                                        memberProfileUpdateModel);
                                              },
                                              child: CircularProgressIndicator(
                                                color: kwhite,
                                              ))
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          top: 50, left: 60),
                                      child: Row(
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: korange,
                                                  minimumSize: Size(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.42,
                                                      40)),
                                              onPressed: () {
                                                MemberProfileUpdateModel
                                                    memberProfileUpdateModel =
                                                    MemberProfileUpdateModel(
                                                  name: nameController.text,
                                                  email: emailController.text,
                                                  dateOfBirth:
                                                      dateofbirthController
                                                          .text,
                                                  fatherName:
                                                      fathernameController.text,
                                                  isMarried: isMarried == true
                                                      ? "1"
                                                      : "0",
                                                  mobile: numberController.text,
                                                  motherName:
                                                      mothernameController.text,
                                                  occupation:
                                                      occupationController.text,
                                                  branch: branchController.text,
                                                  children:
                                                      _controller!.getTags,
                                                  panNo: panController.text,
                                                  spouse:
                                                      spousenameController.text,
                                                  gender:
                                                      selectedGender == "Male"
                                                          ? "Male"
                                                          : "Female",
                                                  adharNo:
                                                      aadhaarController.text,
                                                  adharproofimg: '',
                                                  alternateMob: '',
                                                  gstNo: gstController.text,
                                                  panproofimg: '',
                                                  qualification:
                                                      qualificationController
                                                          .text,
                                                  weddingDate:
                                                      wedingnameController.text, spousedateOfBirth: '',
                                                );

                                                authprofileController.updateProfile(
                                                    memberProfileUpdateModel:
                                                        memberProfileUpdateModel);
                                              },
                                              child: Text('Update'))
                                        ],
                                      ),
                                    ),
                            ),
                            ksizedbox20,
                          ],
                        ),
                      if (regshowController.showindex.value == 1)
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 50, right: 50, top: 50),
                                child: Container(
                                  height: 35,
                                  child: TextField(
                                    textInputAction: TextInputAction.next,
                                    controller: mobileofficedoornumber,
                                    decoration: InputDecoration(
                                        hintText: 'Door Number',
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 50, right: 50, top: 50),
                              child: Container(
                                height: 35,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  controller: mobileofficebnumber,
                                  decoration: InputDecoration(
                                      hintText: 'Building Number',
                                      fillColor: Color(0xffF9F8FD),
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50, right: 50, top: 50),
                                    child: Container(
                                      height: 35,
                                      child: TextField(
                                        textInputAction: TextInputAction.next,
                                        controller: mobileofficeaddress,
                                        decoration: InputDecoration(
                                            hintText: 'Address',
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50, right: 50, top: 50),
                                  child: Container(
                                    height: 35,
                                    child: TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: mobileofficecity,
                                      decoration: InputDecoration(
                                          hintText: 'City',
                                          fillColor: Color(0xffF9F8FD),
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 50, top: 50, right: 50),
                              child: Container(
                                height: 35,
                                child: TextField(
                                  controller: mobileofficestate,
                                  decoration: InputDecoration(
                                      hintText: 'State',
                                      fillColor: Color(0xffF9F8FD),
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 50, top: 50, right: 50),
                              child: Container(
                                height: 35,
                                child: TextField(
                                  controller: mobileproofidController,
                                  decoration: InputDecoration(
                                      hintText: 'Proof Id',
                                      fillColor: Color(0xffF9F8FD),
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 50, top: 50, right: 50),
                              child: Container(
                                height: 35,
                                child: TextField(
                                  controller: mobilepincodeController,
                                  decoration: InputDecoration(
                                      hintText: 'Pincode',
                                      fillColor: Color(0xffF9F8FD),
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ),
                            Obx(
                              () => authprofileController.isLoading.isTrue
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, top: 50),
                                      child: Row(
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: korange,
                                                  minimumSize: Size(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.42,
                                                      40)),
                                              onPressed: () {
                                                AddressModel addressModel =
                                                    AddressModel(
                                                  aadhrId: "",
                                                  address:
                                                      mobileofficeaddress.text,
                                                  buildingName:
                                                      mobileofficebnumber.text,
                                                  city: mobileofficecity.text,
                                                  doorNo: mobileofficedoornumber
                                                      .text,
                                                  personalId: "",
                                                  state: mobileofficestate.text,
                                                  pincode: '',
                                                );

                                                authprofileController
                                                    .updateOfficalAddress(
                                                        officialAddress:
                                                            addressModel);
                                              },
                                              child: CircularProgressIndicator(
                                                  color: kwhite))
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, top: 50),
                                      child: Row(
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: korange,
                                                  minimumSize: Size(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.42,
                                                      40)),
                                              onPressed: () {
                                                AddressModel addressModel =
                                                    AddressModel(
                                                  aadhrId: "",
                                                  address:
                                                      mobileofficeaddress.text,
                                                  buildingName:
                                                      mobileofficebnumber.text,
                                                  city: mobileofficecity.text,
                                                  doorNo: mobileofficedoornumber
                                                      .text,
                                                  personalId: "",
                                                  state: mobileofficestate.text,
                                                  pincode: '',
                                                );

                                                authprofileController
                                                    .updateOfficalAddress(
                                                        officialAddress:
                                                            addressModel);
                                              },
                                              child: Text(
                                                'Update',
                                                style: TextStyle(fontSize: 17),
                                              ))
                                        ],
                                      ),
                                    ),
                            ),
                            ksizedbox30,
                          ],
                        )),
                      if (regshowController.showindex.value == 2)
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50, right: 50, top: 50),
                                  child: Container(
                                    height: 35,
                                    child: TextField(
                                      textInputAction: TextInputAction.next,
                                      controller:
                                          mobileresidoornumberController,
                                      decoration: InputDecoration(
                                          hintText: 'Door Number',
                                          fillColor: Color(0xffF9F8FD),
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 50, right: 50, top: 50),
                                child: Container(
                                  height: 35,
                                  child: TextField(
                                    textInputAction: TextInputAction.next,
                                    controller: mobileresibnameController,
                                    decoration: InputDecoration(
                                        hintText: 'Building Number',
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 50, right: 50, top: 50),
                                child: Container(
                                  height: 35,
                                  child: TextField(
                                    textInputAction: TextInputAction.next,
                                    controller: mobileresiaddressController,
                                    decoration: InputDecoration(
                                        hintText: 'Address',
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 50, right: 50, top: 50),
                                child: Container(
                                  height: 35,
                                  child: TextField(
                                    textInputAction: TextInputAction.next,
                                    controller: mobileresibcityController,
                                    decoration: InputDecoration(
                                        hintText: 'City',
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 50, right: 50, top: 50),
                                child: Container(
                                  height: 35,
                                  child: TextField(
                                    textInputAction: TextInputAction.next,
                                    controller: mobileresistateController,
                                    decoration: InputDecoration(
                                        hintText: 'State',
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 50, right: 50, top: 50),
                                child: Container(
                                  height: 35,
                                  child: TextField(
                                    textInputAction: TextInputAction.next,
                                    controller: mobileresiperidController,
                                    decoration: InputDecoration(
                                        hintText: 'Proof Id No',
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 50, top: 50, right: 50),
                                child: Container(
                                  height: 35,
                                  child: TextField(
                                    controller: mobileresiadaridController,
                                    decoration: InputDecoration(
                                        hintText: 'Pincode',
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                              ),
                              Obx(
                                () => Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 50),
                                  child: profileController.isLoading.isTrue
                                      ? InkWell(
                                          onTap: () {
                                            AddressModel addressModel = AddressModel(
                                                aadhrId:
                                                    mobileresiadaridController
                                                        .text,
                                                address:
                                                    mobileresiaddressController
                                                        .text,
                                                buildingName:
                                                    mobileresibnameController
                                                        .text,
                                                city: mobileresibcityController
                                                    .text,
                                                doorNo:
                                                    mobileresidoornumberController
                                                        .text,
                                                personalId:
                                                    mobileresiperidController
                                                        .text,
                                                state: mobileresistateController
                                                    .text,
                                                pincode: '');
                                            authprofileController
                                                .updateRecidencyAddress(
                                                    residentialAddress:
                                                        addressModel);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 50),
                                            child: Container(
                                                height: 40,
                                                width: size.width * 0.42,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffFF9021)),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0xffFF5003),
                                                        blurRadius: 2.0,
                                                      ),
                                                    ]),
                                                child:
                                                    CircularProgressIndicator(
                                                        color: kwhite)),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            AddressModel addressModel = AddressModel(
                                                aadhrId:
                                                    mobileresiadaridController
                                                        .text,
                                                address:
                                                    mobileresiaddressController
                                                        .text,
                                                buildingName:
                                                    mobileresibnameController
                                                        .text,
                                                city: mobileresibcityController
                                                    .text,
                                                doorNo:
                                                    mobileresidoornumberController
                                                        .text,
                                                personalId:
                                                    mobileresiperidController
                                                        .text,
                                                state: mobileresistateController
                                                    .text,
                                                pincode: '');
                                            authprofileController
                                                .updateRecidencyAddress(
                                                    residentialAddress:
                                                        addressModel);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 50),
                                            child: Container(
                                              height: 40,
                                              width: size.width * 0.42,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffFF9021)),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Color(0xffFF5003),
                                                      blurRadius: 2.0,
                                                    ),
                                                  ]),
                                              child: const Center(
                                                child: Text(
                                                  "Submit",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                              ksizedbox10,
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ]),
          ]),
        ));
  }
}
