import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../constant/constans.dart';
import '../../controller/service_controller/home_controller.dart';

class ProfileOfferceScreen extends StatefulWidget {
  const ProfileOfferceScreen({super.key});

  @override
  State<ProfileOfferceScreen> createState() => _ProfileOfferceScreenState();
}

class _ProfileOfferceScreenState extends State<ProfileOfferceScreen> {
  final seriveoffersController = Get.find<HomeServiceController>();
  @override
  Widget build(BuildContext context) {
    return    Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: MediaQuery.of(context).size.width - 195,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: [
                            Text('Member Offer',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: kblue)),
                          ],
                        ),
                      ),
                      GetBuilder<HomeServiceController>(builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 30, right: 30),
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: seriveoffersController
                                    .todayOfferListData.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 6 / 2,
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20),
                                itemBuilder: (context, index) {
                                  return seriveoffersController
                                          .todayOfferListData.isNotEmpty
                                      ? Container(
                                          height: 50,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          decoration: BoxDecoration(
                                              color: kwhite,
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    offset: Offset(0.0, 0.75),
                                                    blurRadius: 5,
                                                    color: kgrey)
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 30),
                                                      child: Container(
                                                        height: 40,
                                                        child: Text(
                                                          seriveoffersController
                                                              .todayOfferListData[
                                                                  index]
                                                              .title,
                                                          style: TextStyle(
                                                            height: 1.7,
                                                            fontSize: 19,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 0),
                                                      child: Container(
                                                        height: 40,
                                                        child: Text(
                                                          "Discount value : %${seriveoffersController.todayOfferListData[index].discountValue}",
                                                          style: TextStyle(
                                                            height: 1.7,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 0),
                                                      child: Container(
                                                        height: 40,
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'Ends on : ',
                                                              style: TextStyle(
                                                                height: 1.7,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 4),
                                                              child: Text(
                                                                formatDate(
                                                                    seriveoffersController
                                                                        .todayOfferListData[index]
                                                                        .endsAt,
                                                                    [
                                                                      dd,
                                                                      "-",
                                                                      mm,
                                                                      "-",
                                                                      yyyy
                                                                    ]),
                                                                style:
                                                                    TextStyle(
                                                                  height: 1.7,
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15),
                                                child: Image.network(
                                                  seriveoffersController
                                                      .todayOfferListData[index]
                                                      .image,
                                                  fit: BoxFit.fitHeight,
                                                  height: 110,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      : Center(
                                          child: Text('No Offers',
                                              style: TextStyle(fontSize: 18)));
                                }),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              );
  }
}