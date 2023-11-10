import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/home_controller.dart';
import 'package:bciweb/controller/profile_controller.dart';
import 'package:bciweb/controller/service_controller/home_controller.dart';
import 'package:bciweb/registerhomescreen/common_reg_homescreen.dart';
import 'package:bciweb/views/members/common_widget/common.dart';
import 'package:bciweb/views/members/services/views/servicescart/vendor_service_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class VendorsCategoryListView extends StatefulWidget {
  String vendorId;
  VendorsCategoryListView({super.key, required this.vendorId});

  @override
  State<VendorsCategoryListView> createState() => _VendorsListViewState();
}

class _VendorsListViewState extends State<VendorsCategoryListView> {
  final homeServiceController = Get.find<HomeServiceController>();
  final profileController = Get.find<ProfileController>();

  var searchTextEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    getdatas();
    super.initState();
  }

  getdatas() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeServiceController.getVendorCategory(widget.vendorId);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonScreen(),
              RegisterCommonContainer(),
            ],
          ),
          preferredSize: const Size(double.infinity, 110)),
      body: GetBuilder<HomeController>(builder: (_) {
        return homeServiceController.merchatCategoryList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                        image: AssetImage("assets/icons/Group 8861.png")),
                    ksizedbox20,
                    Text(
                      "No Services found",
                      style: TextStyle(
                          fontSize: 22,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            : GridView.builder(
                itemCount: homeServiceController.merchatCategoryList.length,
                shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1, 
                                crossAxisCount: 5),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // Get.to(
                        //   VendorDetailScreen(
                        //     vendorListModelData:
                        //         homeController.vendorList[index],
                        //     userid:
                        //         homeController.vendorList[index].id.toString(),
                        //   ),
                        // );
                        Get.to(() => VendorServiceListScreen(
                              vendorId: widget.vendorId,
                              categoryName: homeServiceController
                                  .merchatCategoryList[index].image,
                              categoryId: homeServiceController
                                  .merchatCategoryList[index].id
                                  .toString(),
                            ));
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: kgrey, blurRadius: 0.5),
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: homeServiceController.merchatCategoryList[index].image !=
                                      null
                                  ? Image.network(
                                      homeServiceController
                                          .merchatCategoryList[index].image,
                                      height: 180,
                                      width: size.width,
                                      fit: BoxFit.cover,
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Image.asset(
                                        "assets/images/Group 9407.png",
                                        height: 180,
                                        width: size.width,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                            ),
                            ksizedbox10,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                height: 35,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    homeServiceController
                                        .merchatCategoryList[index].title,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: kblue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}
