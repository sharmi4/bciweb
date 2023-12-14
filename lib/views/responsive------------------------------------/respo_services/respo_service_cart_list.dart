import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/models/business_model/get_vendor_service_list_model.dart';
import 'package:bciweb/views/members/services/views/servicescart/servicescart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../constant/constans.dart';
import '../../../../../../controller/redeem_controller/redeem_controller.dart';
import '../../../../../../controller/service_controller/home_controller.dart';
import '../../../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../../../registerhomescreen/common_reg_homescreen.dart';
import '../mobile_wdgets/comomappbar.dart';
import '../mobile_wdgets/drawer.dart';
import '../mobile_wdgets/mobile_common_bottom/bottom.dart';
import 'cart_screen.dart';

class ResListCart extends StatefulWidget {
  GetServiceListData servicedata;
  ResListCart({super.key, required this.servicedata});

  @override
  State<ResListCart> createState() => _ResListCartState();
}

class _ResListCartState extends State<ResListCart> {
  final authController = Get.find<AuthController>();

  final homeController = Get.find<HomeServiceController>();

  final redeemCouponcontroller = TextEditingController();

  final profileControllerss = Get.find<RedeemController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      drawer: MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RegisterCommonContainer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ksizedbox10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width * 0.2,
//height: size.height * 0.5,
                        child: Image.network(widget.servicedata.image),
                      ),
                      Container(
                        width: size.width * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ksizedbox30,
                            Text(
                              widget.servicedata.title,
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: kblue),
                            ),
                            ksizedbox20,
                            Text(
                              "About",
                              style: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                  color: kblue),
                            ),
                            ksizedbox30,
                            Text(
                              widget.servicedata.description,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: kgrey),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ksizedbox10,
                            Text(
                              'Services',
                              style: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                  color: kblue),
                            ),
                            ksizedbox10,
                            for (int i = 0;
                                i < widget.servicedata.amenties!.length;
                                i++)
                              Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: kgrey,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.servicedata.amenties![i].value,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: kgrey),
                                  ),
                                ],
                              ),
                            ksizedbox40,
                            InkWell(
                              onTap: () {
                                Get.to(CartScreen());
                              },
                              child: Container(
                                height: 40,
                                width: 110,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: const [
                                      Text(
                                        "View Cart",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ksizedbox40,
                            Text(
                              "₹ ${widget.servicedata.saleAmount}",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: kOrange),
                            ),
                            ksizedbox40,
                            ksizedbox40,
                            TextField(
                              controller: redeemCouponcontroller,
                              decoration: InputDecoration(
                                disabledBorder: const OutlineInputBorder(),
                                hintText: 'Enter Your Coupon code',
                                fillColor: kwhite,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    height: 20,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      color: kblue,
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        String tempSaleAmount =
                                            widget.servicedata.saleAmount;
                                        String amount =
                                            await profileControllerss
                                                .redeemCoupon(
                                                    couponcode:
                                                        redeemCouponcontroller
                                                            .text,
                                                    serviceId: widget
                                                        .servicedata.id
                                                        .toString(),
                                                    requestAmount:
                                                        tempSaleAmount,
                                                    vendorId: widget
                                                        .servicedata.vendorId);

                                        double tAmount = double.parse(amount);
                                        double tempSaleAmounz =
                                            double.parse(tempSaleAmount);

                                        if (tAmount < tempSaleAmounz) {
                                          double totalAmountTobeAdded =
                                              tempSaleAmounz - tAmount;

                                          setState(() {
                                            widget.servicedata.saleAmount =
                                                totalAmountTobeAdded
                                                    .toStringAsFixed(2);
                                          });
                                        } else {
                                          Get.rawSnackbar(
                                              message:
                                                  "Coupon is not applicable for this service",
                                              backgroundColor: Colors.red);
                                        }

                                        // String tempSaleAmount =
                                        //     widget.servicedata.saleAmount;
                                        // String amount =
                                        //     await profileControllerss.redeemCoupon(
                                        //         couponcode: redeemCouponcontroller.text);

                                        // double tAmount = double.parse(amount);
                                        // double tempSaleAmounz =
                                        //     double.parse(tempSaleAmount);

                                        // double totalAmountTobeAdded =
                                        //     tempSaleAmounz - tAmount;

                                        // setState(() {
                                        //   widget.servicedata.saleAmount =
                                        //       totalAmountTobeAdded.toStringAsFixed(2);
                                        // });
                                      },
                                      // {
                                      //  profileControllerss.redeemCoupon(
                                      //      couponcode: redeemCouponcontroller.text);
                                      // },
                                      // child: Center(
                                      child: Center(
                                        child: Text(
                                          'Redeem Now',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                focusColor: kwhite,
                                isDense: true,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                            ksizedbox40,
                            Container(
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: kyellow),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Center(
                                            child: Text(
                                          "Total : ₹${widget.servicedata.saleAmount}",
                                          style: TextStyle(
                                              color: kwhite,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: InkWell(
                                      onTap: () {
                                        // homeController.addToCart(
                                        //    startTime: selectedValue != null
                                        //     ? "${selectedValue.weekday} ${selectedValue.startTime}-${selectedValue.endTime}"
                                        //     : "",
                                        //     slotId: selectedValue != null
                                        //     ?selectedValue.id.toString():"" ,
                                        //     amount:
                                        //         widget.servicedata.saleAmount,
                                        //     serviceid: widget.servicedata.id
                                        //         .toString());
                                      },
                                      child: Container(
                                        height: 65,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: kwhite,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: const Center(
                                            child: Text(
                                          "Add To Cart",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 20),
                  //   child: Center(
                  //     child: Column(
                  //       children: [
                  //         InkWell(
                  //           onTap: () {
                  //             Get.to(const ServicesCart());
                  //           },
                  //           child: Padding(
                  //             padding:
                  //                 const EdgeInsets.only(right: 20, bottom: 10),
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.end,
                  //               children: [
                  //                 Container(
                  //                   height: 40,
                  //                   width: 110,
                  //                   decoration: BoxDecoration(
                  //                     color: Colors.green,
                  //                     borderRadius: BorderRadius.circular(5),
                  //                   ),
                  //                   child: Center(
                  //                     child: Row(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.spaceAround,
                  //                       children: const [
                  //                         Text(
                  //                           "View Cart",
                  //                           style: TextStyle(
                  //                               color: Colors.white,
                  //                               fontWeight: FontWeight.w500),
                  //                         ),
                  //                         Icon(
                  //                           Icons.shopping_cart,
                  //                           color: Colors.white,
                  //                         )
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 20, right: 20),
                  //           child: TextField(
                  //             controller: redeemCouponcontroller,
                  //             decoration: InputDecoration(
                  //               disabledBorder: const OutlineInputBorder(),
                  //               hintText: 'Enter Your Coupon code',
                  //               fillColor: kwhite,
                  //               focusColor: kwhite,
                  //               isDense: true,
                  //               filled: true,
                  //               border: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.circular(4.0),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         ksizedbox20,
                  //         Padding(
                  //           padding: const EdgeInsets.all(20.0),
                  //           child: Container(
                  //             height: 70,
                  //             width: double.infinity,
                  //             decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(16),
                  //                 color: kyellow),
                  //             child: Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Padding(
                  //                   padding: const EdgeInsets.all(8),
                  //                   child: InkWell(
                  //                     onTap: () {
                  //                       //  dialogBuilder(context);
                  //                     },
                  //                     child: Container(
                  //                       height: 65,
                  //                       width: 150,
                  //                       decoration: BoxDecoration(
                  //                           color: kwhite,
                  //                           borderRadius:
                  //                               BorderRadius.circular(16)),
                  //                       child: const Center(
                  //                           child: Text(
                  //                         "Book Now",
                  //                         style: TextStyle(
                  //                             fontSize: 18,
                  //                             fontWeight: FontWeight.w700),
                  //                       )),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding: const EdgeInsets.all(8),
                  //                   child: InkWell(
                  //                     onTap: () {
                  //                       homeController.addToCart(
                  //                           serviceid: widget.servicedata.id
                  //                               .toString());
                  //                     },
                  //                     child: Container(
                  //                       height: 65,
                  //                       width: 150,
                  //                       decoration: BoxDecoration(
                  //                           color: kwhite,
                  //                           borderRadius:
                  //                               BorderRadius.circular(16)),
                  //                       child: const Center(
                  //                           child: Text(
                  //                         "Add To Cart",
                  //                         style: TextStyle(
                  //                             fontSize: 18,
                  //                             fontWeight: FontWeight.w700),
                  //                       )),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  ksizedbox20,
                  // Text(
                  //   "About",
                  //   style: TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold,
                  //       color: kblue),
                  // ),
                  // ksizedbox10,
                  // Text(
                  //   widget.servicedata.description,
                  //   style: TextStyle(
                  //       fontSize: 13,
                  //       fontWeight: FontWeight.w400,
                  //       color: kgrey),
                  // ),
                  // ksizedbox20,
                  // Text(
                  //   "₹ ${widget.servicedata.actualAmount}",
                  //   style: TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold,
                  //       color: kOrange),
                  // ),
                ],
              ),
            ),
            ksizedbox40,
            MobileCommonBottom()
          ],
        ),
      ),
    );
  }

//  Future<void> dialogBuilder(BuildContext context) {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           //  title: const Text('Basic dialog title'),
//           content: const Text('Are you sure book this services'),
//           actions: <Widget>[
//             InkWell(
//               onTap: (){
//                 Get.back();
//               },
//               child: Text(
//                 "No",
//                 style: primaryFont.copyWith(
//                   color: kblue,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 20,
//             ),
//             InkWell(
//               onTap: () {
//                 Get.back();
//                 if(redeemCouponcontroller.text.isNotEmpty){
//                   print(">>>>>>>>>>>11111111111111111111");
//                   profileController.redeemCoupon(couponcode: redeemCouponcontroller.text);
//                 homeController.addBooking(
//                                     serviceid: widget.servicedata.id.toString(),
//                                     qty: "1",
//                                     offerOrCoupon: "",
//                                     couponcode: redeemCouponcontroller.text,
//                                     amount: widget.servicedata.actualAmount);
//                 }else{
//                   print(">>>>>>>>>>>>>>>222222222222222222");
//                 homeController.addBooking(
//                                     serviceid: widget.servicedata.id.toString(),
//                                     qty: "1",
//                                     offerOrCoupon: "",
//                                     couponcode: redeemCouponcontroller.text,
//                                     amount: widget.servicedata.actualAmount);
//                 }

//               },
//               child: Text(
//                 "Yes",
//                 style: primaryFont.copyWith(
//                   color: kblue,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 20,
//             ),
//           ],
//         );
//       },
//     );
//   }
}
