import 'dart:io';

import 'package:bciweb/views/authentication/office_address.dart';
import 'package:bciweb/views/authentication/widgets/formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import '../../constant/constans.dart';
import '../../models/create_account_model.dart';

class ResidentialAddress extends StatefulWidget {
   CreateAccountModel?memberRegisterModel;
   ResidentialAddress({super.key,  this.memberRegisterModel});

  @override
  State<ResidentialAddress> createState() => _ResidentialAddressState();
}

class _ResidentialAddressState extends State<ResidentialAddress> {
  var doornumberController=TextEditingController();
   var buildingnameController=TextEditingController();
    var addresController=TextEditingController();
    var cityController=TextEditingController();
     var stateController=TextEditingController();
      var _formKey = GlobalKey<FormState>();
      dynamic imageprofile;
      dynamic adharimage;
     bool showimage=false;
  Future profileimage() async {
    try {
      final ImagePicker _picker = ImagePicker();
                    // Pick an image
                    final XFile? timage =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      imageprofile = File(timage!.path);
                    });
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }
  @override
  Widget build(BuildContext context) {
    //  bool isChecked = false;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                child: Column(
                  children: [
                    ksizedbox40,
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        'Residential Address',
                        style: TextStyle(
                            fontSize: 30, color: kblue, fontWeight: FontWeight.w700),
                      ),
                    ),
                    ksizedbox10,
                    Padding(
                      padding: const EdgeInsets.only(top: 10,right: 50),
                      child: Text(
                        'Please fill the details Address',
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
                                  text: 'Door No',
                                  controller: doornumberController,
                                ),
                                ksizedbox20,
                                Formfield(
                                  text: 'Building Name',
                                  controller: buildingnameController,
                                ),
                                ksizedbox20,
                                Formfield(
                                  text: 'Address',
                                  controller: addresController,
                                ),
                                ksizedbox20,
                                Formfield(
                                  text: 'City',
                                  controller: cityController,
                                ),
                                ksizedbox20,
                                Formfield(
                                  text: 'State',
                                  controller: stateController,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 27),
                                  child: Container(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10, left: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          imageprofile != null? Image.memory(imageprofile):Text('Personal ID '),
                                          GestureDetector(
                                            onTap: ()async{
                                             
                          PickedFile? pickedFile = await ImagePicker().getImage(
                            source: ImageSource.gallery,
                          );

                          var tempCont = await pickedFile!.readAsBytes();
                          setState(() {
                            imageprofile = tempCont;
                          });
                          

                          // profileController.updateProfilePic(media: imagePath);
                        },
                                          
                                            child: Icon(Icons.upload_sharp,color: kgrey,))
                                        ],
                                      ),
                                    ),
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: Color(0xff707070))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 27),
                                  child: Container(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10, left: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          adharimage!=null?Image.memory(adharimage):Text('Adhaar ID'),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: IconButton(
                                              onPressed: ()async{
                                                 PickedFile? pickedFile = await ImagePicker().getImage(
                                                                      source: ImageSource.gallery,
                                                                    );
                                          
                                                                    var tempCont = await pickedFile!.readAsBytes();
                                                                    setState(() {
                                                                      adharimage = tempCont;
                                                                    });
                                                                    
                                              },
                                              icon: Icon(
                                                Icons.upload_sharp,
                                                color: kgrey,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: Color(0xff707070))),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),

                    //   ksizedbox30,
                    ksizedbox30,
                    InkWell(
                      onTap: () {
                      if(_formKey.currentState!.validate()){
                        AddressModel addresModel=AddressModel(
                          doorNo: doornumberController.text, 
                          buildingName: buildingnameController.text, 
                          address: addresController.text, 
                          city: cityController.text, 
                          state: stateController.text, 
                          personalId: '1234', 
                          aadhrId: '5678907645', pincode: '');
                          CreateAccountModel tempcreateaccountModel=
                          CreateAccountModel(
                            referalcode:  widget.memberRegisterModel!.referalcode,
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
                             dateofbirth: widget.memberRegisterModel!.dateofbirth,
                            
                            );
                            Get.to(OfficeAddress(
                              addresModel:addresModel,
                              tempMemberRegisterModel:tempcreateaccountModel
                            ));
                      }
                      },
                      child: Container(
                        width: size.width * 0.25,
                        height: 45,
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
                          'Next',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ksizedbox10,
                  ],
                ),
              )),
              Expanded(
                child: Container(
                  color: kblue,
                  child: Image.asset(
                    'assets/images/6.png',
                    height: size.height,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
