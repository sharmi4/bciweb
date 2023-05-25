import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/business/bookins/history/views/widgets/orders.dart';
import 'package:bciweb/views/business/bookins/history/views/widgets/widgetsdemo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../controller/historycontroller.dart';
import '../../../../../controller/reg_home_controller.dart';
import '../../../../../registerhomescreen/common_reg_appbar';
import '../../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../../registerhomescreen/common_reg_homescreen.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final historyController = Get.find<BookingHistoryController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: RegisterCommonAppbar(),
          preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterCommonContainer(),
            Stack(
              children: [
                Container(
                    width: size.width,
                    child: Image.asset('assets/images/Group 39754.png')),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                historyController.hisindex(0);
                                historyController.update();
                              },
                              child: Container(
                                child: Center(
                                    child: Text(
                                  'Flights',
                                  style: TextStyle(
                                      color: kwhite
                                      //  historyController.reindex == 0
                                      //     ? kOrange
                                      //     : kblue,
                                      ,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700),
                                )),
                                decoration: BoxDecoration(
                                    color:  historyController.hisindex == 0
                                           ? kyellow
                                           : kgrey,
                                    borderRadius: BorderRadius.circular(15)),
                                height: 100,
                                width: 200,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                historyController.hisindex(1);
                                historyController.update();
                              },
                              child: Container(
                                child: Center(
                                    child: Text(
                                  'Hotels',
                                  style: TextStyle(
                                      color: kwhite,
                                      
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700),
                                )),
                                decoration: BoxDecoration(
                                          color:  historyController.hisindex == 1
                                           ? kyellow
                                           : kgrey,
                                    borderRadius: BorderRadius.circular(15)),
                                height: 100,
                                width: 200,
                              ),
                            ),
                            InkWell(onTap: (){ historyController.hisindex(2);
                                historyController.update();},
                              child: Container(
                                child: Center(
                                    child: Text(
                                  'Holiday\nPackages',
                                  style: TextStyle(
                                      color: kwhite,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700),
                                )),
                                decoration: BoxDecoration(
                                    color:   historyController.hisindex == 2
                                           ? kyellow
                                           : kgrey,
                                    borderRadius: BorderRadius.circular(15)),
                                height: 100,
                                width: 200,
                              ),
                            ),
                            InkWell(onTap: (){ historyController.hisindex(3);
                                historyController.update();},
                              child: Container(
                                child: Center(
                                    child: Text(
                                  'Liquor',
                                  style: TextStyle(
                                      color:  kwhite,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700),
                                )),
                                decoration: BoxDecoration(
                                    color:  historyController.hisindex == 3
                                           ? kyellow
                                           : kgrey,
                                    borderRadius: BorderRadius.circular(15)),
                                height: 100,
                                width: 200,
                              ),
                            ),
                          ],
                        ),
                      ),
                      height: 140,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: kwhite,
                          borderRadius: BorderRadius.circular(13)),
                    ),
                  ),
                )
              ],
            ),
            ksizedbox30,Obx(()=> Column(children: [if (historyController.hisindex.value == 0)
                        index1(),
                      if (historyController.hisindex.value == 1)
                        index2(),
                      if (historyController.hisindex.value == 2)
                      index3(),
                      if (historyController.hisindex.value == 3)
                         bottle_container(),],)),
           
            ksizedbox30,
           
            ksizedbox30,
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}

class bottle_container extends StatelessWidget {
  const bottle_container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Orders(
              bottleimg: 'assets/images/Group 5831.png',
            ),
            Orders(
              bottleimg: 'assets/images/Group 5831.png',
            ),
          ],
        ),
        ksizedbox30,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Orders(
              bottleimg: 'assets/images/Group 5831.png',
            ),
            Orders(
              bottleimg: 'assets/images/Group 5831.png',
            ),
          ],
        ),
        ksizedbox30,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Orders(
              bottleimg: 'assets/images/Group 5831.png',
            ),
            Orders(
              bottleimg: 'assets/images/Group 5831.png',
            ),
          ],
        ),
      ],
    );
  }
}
