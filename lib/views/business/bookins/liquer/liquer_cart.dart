import 'package:bciweb/views/business/bookins/history/views/history.dart';
import 'package:bciweb/views/business/bookins/liquer/widgets/addsubstract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../constant/constans.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';

class LiquerCart extends StatefulWidget {
  const LiquerCart({super.key});

  @override
  State<LiquerCart> createState() => _LiquerCartState();
}

class _LiquerCartState extends State<LiquerCart> {
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
          // Container(
          //     height: double.infinity,
          //     width: double.infinity,
          //     child: Image.asset(
          //       'assets/images/Clip.png',
          //       fit: BoxFit.cover,
          //     )),
        
          Stack(
            children: [  Positioned(right: 0,
              child: Image.asset(
              'assets/images/23456.png',
                      ),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ksizedbox40,
                    Text(
                      'CHARDONNAY',
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    ksizedbox10,
                    Text(
                      'Barefoot Wine',
                      style: TextStyle(fontSize: 30),
                    ),
                    ksizedbox40,
                    Text(
                      'Tastes like...',
                      style: TextStyle(fontSize: 25),
                    ),
                    ksizedbox20,
                    Text(
                      'Apple, Rich, Vanilla',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    ksizedbox40,
                    Text(
                      'White Wine',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    ksizedbox40,
                    Text(
                      'Size',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    ksizedbox30,
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              '2L',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AddSubtractScreen(),
                      ],
                    ), // AddSubtractScreen(),
                    ksizedbox40,
                    // Container(
                    //   child: Center(
                    //       child: Text(
                    //     '1.5 L',
                    //     style: TextStyle(fontSize: 16),
                    //   )),
                    //   height: 35,
                    //   width: 150,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(7), color: kgrey),
                    // ),
                    //  ksizedbox30,
                    // Container(
                    //   child: Center(
                    //       child: Text(
                    //     '+        02      _',
                    //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    //   )),
                    //   height: 35,
                    //   width: 150,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(7), color: kgrey),
                    // ),
                    // ksizedbox40,
                    Text(
                      'About',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    ksizedbox40,
                    Container(
                      width: size.width * 0.5,
                      child: Text(
                        'Packing big, bold flavor with a smooth finish, Barefoot Chardonnay brings tempting flavors to every bottle, with notes of crisp, green apples and sweet peaches. Accented with hints of honey and vanilla, our medium-bodied Chardonnay pairs perfectly with fresh fruit, pasta, chicken, and salmon.',
                        style: TextStyle(fontSize: 20, color: kgrey),
                      ),
                    ),
                    ksizedbox40,
                    Text(
                      'Delivery Information',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    ksizedbox40,
                    Text(
                      'Direct selling for delivery service our order club and Bar.',
                      style: TextStyle(fontSize: 20, color: kgrey),
                    ),
                    ksizedbox40,
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {
                                  Get.to(History());
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Total - ₹ 16.80',
                                  style: TextStyle(color: kwhite, fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    'Add To Cart',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  )),
                                  height: 65,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: kwhite,
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                              ),
                            ],
                          ),
                          height: 70,
                          width: size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: kyellow),
                        ),
                      ),
                    ),
                 ksizedbox40, ],
                ),
              ),
            ],
          ),
       RegisterCommonBottom()  ],
      )),
    );
  }
}
