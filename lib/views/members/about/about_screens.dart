import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/members/common_widget/common_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dash/flutter_dash.dart';

import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../../registerhomescreen/common_reg_homescreen.dart';
import '../common_widget/common.dart';
import '../common_widget/commoncontainer.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(child: CommonScreen(), 
     preferredSize:Size(double.infinity, 
             40)),
      body: ListView(
        children: [RegisterCommonContainer(),
       //   CommonContainer(),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/aboutbackground.png',),
              fit: BoxFit.cover)
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text('ABOUT US',textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,color: kwhite
              ),),
            ),
          ),
          ksizedbox30,
          
          
           Stack(
            children: [
              const Image(image: AssetImage("assets/images/homebackground.png")),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Row(
                    children: [
                     const Image(
                        height: 480,
                        width: 600,
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/aboutimage.png")),
                        const SizedBox(width: 100,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Get About Us",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kblue,
                            fontSize: 46,
                            fontWeight: FontWeight.bold
                          ),),
                          const SizedBox(height: 20,),
                          Text('''"All in one membership"\ngenerally refers to a membership\nprogram that offers a wide range\nof benefits and services to its\nmembers, often from different\ncategories or areas such as\nfitness, entertainment, travel,\nshopping, and more.''',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: kblue,
                            height: 1.8,
                            fontSize: 26,
                            fontWeight: FontWeight.w400
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
           ),
           Container(
            height: 700,
            color:const Color(0xffE6E6E6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 50,),
                Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("The Perfect membership\nFor You & Your Family",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: kblue,
                            height: 2,
                            fontSize: 46,
                            fontWeight: FontWeight.bold
                          ),),
                          const SizedBox(height: 20,),
                          Text("Look into what benefits are included with\nthe membership. Does it offer discounts on\nproducts or services that you regularly use?\nDoes it provide access to exclusive events\nor experiences?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: kblue,
                            height: 1.8,
                            fontSize: 26,
                            fontWeight: FontWeight.w400
                          ),),
                        ],
                      ),
                      const Image(
                        height: 480,
                        width: 600,
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/aboutimage2.png")),
              ],
            ),
           ),
           Container(
            height: 260,
            color:const Color(0xffF9F8FD),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 80,right: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                Text("11K",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: kblue,
                                  height: 2,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold
                                ),),
                                Text("AMAZING BUSINESS",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: kblue,
                                  height: 2,
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w400
                                ),),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 40),
                            child:  Dash(
                            direction: Axis.vertical,
                            length: 130,
                            dashLength: 15,
                            dashColor: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                Text("41K",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: kblue,
                                  height: 2,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold
                                ),),
                                Text("AMAZING MEMBERS",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: kblue,
                                  height: 2,
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w400
                                ),),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 40),
                            child:  Dash(
                            direction: Axis.vertical,
                            length: 130,
                            dashLength: 15,
                            dashColor: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                Text("3K",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: kblue,
                                  height: 2,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold
                                ),),
                                Text("TOTAL SUPPORT",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: kblue,
                                  height: 2,
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w400
                                ),),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 40),
                            child:  Dash(
                            direction: Axis.vertical,
                            length: 130,
                            dashLength: 15,
                            dashColor: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                Text("77K",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: kblue,
                                  height: 2,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold
                                ),),
                                Text("TOTAL USERS",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: kblue,
                                  height: 2,
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w400
                                ),),
                              ],
                            ),
                          ),
                         
                  ],
                ),
              ),
            ),
           ),
           ksizedbox10,
            Stack(
            children: [
             Container(
              height: 450,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: kgrey.withOpacity(0.1),
              
              ),
              child: Image.asset("assets/images/homebackground.png",fit: BoxFit.cover,),
            
             ),
             Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Most Popular Business',textAlign: TextAlign.center,
                  style:TextStyle(
                    fontSize: 35,
                    color: kblue,
                    fontWeight: FontWeight.bold
                  ) ,),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,),
                    child: Container(
                      height: 10,
                      width: 70,
                      color: kOrange,
                    ),
                  ),
                  ksizedbox20,
                  Text('Special coupons are promotional discounts offered by businesses to encourage \ncustomers to make a purchase or use their services. These coupons may be available \nin various forms such as printed coupons, digital coupons, or promo codes.',
                  textAlign:TextAlign.center,style: TextStyle(
                    fontSize: 15,
                    height: 2
                  ),
                  ),
                  ksizedbox30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     Container(
                      height: 180,
                      width: 150,
                      decoration: BoxDecoration(
                          color: kwhite,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: <BoxShadow>[
                          BoxShadow(blurRadius: 5,
                          offset: Offset(0.0, 0.5),
                          color: kgrey)
                         ]
                      ),
                 
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 170,
                        
                            decoration: BoxDecoration(
                               
                              image: DecorationImage(
                                image: AssetImage('assets/images/travelimage.png',),
                                fit: BoxFit.cover)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text('TRAVEL',
                            style: TextStyle(
                              color: kblue
                            )),
                          )
                        ],
                      ),
                     ),
                      Container(
                      height: 180,
                      width: 150,
                 
                      decoration: BoxDecoration(
                                 color: kwhite,
                                 borderRadius: BorderRadius.circular(10),
                                 boxShadow: <BoxShadow>[
                          BoxShadow(blurRadius: 5,
                          offset: Offset(0.0, 0.5),
                          color: kgrey)
                         ]
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 170,
                        
                            decoration: BoxDecoration(
                                
                              image: DecorationImage(
                                image: AssetImage('assets/images/retailimage.png'),
                                fit: BoxFit.cover)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text('RETAIL',
                            style: TextStyle(
                              color: kblue
                            ),),
                          )
                        ],
                      ),
                     ),
                      Container(
                      height: 180,
                      width: 150,
                   
                      decoration: BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                          BoxShadow(blurRadius: 5,
                          offset: Offset(0.0, 0.5),
                          color: kgrey)
                         ]
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 170,
                        
                            decoration: BoxDecoration(
                              
                              image: DecorationImage(
                                image: AssetImage('assets/images/gymimage.png'),
                                fit: BoxFit.cover)
                            ),
                          ),
                                                    Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text('GYM',
                            style: TextStyle(
                              color: kblue
                            ),),
                          )
                        ],
                      ),
                     ),
                      Container(
                      height: 180,
                      width: 150,
                     
                      decoration: BoxDecoration(
                         color: kwhite,
                         borderRadius: BorderRadius.circular(10),
                         boxShadow: <BoxShadow>[
                          BoxShadow(blurRadius: 5,
                          offset: Offset(0.0, 0.5),
                          color: kgrey)
                         ]
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 170,
                        
                            decoration: BoxDecoration(
                            
                              image: DecorationImage(
                                image: AssetImage('assets/images/entertaiment.png'),
                                fit: BoxFit.cover)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text('ENTERTAIMENT',
                            style: TextStyle(
                              color: kblue
                            ),),
                          )
                        ],
                      ),
                     )
                    ],
                  )
                ],
              ),
              
              )
            ],
           ),
           
           Container(
             height: 250,
             width: MediaQuery.of(context).size.width,
             color: kwhite,
             child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text('- - - - - - - Watch Our Story - - - - - - - - -',
                  style: TextStyle(
                    fontSize: 22,
                    color: kOrange,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                ksizedbox20,
                Text('Unforgettable Subscrition Experiences \nGet Your Guide',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: kblue,
                  fontWeight: FontWeight.bold
                ),),
                ksizedbox30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kblue,
                        minimumSize: Size(200, 47)
                      ),
                      onPressed: (){}, 
                    child: Text('Contact Us',
                    style: TextStyle(
                      fontSize: 18
                    ),)),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kOrange,
                          minimumSize: Size(200, 
                          47)
                        ),
                        onPressed: (){}, 
                      child: Text('Book Now',
                      style: TextStyle(
                        fontSize: 18
                      ),)),
                    )
                  ],
                )
              ],
             ),
           ),
             RegisterCommonBottom()
        ],
      ),
    );
  }
}