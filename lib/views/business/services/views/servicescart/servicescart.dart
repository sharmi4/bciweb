import 'package:bciweb/views/business/bookins/history/views/history.dart';
import 'package:bciweb/views/business/bookins/liquer/widgets/addsubstract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../constant/constans.dart';
import '../../../../../controller/subscription_controller/home_controller.dart';

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
          GetBuilder<HomeServiceController>(builder: (_) {
            return Container(
              height: size.height * 0.5,
              width: size.width,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: homeController.cartListData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        width: size.width * 0.7,
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
                                    mainAxisAlignment: MainAxisAlignment.end,
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
                                            homeController.cartListData[index]
                                                .serviceName,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
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
 Row(mainAxisAlignment: MainAxisAlignment.end,
   children: [
     Container(
                                  height: 70,
                                  width: size.width*0.3,
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
                                            // child: const Center(
                                            //     child: Text(
                                            //   "Book Now",
                                            //   style: TextStyle(
                                            //       fontSize: 18,
                                            //       fontWeight: FontWeight.w700),
                                            // )),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: InkWell(
                                          onTap: () {
                                          //  homeController.addToCart(
///serviceid: widget.servicedata.id
                         //                           .toString());
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
                                              "BOOK NOW",
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
   kwidth10],
 ),
          const Divider(
            thickness: 1,
          ),
          Padding(
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
        
          RegisterCommonBottom()
        ],
      ),

    
    );
  }
}
