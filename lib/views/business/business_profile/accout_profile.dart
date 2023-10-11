import 'dart:html';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constant/constans.dart';
import '../../../controller/auth_controller/auth_profile_controller.dart';
import '../../../controller/profile_controller.dart';
import '../../../models/business_model/business_update_model.dart';
import '../../../models/member profileupdate.dart';

class BusinessProfileSettings extends StatefulWidget {
  const BusinessProfileSettings({super.key});

  @override
  State<BusinessProfileSettings> createState() => _BusinessProfileSettingsState();
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
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateofbirthController.text =
            formatDate(selectedDate, [dd, "/", mm, "/", yyyy]);
      });
    }
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

    if (picked != null && picked != selectedDate2) {
      setState(() {
        selectedDate2 = picked;
        wedingnameController.text =
            formatDate(selectedDate2, [dd, "/", mm, "/", yyyy]);
      });
    }
  }

  bool isMarried = false;
  bool isUnmarried = false;
  int offersindex = 0;
  bool isLoading = false;

  final businessprofileController = Get.find<ProfileController>();

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
  var subMobileController = TextEditingController();
  var panController = TextEditingController();
  var aadhaarController = TextEditingController();
  var gstController = TextEditingController();

  dynamic selectedGender = '';
  dynamic imageprofile;
  dynamic aadharimage;
  dynamic panimage;

  setDefauld() async {
    await businessprofileController.getProfile();
    

    if (businessprofileController.profileData.isNotEmpty) {
      nameController.text = businessprofileController.profileData.first.name;
      numberController.text = businessprofileController.profileData.first.mobile;
      alternumberController.text =
          businessprofileController.profileData.first.alternateMobile;
      emailController.text = businessprofileController.profileData.first.email;

      gstController.text = businessprofileController.profileData.first.gstNo;

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
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 75),
              child: GetBuilder<AuthProfileController>(builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(""),
                    if (businessprofileController.profileData.isNotEmpty)
                      GestureDetector(
                          onTap: () async {
                            PickedFile? pickedFile =
                                await ImagePicker().getImage(
                              source: ImageSource.gallery,
                            );

                            var tempCont = await pickedFile!.readAsBytes();
                            setState(
                              () {
                                imageprofile = tempCont;
                              },
                            );
                            businessprofileController
                                .updateProfilePic(imageprofile);
                          },
                          child: imageprofile != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    child: Image.memory(
                                      imageprofile!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : businessprofileController.profileData.isNotEmpty
                                  ? businessprofileController.profileData.first
                                              .profilePicture ==
                                          null
                                      ? Stack(
                                          children: [
                                            Image.asset(
                                                'assets/images/prfl.png'),
                                            Positioned(
                                              left: 55,
                                              top: 55,
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                  color: kblue,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.camera_alt,
                                                    color: Colors.black,
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
                                                    BorderRadius.circular(50),
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
                                              left: 85,
                                              top: 75,
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  color: kblue,
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.camera_alt,
                                                    color: Colors.white,
                                                    size: 22,
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
                                    )),
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
                        suffixIcon: Icon(Icons.edit),
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
                            controller: dateofbirthController,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                                hintText: 'Business Address',
                           
                                
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
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                        hintText: 'Map Url',
                     
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
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                            decoration: InputDecoration(
                                hintText: 'Mobile Number',
                            
                              
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
                        suffixIcon: Icon(Icons.edit),
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
                            controller: occupationController,
                            decoration: InputDecoration(
                                hintText: 'GST NO',
                               
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
                    controller: qualificationController,
                    decoration: const InputDecoration(
                        hintText: 'Bank Name',
                        suffixIcon: Icon(Icons.edit),
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
                            controller: fathernameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                hintText: 'Account Holder Name',
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                ),
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
                    keyboardType: TextInputType.name,
                    controller: mothernameController,
                    decoration: const InputDecoration(
                        hintText: 'Account Type',
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
                          controller: spousenameController,
                          decoration: const InputDecoration(
                              hintText: 'Bank Account Number',
                              suffixIcon: Icon(Icons.edit),
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
      
                      Obx(
            () => businessprofileController.isLoading.isTrue
                ? Padding(
                    padding: const EdgeInsets.only(top: 30, left: 40),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: korange,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.34, 45),
                          ),
                          onPressed: () {
                            print(panimage);
                            MerchantUpdateModel merchantUpdateModel =
                                MerchantUpdateModel(
                              name: nameController.text,
                              email: emailController.text,
                             
                              mobile: numberController.text,
                             
                              gstNo: gstController.text, 
                              accountType: '', 
                              address: '', 
                              alternateMobile: '',
                               bankAccountName: '', bankAccountNumber: '', bankName: '', categoryId: '', ifscCode: '', shopImage: '',
                              
                            );

                            businessprofileController.updateProfile(
                                 merchantUpdateModel: merchantUpdateModel);
                          },
                          child: CircularProgressIndicator(
                            color: kwhite,
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 30, left: 40),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: korange,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.34, 45),
                          ),
                          onPressed: () {
                            MerchantUpdateModel merchantUpdateModel =
                                MerchantUpdateModel(
                              name: nameController.text,
                              email: emailController.text,
                             
                              mobile: numberController.text,
                             
                              gstNo: gstController.text, 
                              accountType: '', 
                              address: '', 
                              alternateMobile: '',
                               bankAccountName: '', bankAccountNumber: '', bankName: '', categoryId: '', ifscCode: '', shopImage: '',
                            );

                           businessprofileController .updateProfile(
                                merchantUpdateModel:
                                    merchantUpdateModel);
                          },
                          child: Text('Update'),
                        )
                      ],
                    ),
                  ),
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
    );
  }
  }
