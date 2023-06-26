import 'package:flutter/material.dart';

import '../../../constant/constans.dart';
class CommonBottom extends StatefulWidget {
  const CommonBottom({super.key});

  @override
  State<CommonBottom> createState() => _CommonBottomState();
}

class _CommonBottomState extends State<CommonBottom> {
  @override
  Widget build(BuildContext context) {
    return  Container(
            color: kblue,
            child: const Padding(
              padding:  EdgeInsets.only(top: 20),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Image(image: AssetImage("assets/images/logo.png",),
                       height: 70,
                       fit: BoxFit.fitHeight,),
                       SizedBox(height: 10,),
                            Text("The best memberships depend on individual\nneeds and interests. However, here are some\npopular and highly rated membership programs\nthat offer a range of benefits.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              height: 1.8,
                              fontSize: 13,
                            ),),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Image(image: AssetImage("assets/images/facebook.png")),
                                SizedBox(width: 20,),
                                Image(image: AssetImage("assets/images/twitter.png")),
                                SizedBox(width: 20,),
                                Image(image: AssetImage("assets/icons/eyeicon.png")),
                              ],
                            ),
                             SizedBox(height: 20,),
                            Text("Copyright @ benzeclub 2023",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                           Text("Sitemap",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color(0xffEF5323),
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                            ),),
                            SizedBox(height: 15,),
                             Text("Home",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400
                            ),),
                            SizedBox(height: 10,),
                            Text("About",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400
                            ),),
                            SizedBox(height: 10,),
                            Text("Services",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400
                            ),),
                            SizedBox(height: 10,),
                            Text("Booking",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400
                            ),),
                            SizedBox(height: 10,),
                            Text("Contacts",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400
                            ),),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: [
                        SizedBox(height: 0,),
                             Text("Booking",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color(0xffEF5323),
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              ),),
                              SizedBox(height: 15,),
                               Text("Fight Book",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                              ),),
                              SizedBox(height: 10,),
                              Text("Hotel Book",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                              ),),
                              SizedBox(height: 10,),
                              Text("holidays Trip Book",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                              ),),
                              SizedBox(height: 10,),
                              Text("Liquor Book",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                              ),),
                              
                      ],
                    ),
                  ),
                   Padding(
                     padding: EdgeInsets.only(bottom: 60),
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                             Text("Contact Us",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color(0xffEF5323),
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              ),),
                              SizedBox(height: 15,),
                               Row(
                                 children: [
                                   Image(
                                    height: 15,
                                    width: 15,
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/phoneimage.png")),
                                    SizedBox(width: 10,),
                                   Text("+91 8939 804 805  ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400
                              ),),
                                 ],
                               ),
                              SizedBox(height: 10,),
                              Text("+91 8939 806 807",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                              ),),
                              SizedBox(height: 10,),
                              Text("customercare@bcipvtltd.com",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                              ),),
                              
                      ],
                                     ),
                   ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            
           );
  }
}