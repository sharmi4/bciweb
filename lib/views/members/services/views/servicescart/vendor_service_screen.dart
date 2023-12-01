import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/members/services/views/servicescart/service_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/service_controller/home_controller.dart';
import '../../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../common_widget/common.dart';

class VendorServiceListScreen extends StatefulWidget {
  String vendorId;
  String categoryName;
  String categoryId;
  VendorServiceListScreen({super.key, required this.vendorId,required this.categoryId,required this.categoryName});

  @override
  State<VendorServiceListScreen> createState() => _VendorServiceListScreenState();
}

class _VendorServiceListScreenState extends State<VendorServiceListScreen> {
  final homeController = Get.find<HomeServiceController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.vendorServiceListbyCategory(widget.vendorId, widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:const PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RegisterCommonContainer(),
            ksizedbox30,
            Center(
                child: Text("Service",
                style: primaryFont.copyWith(
                       fontSize: 28,
                       fontWeight: FontWeight.bold,
                       color: kblue
                       ),
                ),
              ),
              ksizedbox30,
             GetBuilder<HomeServiceController>(
               builder: (_) {
                 return homeController.vendorServiceListData.isEmpty
            ?  Center(
                child: Image.asset('assets/icons/Group 39781.png',height: 500,),
              )
            :  GridView.builder(
                        itemCount: homeController.vendorServiceListData.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2.5, 
                                crossAxisCount: 3),
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2.5,
                                        color: Colors.grey.withOpacity(0.5))
                                  ]),
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                       homeController.vendorServiceListData[index]
                                        .images.isEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          "assets/images/Group 9407.png",
                                          height: 125,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          homeController
                                              .vendorServiceListData[index]
                                              .images
                                              .first,
                                          height: 125,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15,top: 15),
                                        child: Column(
                                         // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            
                                            Text(
                                              homeController.vendorServiceListData[index].title,
                                              overflow: TextOverflow.ellipsis,
                                              style: primaryFont.copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                                width: size.width * 0.15,
                                                child: Text(homeController.vendorServiceListData[index].description,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: primaryFont.copyWith(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w500),
                                                )),
                                                const SizedBox(
                                                 height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Actual price",
                                                          style: primaryFont.copyWith(
                                                              color: kOrange,
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                        Text(
                                                          "₹${homeController.vendorServiceListData[index].actualAmount}",
                                                          style: primaryFont.copyWith(
                                                              decoration:
                                                                  TextDecoration.lineThrough,
                                                              color: Colors.grey,
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(width: 15,),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "BCI price",
                                                          style: primaryFont.copyWith(
                                                              color: kOrange,
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                        Text(
                                                          "₹${homeController.vendorServiceListData[index].saleAmount}",
                                                          style: primaryFont.copyWith(
                                                              color: kblue,
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.to(ListCart(
                                                  servicedata: homeController.vendorServiceListData[index],
                                                ));
                                              },
                                              child: Container(
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: kblue,
                                                ),
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  child: Text(
                                                    "Click now",
                                                    style: primaryFont.copyWith(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                     
                                    ],
                                  ),
                                   if (homeController
                                  .vendorServiceListData[index].isRecomended ==
                              "1")
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.4),
                              ),
                              child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                       color: kwhite,
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                         "All slots are filled",
                                          style: primaryFont.copyWith(color: Colors.red),
                                                                      ),
                                    ),
                                  )
                              ),
                            )
                                ],
                              ),
                            ),
                          );
                        }),
                      );
               }
             ),

            ksizedbox20,
            const RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}
