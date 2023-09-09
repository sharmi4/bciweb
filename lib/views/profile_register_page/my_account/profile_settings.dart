import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
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
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobController.text =
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
        dobController.text =
            '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
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
  var  subNameController=TextEditingController();
var  subEmailController=TextEditingController();
var  subMobileController=TextEditingController();
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
      alternumberController.text = authprofileController.profileData.first.alternateMobile;
      emailController.text = authprofileController.profileData.first.email;
      occupationController.text =
          authprofileController.profileData.first.occupation;
      qualificationController.text =
          authprofileController.profileData.first.qualification;
      fathernameController.text =
          authprofileController.profileData.first.fatherName;
      gstnoController.text = authprofileController.profileData.first.gstNo;
      pannoController.text = authprofileController.profileData.first.panNo;

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

      officeaddresController.text =
          authprofileController.profileData.first.officialAddress.city;
      officestateController.text =
          authprofileController.profileData.first.officialAddress.state;

      setState(() {
        isMarried = authprofileController.profileData.first.isMarried == "0"
            ? false
            : true;
        isUnmarried = authprofileController.profileData.first.isMarried == "0"
            ? false
            : true;
        aadharimage = authprofileController.profileData.first.adharProof;
      });
    }
  }

  @override
void initState() {

  super.initState();
    setDefauld();
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
                            setState(() {
                              imageprofile = tempCont;
                            });
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
                              : authprofileController
                                          .profileData.first.profilePicture ==
                                      null
                                  ? Stack(
                                      children: [
                                        Image.asset('assets/images/prfl.png'),
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
                                hintText: 'Wedding Date',
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
                            keyboardType: TextInputType.phone,
                            controller: numberController,
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
                    keyboardType: TextInputType.phone,
                    controller: alternumberController,
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
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          hintText: 'Wedding Date',
                          suffixIcon: IconButton(
                            onPressed: () {
                              // _selectDate2(context);
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
                      controller: dobController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Date Of Birth',
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
                          controller: childrensController,
                          decoration: const InputDecoration(
                              hintText: 'No.Of.Children',
                              suffixIcon: Icon(Icons.edit),
                              fillColor: Color(0xffF9F8FD),
                              border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
           ksizedbox10,
                                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('GENDER').text.gray500.semiBold.make(),
                        ],
                      ),
                      RadioListTile(
              title:const Text('Male'),
              value: 'Male',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
            ),
            RadioListTile(
              title:const Text('Female'),
              value: 'Female',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
            ),
          //      Row(
          //       mainAxisAlignment:
          //           MainAxisAlignment.spaceAround,
          //       children: [
          //          Container(
          // height: 100,
          // width: 100,
          // child: authprofileController.profileData.first.panProof.isEmpty ?
          // panimage != null? Image.memory(panimage): Container(
          //   height: 150,
          //   width: 150,
          //    child:GestureDetector(onTap: ()async{
          //              PickedFile? pickedFile =
          //                     await ImagePicker()
          //                         .getImage(
          //                   source: ImageSource.gallery,
          //                 );

          //                 var tempCont = await pickedFile!.readAsBytes();
          //                 setState(() {
          //                   panimage = tempCont;
          //                 });

          //             }, child: Text('Upload Pan Card'),),

          // ) : Image.network(authprofileController.profileData.first.panProof)),

          //          Container(
          // height: 100,
          // width: 100,
          // child: authprofileController.profileData.first.adharProof == null ?
          // aadharimage != null? Image.memory(aadharimage!): Container(
          //   height: 150,
          //   width: 150,
          //    child:GestureDetector(onTap: ()async{
          //              PickedFile? pickedFile =
          //                     await ImagePicker()
          //                         .getImage(
          //                   source: ImageSource.gallery,
          //                 );

          //                 var tempCont = await pickedFile!.readAsBytes();
          //                 setState(() {
          //                   aadharimage = tempCont;
          //                 });

          //             }, child: Text('Upload Aadhar Card'),),

          // ) : Image.network(authprofileController.profileData.first.adharProof)),

          //       ],
          //     ),
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
          //       Expanded(
          //         child: TextField(
          //             textInputAction: TextInputAction.next,
          //             controller: resiadaridController,
          //             decoration: InputDecoration(
          //                 hintText: 'Adhaar Id',
          //                 suffixIcon: Icon(Icons.upload),
          //                 fillColor: Color(0xffF9F8FD),
          //                 border: OutlineInputBorder()),
          //           ),
          //       ),
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
                                    MediaQuery.of(context).size.width * 0.35,
                                    45)),
                            onPressed: () {
                              MemberProfileUpdateModel
                                  memberProfileUpdateModel =
                                  MemberProfileUpdateModel(
                                name: nameController.text,
                                email: emailController.text,
                                dateOfBirth: dateofbirthController.text,
                                fatherName: fathernameController.text,
                                isMarried: isMarried == true ? "1" : "0",
                                mobile: numberController.text,
                                motherName: mothernameController.text,
                                occupation: occupationController.text,
                                aadharno: adharController.text,
                                branch: branchController.text,
                                children: childrensController.text,
                                gstno: gstnoController.text,
                                marrigedate: wedingnameController.text,
                                panNo: pannoController.text,
                                qulification: qualificationController.text,
                                spouse: spousenameController.text,
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
                    padding: const EdgeInsets.only(top: 50, left: 50),
                    child: Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: korange,
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.35,
                                    45)),
                            onPressed: () {
                              MemberProfileUpdateModel
                                  memberProfileUpdateModel =
                                  MemberProfileUpdateModel(
                                name: nameController.text,
                                email: emailController.text,
                                dateOfBirth: dateofbirthController.text,
                                fatherName: fathernameController.text,
                                isMarried: isMarried == true ? "1" : "0",
                                mobile: numberController.text,
                                motherName: mothernameController.text,
                                occupation: occupationController.text,
                                aadharno: null,
                                branch: null,
                                children: null,
                                gstno: null,
                                marrigedate: null,
                                panNo: null,
                                qulification: null,
                                spouse: null,
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
        ],
      ),
    );
  }
}
