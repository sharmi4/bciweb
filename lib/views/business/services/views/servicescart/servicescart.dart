import 'package:bciweb/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../constant/constans.dart';
import '../../../../../controller/home_controller.dart';
import '../../../../../controller/service_controller/home_controller.dart';
import '../../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../../members/common_widget/common.dart';

class ServicesCart extends StatefulWidget {
  const ServicesCart({super.key});

  @override
  State<ServicesCart> createState() => _ServicesCartState();
}

class _ServicesCartState extends State<ServicesCart> {
  @override
  void initState() {
    super.initState();
    homeController.getCartdetails();
  }

  // final profileController = Get.find<ProfileController>();
  final homeController = Get.find<HomeServiceController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: ListView(
        children: [
          RegisterCommonContainer(),
          //  Text('data'),
          GetBuilder<HomeServiceController>(
            builder: (_) {
              return homeController.cartListData.isEmpty
                  ? Container(
                      height: 300,
                      child: Center(
                          child: Text(' item not  fount').text.xl2.thin.make()))
                  : Padding(
                    padding: const EdgeInsets.only(top: 30,left: 30,right: 30),
                    child: Container(
                        height: size.height * 0.8,
                        width: 10,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: homeController.cartListData.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                  width: 150,
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
                                                  height: 80,
                                                  width: 90,
                                                  fit: BoxFit.cover,
                                                ),
                                                kwidth10,
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                            // Row(
                                            //   children: [
                                            //     Column(
                                            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            //       children: [
                                            //         InkWell(
                                            //           onTap: (){
                                            //             homeController.deleteToCart(serviceid: homeController.cartListData[index].serviceId.toString());
                                            //           },
                                            //           child:const Icon(Icons.delete,color: Colors.redAccent,)),
                                            //         ksizedbox10,
                                            //         Text(
                                            //   '₹ ${homeController.cartListData[index].price}',
                                            //    style: TextStyle(
                                            //    fontSize: 17.sp,
                                            //    fontWeight: FontWeight.w600,
                                            //   color: kyellow),
                                            // ),
                                            //       ],
                                            //     ),
                  
                                            //   ],
                                            // ),
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
             homeController.deleteToCart(
             serviceid: homeController.cartListData[index].serviceId.toString());
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
                                              '₹ ${double.parse(homeController.cartListData[index].amount).toStringAsFixed(2)}',
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
                                        ),
                                      )
                                    ],
                                  )),
                            );
                          },
                        ),
                      ),
                  );
            },
          ),
          ksizedbox40,
          ksizedbox40,
        
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 70,
                width: size.width * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), color: kyellow),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          //  dialogBuilder(context);
                        },
                        child: Container(
                          height: 65,
                          width: 150,
                          decoration: BoxDecoration(
                              color: kyellow,
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(child:
                              GetBuilder<HomeServiceController>(builder: (_) {
                            return Text(
                              'Total : ₹${homeController.getGrandTotal(tcartListData: homeController.cartListData).toStringAsFixed(2)}',
                              // homeController.cartListData.totalamount,

                              style: TextStyle(
                                  color: kwhite,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            );
                          })),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          for (int i = 0;
                              i < homeController.cartListData.length;
                              i++) {
                            homeController.addBooking(
                                serviceid:
                                    homeController.cartListData[i].serviceId,
                                cartid: homeController.cartListData[i].id
                                    .toString(),
                                qty: homeController.cartListData[i].quantity,
                                offerOrCoupon: "",
                                couponcode: "",
                                amount: homeController.cartListData[i].amount);
                          }

                          Get.toNamed(Routes.MEMBHOME);
                        },
                        //  onTap: () {
                        //  homeController.addToCart(
                        ///serviceid: widget.servicedata.id
                        //                           .toString());
                        //   },
                        child: Container(
                          height: 65,
                          width: 150,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(16)),
                          child: const Center(
                              child: Text(
                            "BOOK NOW",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              kwidth10,
            ],
          ),
          ksizedbox40,
          // const Divider(
          //   thickness: 1,
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child:
          //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //     // ksizedbox40,
          //     Text(
          //       'Support',
          //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          //     ),
          //     ksizedbox10,
          //     Text(
          //       'Member ID Number:',
          //       style: TextStyle(
          //           fontSize: 20, fontWeight: FontWeight.w400, color: korange),
          //     ),
          //     Text(
          //       'BCI123456QWE',
          //       style: TextStyle(fontSize: 15),
          //     ),
          //     ksizedbox10,
          //     Text(
          //       'Phone Number:',
          //       style: TextStyle(
          //           fontSize: 20, fontWeight: FontWeight.w400, color: korange),
          //     ),
          //     Text(
          //       '92345 43453',
          //       style: TextStyle(fontSize: 15),
          //     ),
          //     ksizedbox10,
          //     Text(
          //       'Delivery Address:',
          //       style: TextStyle(
          //           fontSize: 20, fontWeight: FontWeight.w400, color: korange),
          //     ),
          //     Text(
          //       '2A,Street Nager, Anna Nagar, Chennai, 600021.',
          //       style: TextStyle(fontSize: 15),
          //     ),
          //   ]),
          // ),
          ksizedbox40, ksizedbox40,
          RegisterCommonBottom()
        ],
      ),
    );
  }
}
