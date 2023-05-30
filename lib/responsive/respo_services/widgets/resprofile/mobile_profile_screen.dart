import 'dart:io';

import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/reg_home_controller.dart';
import 'package:bciweb/controller/reg_profile_controller.dart';
import 'package:bciweb/views/authentication/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

//import '../../../registerhomescreen/common_reg_appbar';
import '../../../../controller/profile_show_controller.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../mobile_wdgets/comomappbar.dart';
import '../../../mobile_wdgets/mobile_common_bottom/bottom.dart';
class  MobileProfileScreen extends StatefulWidget {
  const  MobileProfileScreen({super.key});

  @override
  State< MobileProfileScreen> createState() => _MobileProfileScreenState();
}

class _MobileProfileScreenState extends State< MobileProfileScreen> {
  final reghomeController=Get.find<RegisterProfileController>();
  final regshowController=Get.find<ProfileShowController>();
  var nameController=TextEditingController();
  var dobController=TextEditingController();
  var emailController=TextEditingController();
  var numberController=TextEditingController();
  var occupationController=TextEditingController();
  var fathernameController=TextEditingController();
  var mothernameController=TextEditingController();
  var wedingnameController=TextEditingController();
  var spousenameController=TextEditingController();
  var dateofbirthController=TextEditingController();
  var childrensController=TextEditingController();
var referalCOntroller=TextEditingController();
  var subNameController=TextEditingController();
  var subMobileController=TextEditingController();
  var subEmailController=TextEditingController();
  var subDescriptionController=TextEditingController();
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
        dobController.text = '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
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
        dobController.text = '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      body: 
       ListView(
          children:[ 
                
                  Column(
                    children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 50,top: 40),
                         child: Row(
                          children: [
                             Icon(Icons.person,size: 35,color: kblue,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 11),
                                 child: Text('My Account',
                                 style: TextStyle(
                                 fontSize: 16
                                 ),),)
                          ],
                         ),
                       ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50,top:40),
                          child: Row(
                             children: [
                              Image.asset('assets/icons/profiledashboard.png',
                              height: 35,fit: BoxFit.fitHeight,color: kblue,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 11),
                                 child: Text('Dashboard',
                                 style: TextStyle(
                                     fontSize: 16
                                 ),),
                               ),
                             ],
                           ),
                        ),
                         Padding(
                           padding: const EdgeInsets.only(left: 50,top: 40),
                           child: Row(
                             children: [
                              Image.asset('assets/icons/profileoffers.png',
                              height: 35,fit: BoxFit.fitHeight,color: kblue,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 11),
                                 child: Text('Offers',
                                 style: TextStyle(
                                  fontSize: 16
                                 ),),
                               ),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 50,top: 40),
                           child: Row(
                             children: [
                              Image.asset('assets/icons/profilecuopons.png',
                              height: 25,fit: BoxFit.fitHeight,color: kblue,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 11),
                                 child: Text('Your Coupons',
                                 style: TextStyle(
                                  fontSize: 16
                                 ),),
                               ),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 40,left: 50),
                           child: Row(
                             children: [
                              Image.asset('assets/icons/proaditionaloffer.png',
                              height: 35,fit: BoxFit.fitHeight,color: kblue,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 11),
                                 child: Text('Additional Coupons',
                                 style: TextStyle(
                                 fontSize: 16 
                                 ),),
                               ),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 40,left: 50),
                           child: Row(
                             children: [
                              Image.asset('assets/icons/profilerefferal.png',
                              height: 30,fit: BoxFit.fitHeight,color: kblue,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 11),
                                 child: Text('Your Referrals',
                                 style: TextStyle(
                                  fontSize: 16
                                 ),),
                               ),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 40,left: 50),
                           child: Row(
                             children: [
                              Image.asset('assets/icons/profilepartner.png',
                              height: 30,fit: BoxFit.fitHeight,color: kblue,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 11),
                                 child: Text('Our Partner',
                                 style: TextStyle(
                                  fontSize: 16
                                 ),),
                               ),
                             ],
                           ),
                         ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40,left: 50),
                            child: Row(
                             children: [
                              Image.asset('assets/icons/profileupgrade.png',
                              height: 36,fit: BoxFit.fitHeight,color: kblue,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 11),
                                 child: Text('Upgrade',
                                 style: TextStyle(
                                  fontSize: 16
                                 ),),
                               ),
                             ],
                                                   ),
                          ),
                         Padding(
                           padding: const EdgeInsets.only(top: 40,left: 50),
                           child: Row(
                             children: [
                              OutlinedButton(
                                style: ButtonStyle(
                                  minimumSize: MaterialStatePropertyAll(Size.fromWidth(200))
                                ),
                                onPressed: (){},
                                child: Row(
                                  children:[ Image.asset('assets/icons/profilesubort.png',
                                  height: 35,fit: BoxFit.fitHeight,color: kblue,),
                                  Padding(
                                 padding: const EdgeInsets.only(left: 11),
                                 child: Text('Support',
                                 style: TextStyle(
                                  fontSize: 16
                                 ),),
                               ),
                                  ]
                                ),
                                 
                              ),
                              
                             ],
                           ),
                         ), 
                         Padding(
                           padding: const EdgeInsets.only(top: 40,left: 50),
                           child: Row(
                             children: [
                              Image.asset('assets/icons/profilelogout.png',
                              height: 30,fit: BoxFit.fitHeight,color: kblue,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 11),
                                 child: Text('Logout',style: TextStyle(
                                  fontSize: 16
                                 ),),
                               ),
                             ],
                           ),
                         ),  
                    ],
                  ),
                  
                   MobileCommonBottom()
              
                
          ]
        ),
      
    );
  }
}