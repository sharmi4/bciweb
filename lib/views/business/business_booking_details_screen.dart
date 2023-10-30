

import 'package:bciweb/registerhomescreen/business_common_reg_bottom.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant/constans.dart';
import '../../registerhomescreen/business_comm_homecontainer.dart';
import '../../registerhomescreen/common_reg_bottom.dart';
import '../members/common_widget/business_common_screen.dart';

class BusinessBookingDetailsScreen extends StatefulWidget {
    String img;
      String tit;
      String des;
      String amt;
      String qty;
      String cusName;
      String mobile; 
      String email;
   BusinessBookingDetailsScreen({super.key,
   required this.amt,
   required this.cusName,
   required this.des,
   required this.email,
   required this.img,
   required this.mobile,
   required this.qty,
   required this.tit});

  @override
  State<BusinessBookingDetailsScreen> createState() => _BusinessBookingDetailsScreenState();
}

class _BusinessBookingDetailsScreenState extends State<BusinessBookingDetailsScreen> {
  var amountController = TextEditingController();
  var customernameController=TextEditingController();
  var emailController = TextEditingController();
  var mobileControll = TextEditingController();
  dynamic imageprofile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BusinessCommonScreen(),
              BusinessCommonhomeContainer(),
            ],
          ),
          preferredSize: const Size(double.infinity, 110)),
          body: ListView(
            children: [
              Column(
                children: [
                     Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.asset('assets/images/businessbookingimage.png',
                                  fit: BoxFit.cover,)),
                                  Container(
                                    height: 100,
                                  )
                              ],
                            ),
                            Positioned(
                              top:0,
                              left:0,
                              right:0,
                              bottom:50,
                              child: Center(
                                child: Text('BOOKING DETAILS',
                                   style: TextStyle(
                                    fontSize: 32,
                                    color: kwhite,
                                    fontWeight: FontWeight.bold
                                   ),
                                                          
                                ),
                              )),
                              
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Product Name',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  ksizedbox20,
                                  Container(
                                    height: 54,
                                    width: MediaQuery.of(context).size.width*0.25,
                                    decoration: BoxDecoration(
                                              
                                    ),
                                    child: TextField(
                                       decoration: InputDecoration(
                                        hintText: widget.tit,
                                        hintStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                        ),
                                        border: OutlineInputBorder(

                                        )
                                       ),
                                    
                                    ),
                                  ),ksizedbox40,
                                  Text('Customer Name',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  ksizedbox20,
                                   Container(
                                    height: 54,
                                    width: MediaQuery.of(context).size.width*0.25,
                                    decoration: BoxDecoration(
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: widget.cusName,
                                        hintStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                        ),
                                        border: OutlineInputBorder(

                                        )
                                      ),
                                    )
                                  ),ksizedbox40,
                                  Text('Quantity',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  ksizedbox20,
                                   Container(
                                    height: 54,
                                    width: MediaQuery.of(context).size.width*0.25,
                                    decoration: BoxDecoration(
                                    
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: widget.qty,
                                        hintStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                        ),
                                        border: OutlineInputBorder()
                                      ),
                                    )
                                  ),
                                  ksizedbox40,
                                  Text('Price',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  ksizedbox20,
                                   Container(
                                    height: 54,
                                    width: MediaQuery.of(context).size.width*0.25,
                                    decoration: BoxDecoration(
                                              
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: widget.amt,
                                        hintStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                        ),
                                        border: OutlineInputBorder()
                                      ),
                                    )
                                  ),
                                  ksizedbox40,
                                  Text('Mobile Number',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  ksizedbox20,
                                   Container(
                                    height: 54,
                                    width: MediaQuery.of(context).size.width*0.25,
                                    decoration: BoxDecoration(
                                              
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: widget.mobile,
                                        hintStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                        ),
                                        border: OutlineInputBorder()
                                      ),
                                    )
                                  ),
                                  ksizedbox40,
                                  Text('Email Address',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  ksizedbox20,
                                   Container(
                                    height: 54,
                                    width: MediaQuery.of(context).size.width*0.25,
                                    decoration: BoxDecoration(
                                              
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: widget.email,
                                        hintStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                        ),
                                        border: OutlineInputBorder()
                                      ),
                                    )
                                  ),
                        
                                
                                 
                                ],
                              ),
                               Padding(
                                 padding: const EdgeInsets.only(bottom: 0,right: 50),
                                 child: Column(
                                   children:[ ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                     child: Image.network(
                                       widget.img,
                                       fit: BoxFit.fitHeight,
                                       height: 500,
                                                      ),
                                   ),
                                   ]
                                 ),
                               ),
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 150),
                              //   child: Container(
                              //     height: 235,
                              //     width: 250,
                              //     decoration: BoxDecoration(
                              //       color: kgrey.withOpacity(0.1)
                              //     ),
                              //   ),
                              // ),
                        
                               
                            ],
                          ),
                        ),
                ],
              ),
                  ksizedbox30,
            businessRegisterCommonBottom()
            ],
          ),
    );
    
  }
}