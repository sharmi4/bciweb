import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/views/members/responsive/mobile_wdgets/comomappbar.dart';
import 'package:bciweb/views/members/responsive/respo_services/widgets/offerccontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../constant/constans.dart';
//import '../../../../registerhomescreen/common_reg_appbar';
import '../../../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../../controller/service_controller/home_controller.dart';
import '../mobile_wdgets/drawer.dart';
import '../mobile_wdgets/mobile_common_bottom/bottom.dart';
//import '../../../members/common_widget/common.dart';

class RespOffer extends StatefulWidget {
  String image;
  String title;
  String description;
  RespOffer(
      {super.key,
      required this.description,
      required this.image,
      required this.title});

  @override
  State<RespOffer> createState() => _RespOfferState();
}

class _RespOfferState extends State<RespOffer> {

  

  final serviceController = Get.find<HomeServiceController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      drawer: MobileDrawer(),
      body: SingleChildScrollView(
        child: GetBuilder<HomeServiceController>(builder: (_) {
          return Column(
            children: [
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
                          'OFFERS',
                          style: GoogleFonts.lato(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: kwhite),
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
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              ksizedbox20,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                   height: 700,
                  child: ListView.builder(
                    itemCount: serviceController.todayofferslist.length,
                    itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                          color: kwhite,
                         boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0.0, 0.75),
                            blurRadius: 1,
                            color: kblue
                          )
                         ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            
                            children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 120,
                                width: 120,
                                child: Image.network(serviceController.todayofferslist[index].image,
                                fit: BoxFit.cover),
                              )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:40),
                            child: Column(
                              
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(serviceController.todayofferslist[index].title,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: kblue,
                                  fontWeight: FontWeight.bold
                                ),),
                                Text(serviceController.todayofferslist[index].description,
                            style: TextStyle(
                              fontSize: 16,
                          
                            ),)
                              ],
                            ),
                          ),
                          
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
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
                        size: 18,
                        color: kwhite,
                      ),
                      Text(
                        'BACK',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 15,
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
              //   RegisterCommonBottom()
              MobileCommonBottom()
            ],
          );
        }),
      ),
    );
  }
}
