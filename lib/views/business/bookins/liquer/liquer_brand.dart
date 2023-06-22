import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/business/bookins/liquer/widgets/liquerwidget.dart';
import 'package:bciweb/views/members/common_widget/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import 'dart:math' as math;

import 'liquer_cart.dart';

class LiquerBrand extends StatelessWidget {
  const LiquerBrand({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterCommonContainer(),
            Stack(
              children: [
                Container(
                    color: Colors.black,
                    width: size.width,
                    child: Image.asset(
                      'assets/images/Group 39751.png',
                      opacity: const AlwaysStoppedAnimation(.5),
                    )),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(
                        child: Text('Choose Liquor :)')
                            .text
                            .semiBold
                            .white
                            .xl6
                            .make()))
              ],
            ),
            ksizedbox40,
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello Raja, Choose Your',
                  style: TextStyle(
                    fontSize: 22
                  ),),
                     
                  ksizedbox40,
                  Text('Best Liquor Brands',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kblue
                  ),),
            
                  ksizedbox30,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        hintText: 'Search Your Brands',
                        hintStyle: TextStyle(color: kgrey),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 20.0),
                      ),
                    ),
                  ),
                  ksizedbox40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          //    Get.to(wine_screen());
                        },
                        child: Container(
                          height: 150,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color: kblue,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  left: 15,
                                  child: Image.asset(
                                    'assets/images/Vector Smart Object.png',
                                    height: 130,
                                  )),
                              Positioned(
                                bottom: 15,
                                right: 5,
                                child: Transform.rotate(
                                  angle: -math.pi / 2.0,
                                  child: Text(
                                    "Beer",
                                    style: TextStyle(color: Color(0xFFD1D1D1)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //  Get.to(wine_screen());
                        },
                        child: Container(
                          height: 150,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color: kblue,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  left: 15,
                                  child: Image.asset(
                                    'assets/images/Vector Smart Object-1.png',
                                    height: 130,
                                  )),
                              Positioned(
                                bottom: 15,
                                right: 5,
                                child: Transform.rotate(
                                  angle: -math.pi / 2.0,
                                  child: Text(
                                    "Wine",
                                    style: TextStyle(color: kwhite),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //    Get.to(wine_screen());
                        },
                        child: Container(
                          height: 150,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFD1D1D1),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 15,
                                child: Image.asset(
                                  'assets/images/Vector Smart Object-2.png',
                                  height: 130,
                                ),
                              ),
                              Positioned(
                                bottom: 19,
                                right: 5,
                                child: Transform.rotate(
                                  angle: -math.pi / 2.0,
                                  child: Text(
                                    "whiskey",
                                    style: TextStyle(color: kwhite),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //    Get.to(wine_screen());
                        },
                        child: Container(
                          height: 150,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color: kblue,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 15,
                                child: Image.asset(
                                  'assets/images/Vector Smart Object.png',
                                  height: 130,
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                right: 5,
                                child: Transform.rotate(
                                  angle: -math.pi / 2.0,
                                  child: Text(
                                    "Beer",
                                    style: TextStyle(color: Color(0xFFD1D1D1)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //  Get.to(wine_screen());
                        },
                        child: Container(
                          height: 150,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color: kblue,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 15,
                                child: Image.asset(
                                  'assets/images/Vector Smart Object-1.png',
                                  height: 130,
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                right: 5,
                                child: Transform.rotate(
                                  angle: -math.pi / 2.0,
                                  child: Text(
                                    "Wine",
                                    style: TextStyle(color: kwhite),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //    Get.to(wine_screen());
                        },
                        child: Container(
                          height: 150,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFD1D1D1),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 15,
                                child: Image.asset(
                                  'assets/images/Vector Smart Object-2.png',
                                  height: 130,
                                ),
                              ),
                              Positioned(
                                bottom: 19,
                                right: 5,
                                child: Transform.rotate(
                                  angle: -math.pi / 2.0,
                                  child: Text(
                                    "whiskey",
                                    style: TextStyle(color: kwhite),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ksizedbox40,
                  Text('Popular Wine')
                      .text
                      .semiBold
                      .xl5
                      .make()
                      .objectCenterLeft(),
                  ksizedbox40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Wine_widget(
                        onTap: () {
                          Get.to(LiquerCart());
                        },
                        wineimg: 'assets/images/Layer 3442.png',
                      ),
                      Wine_widget(
                        onTap: () {
                          Get.to(LiquerCart());
                        },
                        wineimg: 'assets/images/liq.png',
                      ),
                      Wine_widget(
                        onTap: () {
                          Get.to(LiquerCart());
                        },
                        wineimg: 'assets/images/Layer 3442.png',
                      ),
                      Wine_widget(
                        onTap: () {
                          Get.to(LiquerCart());
                        },
                        wineimg: 'assets/images/Layer 3442.png',
                      ),
                      Wine_widget(
                        onTap: () {
                          Get.to(LiquerCart());
                        },
                        wineimg: 'assets/images/Layer 3442.png',
                      ),
                    ],
                  ),
                  ksizedbox40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Wine_widget(
                        onTap: () {
                          Get.to(LiquerCart());
                        },
                        wineimg: 'assets/images/Layer 3442.png',
                      ),
                      Wine_widget(
                        onTap: () {
                          Get.to(LiquerCart());
                        },
                        wineimg: 'assets/images/liq.png',
                      ),
                      Wine_widget(
                        onTap: () {
                          Get.to(LiquerCart());
                        },
                        wineimg: 'assets/images/Layer 3442.png',
                      ),
                      Wine_widget(
                        onTap: () {
                          Get.to(LiquerCart());
                        },
                        wineimg: 'assets/images/Layer 3442.png',
                      ),
                      Wine_widget(
                        onTap: () {
                          Get.to(LiquerCart());
                        },
                        wineimg: 'assets/images/Layer 3442.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}
