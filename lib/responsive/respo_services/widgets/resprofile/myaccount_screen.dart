import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constant/constans.dart';
import '../../../../controller/auth_controller/auth_profile_controller.dart';
import '../../../../controller/profile_controller.dart';
import '../../../../controller/profile_show_controller.dart';
import '../../../../controller/reg_profile_controller.dart';
import '../../../../models/create_account_model.dart';
import '../../../../models/member profileupdate.dart';
import '../../../mobile_wdgets/comomappbar.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
    final reghomeController=Get.find<RegisterProfileController>();
  final regshowController=Get.find<ProfileShowController>();
  var mobilenameController=TextEditingController();
  var mobiledobController=TextEditingController();
  var mobileemailController=TextEditingController();
  var mobilenumberController=TextEditingController();
  var mobileoccupationController=TextEditingController();
  var mobilefathernameController=TextEditingController();
  var mobilemothernameController=TextEditingController();
  var mobilewedingnameController=TextEditingController();
  var mobilespousenameController=TextEditingController();
  var mobiledateofbirthController=TextEditingController();
  var mobilechildrensController=TextEditingController();
var mobilereferalCOntroller=TextEditingController();
  var submobileNameController=TextEditingController();
  var subMobileController=TextEditingController();
  var submobileEmailController=TextEditingController();
  var submobileDescriptionController=TextEditingController();
  var mobileofficedoornumber=TextEditingController();
   var mobileofficebnumber=TextEditingController();
    var mobileofficeaddress=TextEditingController();
     var mobileofficecity=TextEditingController();
      var mobileofficestate=TextEditingController();

       var mobileresibnameController=TextEditingController();
       var mobileresidoornumberController=TextEditingController();
       var mobileresibcityController=TextEditingController();
       var mobileresistateController=TextEditingController();
       var mobileresiperidController=TextEditingController();
       var mobileresiadaridController=TextEditingController();
       var mobileresiaddressController=TextEditingController();
   File? image;
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
  Future imagepic() async {
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
        mobiledobController.text = '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
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
        mobiledobController.text = '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
      });
    }
  }
bool _value=false;
bool _value2=false;
bool _value3=false;
bool _value4=false;
int offersindex=0;
List partnerimage=[
  'assets/images/partnerimage1.png',
  'assets/images/partnerimage2.png',
  'assets/images/partnerimage3.png',
  'assets/images/partnerimage4.png',
  'assets/images/partnerimage5.png',
  'assets/images/partnerimage6.png'
  ];
 final authprofileController=Get.find<AuthProfileController>();
  final profileController=Get.find<ProfileController>();

  @override
void initState() {

  super.initState();
    setDefauld();
}
  setDefauld()async{
     await authprofileController.getProfile();
     if(authprofileController.profileData.isNotEmpty){
    mobilenameController.text= authprofileController.profileData.first.name;
    mobilenumberController.text= authprofileController.profileData.first.mobile;
    mobileemailController.text= authprofileController.profileData.first.email;
    mobileoccupationController.text= authprofileController.profileData.first.occupation;
    mobilefathernameController.text=authprofileController.profileData.first.fatherName;
    mobilemothernameController.text=authprofileController.profileData.first.motherName;
    
     mobileofficedoornumber.text =
          authprofileController.profileData.first.officialAddress.doorNo;
      mobileresibnameController.text =
          authprofileController.profileData.first.officialAddress.buildingName;
      mobileofficeaddress.text =
          authprofileController.profileData.first.officialAddress.address;

      mobileresibnameController.text = authprofileController.profileData.first.officialAddress.city;
      mobileofficestate.text = authprofileController.profileData.first.officialAddress.state;

      

      setState(() {
        isMarried =
            authprofileController.profileData.first.isMarried == "0" ? false : true;
              isUnmarried =
            authprofileController.profileData.first.isMarried == "0" ? false : true;
      });
      mobiledateofbirthController.text = authprofileController.profileData.first.dob;
    }
     } 
     bool isMarried =false;
