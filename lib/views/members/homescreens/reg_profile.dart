import 'dart:io';

import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/reg_home_controller.dart';
import 'package:bciweb/controller/reg_profile_controller.dart';
import 'package:bciweb/views/authentication/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controller/profile_controller.dart';
import '../../../controller/profile_show_controller.dart';
//import '../../../registerhomescreen/common_reg_appbar';
import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../../registerhomescreen/common_reg_homescreen.dart';
import '../common_widget/common.dart';
class  RegisterProfileScreen extends StatefulWidget {
  const  RegisterProfileScreen({super.key});

  @override
  State< RegisterProfileScreen> createState() => _RegisterProfileScreenState();
}

class _RegisterProfileScreenState extends State< RegisterProfileScreen> {
  final reghomeController=Get.find<RegisterProfileController>();
  final regshowController=Get.find<ProfileShowController>();
  final profileController=Get.find<ProfileController>();
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

  var officebnameController=TextEditingController();
   var officedoornoController=TextEditingController();
    var officeaddressController=TextEditingController();
     var officeaddresController=TextEditingController();
      var officecityController=TextEditingController();
       var officestateController=TextEditingController();

       var resibnameController=TextEditingController();
       var residoornumberController=TextEditingController();
       var resibcityController=TextEditingController();
       var resistateController=TextEditingController();
       var resiperidController=TextEditingController();
       var resiadaridController=TextEditingController();
       var resiaddressController=TextEditingController();
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
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: Obx(()=>
       ListView(
          children:[ RegisterCommonContainer(),
                
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          Container(
            height:900,
            width: 195,
            color: kyellow,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                     InkWell(
                      onTap: (){
                        reghomeController.proindex(0);
                          reghomeController.update();
                          
                      },
                       child: Container(
                         height: 40,
                                 width: 195,
                                   decoration: BoxDecoration(
                                   border: BorderDirectional(
                                  bottom: BorderSide(
                                    color: kwhite
                                  )
                                ),
                                color:reghomeController.proindex==0?kblue:kyellow 
                                                           ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: Row(
                           children: [
                            Icon(Icons.person,size: 20,color: kwhite,),
                             Padding(
                               padding: const EdgeInsets.only(left: 11),
                               child: Text('My Account',
                               style: TextStyle(
                                color: kwhite
                               ),),
                             ),
                           ],
                         ),
                       ),),
                     )
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                     InkWell(
                      onTap: (){
                         reghomeController.proindex(1);
                          reghomeController.update();
                      },
                       child: Container(
                              height: 40,
                               width: 195,
                                 decoration: BoxDecoration(
                                 border: BorderDirectional(
                                bottom: BorderSide(
                                  color: kwhite
                                )
                              ),
                              color:reghomeController.proindex==1?kblue:kyellow 
                                                         ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: Row(
                           children: [
                            Image.asset('assets/icons/profiledashboard.png',
                            height: 20,fit: BoxFit.fitHeight,),
                             Padding(
                               padding: const EdgeInsets.only(left: 11),
                               child: Text('Dashboard',
                               style: TextStyle(
                                color: kwhite
                               ),),
                             ),
                           ],
                         ),
                       ),),
                     )
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                     InkWell(
                      onTap: (){
                        reghomeController.proindex(2);
                          reghomeController.update();
                      },
                       child: Container(
                       height: 40,
                             width: 195,
                               decoration: BoxDecoration(
                               border: BorderDirectional(
                              bottom: BorderSide(
                                color: kwhite
                              )
                            ),
                            color:reghomeController.proindex==2?kblue:kyellow 
                                                       ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: Row(
                           children: [
                            Image.asset('assets/icons/profileoffers.png',
                            height: 20,fit: BoxFit.fitHeight,),
                             Padding(
                               padding: const EdgeInsets.only(left: 11),
                               child: Text('Offers',
                               style: TextStyle(
                                color: kwhite
                               ),),
                             ),
                           ],
                         ),
                       ),),
                     )
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                     InkWell(
                      onTap: (){
                         reghomeController.proindex(3);
                          reghomeController.update();
                      },
                       child: Container(
                           height: 40,
                           width: 195,
                             decoration: BoxDecoration(
                             border: BorderDirectional(
                            bottom: BorderSide(
                              color: kwhite
                            )
                          ),
                          color:reghomeController.proindex==3?kblue:kyellow 
                                                     ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: Row(
                           children: [
                            Image.asset('assets/icons/profilecuopons.png',
                            height: 15,fit: BoxFit.fitHeight,),
                             Padding(
                               padding: const EdgeInsets.only(left: 11),
                               child: Text('Your Coupons',
                               style: TextStyle(
                                color: kwhite
                               ),),
                             ),
                           ],
                         ),
                       ),),
                     )
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                     InkWell(
                      onTap: (){
                          reghomeController.proindex(4);
                          reghomeController.update();
                      },
                       child: Container(
                         height: 40,
                         width: 195,
                           decoration: BoxDecoration(
                           border: BorderDirectional(
                          bottom: BorderSide(
                            color: kwhite
                          )
                        ),
                        color:reghomeController.proindex==4?kblue:kyellow 
                                                   ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: Row(
                           children: [
                            Image.asset('assets/icons/proaditionaloffer.png',
                            height: 20,fit: BoxFit.fitHeight,),
                             Padding(
                               padding: const EdgeInsets.only(left: 11),
                               child: Text('Additional Coupons',style: TextStyle(
                                color: kwhite
                               ),),
                             ),
                           ],
                         ),
                       ),),
                     )
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                     InkWell(
                      onTap: (){
                        reghomeController.proindex(5);
                        reghomeController.update();
                      },
                       child: Container(
                        height: 40,
                        width: 195,
                        decoration: BoxDecoration(
                           border: BorderDirectional(
                          bottom: BorderSide(
                            color: kwhite
                          )
                        ),
                          color: reghomeController.proindex==5?kblue:kyellow,
                        ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: Row(
                           children: [
                            Image.asset('assets/icons/profilerefferal.png',
                            height: 20,fit: BoxFit.fitHeight,),
                             Padding(
                               padding: const EdgeInsets.only(left: 11),
                               child: Text('Your Referrals',
                               style: TextStyle(
                                color: kwhite
                               ),),
                             ),
                           ],
                         ),
                       ),),
                     )
                    ],
                  ),
                ),
                   Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                     InkWell(
                      onTap: (){
                        reghomeController.proindex(6);
                        reghomeController.update();
                      },
                       child: Container(
                       height: 40,
                       width: 195,
                       decoration: BoxDecoration(
                        border: BorderDirectional(
                          bottom: BorderSide(
                            color: kwhite
                          )
                        ),
                        color:  reghomeController.proindex==6?kblue:kyellow,
                       ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 11),
                         child: Row(
                           children: [
                            Image.asset('assets/icons/profilepartner.png',
                            height: 20,fit: BoxFit.fitHeight,),
                             Padding(
                               padding: const EdgeInsets.only(left: 11),
                               child: Text('Our Partner',
                               style: TextStyle(
                                color: kwhite
                               ),),
                             ),
                           ],
                         ), 
                       ),),
                     )
                    ],
                  ),
                ),
                
                 Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                     InkWell(
                      onTap: (){
                         reghomeController.proindex(7);
                        reghomeController.update();
                    
                      },
                       child: Container(
                       height: 40,
                       width: 195,
                       decoration: BoxDecoration(
                         border: BorderDirectional(
                          bottom: BorderSide(
                            color: kwhite
                          )
                        ),
                        color: reghomeController.proindex==7?kblue:kyellow
                       ),
                       
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: Row(
                           children: [
                            Image.asset('assets/icons/profileupgrade.png',
                            height: 20,fit: BoxFit.fitHeight,),
                             Padding(
                               padding: const EdgeInsets.only(left: 11),
                               child: Text('Upgrade',
                               style: TextStyle(
                                color: kwhite
                               ),),
                             ),
                           ],
                         ), 
                       ),),
                     )
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                     InkWell(
                      onTap: (){
                         reghomeController.proindex(8);
                        reghomeController.update();
                      },
                       child: Container(
                       width: 195,
                       height: 40,
                       decoration: BoxDecoration(
                         border: BorderDirectional(
                          bottom: BorderSide(
                            color: kwhite
                          )
                        ),
                        color:  reghomeController.proindex==8?kblue:kyellow
                       ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: Row(
                           children: [
                            Image.asset('assets/icons/profilesubort.png',
                            height: 20,fit: BoxFit.fitHeight,),
                             Padding(
                               padding: const EdgeInsets.only(left: 11),
                               child: Text('Support',
                               style: TextStyle(color: kwhite),),
                             ),
                           ],
                         ), 
                       ),),
                     )
                    ],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                     InkWell(
                      onTap: (){
                         reghomeController.proindex(9);
                        reghomeController.update();
                        Get.offAll(LandingScreen());
                      },
                       child: Container(
                          width: 195,
                         height: 40,
                         decoration: BoxDecoration(
                           border: BorderDirectional(
                          bottom: BorderSide(
                            color: kwhite
                          )
                        ),
                          color:  reghomeController.proindex==9?kblue:kyellow
                         ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: Row(
                           children: [
                            Image.asset('assets/icons/profilelogout.png',
                            height: 20,fit: BoxFit.fitHeight,),
                             Padding(
                               padding: const EdgeInsets.only(left: 11),
                               child: Text('Logout',style: TextStyle(
                                color: kwhite
                               ),),
                             ),
                           ],
                         ), 
                       ),
                       ),
                     )
                    ],
                  ),
                ),
              ],
            ),
          ),
           if(reghomeController.proindex.value ==0)
                 Padding(
                   padding: const EdgeInsets.only(bottom: 0),
                   child: Container(
                    width: MediaQuery.of(context).size.width-195,
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
                                   profileController.profileindex(0);
                                   profileController.update();
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
                          
                        if(profileController.profileindex.value==0)
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Column(
                            children: [
                              Stack(
                                children:[ 
                                  Center(
                                    child: image!=null?Image.file(image!):InkWell(
                                      onTap: (){

                                      },
                                      child: Image.asset('assets/images/profileimage.png',
                                                                    height: 90,fit: BoxFit.fitHeight,),
                                    ),
                                  ),
                                 Padding(
                                padding: const EdgeInsets.only(top: 60,left: 75),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    
                                    InkWell(
                                      onTap: (){
                                        imagepic();
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: kblue,
                                        radius: 12,
                                        child: Icon(
                                          Icons.camera_alt_outlined,size: 15,),
                                      ),
                                    )
                                  ],
                                ), 
                              )
                                ]
                              ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 40,right: 70,top: 30,bottom: 30),
                                    child: TextField( 
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        hintText: 'User Name',
                                        suffixIcon: Icon(Icons.edit),
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder(
                                 
                                        )
                                      ),
                                                               
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 70,right: 50,
                                    top: 30,bottom: 30),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          TextField(
                                            
                                            controller: dobController,
                                             decoration: InputDecoration(
                                              hintText: 'Enter Date Of Birth',
                                              suffixIcon: IconButton(onPressed: (){
                                                _selectDate(context);
                                              }, 
                                              icon: Icon(Icons.edit),),
                                              fillColor: Color(0xffF9F8FD),
                                              border: OutlineInputBorder(
                                              )
                                              )
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
                                    padding: const EdgeInsets.only(left: 40,right: 70,top: 0,bottom: 30),
                                    child: TextField( 
                                      keyboardType: TextInputType.emailAddress,
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Email',
                                        suffixIcon: Icon(Icons.edit),
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder(
                                 
                                        )
                                      ),
                                                               
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 70,right: 50,
                                    top: 0,bottom: 30),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          TextField(
                                            keyboardType: TextInputType.number,
                                            controller: dobController,
                                             decoration: InputDecoration(
                                              hintText: 'Enter Phone Number',
                                              suffixIcon: IconButton(onPressed: (){
                                            
                                              }, 
                                              icon: Icon(Icons.edit),),
                                              fillColor: Color(0xffF9F8FD),
                                              border: OutlineInputBorder(
                                              )
                                              )
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
                                    padding: const EdgeInsets.only(left: 40,right: 70,top: 0,bottom: 30),
                                    child: TextField( 
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        hintText: 'Occupation',
                                        suffixIcon: Icon(Icons.edit),
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder(
                                 
                                        )
                                      ),
                                                               
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 70,right: 50,
                                    top: 0,bottom: 30),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          TextField(
                                            
                                            controller: dobController,
                                             decoration: InputDecoration(
                                              hintText: 'Father Name',
                                              suffixIcon: IconButton(onPressed: (){
                                              
                                              }, 
                                              icon: Icon(Icons.edit),),
                                              fillColor: Color(0xffF9F8FD),
                                              border: OutlineInputBorder(
                                              )
                                              )
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
                                    padding: const EdgeInsets.only(left: 40,right: 70,top: 0,bottom: 30),
                                    child: TextField( 
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        hintText: 'Mother Name',
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder(
                                 
                                        )
                                      ),
                                                               
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 70,right: 50,
                                    top: 0,bottom: 30),
                                    child: Container(
                                      height: 50 ,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: kwhite,
                                      border: Border.all(
                                        color: kgrey
                                      )
                                      ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5,left: 1 ),
                                              child: Row(
                                                                                      
                                                children: [
                                                  Checkbox(value: _value, 
                                                  onChanged: (value){
                                                     setState(() {
                                                         _value=value!;
                                                     });
                                                  }),
                                                  Text('Married'),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 40),
                                                    child: Checkbox(value: _value2, 
                                                    onChanged: (value){
                                                      setState(() {
                                                        _value2=value!;
                                                      });
                                                    }),
                                                  ),
                                                  Text('Unmarried')
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
                                    padding: const EdgeInsets.only(left: 40,right: 70,top: 0,bottom: 30),
                                    child: TextField(
                                            
                                            controller: dobController,
                                             decoration: InputDecoration(
                                              hintText: 'Wedding Date',
                                              suffixIcon: IconButton(onPressed: (){
                                                // _selectDate2(context);
                                              }, 
                                              icon: Icon(Icons.edit),),
                                              fillColor: Color(0xffF9F8FD),
                                              border: OutlineInputBorder(
                                              )
                                              )
                                          ),
                                    
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 70,right: 50,
                                    top: 0,bottom: 30),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          
                                               TextField( 
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        hintText: 'Spouse Name',
                                        suffixIcon: Icon(Icons.edit),
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder(
                                 
                                        )
                                      ),
                                                               
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
                                    padding: const EdgeInsets.only(left: 40,right: 70,top: 0,bottom: 30),
                                    child: TextField(
                                            
                                            controller: dobController,
                                             decoration: InputDecoration(
                                              hintText: 'Date of Birth',
                                              suffixIcon: IconButton(onPressed: (){
                                                 _selectDate2(context);
                                              }, 
                                              icon: Icon(Icons.edit),),
                                              fillColor: Color(0xffF9F8FD),
                                              border: OutlineInputBorder(
                                              )
                                              )
                                          ),
                                    
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 70,right: 50,
                                    top: 0,bottom: 30),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          
                                               TextField( 
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        hintText: 'No.Of.Children',
                                        suffixIcon: Icon(Icons.edit),
                                        fillColor: Color(0xffF9F8FD),
                                        border: OutlineInputBorder(
                                 
                                        )
                                      ),
                                                               
                                    ),      

                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                             ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 40),
                                 child: Row(
                                   children: [
                                     Container(
                                            height: 49,
                                            width: MediaQuery.of(context).size.width*0.34,
                                            decoration: BoxDecoration(
                                              color: kwhite,
                                            border: Border.all(
                                              color: kgrey
                                            )
                                            ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 5,left: 10 ),
                                                    child: Row(
                                                                                       
                                                      children: [
                                                        Text('18 Yrs'),
                                                        Checkbox(value: _value3, 
                                                        onChanged: (value){
                                                           setState(() {
                                                               _value3=value!;
                                                           });
                                                        }),
                                                        Text('Above'),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 40),
                                                          child: Checkbox(value: _value4, 
                                                          onChanged: (value){
                                                            setState(() {
                                                              _value4=value!;
                                                            });
                                                          }),
                                                        ),
                                                        Text('Blow')
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            
                                          ),
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left:40,top:40),
                                 child: Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: korange,
                                        minimumSize: Size(MediaQuery.of(context).size.width*0.35, 45)
                                      ),
                                      onPressed: (){}, 
                                    child: Text('Update'))
                                  ],
                                 ),
                               ),
                                        
                            ],
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
                                    profileController.profileindex(1);
                                    profileController.update();
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
                                    profileController.profileindex(2);
                                    profileController.update();
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
                          
                       if(profileController.profileindex.value==1)
                       
                                Container(
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                       Expanded(
                                         child: Padding(
                                           padding: const EdgeInsets.only(),
                                           child: Padding(
                                             padding: const EdgeInsets.only(left: 50,right:50,top:50),
                                             child: TextField( 
                                               controller: officedoornoController,
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
                                       ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:50,right:50,top:50),
                                    child: TextField( 
                                          controller: officebnameController,
                                          decoration: InputDecoration(
                                            hintText: 'Building Number',
                                            suffixIcon: Icon(Icons.edit),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder(
                                     
                                            )
                                          ),
                                                                   
                                        ),
                                  ),
                                ),
                                    ],),
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                       Expanded(
                                         child: Padding(
                                           padding: const EdgeInsets.only(),
                                           child: Padding(
                                             padding: const EdgeInsets.only(left: 50,right:50,top:50),
                                             child: TextField( 
                                               controller: officeaddresController,
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
                                       ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:50,right:50,top:50),
                                    child: TextField( 
                                          controller: officecityController,
                                          decoration: InputDecoration(
                                            hintText: 'City',
                                            suffixIcon: Icon(Icons.edit),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder(
                                     
                                            )
                                          ),
                                                                   
                                        ),
                                  ),
                                ),
                                    ],),
                                      Padding(
                                        padding: const EdgeInsets.only(left:50,top:50),
                                        child: Column(
                                          
                                          children: [
                                            Container(
                                              width:MediaQuery.of(context).size.width*0.35,
                                              child: TextField( 
                                                    controller: officestateController,
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
                                   Padding(
                                 padding: const EdgeInsets.only(left:50,top:50),
                                 child: Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: korange,
                                        minimumSize: Size(MediaQuery.of(context).size.width*0.36, 45)
                                      ),
                                      onPressed: (){}, 
                                    child: Text('Update',
                                    style: TextStyle(
                                      fontSize: 17
                                    ),))
                                  ],
                                 ),
                               ),

                                  ],
                                )
                                ),

                             if(profileController.profileindex.value==2) 
                             Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                       Expanded(
                                         child: Padding(
                                           padding: const EdgeInsets.only(),
                                           child: Padding(
                                             padding: const EdgeInsets.only(left: 50,right:50,top:50),
                                             child: TextField( 
                                               controller: residoornumberController,
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
                                       ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:50,right:50,top:50),
                                    child: TextField( 
                                          controller: resibnameController,
                                          decoration: InputDecoration(
                                            hintText: 'Building Number',
                                            suffixIcon: Icon(Icons.edit),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder(
                                     
                                            )
                                          ),
                                                                   
                                        ),
                                  ),
                                ),
                                    ],),
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                       Expanded(
                                         child: Padding(
                                           padding: const EdgeInsets.only(),
                                           child: Padding(
                                             padding: const EdgeInsets.only(left: 50,right:50,top:50),
                                             child: TextField( 
                                               controller: resiaddressController,
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
                                       ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:50,right:50,top:50),
                                    child: TextField( 
                                          controller: resibcityController,
                                          decoration: InputDecoration(
                                            hintText: 'City',
                                            suffixIcon: Icon(Icons.edit),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder(
                                     
                                            )
                                          ),
                                                                   
                                        ),
                                  ),
                                ),
                                    ],),
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                       Expanded(
                                         child: Padding(
                                           padding: const EdgeInsets.only(),
                                           child: Padding(
                                             padding: const EdgeInsets.only(left: 50,right:50,top:50),
                                             child: TextField( 
                                               controller: resistateController,
                                               decoration: InputDecoration(
                                                 hintText: 'State',
                                                 suffixIcon: Icon(Icons.edit),
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
                                    padding: const EdgeInsets.only(left:50,right:50,top:50),
                                    child: TextField( 
                                          controller: resiperidController,
                                          decoration: InputDecoration(
                                            hintText: 'Personal Id',
                                            suffixIcon: Icon(Icons.upload),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder(
                                     
                                            )
                                          ),
                                                                   
                                        ),
                                  ),
                                ),
                                    ],),
                                     Padding(
                                        padding: const EdgeInsets.only(left:50,top:50),
                                        child: Column(
                                          
                                          children: [
                                            Container(
                                              width:MediaQuery.of(context).size.width*0.35,
                                              child: TextField( 
                                                    controller: resiadaridController,
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
                                      Padding(
                                 padding: const EdgeInsets.only(left:50,top:50),
                                 child: Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: korange,
                                        minimumSize: Size(MediaQuery.of(context).size.width*0.36, 45)
                                      ),
                                      onPressed: (){}, 
                                    child: Text('Update',
                                    style: TextStyle(
                                      fontSize: 17
                                    ),))
                                  ],
                                 ),
                               ),
                                ],
                              ),
                             )  
                       
                      ],
                     ),
                   ),
                 ),
                 
                     if(reghomeController.proindex.value==1)
                       Padding(
                         padding: const EdgeInsets.only(top: 50),
                         child: Container(
                           width: MediaQuery.of(context).size.width-195,
                           child: Column(
                            children: [
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100),
                                    child: Text('Hello, Benze',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: kblue,
                                      fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                 Padding(
                                   padding: const EdgeInsets.only(right: 100),
                                   child: Image.asset('assets/images/profileimage.png',
                                   height: 75,fit: BoxFit.fitHeight,),
                                 ),
                                ],
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 100),
                                 child: Row(
                                   children: [
                                     Text('View Profile',
                                     style:TextStyle(color: kblue) ,),
                                   ],
                                 ),
                               ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 1,
                                      width: 80,
                                      color: kgrey,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100,top: 30),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width*0.68,
                                      decoration: BoxDecoration(
                                        color: kwhite,
                                        border: Border.all(
                                          color: kblue
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                         boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        offset: Offset(0.0, 0.75),
                                                        blurRadius: 5,
                                                        color: kgrey
                                                      )
                                                    ]
                                      ),
                                      child: Row(
                                        children: [
                                         Padding(
                                           padding: const EdgeInsets.only(left: 30),
                                           child: Text('Wallet Amount',
                                           style: TextStyle(
                                            fontSize: 17,
                                            color: kblue
                                           ),),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 580),
                                           child: Text('₹ 1.00',textAlign: TextAlign.end,
                                           style: TextStyle(
                                            fontSize: 17,
                                            color: kblue,
                                           ),),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 13),
                                           child: CircleAvatar(
                                            radius: 15,
                                            backgroundColor: kblue,
                                            child: Icon(Icons.chevron_right,color: kwhite,),
                                           ),
                                         )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100,top: 45),
                                    child: Text('Your Coupons',
                                    style: TextStyle(
                                      fontSize:22,
                                      color: kblue
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 110,top: 45),
                                    child: Text('View',style: TextStyle(
                                      fontSize: 22,
                                      color: kyellow
                                    ),),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100,top:35),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 140,
                                      width: MediaQuery.of(context).size.width*0.68,
                                      decoration: BoxDecoration(
                                        color: kwhite,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: kgrey,
                                            blurRadius: 5,
                                            offset: Offset(0.0,0.75)
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 40,top: 25),
                                                child: Container(
                                                  height:70,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: kwhite,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: kblue)
                                                  ),
                                                      child: Center(child: Text('0',
                                                       style: TextStyle(
                                                        fontSize: 22
                                                      ),textAlign: TextAlign.center,)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top:25),
                                                child: Container(
                                                  height:70,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: kwhite,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: kblue)
                                                  ),
                                                      child: Center(child: Text('0',
                                                       style: TextStyle(
                                                        fontSize: 22
                                                      ),textAlign: TextAlign.center,)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 60,top:25),
                                                child: Container(
                                                  height:70,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: kwhite,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: kblue)
                                                  ),
                                                  child: Center(child: Text('0',
                                                   style: TextStyle(
                                                        fontSize: 22
                                                      ),textAlign: TextAlign.center,)),
                                                ),
                                              ),
                                              
                                            ],

                                          ),
                                         
                                          Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 60,top:5),
                                                    child: Text('Total',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: kblue
                                                    ),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:5),
                                                    child: Text('Used',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: kblue
                                                    ),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 60,
                                                    top:5),
                                                    child: Text('Pending',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: kblue
                                                    ),),
                                                  )
                                                ],
                                              )
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                                 Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100,top: 45),
                                    child: Text('Your Referrals',
                                    style: TextStyle(
                                      fontSize:22,
                                      color: kblue
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 110,top: 45),
                                    child: Text('Invite',style: TextStyle(
                                      fontSize: 22,
                                      color: kyellow
                                    ),),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100,top:35),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 140,
                                      width: MediaQuery.of(context).size.width*0.68,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                        color: kwhite,
                                         boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        offset: Offset(0.0, 0.75),
                                                        blurRadius: 5,
                                                        color: kgrey
                                                      )
                                                    ]
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 40,top: 25),
                                                child: Container(
                                                  height:70,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: kwhite,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: kblue)
                                                  ),
                                                      child: Center(child: Text('0',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 22
                                                      ),)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top:25),
                                                child: Container(
                                                  height:70,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: kwhite,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: kblue),
                                                   
                                                  ),
                                                      child: Center(child: Text('0',
                                                      style: TextStyle(
                                                        fontSize: 22
                                                      ),textAlign: TextAlign.center,)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 60,top:25),
                                                child: Container(
                                                  height:70,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: kwhite,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: kblue)
                                                  ),
                                                  child: Center(child: Text('0',
                                                   style: TextStyle(
                                                        fontSize: 22
                                                      ),textAlign: TextAlign.center,)),
                                                ),
                                              ),
                                              
                                            ],

                                          ),
                                         
                                          Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 60,top:5),
                                                    child: Text('Total',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: kblue
                                                    ),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:5),
                                                    child: Text('Used',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: kblue
                                                    ),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 60,
                                                    top:5),
                                                    child: Text('Pending',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: kblue
                                                    ),),
                                                  )
                                                ],
                                              )
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                         
                            ],
                           ),
                         ),
                       ),
                           if(reghomeController.proindex.value==2)
                             Padding(
                               padding: const EdgeInsets.only(top:50),
                               child: Container(
                                   width: MediaQuery.of(context).size.width-195,
                                child: Column(
                                  children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 40),
                                        child: Row(
                                          children: [
                                            Text('Member Offer',textAlign: TextAlign.start,
                                            style:TextStyle(fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: kblue)),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 50,top:30),
                                            child: Container(
                                              height: 130,
                                              width: MediaQuery.of(context).size.width*0.3,
                                              decoration: BoxDecoration(
                                                color: Color(0xff594A99),
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Text('Best Deals \nof Today',
                                                    style: TextStyle(
                                                      height: 1.7,
                                                      fontSize: 19,
                                                      color: kwhite
                                                    ),),
                                                  ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(right:15),
                                                     child: Image.asset('assets/images/offersimage.png',fit:BoxFit.fitHeight,
                                                     height: 110,),
                                                   )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right:120,top:30),
                                            child: Container(
                                              height: 130,
                                              width: MediaQuery.of(context).size.width*0.3,
                                              decoration: BoxDecoration(
                                                color:kyellow,
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                   Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Text('Best Deals \nof Today',
                                                    style: TextStyle(
                                                      height: 1.7,
                                                      fontSize: 19,
                                                      color: kwhite
                                                    ),),
                                                  ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(right:15),
                                                     child: Image.asset('assets/images/offersimage.png',fit:BoxFit.fitHeight,
                                                     height: 110,),
                                                   )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                         Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 50,top:30),
                                            child: Container(
                                              height: 130,
                                              width: MediaQuery.of(context).size.width*0.3,
                                              decoration: BoxDecoration(
                                                color:Color(0xff0A7A0D),
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                   Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Text('Best Deals \nof Today',
                                                    style: TextStyle(
                                                      height: 1.7,
                                                      fontSize: 19,
                                                      color: kwhite
                                                    ),),
                                                  ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(right:15),
                                                     child: Image.asset('assets/images/offersimage.png',fit:BoxFit.fitHeight,
                                                     height: 110,),
                                                   )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right:120,top:30),
                                            child: Container(
                                              height: 130,
                                              width: MediaQuery.of(context).size.width*0.3,
                                              decoration: BoxDecoration(
                                                color:kblue,
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                   Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Text('Best Deals \nof Today',
                                                    style: TextStyle(
                                                      height: 1.7,
                                                      fontSize: 19,
                                                      color: kwhite
                                                    ),),
                                                  ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(right:15),
                                                     child: Image.asset('assets/images/offersimage.png',fit:BoxFit.fitHeight,
                                                     height: 110,),
                                                   )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                  ],
                                ),
                               ),
                             ),
                               if(reghomeController.proindex.value==3)
                               Container(
                                 width: MediaQuery.of(context).size.width-195,
                                 child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 45,
                                          width: MediaQuery.of(context).size.width-195,
                                          decoration: BoxDecoration(
                                            color: kblue
                                          ),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                  setState(() {
                                                      regshowController.showindex(0);
                                                      offersindex=0;
                                                      regshowController.update();
                                                      });
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: Container(
                                                    height: 30,
                                                     width:150,
                                                    decoration: BoxDecoration(
                                                       color: offersindex==0?kyellow:kblue,
                                                       borderRadius: BorderRadius.circular(5),
                                                         border: offersindex==0?Border.all(
                                                          color: kwhite
                                                         ):null                                     
                                                         ),
                                                         child: Center(child: Text('Other Coupons',
                                                         style: TextStyle(
                                                           color: offersindex==0?kwhite:kwhite,
                                                         ),)),
                                                  ),
                                                ),
                                              ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:30),
                                                  child: InkWell(
                                                    onTap: (){
                                                      setState(() {
                                                      regshowController.showindex(1);
                                                      offersindex=1;
                                                      regshowController.update();
                                                      });
                                                    },
                                                    child: Container(
                                                    height: 30,
                                                     width:150,
                                                    decoration: BoxDecoration(
                                                         borderRadius: BorderRadius.circular(5),
                                                         border: offersindex==1?Border.all(
                                                          color: kwhite
                                                         ):null,
                                                       color: offersindex==1?kyellow:kblue,
                                                       
                                                         ),
                                                         child: Center(child: Text('Vendor Coupons',
                                                         style: TextStyle(
                                                           color: offersindex==1?kwhite:kwhite,
                                                         ),)),
                                                     ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    if(regshowController.showindex.value==1)
                                     Padding(
                                      padding: const EdgeInsets.only(left:20,top:30,right:30),
                                      child: Container(
                                          width: MediaQuery.of(context).size.width-195,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                  
                                                    width: 180,
                                                    child: Column(
                                                      children:[ 
                                                       Padding(
                                                         padding: const EdgeInsets.only(bottom: 5),
                                                         child: Image.asset('assets/images/vendorimage1.png',height: 84,
                                                          width: 170,
                                                                                                             fit: BoxFit.cover,),
                                                       ),

                                                      Row(
                                                        children: [
                                                          Text('Lorem Ipsum',
                                                          style: TextStyle(
                                                            color: kblue,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 16
                                                          ),),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 5),
                                                        child: Row(
                                                          children: [
                                                            Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                            style: TextStyle(
                                                              height: 1.5,
                                                              fontSize: 12
                                                            ),)
                                                          ],
                                                        ),
                                                      ),
                                                      ksizedbox20,
                                                      Row(
                                                        children: [
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor: kOrange
                                                            ),
                                                            onPressed: (){},
                                                           child: Text('BASISJWSW')),
                                                        ],
                                                      )
                                                      ]
                                                    ),
                                                    
                                                  ),
                                                   Container(
                                                  
                                                    width: 180,
                                                    child: Column(
                                                      children:[ 
                                                        Image.asset('assets/images/vendorimage2.png',
                                                      fit: BoxFit.cover,),

                                                      Row(
                                                        children: [
                                                          Text('Lorem Ipsum',
                                                          style: TextStyle(
                                                            color: kblue,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 16
                                                          ),),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 5),
                                                        child: Row(
                                                          children: [
                                                            Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                            style: TextStyle(
                                                              height: 1.5,
                                                              fontSize: 12
                                                            ),)
                                                          ],
                                                        ),
                                                      ),
                                                      ksizedbox20,
                                                      Row(
                                                        children: [
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor: kOrange
                                                            ),
                                                            onPressed: (){},
                                                           child: Text('BASISJWSW')),
                                                        ],
                                                      )
                                                      ]
                                                    ),
                                                    
                                                  ),
                                                   Container(
                                                  
                                                    width: 180,
                                                    child: Column(
                                                      children:[ 
                                                        Padding(
                                                          padding: const EdgeInsets.only(bottom: 5),
                                                          child: Image.asset('assets/images/vendorimage1.png',height: 84,
                                                          width: 170,
                                                                                                              fit: BoxFit.cover,),
                                                        ),

                                                      Row(
                                                        children: [
                                                          Text('Lorem Ipsum',
                                                          style: TextStyle(
                                                            color: kblue,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 16
                                                          ),),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 5),
                                                        child: Row(
                                                          children: [
                                                            Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                            style: TextStyle(
                                                              height: 1.5,
                                                              fontSize: 12
                                                            ),)
                                                          ],
                                                        ),
                                                      ),
                                                      ksizedbox20,
                                                      Row(
                                                        children: [
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor: kOrange
                                                            ),
                                                            onPressed: (){},
                                                           child: Text('BASISJWSW')),
                                                        ],
                                                      )
                                                      ]
                                                    ),
                                                    
                                                  ),
                                                   Container(
                                                  
                                                    width: 180,
                                                    child: Column(
                                                      children:[ 
                                                        Image.asset('assets/images/vendorimage2.png',
                                                      fit: BoxFit.cover,),

                                                      Row(
                                                        children: [
                                                          Text('Lorem Ipsum',
                                                          style: TextStyle(
                                                            color: kblue,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 16
                                                          ),),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 5),
                                                        child: Row(
                                                          children: [
                                                            Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                            style: TextStyle(
                                                              height: 1.5,
                                                              fontSize: 12
                                                            ),)
                                                          ],
                                                        ),
                                                      ),
                                                      ksizedbox20,
                                                      Row(
                                                        children: [
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor: kOrange
                                                            ),
                                                            onPressed: (){},
                                                           child: Text('BASISJWSW')),
                                                        ],
                                                      )
                                                      ]
                                                    ),
                                                    
                                                  )
                                                ],
                                              ),
                                      
                                              Padding(
                                                padding: const EdgeInsets.only(top:50),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Container(
                                                    
                                                      width: 180,
                                                      child: Column(
                                                        children:[ 
                                                         Padding(
                                                           padding: const EdgeInsets.only(bottom: 5,right:10 ),
                                                           child: Image.asset('assets/images/vendorimage3.png',height: 84,
                                                            width: 170,
                                                                                                               fit: BoxFit.cover,),
                                                         ),
                                              
                                                        Row(
                                                          children: [
                                                            Text('Lorem Ipsum',
                                                            style: TextStyle(
                                                              color: kblue,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16
                                                            ),),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 5),
                                                          child: Row(
                                                            children: [
                                                              Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                              style: TextStyle(
                                                                height: 1.5,
                                                                fontSize: 12
                                                              ),)
                                                            ],
                                                          ),
                                                        ),
                                                        ksizedbox20,
                                                        Row(
                                                          children: [
                                                            ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: kOrange
                                                              ),
                                                              onPressed: (){},
                                                             child: Text('BASISJWSW')),
                                                          ],
                                                        )
                                                        ]
                                                      ),
                                                      
                                                    ),
                                                     Container(
                                                    
                                                      width: 180,
                                                      child: Column(
                                                        children:[ 
                                                          Image.asset('assets/images/vendorimage4.png',
                                                        fit: BoxFit.cover,),
                                              
                                                        Row(
                                                          children: [
                                                            Text('Lorem Ipsum',
                                                            style: TextStyle(
                                                              color: kblue,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16
                                                            ),),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 5),
                                                          child: Row(
                                                            children: [
                                                              Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                              style: TextStyle(
                                                                height: 1.5,
                                                                fontSize: 12
                                                              ),)
                                                            ],
                                                          ),
                                                        ),
                                                        ksizedbox20,
                                                        Row(
                                                          children: [
                                                            ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: kOrange
                                                              ),
                                                              onPressed: (){},
                                                             child: Text('BASISJWSW')),
                                                          ],
                                                        )
                                                        ]
                                                      ),
                                                      
                                                    ),
                                                     Container(
                                                    
                                                      width: 180,
                                                      child: Column(
                                                        children:[ 
                                                          Padding(
                                                            padding: const EdgeInsets.only(bottom: 5),
                                                            child: Image.asset('assets/images/vendorimage3.png',height: 84,
                                                            width: 170,
                                                                                                                fit: BoxFit.cover,),
                                                          ),
                                              
                                                        Row(
                                                          children: [
                                                            Text('Lorem Ipsum',
                                                            style: TextStyle(
                                                              color: kblue,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16
                                                            ),),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 5),
                                                          child: Row(
                                                            children: [
                                                              Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                              style: TextStyle(
                                                                height: 1.5,
                                                                fontSize: 12
                                                              ),)
                                                            ],
                                                          ),
                                                        ),
                                                        ksizedbox20,
                                                        Row(
                                                          children: [
                                                            ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: kOrange
                                                              ),
                                                              onPressed: (){},
                                                             child: Text('BASISJWSW')),
                                                          ],
                                                        )
                                                        ]
                                                      ),
                                                      
                                                    ),
                                                     Container(
                                                    
                                                      width: 180,
                                                      child: Column(
                                                        children:[ 
                                                          Image.asset('assets/images/vendorimage4.png',
                                                        fit: BoxFit.cover,),
                                              
                                                        Row(
                                                          children: [
                                                            Text('Lorem Ipsum',
                                                            style: TextStyle(
                                                              color: kblue,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16
                                                            ),),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 5),
                                                          child: Row(
                                                            children: [
                                                              Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                              style: TextStyle(
                                                                height: 1.5,
                                                                fontSize: 12
                                                              ),)
                                                            ],
                                                          ),
                                                        ),
                                                        ksizedbox20,
                                                        Row(
                                                          children: [
                                                            ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: kOrange
                                                              ),
                                                              onPressed: (){},
                                                             child: Text('BASISJWSW')),
                                                          ],
                                                        )
                                                        ]
                                                      ),
                                                      
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                      ),
                                    ),
                                   if(regshowController.showindex.value==0)
                                    Padding(
                                      padding: const EdgeInsets.only(left:20,top:30,right:30),
                                      child: Container(
                                          width: MediaQuery.of(context).size.width-195,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                  
                                                    width: 180,
                                                    child: Column(
                                                      children:[ 
                                                       Padding(
                                                         padding: const EdgeInsets.only(bottom: 5),
                                                         child: Image.asset('assets/images/offersimage.png',height: 84,
                                                          width: 170,
                                                                                                             fit: BoxFit.cover,),
                                                       ),

                                                      Row(
                                                        children: [
                                                          Text('Lorem Ipsum',
                                                          style: TextStyle(
                                                            color: kblue,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 16
                                                          ),),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 5),
                                                        child: Row(
                                                          children: [
                                                            Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                            style: TextStyle(
                                                              height: 1.5,
                                                              fontSize: 12
                                                            ),)
                                                          ],
                                                        ),
                                                      ),
                                                      ksizedbox20,
                                                      Row(
                                                        children: [
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor: kOrange
                                                            ),
                                                            onPressed: (){},
                                                           child: Text('BASISJWSW')),
                                                        ],
                                                      )
                                                      ]
                                                    ),
                                                    
                                                  ),
                                                   Container(
                                                  
                                                    width: 180,
                                                    child: Column(
                                                      children:[ 
                                                        Image.asset('assets/images/couponsimage.png',
                                                      fit: BoxFit.cover,),

                                                      Row(
                                                        children: [
                                                          Text('Lorem Ipsum',
                                                          style: TextStyle(
                                                            color: kblue,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 16
                                                          ),),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 5),
                                                        child: Row(
                                                          children: [
                                                            Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                            style: TextStyle(
                                                              height: 1.5,
                                                              fontSize: 12
                                                            ),)
                                                          ],
                                                        ),
                                                      ),
                                                      ksizedbox20,
                                                      Row(
                                                        children: [
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor: kOrange
                                                            ),
                                                            onPressed: (){},
                                                           child: Text('BASISJWSW')),
                                                        ],
                                                      )
                                                      ]
                                                    ),
                                                    
                                                  ),
                                                   Container(
                                                  
                                                    width: 180,
                                                    child: Column(
                                                      children:[ 
                                                        Padding(
                                                          padding: const EdgeInsets.only(bottom: 5),
                                                          child: Image.asset('assets/images/offersimage.png',height: 84,
                                                          width: 170,
                                                                                                              fit: BoxFit.cover,),
                                                        ),

                                                      Row(
                                                        children: [
                                                          Text('Lorem Ipsum',
                                                          style: TextStyle(
                                                            color: kblue,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 16
                                                          ),),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 5),
                                                        child: Row(
                                                          children: [
                                                            Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                            style: TextStyle(
                                                              height: 1.5,
                                                              fontSize: 12
                                                            ),)
                                                          ],
                                                        ),
                                                      ),
                                                      ksizedbox20,
                                                      Row(
                                                        children: [
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor: kOrange
                                                            ),
                                                            onPressed: (){},
                                                           child: Text('BASISJWSW')),
                                                        ],
                                                      )
                                                      ]
                                                    ),
                                                    
                                                  ),
                                                   Container(
                                                  
                                                    width: 180,
                                                    child: Column(
                                                      children:[ 
                                                        Image.asset('assets/images/couponsimage.png',
                                                      fit: BoxFit.cover,),

                                                      Row(
                                                        children: [
                                                          Text('Lorem Ipsum',
                                                          style: TextStyle(
                                                            color: kblue,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 16
                                                          ),),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 5),
                                                        child: Row(
                                                          children: [
                                                            Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                            style: TextStyle(
                                                              height: 1.5,
                                                              fontSize: 12
                                                            ),)
                                                          ],
                                                        ),
                                                      ),
                                                      ksizedbox20,
                                                      Row(
                                                        children: [
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor: kOrange
                                                            ),
                                                            onPressed: (){},
                                                           child: Text('BASISJWSW')),
                                                        ],
                                                      )
                                                      ]
                                                    ),
                                                    
                                                  )
                                                ],
                                              ),
                                      
                                              Padding(
                                                padding: const EdgeInsets.only(top:50),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Container(
                                                    
                                                      width: 180,
                                                      child: Column(
                                                        children:[ 
                                                         Padding(
                                                           padding: const EdgeInsets.only(bottom: 5,right:10 ),
                                                           child: Image.asset('assets/images/couponsimage2.png',height: 84,
                                                            width: 170,
                                                                                                               fit: BoxFit.cover,),
                                                         ),
                                              
                                                        Row(
                                                          children: [
                                                            Text('Lorem Ipsum',
                                                            style: TextStyle(
                                                              color: kblue,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16
                                                            ),),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 5),
                                                          child: Row(
                                                            children: [
                                                              Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                              style: TextStyle(
                                                                height: 1.5,
                                                                fontSize: 12
                                                              ),)
                                                            ],
                                                          ),
                                                        ),
                                                        ksizedbox20,
                                                        Row(
                                                          children: [
                                                            ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: kOrange
                                                              ),
                                                              onPressed: (){},
                                                             child: Text('BASISJWSW')),
                                                          ],
                                                        )
                                                        ]
                                                      ),
                                                      
                                                    ),
                                                     Container(
                                                    
                                                      width: 180,
                                                      child: Column(
                                                        children:[ 
                                                          Image.asset('assets/images/couponsimage3.png',
                                                        fit: BoxFit.cover,),
                                              
                                                        Row(
                                                          children: [
                                                            Text('Lorem Ipsum',
                                                            style: TextStyle(
                                                              color: kblue,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16
                                                            ),),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 5),
                                                          child: Row(
                                                            children: [
                                                              Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                              style: TextStyle(
                                                                height: 1.5,
                                                                fontSize: 12
                                                              ),)
                                                            ],
                                                          ),
                                                        ),
                                                        ksizedbox20,
                                                        Row(
                                                          children: [
                                                            ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: kOrange
                                                              ),
                                                              onPressed: (){},
                                                             child: Text('BASISJWSW')),
                                                          ],
                                                        )
                                                        ]
                                                      ),
                                                      
                                                    ),
                                                     Container(
                                                    
                                                      width: 180,
                                                      child: Column(
                                                        children:[ 
                                                          Padding(
                                                            padding: const EdgeInsets.only(bottom: 5),
                                                            child: Image.asset('assets/images/couponsimage2.png',height: 84,
                                                            width: 170,
                                                                                                                fit: BoxFit.cover,),
                                                          ),
                                              
                                                        Row(
                                                          children: [
                                                            Text('Lorem Ipsum',
                                                            style: TextStyle(
                                                              color: kblue,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16
                                                            ),),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 5),
                                                          child: Row(
                                                            children: [
                                                              Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                              style: TextStyle(
                                                                height: 1.5,
                                                                fontSize: 12
                                                              ),)
                                                            ],
                                                          ),
                                                        ),
                                                        ksizedbox20,
                                                        Row(
                                                          children: [
                                                            ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: kOrange
                                                              ),
                                                              onPressed: (){},
                                                             child: Text('BASISJWSW')),
                                                          ],
                                                        )
                                                        ]
                                                      ),
                                                      
                                                    ),
                                                     Container(
                                                    
                                                      width: 180,
                                                      child: Column(
                                                        children:[ 
                                                          Image.asset('assets/images/couponsimage3.png',
                                                        fit: BoxFit.cover,),
                                              
                                                        Row(
                                                          children: [
                                                            Text('Lorem Ipsum',
                                                            style: TextStyle(
                                                              color: kblue,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16
                                                            ),),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 5),
                                                          child: Row(
                                                            children: [
                                                              Text('Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                              style: TextStyle(
                                                                height: 1.5,
                                                                fontSize: 12
                                                              ),)
                                                            ],
                                                          ),
                                                        ),
                                                        ksizedbox20,
                                                        Row(
                                                          children: [
                                                            ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: kOrange
                                                              ),
                                                              onPressed: (){},
                                                             child: Text('BASISJWSW')),
                                                          ],
                                                        )
                                                        ]
                                                      ),
                                                      
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                      ),
                                    ),

                                  ],
                                 ),
                               ),
                               if(reghomeController.proindex.value==4)
                               Padding(
                                 padding: const EdgeInsets.only(top:50),
                                 child: Container(
                                  width: MediaQuery.of(context).size.width-195,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:55),
                                        child: Row(
                                          children: [
                                            Text('Additional Coupons',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: kblue,
                                              fontWeight: FontWeight.bold
                                            ),)
                                          ],
                                        ),
                                      ),
                                      ksizedbox40,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/aditioffersimage1.png',
                                          height: 110,fit: BoxFit.fitHeight,),
                                            Image.asset('assets/images/aditioffersimage1.png',
                                             height: 110,fit: BoxFit.fitHeight,)
                                        ],
                                      ),
                                      ksizedbox30,
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/aditioffersimage2.png',
                                           height: 110,fit: BoxFit.fitHeight,),
                                            Image.asset('assets/images/aditioffersimage2.png',
                                             height: 110,fit: BoxFit.fitHeight,)
                                        ],
                                      )
                                    ],
                                  ),
                                 ),
                               ),
                               if(reghomeController.proindex.value==5)
                               Container(
                                   width: MediaQuery.of(context).size.width-195,
                                   child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top:50),
                                        child: Center(
                                          child: Container(
                                            height:MediaQuery.of(context).size.height*0.74,
                                            width: MediaQuery.of(context).size.width*0.29,
                                            decoration: BoxDecoration(
                                              color:kwhite,
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                  offset: Offset(0.0, 0.75),
                                                  blurRadius: 5,
                                                  color:kgrey
                                                )
                                              ]
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 7),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Image.asset('assets/images/referalimage.png',
                                                       height: 180,
                                                       fit:BoxFit.fitHeight
                                                      ),
                                                      
                                                    ],
                                                  ),
                                                 ksizedbox10,
                                                  Text('Referral Code',
                                                  style: TextStyle(
                                                    fontSize: 23,
                                                    color: kblue
                                                  ),),
                                              
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:20,right:20,top:15),
                                                    child: Container(
                                                    
                                                      decoration: BoxDecoration(
                                                        color:kwhite,
                                                       
                                                        boxShadow: <BoxShadow>[
                                                          BoxShadow(
                                                            offset: Offset(0.0,0.75),
                                                            blurRadius: 2,
                                                            color:kgrey
                                                          )
                                                        ]
                                                      ),
                                                      child: TextField(
                                                        controller:referalCOntroller,
                                                        decoration: InputDecoration(
                                                          hintText: 'ABCDEF',
                                                          hintStyle: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w600,
                                                            color: kblue
                                                          ),
                                                          suffixIcon: Icon(Icons.file_copy,
                                                          color: kblue,size:40),
                                                          border: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: kblue
                                                            )
                                                          )
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:25,left: 40),
                                                    child: Row(
                                                      children: [
                                                        Text('Referral Count :',
                                                        style:TextStyle(
                                                          fontSize:24,
                                                          color:kblue
                                                        )),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left:20 ),
                                                          child: Container(
                                                            height: 30,
                                                            width:30,
                                                            decoration:BoxDecoration(
                                                              color:kOrange,
                                                              borderRadius: BorderRadius.circular(3)
                                                            ),
                                                            child:Center(child: Text('0',
                                                            style: TextStyle(
                                                              fontSize:20,
                                                              color:kwhite
                                                            ),),)
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                            left: 20
                                                          ),
                                                          child: Container(
                                                            height: 30,
                                                            width:30,
                                                            decoration:BoxDecoration(
                                                              color:kOrange,
                                                              borderRadius: BorderRadius.circular(3)
                                                            ),
                                                            child:Center(child: Text('0',
                                                            style: TextStyle(
                                                              color: kwhite,
                                                              fontSize: 20),),)
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 8),
                                                          child: Container(
                                                            height: 30,
                                                            width:30,
                                                            decoration:BoxDecoration(
                                                              color:kOrange,
                                                              borderRadius: BorderRadius.circular(3)
                                                            ),
                                                            child:Center(child: Text('0',
                                                            style: TextStyle(
                                                              color: kwhite
                                                            ),),)
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  ksizedbox40,
                                                 Container(
                                                  height: 45,
                                                  width: MediaQuery.of(context).size.width*0.25,
                                                  decoration: BoxDecoration(
                                                    color:korange,
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        offset: Offset(0.0, 0.75),
                                                        blurRadius: 5,
                                                        color: kyellow
                                                      )
                                                    ],
                                                    borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child:Center(child: Text('Share Now',
                                                  style:TextStyle(
                                                    color:kwhite,
                                                    fontSize: 20
                                                  )))
                                                 )
                                                ]
                                              ),
                                            )),
                                        ),
                                      )
                                    ],
                                   ),
                               ),
                               if(reghomeController.proindex.value==6)
                               Padding(
                                 padding: const EdgeInsets.only(top:50),
                                 child: Container(
                                   width: MediaQuery.of(context).size.width-195,
                                   child:GridView.builder(
                                    itemCount: partnerimage.length,
                                    shrinkWrap: true,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 40,
                                      crossAxisSpacing: 50,
                                      childAspectRatio: 2
                                      ), 
                                    itemBuilder: (context,index){
                                      return Padding(
                                        padding: const EdgeInsets.only(left:70,right:70),
                                        child: Container(
                                               height: 10,
                                               width: 10,
                                               decoration: BoxDecoration(
                                            
                                               ),
                                               child:Image.asset(partnerimage[index])    
                                        ),
                                      );
                                    })
                                    
                                 ),
                               ),
                               if(reghomeController.proindex.value==7)
                               Container(),
                               if(reghomeController.proindex.value==8)
                               Padding(
                                 padding: const EdgeInsets.only(top:50),
                                 child: Container(
                                   width: MediaQuery.of(context).size.width-195,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 50),
                                            child: Container(
                                              height: 40,
                                              width: MediaQuery.of(context).size.width*0.3,
                                              decoration: BoxDecoration(
                                                color: kgrey.withOpacity(0.3),
                                                
                                              ),
                                              child: TextField(
                                                controller: subNameController,
                                                decoration: InputDecoration(
                                                  hintText: 'Your Name',
                                                  hintStyle: TextStyle(
                                                    fontSize: 14.5
                                                  ),
                                                  border: OutlineInputBorder(
                                                   borderSide: BorderSide.none
                                                    
                                                  
                                                  )
                                                ),
                                                
                                              ),
                                            ),
                                          ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 150),
                                              child: Container(
                                              height: 40,
                                              width: MediaQuery.of(context).size.width*0.3,
                                              decoration: BoxDecoration(
                                                color: kgrey.withOpacity(0.3),
                                                
                                              ),
                                              child: TextField(
                                                controller: subMobileController,
                                                decoration: InputDecoration(
                                                  hintText: 'Mobile',
                                                  hintStyle: TextStyle(
                                                    fontSize: 14.5
                                                  ),
                                                  border: OutlineInputBorder(
                                                   borderSide: BorderSide.none
                                                    
                                                  
                                                  )
                                                ),
                                                
                                              ),
                                                                                    ),
                                            ),
                                        ],
                                      ),
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 50,top:35),
                                            child: Container(
                                              height: 40,
                                              width: MediaQuery.of(context).size.width*0.69,
                                              decoration: BoxDecoration(
                                                color: kgrey.withOpacity(0.3),
                                                
                                              ),
                                              child: TextField(
                                                controller: subEmailController,
                                                decoration: InputDecoration(
                                                  hintText: 'Email',
                                                  hintStyle: TextStyle(
                                                    fontSize: 14.5
                                                  ),
                                                  border: OutlineInputBorder(
                                                   borderSide: BorderSide.none
                                                    
                                                  
                                                  )
                                                ),
                                                
                                              ),
                                            ),
                                          )
                                        ]
                                          ),
                                           Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 50,top:35),
                                            child: Container(
                                            
                                              width: MediaQuery.of(context).size.width*0.69,
                                              decoration: BoxDecoration(
                                                color: kgrey.withOpacity(0.3),
                                                
                                              ),
                                              child: TextField(
                                                maxLines: 4,
                                                controller: subDescriptionController,
                                                decoration: InputDecoration(
                                                  hintText: 'Description',
                                                  hintStyle: TextStyle(
                                                    fontSize: 14.5
                                                  ),
                                                  border: OutlineInputBorder(
                                                   borderSide: BorderSide.none
                                                    
                                                  
                                                  )
                                                ),
                                                
                                              ),
                                            ),
                                          )
                                        ]
                                          ),
                                          ksizedbox30,
                                          Padding(
                                            padding: const EdgeInsets.only(left: 50),
                                            child: Row(
                                              children: [
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    minimumSize: Size(MediaQuery.of(context).size.width*0.7, 
                                                    45),
                                                    backgroundColor: kblue
                                                  ),
                                                  onPressed: (){}, 
                                                child: Text('Submit',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: kwhite
                                                ),)),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 40,left:50),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 150,
                                                  width: MediaQuery.of(context).size.width*0.7,
                                                  decoration: BoxDecoration(
                                                    color: kwhite,
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        offset: Offset(0.0,0.75),
                                                        blurRadius: 5,
                                                        color: kgrey,

                                                      )
                                                    ],
                                                    border: Border.all(
                                                      color: Colors.black.withOpacity(0.3)
                                                    )
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(
                                                              top:20,left:10
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Text('Contact Admin :',
                                                                
                                                                style: TextStyle(
                                                                  fontSize: 16
                                                                ),),
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(left: 15),
                                                                    child: Text('+91 9876543210',
                                                                    style: TextStyle(
                                                                    color: kblue,
                                                                    fontSize: 16
                                                                    ),),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        
                                                          Padding(
                                                            padding: const EdgeInsets.only(
                                                              top:20,right: 30
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                                Text('Admin Email :',
                                                                style: TextStyle(
                                                                  fontSize: 16
                                                                ),),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(
                                                                  left: 15
                                                                  ),
                                                                  child: Text("Customer@gmail.com",
                                                                  style: TextStyle(
                                                                    color: kblue,
                                                                    fontSize: 16
                                                                  ),),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      ksizedbox20,
                                                      Padding(
                                                        padding: const EdgeInsets.only(left:
                                                        10),
                                                        child: Row(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text('Head Office Address :',
                                                                style: TextStyle(
                                                                    fontSize: 16
                                                                ),),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 15),
                                                                  child: Text('No 781, Second Street, New Chennai, Tamil nadu-600021.',
                                                                  style: TextStyle(
                                                                    color: kblue,
                                                                    fontSize: 16
                                                                  ),),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                    ],
                                  ),
                                 ),
                               ),


                              
                              
                    ]
                   ),
                  
                  
                   
                RegisterCommonBottom()
                
          ]
        ),
      ),
    );
  }
}