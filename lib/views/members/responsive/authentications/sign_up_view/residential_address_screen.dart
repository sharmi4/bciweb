
import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/members/responsive/authentications/sign_up_view/office_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../models/create_account_model.dart';

class ResidentialAddressScreen extends StatefulWidget {
  CreateAccountModel?memberRegisterModel;
  ResidentialAddressScreen({super.key, required this.memberRegisterModel});

  @override
  State<ResidentialAddressScreen> createState() =>
      _ResidentialAddressScreenState();
}

class _ResidentialAddressScreenState extends State<ResidentialAddressScreen> {
  var doorNumberController = TextEditingController();
  var buildingNameController = TextEditingController();
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var personalIDController = TextEditingController();
  var aadharController = TextEditingController();
  var referalcodeController = TextEditingController();

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
                "Residential Address",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.w600, color: kblue),
              ),
              ksizedbox10,
              Text(
                "Please fill the details address",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w400, color: kblue),
              ),
              ksizedbox30,
              const Image(
                  height: 200, image: AssetImage("assets/images/Group -1.png")),
              ksizedbox30,
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: doorNumberController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return "User name can't be empty";
                  //   }
                  //   return null;
                  // },
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
                      hintText: "Door No",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: buildingNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Building name can't be empty";
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
                      hintText: "Building Name",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: addressController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Address can't be empty";
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
                      hintText: "Address",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: cityController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "City can't be empty";
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
                      hintText: "City",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: stateController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                       return "State can't be empty";
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
                      hintText: "State",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: personalIDController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Personal Id can't be empty";
                    }
                    return null;
                  },
                 
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                   
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
                      hintText: "Personal Id",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: aadharController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Aadhar Number can't be empty";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(12),
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
                      hintText: "Aadhar No",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              ksizedbox40,
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    AddressModel addressModel = AddressModel(
                        doorNo: doorNumberController.text,
                        buildingName: buildingNameController.text,
                        address: addressController.text,
                        city: cityController.text,
                        state: stateController.text,
                        personalId: personalIDController.text,
                        aadhrId: aadharController.text, pincode: '');

                    CreateAccountModel tempcreateaccountModel=
                            CreateAccountModel(
                              referalcode:widget.memberRegisterModel!.referalcode ,
                           name:widget.memberRegisterModel!.name , 
                               email: widget.memberRegisterModel!.email, 
                               mobilenumber: widget.memberRegisterModel!.mobilenumber,
                               aadharNo: widget.memberRegisterModel!.aadharNo,
                               panNo: widget.memberRegisterModel!.panNo,
                               password: widget.memberRegisterModel!.password,
                               fatherName: widget.memberRegisterModel!.fatherName,
                               motherName: widget.memberRegisterModel!.motherName,
                               occupation: widget.memberRegisterModel!.occupation,
                               roleId: widget.memberRegisterModel!.roleId,
                               isMarried: widget.memberRegisterModel!.isMarried,
                               unmarried: widget.memberRegisterModel!.unmarried,
                               passwordConfirmation: widget.memberRegisterModel!.passwordConfirmation,
                                dateofbirth: widget.memberRegisterModel!.dateofbirth,);

                    Get.to(OfficeAddressScreen(  addresModel:addressModel,
                               tempMemberRegisterModel:tempcreateaccountModel
                    //  addressModel: addressModel,
                     // memberRegisterModel: tempMemberRegisterModel,
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
                        Color.fromARGB(255, 255, 123, 34),
                      ],
                    ),
                  ),
                  child: const Center(
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
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../constant/constans.dart';
// import '../../../models/create_account_model.dart';
// import '../../../views/authentication/office_address.dart';
// import 'office_address_screen.dart';

// class ResidentialAddressScreen extends StatefulWidget {
//   CreateAccountModel?memberRegisterModel;
//    ResidentialAddressScreen({super.key, this. memberRegisterModel});

//   @override
//   State<ResidentialAddressScreen> createState() => _ResidentialAddressScreenState();
// }

// class _ResidentialAddressScreenState extends State<ResidentialAddressScreen> {
//     var doornumberController=TextEditingController();
//    var buildingnameController=TextEditingController();
//     var addresController=TextEditingController();
//     var cityController=TextEditingController();
//      var stateController=TextEditingController();
//       var _formKey = GlobalKey<FormState>();
//   dynamic imageprofile;
//   dynamic adharimage;
//    Future profileimage() async {
//     try {
//       final ImagePicker _picker = ImagePicker();
//                     // Pick an image
//                     final XFile? timage =
//                         await _picker.pickImage(source: ImageSource.gallery);
//                     setState(() {
//                       imageprofile = File(timage!.path);
//                     });
//     } catch (e) {
//       print('Failed to pick image:$e');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: const Color(0xffF9F8FD),
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: ListView(
//               children: [
//                 Text(
//                       "Residential Address",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 32,
//                       fontWeight: FontWeight.w600,
//                       color: kblue),
//                     ),
//                     ksizedbox10,
//                      Text(
//                       "Please fill the details address",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 18,
//                       fontWeight: FontWeight.w400,
//                       color: kblue),
//                     ),
//                     ksizedbox30,
//                     const Image(
//                       height: 200,
//                       image: AssetImage("assets/images/Group -1.png")),
//                       ksizedbox30,
//                       Padding(
//                              padding: const EdgeInsets.only(top: 15),
//                              child: Container(
//                                height: 40,
//                                width: size.width,
//                                decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(2),
//                                border: Border.all(color:const Color(0xff707070)),
//                                color:Colors.white),
//                                alignment: Alignment.center,
//                                child: Padding(
//                                 padding:const EdgeInsets.only(left: 15, right: 10),
//                                 child: TextFormField(
//                                   controller: doornumberController,
//                                 //controller: usernamecontroller,
//                                 decoration: InputDecoration(
//                                 isCollapsed: true,
//                                 isDense: true,
//                                 border: InputBorder.none,
//                                 hintText: "Door No",
//                                  hintStyle: TextStyle(
//                                  color: kblue,
//                                  fontWeight: FontWeight.w400,
//                                )),
//                             ),
//                          ),
//                     ),
//                  ),
//                  Padding(
//                              padding: const EdgeInsets.only(top: 15),
//                              child: Container(
//                                height: 40,
//                                width: size.width,
//                                decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(2),
//                                border: Border.all(color:const Color(0xff707070)),
//                                color:Colors.white),
//                                alignment: Alignment.center,
//                                child: Padding(
//                                 padding:const EdgeInsets.only(left: 15, right: 10),
//                                 child: TextFormField(
//                                 controller: buildingnameController,
//                                 //controller: usernamecontroller,
//                                 decoration: InputDecoration(
//                                 isCollapsed: true,
//                                 isDense: true,
//                                 border: InputBorder.none,
//                                 hintText: "Building name",
//                                  hintStyle: TextStyle(
//                                  color: kblue,
//                                  fontWeight: FontWeight.w400,
//                                )),
//                             ),
//                          ),
//                     ),
//                  ),
//                  Padding(
//                              padding: const EdgeInsets.only(top: 15),
//                              child: Container(
//                                height: 40,
//                                width: size.width,
//                                decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(2),
//                                border: Border.all(color:const Color(0xff707070)),
//                                color:Colors.white),
//                                alignment: Alignment.center,
//                                child: Padding(
//                                 padding:const EdgeInsets.only(left: 15, right: 10),
//                                 child: TextFormField(
//                                   controller: addresController,
//                                 //controller: usernamecontroller,
//                                 decoration: InputDecoration(
//                                 isCollapsed: true,
//                                 isDense: true,
//                                 border: InputBorder.none,
//                                 hintText: "Address",
//                                  hintStyle: TextStyle(
//                                  color: kblue,
//                                  fontWeight: FontWeight.w400,
//                                )),
//                             ),
//                          ),
//                     ),
//                  ),
//                   Padding(
//                              padding: const EdgeInsets.only(top: 15),
//                              child: Container(
//                                height: 40,
//                                width: size.width,
//                                decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(2),
//                                border: Border.all(color:const Color(0xff707070)),
//                                color:Colors.white),
//                                alignment: Alignment.center,
//                                child: Padding(
//                                 padding:const EdgeInsets.only(left: 15, right: 10),
//                                 child: TextFormField(
//                                   controller: cityController,
//                                 //controller: usernamecontroller,
//                                 decoration: InputDecoration(
//                                 isCollapsed: true,
//                                 isDense: true,
//                                 border: InputBorder.none,
//                                 hintText: "City",
//                                  hintStyle: TextStyle(
//                                  color: kblue,
//                                  fontWeight: FontWeight.w400,
//                                )),
//                             ),
//                          ),
//                     ),
//                  ),
//                   Padding(
//                              padding: const EdgeInsets.only(top: 15),
//                              child: Container(
//                                height: 40,
//                                width: size.width,
//                                decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(2),
//                                border: Border.all(color:const Color(0xff707070)),
//                                color:Colors.white),
//                                alignment: Alignment.center,
//                                child: Padding(
//                                 padding:const EdgeInsets.only(left: 15, right: 10),
//                                 child: TextFormField(
//                                   controller: stateController,
//                                 //controller: usernamecontroller,
//                                 decoration: InputDecoration(
//                                 isCollapsed: true,
//                                 isDense: true,
//                                 border: InputBorder.none,
//                                 hintText: "State",
//                                  hintStyle: TextStyle(
//                                  color: kblue,
//                                  fontWeight: FontWeight.w400,
//                                )),
//                             ),
//                          ),
//                     ),
//                  ),
//                  Padding(
//                              padding: const EdgeInsets.only(top: 15),
//                              child: Container(
//                                height: 40,
//                                width: size.width,
//                                decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(2),
//                                border: Border.all(color:const Color(0xff707070)),
//                                color:Colors.white),
//                                alignment: Alignment.center,
//                                child: Padding(
//                                 padding:const EdgeInsets.only(left: 15, right: 10),
//                                 child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             imageprofile != null? Image.memory(imageprofile):Text('Personal ID ',
//                                             style: 
//                                             TextStyle(
//                                               color: kblue,
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 16
//                                             ),),
//                                             GestureDetector(
//                                               onTap: ()async{
                                               
//                             PickedFile? pickedFile = await ImagePicker().getImage(
//                               source: ImageSource.gallery,
//                             );
          
//                             var tempCont = await pickedFile!.readAsBytes();
//                             setState(() {
//                               imageprofile = tempCont;
//                             });
                            
          
//                             // profileController.updateProfilePic(media: imagePath);
//                           },
                                            
//                                               child: Icon(Icons.upload_sharp,color: kgrey,))
//                                           ],
//                                         ),
//                          ),
//                     ),
//                  ),
//                  Padding(
//                              padding: const EdgeInsets.only(top: 15),
//                              child: Container(
//                                height: 40,
//                                width: size.width,
//                                decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(2),
//                                border: Border.all(color:const Color(0xff707070)),
//                                color:Colors.white),
//                                alignment: Alignment.center,
//                                child: Padding(
//                                 padding:const EdgeInsets.only(left: 15, right: 10),
//                                 child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             adharimage != null? Image.memory(adharimage):Text('Adhaar ID ',
//                                              style: 
//                                             TextStyle(
//                                               color: kblue,
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 16
//                                             ),),
//                                             GestureDetector(
//                                               onTap: ()async{
                                               
//                             PickedFile? pickedFile = await ImagePicker().getImage(
//                               source: ImageSource.gallery,
//                             );
          
//                             var tempCont = await pickedFile!.readAsBytes();
//                             setState(() {
//                               adharimage = tempCont;
//                             });
                            
          
//                             // profileController.updateProfilePic(media: imagePath);
//                           },
                                            
//                                               child: Icon(Icons.upload_sharp,color: kgrey,))
//                                           ],
//                                         ),
//                          ),
//                     ),
//                  ),
                 
                
//                  ksizedbox40,
//                   InkWell(
//                         onTap: () {
//                         if(_formKey.currentState!.validate()){
//                           AddressModel addresModel=AddressModel(

//                             doorNo: doornumberController.text, 
//                             buildingName: buildingnameController.text, 
//                             address: addresController.text, 
//                             city: cityController.text, 
//                             state: stateController.text, 
//                             personalId: '1234', 
//                             aadhrId: '5678907645');
//                             CreateAccountModel tempcreateaccountModel=
//                             CreateAccountModel(
//                               name:widget.memberRegisterModel!.name , 
//                               email: widget.memberRegisterModel!.email, 
//                               mobilenumber: widget.memberRegisterModel!.mobilenumber,
//                               aadharNo: widget.memberRegisterModel!.aadharNo,
//                               panNo: widget.memberRegisterModel!.panNo,
//                               password: widget.memberRegisterModel!.password,
//                               fatherName: widget.memberRegisterModel!.fatherName,
//                               motherName: widget.memberRegisterModel!.motherName,
//                               occupation: widget.memberRegisterModel!.occupation,
//                               roleId: widget.memberRegisterModel!.roleId,
//                               isMarried: widget.memberRegisterModel!.isMarried,
//                               unmarried: widget.memberRegisterModel!.unmarried,
//                               passwordConfirmation: widget.memberRegisterModel!.passwordConfirmation,
//                                dateofbirth: widget.memberRegisterModel!.dateofbirth,
                              
//                               );
//                               Get.to(OfficeAddressScreen(
//                                addresModel:addresModel,
//                               tempMemberRegisterModel:tempcreateaccountModel
//                               ));
//                         }
//                         },
//                         child: Container(
//                           width: size.width * 0.25,
//                           height: 45,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                               4,
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
//                                 ksizedbox10,
              
//               ],
//             ),
//           ),
//         ),
//     );
//   }
// }