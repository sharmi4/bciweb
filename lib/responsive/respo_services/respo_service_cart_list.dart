import 'package:bciweb/responsive/mobile_wdgets/drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../constant/constans.dart';
import '../../controller/auth_controller/auth_controller.dart';
import '../../controller/home_controller.dart';
import '../../controller/profile_controler/profile_controller.dart';
import '../../controller/profile_controller.dart';
import '../../controller/service_controller/home_controller.dart';
import '../../models/service_model.dart';
import '../mobile_wdgets/comomappbar.dart';
import '../mobile_wdgets/mobile_common_bottom/bottom.dart';

class RespoServiceCartList extends StatefulWidget {
  ServiceData servicedata;
  RespoServiceCartList({super.key, required this.servicedata});

  @override
  State<RespoServiceCartList> createState() => _RespoServiceCartListState();
}

class _RespoServiceCartListState extends State<RespoServiceCartList> {
  final homeController = Get.find<HomeServiceController>();
  final authController = Get.find<AuthController>();
  final redeemCouponcontroller = TextEditingController();

  final profileControllerss = Get.find<ProfileControllers>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      drawer: MobileDrawer(),
      body: ListView(
        children: [
          Image.network(
            widget.servicedata.image,
            height: 350,
            width: size.width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                ksizedbox10,
                Text(
                  widget.servicedata.description,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                      color: kgrey),
                ),
                ksizedbox10,
                Text(
                  'Services',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                ksizedbox10,
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
                      '',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kgrey),
                    ),
                  ],
                ),
                ksizedbox20,
                TextField(
                  controller: redeemCouponcontroller,
                  decoration: InputDecoration(
                    disabledBorder: const OutlineInputBorder(),
                    hintText: 'Enter Your Coupon code',
                    fillColor: kwhite,
                    focusColor: kwhite,
                    isDense: true,
                    filled: true,
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
                                await profileControllerss.redeemCoupon(
                                    couponcode: redeemCouponcontroller.text,
                                    serviceId:
                                        widget.servicedata.id.toString());

                            double tAmount = double.parse(amount);
                            double tempSaleAmounz =
                                double.parse(tempSaleAmount);

                            double totalAmountTobeAdded =
                                tempSaleAmounz - tAmount;

                            setState(() {
                              widget.servicedata.saleAmount =
                                  totalAmountTobeAdded.toStringAsFixed(2);
                            });
                          },
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
                ksizedbox20,
                Container(
                  height: 60,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), color: kyellow),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Total : ₹${widget.servicedata.saleAmount}",
                          style: primaryFont.copyWith(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(
                              right: 5, top: 5, bottom: 5),
                          child: homeController.isLoading.isTrue
                              ? Container(
                                  height: 65,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: kwhite,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: const Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.black87,
                                  )),
                                )
                              : InkWell(
                                  onTap: () {
                                    homeController.addToCart(
                                        amount: widget.servicedata.saleAmount,
                                        serviceid:
                                            widget.servicedata.id.toString());
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
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          MobileCommonBottom()
        ],
      ),
    );
  }
}