bool isUnmarried =false; 
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return Scaffold(
       appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
       body:Obx(() =>
          ListView(
            children:[ Column(
            children:[
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
                                     padding: const EdgeInsets.only(left: 20,top: 20),
                                     child: Text('Profile Settting',
                                     style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: kblue
                                     ),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(right: 150,top: 20),
                                     child: InkWell(
                                      onTap: (){
                                        regshowController.showindex(0);
                                        regshowController.update();
                                      },
                 
                                       child: Image.asset('assets/icons/profiledropdown.png',
                                       height: 10,fit: BoxFit.fitHeight,),
                                     ),
                                   )
                                 ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 1,left: 10,right: 10),
                              child: Divider(
                                thickness: 1,
                            
                              ),
                            ),
                            Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 20,top: 20),
                                 child: Text('Office Address',
                                 style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: kblue
                                 ),),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(right: 150,top: 20),
                                 child: InkWell(
                                  onTap: (){
                                    regshowController.showindex(1);
                                    regshowController.update();
                                  },

                                   child: Image.asset('assets/icons/profiledropdown.png',
                                   height: 10,fit: BoxFit.fitHeight,),
                                 ),
                               )
                             ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1,left: 10,right: 10),
                          child: Divider(
                            thickness: 1,
                        
                          ),
                        ),
                         Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 20,top: 30),
                                 child: Text('Residential Address',
                                 style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: kblue
                                 ),),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(right: 150,top: 20),
                                 child: InkWell(
                                  onTap: (){
                                      regshowController.showindex(2);
                                      regshowController.update();
                                  },

                                   child: Image.asset('assets/icons/profiledropdown.png',
                                   height: 10,fit: BoxFit.fitHeight,),
                                 ),
                               )
                             ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1,left: 10,right: 10),
                          child: Divider(
                            thickness: 1,
                        
                          ),
                        ),
                            if(regshowController.showindex.value==0)
                            Padding(
                              padding: const EdgeInsets.only(top:40),
                              child: Column(
                                children: [
                                  Stack(
                                    children:[ 
                                      GetBuilder<AuthProfileController>(
                                  builder:(_){
                                  return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(""),
                                if (authprofileController.profileData.isNotEmpty)
                                  InkWell(
                                      onTap: ()async {
                                       
                          PickedFile? pickedFile = await ImagePicker().getImage(
                            source: ImageSource.gallery,
                          );
                           
                           
                          var tempCont = await pickedFile!.readAsBytes();
                          setState(() {
                            imageprofile = tempCont;
                          });
                          authprofileController.updateProfilePic(imageprofile);

                                      },
                                      child:imageprofile != null ? Image.memory(
                                              imageprofile!) :   authprofileController.profileData.first
                                                  .profilePicture ==
                                              null
                                          ?  Image.asset(
                                              'assets/images/profileimage.png')
                                          : Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          authprofileController
                                                              .profileData
                                                              .first
                                                              .profilePicture))),
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
                                  }
                                ), 
                                    
                                    ]
                                  ),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10,right:20,top:30),
                                        child: Container(
                                          height: 31,
                                          child: TextField( 
                                              textInputAction: TextInputAction.next,
                                            controller: mobilenameController,
                                            decoration: InputDecoration(
                                              hintText: 'User Name',
                                              hintStyle: TextStyle(
                                                fontSize: 14
                                              ),
                                              suffixIcon: Icon(Icons.edit,size: 14,),
                                              fillColor: Color(0xffF9F8FD),
                                              border: OutlineInputBorder(
                                                                           
                                              )
                                            ),
                                                                     
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10,right:20,top:30),
                                        child: Container(
                                          height: 31,
                                          width:20,
                                          child: TextField(
                                              textInputAction: TextInputAction.next,
                                            controller: mobiledobController,
                                             decoration: InputDecoration(
                                              hintText: 'Enetr Date Of Birth',
                                              hintStyle: TextStyle(
                                                fontSize: 14
                                              ),
                                              suffixIcon: IconButton(onPressed: (){
                                                _selectDate(context);
                                              }, 
                                              icon: Icon(Icons.edit,size: 14,),),
                                              fillColor: Color(0xffF9F8FD),
                                              border: OutlineInputBorder(
                                              )
                                              )
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
                                        padding: const EdgeInsets.only(left: 10,right: 20,top:30),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 35,
                                              child: TextField( 
                                                  textInputAction: TextInputAction.next,
                                                keyboardType: TextInputType.emailAddress,
                                                controller: mobileemailController,
                                                decoration: InputDecoration(
                                                  hintText: 'Enter Email',
                                                  hintStyle: TextStyle(
                                                    fontSize: 14
                                                  ),
                                                  suffixIcon: Icon(Icons.edit,size: 14,),
                                                  fillColor: Color(0xffF9F8FD),
                                                  border: OutlineInputBorder(
                                                                               
                                                  )
                                                ),
                                                                         
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:10,right:20,top:30),
                                        child: Column(
                                            children: [
                                              Container(
                                                height: 35,
                                                child: TextField(
                                                    textInputAction: TextInputAction.next,
                                                  keyboardType: TextInputType.number,
                                                  controller: mobilenumberController,
                                                   decoration: InputDecoration(
                                                    hintText: 'Enter Phone Number',
                                                    hintStyle: TextStyle(
                                                      fontSize: 14
                                                    ),
                                                    suffixIcon: IconButton(onPressed: (){
                                                  
                                                    }, 
                                                    icon: Icon(Icons.edit,size: 14,),),
                                                    fillColor: Color(0xffF9F8FD),
                                                    border: OutlineInputBorder(
                                                    )
                                                    )
                                                ),
                                              ),
                                                         
                 
                                            ],
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
                                        padding: const EdgeInsets.only(left: 10,right:20,top:30),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 35,
                                              child: TextField( 
                                                  textInputAction: TextInputAction.next,
                                                controller: mobileoccupationController,
                                                decoration: InputDecoration(
                                                  hintText: 'Occupation',
                                                  hintStyle: TextStyle(
                                                    fontSize: 14
                                                  ),
                                                  suffixIcon: Icon(Icons.edit,),
                                                  fillColor: Color(0xffF9F8FD),
                                                  border: OutlineInputBorder(
                                                                               
                                                  )
                                                ),
                                                                         
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10,right: 20,top: 30),
                                        child: Container(
                                       height:35,
                                          child:    TextField(
                                                  textInputAction: TextInputAction.next,
                                                controller: mobilefathernameController,
                                                 decoration: InputDecoration(
                                                  hintText: 'father Name',
                                                  hintStyle: TextStyle(
                                                    fontSize: 14
                                                  ),
                                                  suffixIcon: IconButton(onPressed: (){
                                                  
                                                  }, 
                                                  icon: Icon(Icons.edit,size: 14,),),
                                                  fillColor: Color(0xffF9F8FD),
                                                  border: OutlineInputBorder(
                                                  )
                                                  )
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
                                        padding: const EdgeInsets.only(left: 10,right: 20,top:30),
                                        child: Container(
                                          height: 35,
                                          child: TextField( 
                                              textInputAction: TextInputAction.next,
                                            controller: mobilemothernameController,
                                            decoration: InputDecoration(
                                              hintText: 'Mother Name',
                                              hintStyle: TextStyle(
                                                fontSize: 14
                                              ),
                                              fillColor: Color(0xffF9F8FD),
                                              border: OutlineInputBorder(
                                                                           
                                              )
                                            ),
                                                                     
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10,right: 20,top: 30),
                                        child: Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: kwhite,
                                          border: Border.all(
                                            color: kgrey
                                          ),
                                          borderRadius: BorderRadius.circular(5)
                                          ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(),
                                                  child: Row(
                                                                                          
                                                    children: [
                                                      Checkbox(value: isMarried, 
                                                      onChanged: (value){
                                                         setState(() {
                                                             isMarried=value!;
                                                         });
                                                      }),
                                                      Text('Married',
                                                      style: TextStyle(
                                                        fontSize: 12
                                                      ),),
                                                      Padding(
                                                        padding: const EdgeInsets.only(),
                                                        child: Checkbox(value: isUnmarried, 
                                                        onChanged: (value){
                                                          setState(() {
                                                            isUnmarried=value!;
                                                          });
                                                        }),
                                                      ),
                                                      Text('Unmarried',
                                                      style: TextStyle(
                                                        fontSize: 12
                                                      ),)
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
                                        padding: const EdgeInsets.only(left: 10,right: 20,top: 30),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 35,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8)
                                              ),
                                              child: TextField(
                                                        textInputAction: TextInputAction.next,
                                                      controller: mobilewedingnameController,
                                                       decoration: InputDecoration(
                                                        hintText: 'Wedding Date',
                                                        hintStyle: TextStyle(
                                                          fontSize: 14
                                                        ),
                                                        suffixIcon: IconButton(onPressed: (){
                                                          // _selectDate2(context);
                                                        }, 
                                                        icon: Icon(Icons.edit,
                                                        size: 14,),),
                                                        fillColor: Color(0xffF9F8FD),
                                                        border: OutlineInputBorder(
                                                        )
                                                        )
                                                    ),
                                            ),
                                          ],
                                        ),
                                        
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10,right:20,top: 30),
                                        child: Container(
                                          height: 35,
                                          child: TextField( 
                                               textInputAction: TextInputAction.next,
                                          controller: mobilespousenameController,
                                          decoration: InputDecoration(
                                            hintText: 'Spouse Name',
                                            hintStyle: TextStyle(
                                              fontSize: 14
                                            ),
                                            suffixIcon: Icon(Icons.edit,size: 14,),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder(
                                     
                                            )
                                          ),
                                                          
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
                                        padding: const EdgeInsets.only(left: 10,right: 20,top:30),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 35,
                                              child: TextField(
                                                         textInputAction: TextInputAction.next,
                                                      controller: mobiledateofbirthController,
                                                       decoration: InputDecoration(
                                                        hintText: 'Date of Birth',
                                                        hintStyle: TextStyle(
                                                          fontSize: 14
                                                        ),
                                                        suffixIcon: IconButton(onPressed: (){
                                                           _selectDate2(context);
                                                        }, 
                                                        icon: Icon(Icons.edit,
                                                        size: 14,),),
                                                        fillColor: Color(0xffF9F8FD),
                                                        border: OutlineInputBorder(
                                                        )
                                                        )
                                                    ),
                                            ),
                                          ],
                                        ),
                                        
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10,right: 20,top: 30),
                                  
                                          child: Column(
                                            children: [
                                              
                                                   Container(
                                                    height: 35,
                                                     child: TextField( 
                                                      
                                                     controller: mobilechildrensController,
                                                      decoration: InputDecoration(
                                                      hintText: 'No.Of.Children',
                                                      hintStyle: TextStyle(
                                                        fontSize:14
                                                      ),
                                                       suffixIcon: Icon(Icons.edit,
                                                       size: 14,),
                                                       fillColor: Color(0xffF9F8FD),
                                                       border: OutlineInputBorder(
                                                                                      
                                                         )
                                                        ),
                                                                     
                                                        ),
                                                   ),      
                 
                                            ],
                                          ),
                                        ),
                                      ),
                                  
                                  ],
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
                                  padding: const EdgeInsets.only(top:50,left:60),
                                  child: Row(
                                                              
                                   children: [
                                    ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                     backgroundColor: korange,
                                     minimumSize: Size(MediaQuery.of(context).size.width*0.42, 40)
                                  ),
                                     onPressed: (){
                                      MemberProfileUpdateModel
                                        memberProfileUpdateModel =
                                        MemberProfileUpdateModel(
                                      name: mobilenameController.text,
                                      email: mobileemailController.text,
                                      dateOfBirth:
                                          mobiledateofbirthController.text,
                                      fatherName: mobilefathernameController.text,
                                      isMarried:
                                          isMarried == true ? "1" : "0",
                                      mobile: mobilenumberController.text,
                                      motherName: mobilemothernameController.text,
                                      occupation: mobileoccupationController.text,
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
                                  padding: const EdgeInsets.only(top:50,left:60),
                                  child: Row(
                                                              
                                   children: [
                                    ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                     backgroundColor: korange,
                                     minimumSize: Size(MediaQuery.of(context).size.width*0.42, 40)
                                  ),
                                     onPressed: (){
                                      MemberProfileUpdateModel
                                        memberProfileUpdateModel =
                                        MemberProfileUpdateModel(
                                      name: mobilenameController.text,
                                      email: mobileemailController.text,
                                      dateOfBirth:
                                          mobiledateofbirthController.text,
                                      fatherName: mobilefathernameController.text,
                                      isMarried:
                                          isMarried == true ? "1" : "0",
                                      mobile: mobilenumberController.text,
                                      motherName: mobilemothernameController.text,
                                      occupation: mobileoccupationController.text,
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
                            ),
                           if (regshowController.showindex.value==1)
                           Container(
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.only(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 50,right:50,top:50),
                                        child: TextField( 
                                             textInputAction: TextInputAction.next,
                                          controller: mobileofficedoornumber,
                                          decoration: InputDecoration(
                                            hintText: 'Door Number',
                                            suffixIcon: Icon(Icons.edit),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder(
                                                                     
                                            )
                                          ),
                                                                   
                                        ),
                                      ),
                                    ),
                                Padding(
                                  padding: const EdgeInsets.only(left:50,right:50,top:50),
                                  child: TextField( 
                                       textInputAction: TextInputAction.next,
                                     controller: mobileofficebnumber,
                                     decoration: InputDecoration(
                                       hintText: 'Building Number',
                                       suffixIcon: Icon(Icons.edit),
                                       fillColor: Color(0xffF9F8FD),
                                       border: OutlineInputBorder(
                                   
                                       )
                                     ),
                                                              
                                      ),
                                ),
                                     Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                       Padding(
                                         padding: const EdgeInsets.only(),
                                         child: Padding(
                                           padding: const EdgeInsets.only(left: 50,right:50,top:50),
                                           child: TextField( 
                                               textInputAction: TextInputAction.next,
                                             controller: mobileofficeaddress,
                                             decoration: InputDecoration(
                                               hintText: 'Address',
                                               suffixIcon: Icon(Icons.edit),
                                               fillColor: Color(0xffF9F8FD),
                                               border: OutlineInputBorder(
                                                                        
                                               )
                                             ),
                                                                      
                                           ),
                                         ),
                                       ),
                                Padding(
                                  padding: const EdgeInsets.only(left:50,right:50,top:50),
                                  child: TextField( 
                                       textInputAction: TextInputAction.next,
                                        controller: mobileofficecity,
                                        decoration: InputDecoration(
                                          hintText: 'City',
                                          suffixIcon: Icon(Icons.edit),
                                          fillColor: Color(0xffF9F8FD),
                                          border: OutlineInputBorder(
                                   
                                          )
                                        ),
                                                                 
                                      ),
                                ),
                                    ],),
                                      Padding(
                                        padding: const EdgeInsets.only(left:50,top:50),
                                        child: Column(
                                          
                                          children: [
                                            Container(
                                              width:MediaQuery.of(context).size.width*0.75,
                                              child: TextField(
                                                 
                                                    controller: mobileofficestate,
                                                    decoration: InputDecoration(
                                                      hintText: 'State',
                                                      suffixIcon: Icon(Icons.edit),
                                                      fillColor: Color(0xffF9F8FD),
                                                      border: OutlineInputBorder(
                                               
                                                      )
                                                    ),
                                                                             
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                                                         Obx(
                            () => authprofileController.isLoading.isTrue
                                ? Padding(
                                 padding: const EdgeInsets.only(left:50,top:50),
                                 child: Row(
                                  children: [
                                ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: korange,
                                  minimumSize: Size(MediaQuery.of(context).size.width*0.42, 40)
                                ),
                                onPressed: (){
                                         AddressModel addressModel =
                                      AddressModel(
                                    aadhrId: "",
                                    address: mobileofficeaddress.text,
                                    buildingName: mobileofficebnumber.text,
                                    city: mobileofficecity.text,
                                    doorNo: mobileofficedoornumber.text,
                                    personalId: "",
                                    state: mobileofficestate.text,
                                  );

                                  authprofileController.updateOfficalAddress(
                                      officialAddress: addressModel);
                                }, 
                                child:CircularProgressIndicator(
                                  color:kwhite
                                )
                                )
                                  ],
                                 ),
                               )
                                : Padding(
                                 padding: const EdgeInsets.only(left:50,top:50),
                                 child: Row(
                                  children: [
                                ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: korange,
                                  minimumSize: Size(MediaQuery.of(context).size.width*0.42, 40)
                                ),
                                onPressed: (){
                                         AddressModel addressModel =
                                      AddressModel(
                                    aadhrId: "",
                                    address: mobileofficeaddress.text,
                                    buildingName: mobileofficebnumber.text,
                                    city: mobileofficecity.text,
                                    doorNo: mobileofficedoornumber.text,
                                    personalId: "",
                                    state: mobileofficestate.text,
                                  );

                                  authprofileController.updateOfficalAddress(
                                      officialAddress: addressModel);
                                }, 
                                child: Text('Update',
                                style: TextStyle(
                                fontSize: 17
                                ),))
                                  ],
                                 ),
                               ),
                          ),
                             ksizedbox30,
                                  ],
                                )
                                ),
                                if(regshowController.showindex.value==2)
                                 Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Padding(
                                     padding: const EdgeInsets.only(),
                                     child: Padding(
                                       padding: const EdgeInsets.only(left: 50,right:50,top:50),
                                       child: TextField( 
                                         textInputAction: TextInputAction.next,
                                         controller: mobileresidoornumberController,
                                         decoration: InputDecoration(
                                            
                                           hintText: 'Door Number',
                                           suffixIcon: Icon(Icons.edit),
                                           fillColor: Color(0xffF9F8FD),
                                           border: OutlineInputBorder(
                                                                    
                                           )
                                         ),
                                                                  
                                       ),
                                     ),
                                   ),
                                Padding(
                                  padding: const EdgeInsets.only(left:50,right:50,top:50),
                                  child: TextField( 
                                     textInputAction: TextInputAction.next,
                                    controller: mobileresibnameController,
                                    decoration: InputDecoration(
                                      hintText: 'Building Number',
                                      suffixIcon: Icon(Icons.edit),
                                      fillColor: Color(0xffF9F8FD),
                                      border: OutlineInputBorder(
                                   
                                      )
                                    ),
                                                             
                                  ),
                                ),
                                     Padding(
                                       padding: const EdgeInsets.only(),
                                       child: Padding(
                                         padding: const EdgeInsets.only(left: 50,right:50,top:50),
                                         child: TextField( 
                                           textInputAction: TextInputAction.next,
                                           controller: mobileresiaddressController,
                                           decoration: InputDecoration(
                                             hintText: 'Address',
                                             suffixIcon: Icon(Icons.edit),
                                             fillColor: Color(0xffF9F8FD),
                                             border: OutlineInputBorder(
                                                                      
                                             )
                                           ),
                                                                    
                                         ),
                                       ),
                                     ),
                                Padding(
                                  padding: const EdgeInsets.only(left:50,right:50,top:50),
                                  child: TextField( 
                                     textInputAction: TextInputAction.next,
                                      controller: mobileresibcityController,
                                      decoration: InputDecoration(
                                        hintText: 'City',
                                        suffixIcon: Icon(Icons.edit),
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder(
                                   
                                        )
                                      ),
                                                               
                                    ),
                                ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 50,right:50,top:50),
                                       child: TextField( 
                                         textInputAction: TextInputAction.next,
                                         controller: mobileresistateController,
                                         decoration: InputDecoration(
                                           hintText: 'State',
                                           suffixIcon: Icon(Icons.edit),
                                           fillColor: Color(0xffF9F8FD),
                                           border: OutlineInputBorder(
                                                                    
                                           )
                                         ),
                                                                  
                                       ),
                                     ),
                                Padding(
                                  padding: const EdgeInsets.only(left:50,right:50,top:50),
                                  child: TextField( 
                                     textInputAction: TextInputAction.next,
                                      controller: mobileresiperidController,
                                      decoration: InputDecoration(
                                        hintText: 'Personal Id',
                                        suffixIcon: Icon(Icons.upload),
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder(
                                   
                                        )
                                      ),
                                                               
                                    ),
                                ),
                                     Padding(
                                        padding: const EdgeInsets.only(left:50,top:50),
                                        child: Column(
                                          
                                          children: [
                                            Container(
                                              width:MediaQuery.of(context).size.width*0.75,
                                              child: TextField( 
                                                    controller: mobileresiadaridController,
                                                    decoration: InputDecoration(
                                                      hintText: 'Adhaar Id',
                                                      suffixIcon: Icon(Icons.upload),
                                                      fillColor: Color(0xffF9F8FD),
                                                      border: OutlineInputBorder(
                                               
                                                      )
                                                    ),
                                                                             
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                           Obx(
                            () => Padding(
                              padding: const EdgeInsets.only(top: 20,left: 50),
                              child: profileController.isLoading.isTrue
                                  ? InkWell(
                                      onTap: () {
                                        AddressModel addressModel =
                                            AddressModel(
                                                aadhrId: mobileresiadaridController.text,
                                                address: mobileresiaddressController.text,
                                                buildingName:
                                                    mobileresibnameController.text,
                                                city: mobileresibcityController.text,
                                                doorNo: mobileresidoornumberController.text,
                                                personalId: mobileresiperidController.text,
                                                state: mobileresistateController.text);
                                        authprofileController
                                            .updateRecidencyAddress(
                                                residentialAddress:
                                                    addressModel);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:20,left:50),
                                        child: Container(
                                          height: 40,
                                          width: size.width*0.42,
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
                                            color:kwhite
                                          )
                                          ),
                                        ),
                                      )
                                  : GestureDetector(
                                      onTap: () {
                                        AddressModel addressModel =
                                            AddressModel(
                                                aadhrId: mobileresiadaridController.text,
                                                address: mobileresiaddressController.text,
                                                buildingName:
                                                    mobileresibnameController.text,
                                                city: mobileresibcityController.text,
                                                doorNo: mobileresidoornumberController.text,
                                                personalId: mobileresiperidController.text,
                                                state: mobileresistateController.text);
                                        authprofileController
                                            .updateRecidencyAddress(
                                                residentialAddress:
                                                    addressModel);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:20,left:50),
                                        child: Container(
                                          height: 40,
                                          width: size.width*0.42,
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
                                          child: const Center(
                                            child: Text(
                                              "Submit",
                                           style: TextStyle(
                                          color: Colors.white,
                                fontSize: 17
                                ),
                                              
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
            ]
                   ),
            ]
          ),
       )
    );
  }
}