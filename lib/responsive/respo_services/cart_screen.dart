import 'package:custom_clippers/custom_clippers.dart';
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

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final homeController = Get.find<HomeServiceController>();

  // final profileController = Get.find<ProfileControllers>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getCartdetails();
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
                height: size.height * 0.5,
                child: homeController.cartListData.isEmpty
                    ? const Center(
                        child: Text("No Items In Your Cart"),
                      )
                    : ListView.builder(physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: homeController.cartListData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                                width: double.infinity,
                                height: 110,
                                decoration: BoxDecoration(
                                    color: kwhite,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: kgrey,
                                        blurRadius: 0.5,
                                      ),
                                    ]),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Image.network(
                                                homeController
                                                    .cartListData[index].image,
                                                height: 50,
                                                width: 60,
                                                fit: BoxFit.cover,
                                              ),
                                              kwidth10,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(
                                                    homeController
                                                        .cartListData[index]
                                                        .serviceName,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                      width: 230,
                                                      child: Text(
                                                        homeController
                                                            .cartListData[index]
                                                            .description,
                                                        maxLines: 3,
                                                      )),
                                                  Text(
                                                      "Qty: ${homeController.cartListData[index].quantity}"),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        homeController.deleteToCart(
                                                            serviceid:
                                                                homeController
                                                                    .cartListData[
                                                                        index]
                                                                    .serviceId
                                                                    .toString());
                                                      },
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: Colors.redAccent,
                                                      )),
                                                  ksizedbox10,
                                                  Text(
                                                    '₹ ${homeController.cartListData[index].price}',
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: kyellow),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          );
                        },
                      ),
              );
            }),
            const Divider(
              thickness: 1,
            ),
            Container(
             // height: 100,
              width: double.infinity,
              color: kwhite,
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ksizedbox40,
                  Text(
                    'Support',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  ksizedbox10,
                  Text(
                    'Member ID Number:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: korange),
                  ),
                  Text(
                    'BCI123456QWE',
                    style: TextStyle(fontSize: 15),
                  ),
                  ksizedbox10,
                  Text(
                    'Phone Number:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: korange),
                  ),
                  Text(
                    '92345 43453',
                    style: TextStyle(fontSize: 15),
                  ),
                  ksizedbox10,
                  Text(
                    'Delivery Address:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: korange),
                  ),
                  Text(
                    '2A,Street Nager, Anna Nagar, Chennai, 600021.',
                    style: TextStyle(fontSize: 15),
                  ),
                ]),
              ),
            ),
            InkWell(
              onTap: () {
                for (int i = 0; i < homeController.cartListData.length; i++) {
                  homeController.addBooking(
                      serviceid: homeController.cartListData[i].serviceId,
                      cartid: homeController.cartListData[i].id.toString(),
                      qty: homeController.cartListData[i].quantity,
                      offerOrCoupon: "",
                      couponcode: "",
                      amount: homeController.cartListData[i].price);
                }
      
                // for(int i = 0; i < homeController.cartListData.length; i++){
                //   homeController.addBooking(
                //   serviceid: homeController.cartListData[i].serviceId,
                //   qty: homeController.cartListData[i].quantity,
                //   offerOrCoupon: "",
                //   couponcode: "",
                //   amount: homeController.cartListData[i].price
                //   );
                // }
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Book Now",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
        MobileCommonBottom()  ],
        ),
      ),
    );
  }
}
