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
  VendorServiceListScreen({super.key, required this.vendorId});

  @override
  State<VendorServiceListScreen> createState() => _VendorServiceListScreenState();
}

class _VendorServiceListScreenState extends State<VendorServiceListScreen> {
  final homeController = Get.find<HomeServiceController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.vendorServiceList(widget.vendorId);
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
                                childAspectRatio: 2.5, crossAxisCount: 3),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      height: 120,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(homeController.vendorServiceListData[index].image),
                                            fit: BoxFit.fill,
                                          ),
                                          //     color: Colors.red,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 2.5,
                                                color: Colors.grey.withOpacity(0.5))
                                          ])),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15,top: 15),
                                    child: Column(
                                     // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          homeController.vendorServiceListData[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          style: primaryFont.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            width: size.width * 0.15,
                                            child: Text(homeController.vendorServiceListData[index].description,
                                              maxLines: 3,
                                              style: primaryFont.copyWith(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            )),
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
