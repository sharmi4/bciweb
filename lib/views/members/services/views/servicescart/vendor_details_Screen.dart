import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/models/vendor_list_model.dart';
import 'package:bciweb/views/members/services/views/servicescart/vendor_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../constant/constans.dart';
import '../../../../../controller/redeem_controller/redeem_controller.dart';
import '../../../../../controller/service_controller/home_controller.dart';
import '../../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../common_widget/common.dart';

class VendorDetailsScreen extends StatefulWidget {
  VendorListModelData vendorListModelData;
  final String userid;
  VendorDetailsScreen({super.key, required this.vendorListModelData,required this.userid});

  @override
  State<VendorDetailsScreen> createState() => _VendorDetailsScreenState();
}

class _VendorDetailsScreenState extends State<VendorDetailsScreen> {
  final authController = Get.find<AuthController>();
  final homeController = Get.find<HomeServiceController>();

  final redeemCouponcontroller = TextEditingController();

  final profileControllerss = Get.find<RedeemController>();



   @override
  void initState() {
    super.initState();
    homeController.getInstance(userid: widget.userid);
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        child: CommonScreen(),
        preferredSize: Size(double.infinity, 40),
      ),
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
                      widget.vendorListModelData.profilePicture != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                widget.vendorListModelData.profilePicture!,
                                height: 350,
                                width: size.width * 0.2,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Image.asset(
                              "assets/icons/no-photo.png",
                              height: 350,
                              width: size.width * 0.2,
                              fit: BoxFit.cover,
                            ),
                      Container(
                        width: size.width * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ksizedbox10,
                            Text(
                              widget.vendorListModelData.name,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: kblue),
                            ),
                            ksizedbox20,
                            const Text(
                              "Details",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                            ),
                            ksizedbox20,
                            if (widget.vendorListModelData.address != null)
                              Text(
                                "${widget.vendorListModelData.address ?? ""}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87),
                              ),
                            if (widget.vendorListModelData.address != null)
                              Text(
                                "${widget.vendorListModelData.city}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87),
                              ),
                            if (widget.vendorListModelData.address != null)
                              Text(
                                "${widget.vendorListModelData.state}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87),
                              ),
                            ksizedbox10,
                            Text(
                              "Mobile: ${widget.vendorListModelData.mobile}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5,
                                  color: Colors.black87),
                            ),
                            Text(
                              "Email: ${widget.vendorListModelData.email}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5,
                                  color: Colors.black87),
                            ),
                            ksizedbox20,
                            if (widget.vendorListModelData.locationAddress !=
                                null)
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(widget
                                          .vendorListModelData
                                          .locationAddress));
                                    },
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 2,
                                                color: Colors.grey
                                                    .withOpacity(0.5))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Location",
                                              style: primaryFont.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                  fontSize: 12),
                                            ),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            const Icon(
                                              Icons.location_on,
                                              color: Colors.blue,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ksizedbox20,
                            InkWell(
                              onTap: () {
                                Get.to(
                                  () => VendorServiceListScreen(
                                      vendorId: widget.vendorListModelData.id
                                          .toString()),
                                );
                              },
                              child: Container(
                                height: 50,
                                width: size.width,
                                decoration: BoxDecoration(
                                    color: korange,
                                    borderRadius: BorderRadius.circular(10)),
                                alignment: Alignment.center,
                                child: Text(
                                  "View Services",
                                  style: primaryFont.copyWith(
                                      fontSize: 16, color: Colors.white),
                                ),
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
                  ksizedbox40,
              GetBuilder<HomeServiceController>(builder: (_) {
                    return homeController.galleryListData.isEmpty
                        ? Container()
                        : Container(
                            height: 80,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount:
                                    homeController.galleryListData.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  backgroundColor: Colors.white,
                                                  title: Column(
                                                    children: [
                                                      Image.network(
                                                          homeController
                                                              .galleryListData[
                                                                  index]
                                                              .image),
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        child: Image.network(
                                          homeController
                                              .galleryListData[index].image,
                                          height: 50,
                                          width: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          );
                  }),
                ],
              ),
            ),
            RegisterCommonBottom()
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
