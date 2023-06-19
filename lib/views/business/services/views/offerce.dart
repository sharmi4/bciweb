import 'dart:math';

import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/constans.dart';
//import '../../../../registerhomescreen/common_reg_appbar';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';

class OfferScreen extends StatelessWidget {
   OfferScreen({super.key});
  final authController=Get.find <AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(),
          preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterCommonContainer(),
            Container(
              child: Stack(
                children: [
                  Image.asset('assets/images/offer.png'),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'OFFERS US',
                        style:displayfont
                        // GoogleFonts.lato(
                          //  fontSize: 80,
                            //fontWeight: FontWeight.bold,
                            //color: kwhite),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ksizedbox20,
            Text(
              'All Offers Available',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff003366),
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            ksizedbox40,
               GetBuilder<AuthController>(
              builder: (_){
                
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 
                  offers_container(
                    
                    image: authController.dataList.first.image,
                    description: authController.dataList.first.description,),
                  offers_container(image: authController.dataList.first.image,
                  description: authController.dataList.first.description,),
                ],
              );
              }
            ),
            ksizedbox30,
            ksizedbox40,
               GetBuilder<AuthController>(
              builder: (_){
                
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 
                  offers_container(
                    
                    image: authController.dataList.first.image,
                    description: authController.dataList.first.description,),
                  offers_container(image: authController.dataList.first.image,
                  description: authController.dataList.first.description,),
                ],
              );
              }
            ),
            ksizedbox30,
            ksizedbox40,
              GetBuilder<AuthController>(
              builder: (_){
                
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 
                  offers_container(
                    
                    image: authController.dataList.first.image,
                    description: authController.dataList.first.description,),
                  offers_container(image: authController.dataList.first.image,
                  description: authController.dataList.first.description,),
                ],
              );
              }
            ),
            ksizedbox30,
            ksizedbox40,
            GetBuilder<AuthController>(
              builder: (_){
                
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 
                  offers_container(
                    
                    image: authController.dataList.first.image,
                    description: authController.dataList.first.description,),
                  offers_container(image: authController.dataList.first.image,
                  description: authController.dataList.first.description,),
                ],
              );
              }
            ),
            ksizedbox30,
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: kwhite,
                    ),
                    Text(
                      'BACK',
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 19,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
                height: 45,
                width: 150,
                decoration: BoxDecoration(
                    color: kOrange, borderRadius: BorderRadius.circular(15)),
              ),
            ),
            ksizedbox40,
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}

class offers_container extends StatelessWidget {
  String image;
  String description;
 offers_container({
    super.key,
    required this.description,required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(125, 158, 158, 158).withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: kwhite,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: 450,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              width: MediaQuery.of(context).size.width*0.15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(image,fit: BoxFit.cover,))),
          ),
          kwidth10,
          Column(
           
            children: [
              ksizedbox10,
              Container(
                width: 100,
                child: Text(
                
                  description,
                  maxLines: 3,
                  style: TextStyle(
                    
                    fontSize: 18,
                    
                  ),
                ),
              ),
             
              ksizedbox10,
            ],
          ),
        ],
      ),
    );
  }
}
