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
import '../../../models/member profileupdate.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
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
  Future<void> _selectDate2(BuildContext context) async {
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

  final authprofileController = Get.find<AuthProfileController>();

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

  String selectedGender = '';
  dynamic imageprofile;
  dynamic aadharimage;
  dynamic panimage;

  setDefauld() async {
    await authprofileController.getProfile();
    subNameController.text = authprofileController.profileData.first.name;
    subEmailController.text = authprofileController.profileData.first.email;
    subMobileController.text = authprofileController.profileData.first.mobile;

    if (authprofileController.profileData.isNotEmpty) {
      nameController.text = authprofileController.profileData.first.name;
      numberController.text = authprofileController.profileData.first.mobile;
      alternumberController.text =
          authprofileController.profileData.first.alternateMobile;
      emailController.text = authprofileController.profileData.first.email;
      occupationController.text =
          authprofileController.profileData.first.occupation;
      qualificationController.text =
          authprofileController.profileData.first.qualification;
      fathernameController.text =
          authprofileController.profileData.first.fatherName;
      gstController.text = authprofileController.profileData.first.gstNo;
      panController.text = authprofileController.profileData.first.panNo;
      aadhaarController.text = authprofileController.profileData.first.aadharNo;
      mothernameController.text =
          authprofileController.profileData.first.motherName;
      spousenameController.text =
          authprofileController.profileData.first.spouse;

      dateofbirthController.text = authprofileController.profileData.first.dob;
      officedoornoController.text =
          authprofileController.profileData.first.officialAddress.doorNo;
      officebnameController.text =
          authprofileController.profileData.first.officialAddress.buildingName;
      officeaddresController.text =
          authprofileController.profileData.first.officialAddress.address;
      wedingnameController.text =
          authprofileController.profileData.first.weddingDate;
      officeaddresController.text =
          authprofileController.profileData.first.officialAddress.city;
      officestateController.text =
          authprofileController.profileData.first.officialAddress.state;

      branchController.text = authprofileController.profileData.first.branch;

      setState(() {
        isMarried = authprofileController.profileData.first.isMarried == "0"
            ? false
            : true;
        isUnmarried = authprofileController.profileData.first.isMarried == "0"
            ? false
            : true;
        // aadharimage = authprofileController.profileData.first.adharProof;
      });
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
                    if (authprofileController.profileData.isNotEmpty)
                      InkWell(
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
                            authprofileController
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
                              : authprofileController.profileData.isNotEmpty
                                  ? authprofileController.profileData.first
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
                                                    authprofileController
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
                        hintText: 'User Name',
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
                                hintText: 'Date of Birth',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _selectDate(context);
                                  },
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
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                        hintText: 'Enter Email',
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
                            controller: numberController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter.digitsOnly,
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                            decoration: InputDecoration(
                                hintText: 'Enter Phone Number',
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
                                hintText: 'Occupation',
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
                    keyboardType: TextInputType.text,
                    controller: qualificationController,
                    decoration: const InputDecoration(
                        hintText: 'Qualification',
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
                                hintText: 'Father Name',
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
                        hintText: 'Mother Name',
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
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: kwhite, border: Border.all(color: kgrey)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 1),
                          child: Row(
                            children: [
                              Checkbox(
                                  value: isMarried,
                                  onChanged: (value) {
                                    setState(() {
                                      isMarried = value!;
                                    });
                                  }),
                              const Text('Married'),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(
                              //           left: 40),
                              //   child: Checkbox(
                              //       value: isUnmarried,
                              //       onChanged: (value) {
                              //         setState(() {
                              //           isUnmarried =
                              //               value!;
                              //         });
                              //       }),
                              // ),
                              // const Text('Unmarried')
                            ],
                          ),
                        )
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
                      controller: wedingnameController,
                      // keyboardType: TextInputType.datetime,
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: 'Wedding Date',
                          suffixIcon: IconButton(
                            onPressed: () {
                              _selectDate2(context);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          fillColor: const Color(0xffF9F8FD),
                          border: const OutlineInputBorder())),
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
                              hintText: 'Spouse Name',
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
          ///////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 40, right: 70, top: 0, bottom: 30),
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    controller: panController,
                    textCapitalization: TextCapitalization.characters,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    decoration: InputDecoration(
                      hintText: 'Pan No',
                      suffixIcon: IconButton(
                        onPressed: () {
                          // _selectDate2(context);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      fillColor: const Color(0xffF9F8FD),
                      border: const OutlineInputBorder(),
                    ),
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
                          keyboardType: TextInputType.phone,
                          controller: gstController,
                          decoration: const InputDecoration(
                              hintText: 'Gst No',
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 40, right: 70, top: 0, bottom: 30),
                  child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: branchController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Branch',
                          suffixIcon: IconButton(
                            onPressed: () {
                              _selectDate2(context);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          fillColor: const Color(0xffF9F8FD),
                          border: const OutlineInputBorder())),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 70, right: 50, top: 0, bottom: 30),
                  child: Container(
                    child: Column(
                      children: [
                        if (isMarried == true)
                          TextFieldTags(
                            textfieldTagsController: _controller,
                            initialTags: const [],
                            textSeparators: const [','],
                            // letterCase: LetterCase.normal,
                            validator: (String tag) {
                              if (tag == 'php') {
                                return 'No, please just no';
                              } else if (_controller!.getTags!.contains(tag)) {
                                return 'you already entered that';
                              }
                              return null;
                            },
                            inputfieldBuilder: (context, tec, fn, error,
                                onChanged, onSubmitted) {
                              return ((context, sc, tags, onTagDelete) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: TextField(
                                    controller: tec,
                                    focusNode: fn,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 74, 137, 92),
                                          width: 3.0,
                                        ),
                                      ),
                                      // focusedBorder: const OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //     color: Color.fromARGB(255, 74, 137, 92),
                                      //     width: 3.0,
                                      //   ),
                                      // ),
                                      //helperText: 'No Of Children',
                                      // helperStyle: TextStyle(
                                      //   color: kblue,
                                      // ),
                                      hintText: _controller!.hasTags
                                          ? ''
                                          : "Children Name",
                                      errorText: error,
                                      prefixIconConstraints: BoxConstraints(
                                          maxWidth: _distanceToField! * 0.74),
                                      prefixIcon: tags.isNotEmpty
                                          ? SingleChildScrollView(
                                              controller: sc,
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                  children:
                                                      tags.map((String tag) {
                                                return Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(20.0),
                                                    ),
                                                    color: Color.fromARGB(
                                                        255, 74, 80, 137),
                                                  ),
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 5.0),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 5.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        child: Text(
                                                          '$tag',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        onTap: () {
                                                          print(
                                                              "$tag selected");
                                                        },
                                                      ),
                                                      const SizedBox(
                                                          width: 4.0),
                                                      InkWell(
                                                        child: const Icon(
                                                          Icons.cancel,
                                                          size: 14.0,
                                                          color: Color.fromARGB(
                                                              255,
                                                              233,
                                                              233,
                                                              233),
                                                        ),
                                                        onTap: () {
                                                          onTagDelete(tag);
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                );
                                              }).toList()),
                                            )
                                          : null,
                                    ),
                                    onChanged: onChanged,
                                    onSubmitted: onSubmitted,
                                  ),
                                );
                              });
                            },
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 30),
                child: Container(
                  width: 560,
                  child: Column(
                    children: [
                      TextField(
                        //textInputAction: TextInputAction.next,
                        controller: aadhaarController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(12),
                          FilteringTextInputFormatter.digitsOnly,
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        decoration: const InputDecoration(
                          hintText: 'Aadhaar No',
                          suffixIcon: Icon(Icons.edit),
                          fillColor: Color(0xffF9F8FD),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Container(
                    height: 180,
                    width: 250,
                    child: authprofileController
                            .profileData.first.panProof.isEmpty
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
                                decoration:
                                    BoxDecoration(color: Colors.grey[300]),
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
                                    setState(() {
                                      panimage = tempCont;
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                        : InkWell(
                            onTap: () async {
                              PickedFile? pickedFile =
                                  await ImagePicker().getImage(
                                source: ImageSource.gallery,
                              );

                              var tempCont = await pickedFile!.readAsBytes();
                              setState(() {
                                aadharimage = tempCont;
                              });
                            },
                            child: Image.network(authprofileController
                                .profileData.first.panProof),
                          ),
                  ),
                  kwidth10,
                  kwidth10,
                  kwidth10,
                  authprofileController.profileData.isEmpty
                      ? Container(
                          height: 20,
                        )
                      : Container(
                          height: 180,
                          width: 250,
                          child: authprofileController
                                  .profileData.first.adharProof.isEmpty
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
                                              await ImagePicker().getImage(
                                            source: ImageSource.gallery,
                                          );

                                          var tempCont =
                                              await pickedFile!.readAsBytes();
                                          setState(() {
                                            aadharimage = tempCont;
                                          });
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
                                              'Upload Adhaar Card',
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
                              : InkWell(
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
                                  child: Image.network(authprofileController
                                      .profileData.first.adharProof),
                                ),
                        ),
                ],
              ),
              Container(
                width: 500,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('GENDER').text.gray500.semiBold.make(),
                      ],
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
                  ],
                ),
              ),
              //
              //kwidth10  ,kwidth10 ,  kwidth10  ,kwidth10
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
          Obx(
            () => authprofileController.isLoading.isTrue
                ? Padding(
                    padding: const EdgeInsets.only(top: 50, left: 50),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: korange,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.35, 45),
                          ),
                          onPressed: () {
                            print(panimage);
                            MemberProfileUpdateModel memberProfileUpdateModel =
                                MemberProfileUpdateModel(
                              name: nameController.text,
                              email: emailController.text,
                              dateOfBirth: dateofbirthController.text,
                              fatherName: fathernameController.text,
                              isMarried: isMarried == true ? "1" : "0",
                              mobile: numberController.text,
                              motherName: mothernameController.text,
                              occupation: occupationController.text,
                              branch: branchController.text,
                              children: _controller!.getTags,
                              panNo: panController.text,
                              spouse: spousenameController.text,
                              gender:
                                  selectedGender == "Male" ? "Male" : "Female",
                              adharNo: aadhaarController.text,
                              alternateMob: alternumberController.text,
                              gstNo: gstController.text,
                              adharproofimg: aadharimage,
                              panproofimg: panimage,
                              qualification: qualificationController.text,
                              weddingDate: wedingnameController.text,
                            );

                            authprofileController.updateProfile(
                                memberProfileUpdateModel:
                                    memberProfileUpdateModel);
                          },
                          child: CircularProgressIndicator(
                            color: kwhite,
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 50, left: 50),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: korange,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.35, 45),
                          ),
                          onPressed: () {
                            MemberProfileUpdateModel memberProfileUpdateModel =
                                MemberProfileUpdateModel(
                              name: nameController.text,
                              email: emailController.text,
                              dateOfBirth: dateofbirthController.text,
                              fatherName: fathernameController.text,
                              isMarried: isMarried == true ? "1" : "0",
                              mobile: numberController.text,
                              motherName: mothernameController.text,
                              occupation: occupationController.text,
                              adharNo: aadhaarController.text,
                              branch: branchController.text,
                              children: _controller!.getTags,
                              gstNo: gstController.text,
                              weddingDate: wedingnameController.text,
                              panNo: panController.text,
                              qualification: qualificationController.text,
                              spouse: spousenameController.text,
                              alternateMob: alternumberController.text,
                              gender:
                                  selectedGender == "Male" ? "Male" : "Female",
                              adharproofimg: aadharimage,
                              panproofimg: panimage,
                            );

                            authprofileController.updateProfile(
                                memberProfileUpdateModel:
                                    memberProfileUpdateModel);
                          },
                          child: Text('Update'),
                        )
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
