import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/controller/service_controller/home_controller.dart';
import 'package:bciweb/controller/setting_controller/setting_controller.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/drawer.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_svg_image/flutter_svg_image.dart';
import '../../../../../constant/constans.dart';
import '../../../mobile_wdgets/comomappbar.dart';

class MobileOffersScreen extends StatefulWidget {
  const MobileOffersScreen({super.key});

  @override
  State<MobileOffersScreen> createState() => _MobileOffersScreenState();
}

class _MobileOffersScreenState extends State<MobileOffersScreen> {
  final serviceController = Get.find<HomeServiceController>();
  final authcontroller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
         appBar:
          PreferredSize(child: AppBarMob(), preferredSize: Size.fromHeight(50)),
      drawer: MobileDrawer(),
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Member Offer",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff003366)),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(15),
                                topStart: Radius.circular(15))),
                        context: context,
                        builder: (context) {
                          return GetBuilder<HomeServiceController>(builder: (_) {
                            return Container(
                              height: 320,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            Get.back();
                                            authcontroller.filterindex(9898);
                                            serviceController.gettodayoffersList();
                                            authcontroller.getCategoryList();
                                          },
                                          child: Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border:
                                                    Border.all(color: kOrange)),
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(
                                                "Select All",
                                                style: primaryFont.copyWith(
                                                    color: kOrange),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 250,
                                    child: ListView.builder(
                                        itemCount:
                                            authcontroller.categoryList.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 30, left: 0, right: 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        authcontroller
                                                            .filterindex(index);
                                                        authcontroller.getoffersfilterCategory(
                                                            categoryid:
                                                                authcontroller
                                                                    .categoryList[
                                                                        index]
                                                                    .id
                                                                    .toString());
                                                        authcontroller.update();
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                          width: 200,
                                                          child: Text(
                                                            authcontroller
                                                                .categoryList[
                                                                    index]
                                                                .title,
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )),
                                                    ),
                                                    Container(
                                                        width: 100,
                                                        child: authcontroller
                                                                    .filterindex
                                                                    .value ==
                                                                index
                                                            ? Container(
                                                                height: 30,
                                                                width: 30,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color:
                                                                        kOrange),
                                                                child: Center(
                                                                  child:
                                                                      Container(
                                                                    height: 15,
                                                                    width: 15,
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color:
                                                                            kwhite),
                                                                  ),
                                                                ),
                                                              )
                                                            : Container(
                                                                color: kwhite,
                                                              ))
                                                  ],
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            );
                          });
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SvgPicture.asset(
                      "assets/icons/filter.svg",
                      width: 25,
                      height: 25,
                      color: kblue,
                    ),
                  ),
                ),

                //     GetBuilder<AuthController>(
                //       builder: (_) {
                //         return PopupMenuButton(
                //           key: _popupMenu,
                // itemBuilder: (context) => [
                //           PopupMenuItem(
                //               child: Container(
                //                 height: 150,
                //                 child: Column(
                //                     children: const [
                //                       Text('item1'),
                //                     Text('item2'),
                //                     ]),
                //               ))
                //         ],
                // child: IconButton(
                //   onPressed: () {
                //         _popupMenu.currentState?.showButtonMenu();
                //   },
                //   icon: Icon(Icons.filter_alt),
                // ));
                //       }
                //     )
              ],
            ),
          ),
          GetBuilder<HomeServiceController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.63,
                child: serviceController.todayOfferListData.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/images/offersnotavailableimage.png'),
                            ksizedbox20,
                            Text(
                              'Member Offers Not Available',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: kblue,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: serviceController.todayOfferListData.length,
                        itemBuilder: (context, index) {
                          return serviceController.todayOfferListData.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 140,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff594A99),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    serviceController
                                                        .todayOfferListData[index]
                                                        .title,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 1.4,
                                                        color:
                                                            Color(0xffFAE7E3)),
                                                  ),
                                                  Text(
                                                    "₹${serviceController.todayOfferListData[index].discountValue} Off",
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 1.4,
                                                        color:
                                                            Color(0xffFAE7E3)),
                                                  ),
                                                  Text(
                                                    "Ends on\n${formatDate(serviceController.todayOfferListData[index].endsAt, [
                                                          dd,
                                                          "-",
                                                          mm,
                                                          "-",
                                                          yyyy
                                                        ])}",
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xffFAE7E3)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10,
                                                    right: 10,
                                                    bottom: 10),
                                                child: Container(
                                                    height: 150,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image(
                                                            image: NetworkImage(
                                                                serviceController
                                                                    .todayOfferListData[
                                                                        index]
                                                                    .image),
                                                            fit: BoxFit.fill))),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const Text('No data');
                        },
                      ),
              ),
            );
          }),
        ],
      ),
    );
  }
}