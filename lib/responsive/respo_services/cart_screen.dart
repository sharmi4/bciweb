import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/constans.dart';
import '../../controller/service_controller/home_controller.dart';
import '../mobile_wdgets/comomappbar.dart';
import '../mobile_wdgets/drawer.dart';
import '../mobile_wdgets/mobile_common_bottom/bottom.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final servicehomeController = Get.find<HomeServiceController>();

  // final profileController = Get.find<ProfileControllers>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    servicehomeController.getCartdetails();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:
          PreferredSize(child: AppBarMob(), preferredSize: Size.fromHeight(50)),
      drawer: MobileDrawer(),
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<HomeServiceController>(builder: (_) {
              return Container(
                height: size.height * 0.6,
                child: servicehomeController.cartListData.isEmpty
                    ? const Center(
                        child: Text("No Items In Your Cart"),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: servicehomeController.cartListData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                            child: Container(
                                width: double.infinity,
                                height: 130,
                                decoration: BoxDecoration(
                                    color: kwhite,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: kgrey,
                                        blurRadius: 0.5,
                                      ),
                                    ]),
                                child:  Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.network(
                                            servicehomeController
                                                .cartListData[index].image,
                                            height: 100,
                                            width: 70,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 5,right: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              servicehomeController.cartListData[index].serviceName,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(height: 5,),
                                            Container(
                                                width: 150,
                                                child: Text(
                                                  servicehomeController.cartListData[index].description,
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                  style:const TextStyle(color: Colors.black54),
                                                )),
                                                const SizedBox(height: 5,),
                                            Text(
                                                "Qty: ${servicehomeController.cartListData[index].quantity}"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10,top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Remove Item", style: TextStyle(color: Colors.black)),
      content: Text(
        "Are you sure do you want to remove this item?",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        TextButton(
          child: Text(
            "cancel",
            style: TextStyle(color: Colors.grey),
          ),
          onPressed: () {
            Get.back();
           //Get.find<AuthController>().logout();
          },
        ),
        TextButton(
          child: Text("Remove", style: TextStyle(color: Colors.grey)),
          onPressed: () {
             servicehomeController.deleteToCart(
             serviceid: servicehomeController.cartListData[index].serviceId.toString());
            Get.back();
          },
        ),
      ],
    );
                                                    });
                                                  // homeController.deleteToCart(
                                                  //     serviceid: homeController
                                                  //         .cartListData[index]
                                                  //         .serviceId
                                                  //         .toString());
                                                },
                                                child: Row(
                                                  children: [
                                                     Icon(
                                                      CupertinoIcons.delete,
                                                      color: Colors.grey,
                                                      size: 15,
                                                    ),
                                                    SizedBox(width: 5,),
                                                    Text("Remove",style: TextStyle(color: Colors.grey),)
                                                  ],
                                                )),

                                            ksizedbox10,
                                            Text(
                                              '₹ ${double.parse(servicehomeController.cartListData[index].amount).toStringAsFixed(2)}',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: kyellow),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                                ),
                          );
                        },
                      ),
              );
            }),
            // const Divider(
            //   thickness: 1,
            // ),
            // Container(
            //  // height: 100,
            //   width: double.infinity,
            //   color: kwhite,
            //   child: Padding(
            // padding: const EdgeInsets.all(8.0),
            // child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       // ksizedbox40,
            //       Text(
            //         'Support',
            //         style:
            //             TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            //       ),
            //       ksizedbox10,
            //       Text(
            //         'Member ID Number:',
            //         style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.w400,
            //             color: korange),
            //       ),
            //       Text(
            //         'BCI123456QWE',
            //         style: TextStyle(fontSize: 15),
            //       ),
            //       ksizedbox10,
            //       Text(
            //         'Phone Number:',
            //         style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.w400,
            //             color: korange),
            //       ),
            //       Text(
            //         '92345 43453',
            //         style: TextStyle(fontSize: 15),
            //       ),
            //       ksizedbox10,
            //       Text(
            //         'Delivery Address:',
            //         style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.w400,
            //             color: korange),
            //       ),
            //       Text(
            //         '2A,Street Nager, Anna Nagar, Chennai, 600021.',
            //         style: TextStyle(fontSize: 15),
            //       ),
            //     ]),
            //   ),
            // ),ksizedbox20,
            // InkWell(
            //   onTap: () {
            //     for (int i = 0; i < homeController.cartListData.length; i++) {
            //       homeController.addBooking(
            //           serviceid: homeController.cartListData[i].serviceId,
            //           cartid: homeController.cartListData[i].id.toString(),
            //           qty: homeController.cartListData[i].quantity,
            //           offerOrCoupon: "",
            //           couponcode: "",
            //           amount: homeController.cartListData[i].price);
            //     }
      
            //     // for(int i = 0; i < homeController.cartListData.length; i++){
            //     //   homeController.addBooking(
            //     //   serviceid: homeController.cartListData[i].serviceId,
            //     //   qty: homeController.cartListData[i].quantity,
            //     //   offerOrCoupon: "",
            //     //   couponcode: "",
            //     //   amount: homeController.cartListData[i].price
            //     //   );
            //     // }
            //   },
            //   child: Container(
            //     height: 40,
            //     width: 150,
            //     decoration: BoxDecoration(
            //       color: kblue,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: Center(
            //       child: Text(
            //         "Book Now",
            //         style: TextStyle(
            //             fontSize: 15,
            //             color: Colors.white,
            //             fontWeight: FontWeight.w500),
            //       ),
            //     ),
            //   ),
            ksizedbox20,
        MobileCommonBottom()  ],
        ),
      ),
    );
  }
}
