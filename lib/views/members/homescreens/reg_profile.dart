import 'dart:io';

import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/reg_home_controller.dart';
import 'package:bciweb/controller/reg_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controller/profile_show_controller.dart';
import '../../../registerhomescreen/common_reg_appbar';
import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../../registerhomescreen/common_reg_homescreen.dart';
class  RegisterProfileScreen extends StatefulWidget {
  const  RegisterProfileScreen({super.key});

  @override
  State< RegisterProfileScreen> createState() => _RegisterProfileScreenState();
}

class _RegisterProfileScreenState extends State< RegisterProfileScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: RegisterCommonAppbar(), preferredSize: Size(double.infinity, 40)),
      body: Obx(()=>
       ListView(
          children:[ RegisterCommonContainer(),
                
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          Container(
            height:MediaQuery.of(context).size.height,
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
                        if(regshowController.showindex.value==0)
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
                                              hintText: 'Enetr Date Of Birth',
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
                                              hintText: 'father Name',
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
                                                        Text('Blove')
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            
                                          ),
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
 
                    ]
                   ),
                   ksizedbox40,
                RegisterCommonBottom()
                
          ]
        ),
      ),
    );
  }
}