import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constans.dart';
import '../../../controller/business_controller/business_service_controller.dart';
import '../../../registerhomescreen/business_comm_homecontainer.dart';
import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../members/common_widget/business_common_screen.dart';

class BusinessLastOffersScreen extends StatefulWidget {
  const BusinessLastOffersScreen({super.key});

  @override
  State<BusinessLastOffersScreen> createState() => _BusinessLastOffersScreenState();
}

class _BusinessLastOffersScreenState extends State<BusinessLastOffersScreen> {

final servicesController = Get.find<BusinessServiceController>();
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    servicesController.offerList();
  }

  @override
  Widget build(BuildContext context) {
      var size = MediaQuery.of(context).size;
    return Scaffold(
       appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BusinessCommonScreen(),
              BusinessCommonhomeContainer(),
            ],
          ),
          preferredSize: const Size(double.infinity, 110)),

          body: Padding(
            padding: const EdgeInsets.only(left: 0,right: 0,top: 20),
            child: ListView(children: [
              Container(
                height: size.height,
                width: size.width,
                child: GetBuilder<BusinessServiceController>(builder: (_) {
                      return servicesController.offerListData.isEmpty ?
                       Container(
                        child: Center(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/businessnoofferslist.png',
                              //height: 300,
                              //fit: BoxFit.fitHeight,
                              ),
                              ksizedbox20,
                              Text('No offers Available',
                              style: TextStyle(
                                fontSize: 24,
                                color: kblue,
                                fontWeight: FontWeight.w700
                              ),)
                            ],
                          ),
                        ),
                      ) :
                        GridView.builder(
                itemCount: servicesController.offerListData.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Get.to(() => VendorViewOffers(
                          //       vendorId: homeController
                          //           .todayOfferListData[index].vendorId,
                          //     ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Container(
                            height: 150,
                          width: size.width*0.6,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  offset: Offset(0.0, 0.75),
                                  blurRadius:5,
                                  color: kgrey
                                )
                              ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                      height: 120,
                                     // width: size.width * 0.1,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 2,
                                              color: Colors.grey.withOpacity(0.5),
                                            )
                                          ]),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          servicesController.offerListData[index].image,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, top:10 ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                    
                                      children: [
                                        Container(
                                          width: 250,
                                          child: Text(
                                            servicesController
                                                .offerListData[index].title,
                                            style: primaryFont.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                             width: 250,
                                          child: Text(
                                            "Discount value : ₹${servicesController.offerListData[index].discountValue}",
                                            style: primaryFont.copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                             width: 250,
                                          child: Text(
                                            "Ends on : ${formatDate(servicesController.offerListData[index].endsAt, [
                                                  dd,
                                                  "-",
                                                  mm,
                                                  "-",
                                                  yyyy
                                                ])}",
                                            style: primaryFont.copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                    ],
                  );
                }), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                childAspectRatio: 2.8,
                //crossAxisSpacing: 10,
                //mainAxisSpacing: 10
                ),);
                    }),
              ),
                 ksizedbox30,
            RegisterCommonBottom()
            ]),
          ),
    );
  }
}