import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constant/constans.dart';
import '../../../../controller/profile_show_controller.dart';
import '../../../../controller/reg_profile_controller.dart';
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
  @override
  Widget build(BuildContext context) {
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
                                        padding: const EdgeInsets.only(left: 10,right:20,top:30),
                                        child: Container(
                                          height: 31,
                                          child: TextField( 
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
                                                      Checkbox(value: _value, 
                                                      onChanged: (value){
                                                         setState(() {
                                                             _value=value!;
                                                         });
                                                      }),
                                                      Text('Married',
                                                      style: TextStyle(
                                                        fontSize: 12
                                                      ),),
                                                      Padding(
                                                        padding: const EdgeInsets.only(),
                                                        child: Checkbox(value: _value2, 
                                                        onChanged: (value){
                                                          setState(() {
                                                            _value2=value!;
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
                                   Padding(
                                     padding: const EdgeInsets.only(left: 10,top: 30),
                                     child: Row(
                                       children: [
                                         Container(
                                                height: 35,
                                                width: MediaQuery.of(context).size.width*0.42,
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
                                                        padding: const EdgeInsets.only( ),
                                                        child: Row(
                                                                                           
                                                          children: [
                                                            Text('18 Yrs',
                                                            style: TextStyle(
                                                              fontSize: 12
                                                            ),),
                                                            Padding(
                                                              padding: const EdgeInsets.only(),
                                                              child: Checkbox(value: _value3, 
                                                              onChanged: (value){
                                                                 setState(() {
                                                                     _value3=value!;
                                                                 });
                                                              }),
                                                            ),
                                                            Text('Above',
                                                            style: TextStyle(
                                                              fontSize: 12
                                                            ),),
                                                            Padding(
                                                              padding: const EdgeInsets.only(),
                                                              child: Checkbox(value: _value4, 
                                                              onChanged: (value){
                                                                setState(() {
                                                                  _value4=value!;
                                                                });
                                                              }),
                                                            ),
                                                            Text('Blove',style: TextStyle(
                                                              fontSize: 12
                                                            ),)
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
                                 padding: const EdgeInsets.only(top:30,left: 20),
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: korange,
                                        minimumSize: Size(MediaQuery.of(context).size.width*0.9, 45)
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
                                   Padding(
                                 padding: const EdgeInsets.only(top:50),
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: korange,
                                        minimumSize: Size(MediaQuery.of(context).size.width*0.6, 45)
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
                                      Padding(
                                 padding: const EdgeInsets.only(top:50),
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: korange,
                                        minimumSize: Size(MediaQuery.of(context).size.width*0.5, 45)
                                      ),
                                      onPressed: (){}, 
                                    child: Text('Update',
                                    style: TextStyle(
                                      fontSize: 17
                                    ),))
                                  ],
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