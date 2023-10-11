import 'package:bciweb/models/category_model.dart';
import 'package:bciweb/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constans.dart';
import '../../../controller/auth_controller/auth_controller.dart';
import '../../../controller/business_controller/business_service_controller.dart';
import '../../../registerhomescreen/business_comm_homecontainer.dart';
import 'business_addupdate_screen.dart';
import '../../members/common_widget/business_common_screen.dart';

class BusinessAvailabilityScreen extends StatefulWidget {
  const BusinessAvailabilityScreen({super.key});

  @override
  State<BusinessAvailabilityScreen> createState() => _BusinessAvailabilityScreenState();
}

class _BusinessAvailabilityScreenState extends State<BusinessAvailabilityScreen> {

    DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
   @override
  void initState() {
    super.initState();
    serviceController.getServicesByVendor();
    authController.getCategoryList();
  
  }
    var merchantCategory;

  var authController = Get.find<AuthController>();
  var serviceController = Get.find<BusinessServiceController>();
  @override
  Widget build(BuildContext context) {
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
          body: ListView(
            children: [
              Column(
                children: [
                   Container(
                      child: Stack(
                        children: [
                           Container(
                            height: 205,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset('assets/images/couponredemtionbackgroundimage.png',fit: BoxFit.cover)),
                        Positioned(
                          top: 0,
                          left: 0,
                          bottom: 0,
                          right: 0,
                          child: Center(
                            child: Text('AVAILABILITY', style: displayfont),
                          ),
                        )
                        ],
                      ),
                    ),
                    ksizedbox10,
                     Stack(
                    children: [
                        Container(
                      height: 240,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/images/bservicehomebackground.png',
                      fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      
                      children: [
                        Text('Service Availability',
                        style: TextStyle(
                          color: kblue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),),
                        Container(
                            height: 9,
                            width: 60,
                            color: kOrange,
                          ),

                          Text('When the customer recive a coupon,they can redeem it by presenting \nat the point purchase the coupon may provide a specific discount such \na presentange of purchase price or dollor amount discount',
                           style: TextStyle(
                            fontSize: 18,
                            height: 1.5
                          
                          ),),
                          Padding(
                            padding: const EdgeInsets.only(left: 150,top: 20),
                            child: Row(
                              children: [
                                Text('Your Services',
                                style: TextStyle(
                                  fontSize: 23,
                                  color: kblue,
                                  fontWeight: FontWeight.bold
                                ),),
                                
                              ],
                            ),
                          )
                      ],
                    ))
                    ],
                   ),
                   ksizedbox10,
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       InkWell(
                      onTap: () {
                        Get.toNamed(Routes.BusinessAddAvailabilityScreen);
                        
                      },
                      child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width*0.25,
                          decoration: BoxDecoration(
                            color: korange,
                              border: Border.all(color: kOrange, width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Add Service',
                                  style: TextStyle(fontSize: 16, color: kwhite),
                                ),
                              ),
                              ksizedbox10,
                              kwidth10,
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child:Icon(Icons.add_circle_outline,
                                color: kwhite,)
                              )
                            ],
                          )),
                    ),
                      GetBuilder<AuthController>(builder: (_) {
                      return Container(
                        height: 40,
                        width: 160,
                        decoration: BoxDecoration(
                            color: const Color(0xffE4E4E4),
                            border: Border.all(color: kblue, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: DropdownButton<CategoryData>(
                            value: merchantCategory,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 0,
                            itemHeight: 55,
                            isDense: true,
                            dropdownColor: Colors.grey[250],
                            style: const TextStyle(color: Colors.black54),
                            hint: Text(
                              "All Services",
                              style: TextStyle(fontSize: 16, color: kblue),
                            ),
                            onChanged: (CategoryData? value) {
                              setState(() {
                                merchantCategory = value!;
                              });
                              serviceController.getServicesByCategory(
                                  categoryId: value!.id.toString());
                            },
                            items: authController.categoryData
                                .map<DropdownMenuItem<CategoryData>>(
                                    (CategoryData value) {
                              return DropdownMenuItem<CategoryData>(
                                value: value,
                                child: Text(value.title),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    }),
                      Container(
                        height: 40,
                        width: 160,
                        decoration: BoxDecoration(
                            color: const Color(0xffE4E4E4),
                            border: Border.all(color: kblue, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                "${selectedDate.toLocal()}".split(' ')[0],
                                style: TextStyle(fontSize: 18, color: kblue),
                              ),
                            ),
                            ksizedbox10,
                            kwidth10,
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: InkWell(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: Icon(Icons.date_range,
                                color: kblue,)
                              ),
                            )
                          ],
                        )
                        ),

                    ],
                   ),ksizedbox20,
                                      Padding(
                                        padding: const EdgeInsets.only(left: 50,right: 50),
                                        child: Divider(),
                                      ),
                   ksizedbox40,
                     Padding(
                       padding: const EdgeInsets.only(left: 100,right: 10),
                       child: GetBuilder<BusinessServiceController>(builder: (_) {
                                   return serviceController.serviceDataList.isEmpty
                                       ?  Container(
                                         child: Center(
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ksizedbox30,
                            Image.asset('assets/icons/availablitynotavailableimage.png',
                            height: 300,fit: BoxFit.fitHeight,),
                            ksizedbox20,
                            Text('No Data Availability',
                            style: TextStyle(
                              fontSize: 20,
                              color: kblue,
                              fontWeight: FontWeight.w700
                            ),)
                          ],
                        ),
                                         ),
                                       )
                                       : Container(
                        height: MediaQuery.of(context).size.height,
                        child: GridView.builder(
                            itemCount: serviceController.serviceDataList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(children: [
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                         
                                        },
                                        child: Container(
                                          height: 140,
                                          width: MediaQuery.of(context).size.width*0.4,
                                          color: Colors.white,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 180,
                                                width: 140,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 10,
                                                      left: 5,
                                                      right: 10,
                                                      bottom: 10),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(4),
                                                    child: Image.network(
                                                      serviceController
                                                          .serviceDataList[index]
                                                          .image,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 10,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 169,
                                                      child: Text(
                                                        serviceController
                                                            .serviceDataList[index]
                                                            .title,
                                                        style: const TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    ),
                                                     Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Container(
                                                        width: 169,
                                                        child: Text(
                                                          "₹${serviceController
                                                              .serviceDataList[
                                                                  index]
                                                              .saleAmount}",
                                                          maxLines: 4,
                                                          style:const TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.black87),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Container(
                                                        width: 169,
                                                        child: Text(
                                                          serviceController
                                                              .serviceDataList[
                                                                  index]
                                                              .description,
                                                          maxLines: 4,
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color: kgrey),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 50),
                                    child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        PopupMenuButton(
                                          // Callback that sets the selected popup menu item.
                                          onSelected: (var item) {
                                            Get.off(() => UpdateServicesView(
                                                serviceData: serviceController
                                                    .serviceDataList[index]));
                                          },
                                          itemBuilder: (BuildContext context) =>
                                              <PopupMenuEntry>[
                                            const PopupMenuItem(
                                              value: 1,
                                              child: Text('Edit'),
                                            ),
                                          ],
                                        ),
                                        // IconButton(
                                        //     onPressed: () {
                                        //       Get.to(() => UpdateServicesView(
                                        //           serviceData: servicesController
                                        //               .serviceDataList[index]));
                                        //     },
                                        //     icon: const Icon(Icons.more_vert)),
                                      ],
                                    ),
                                  ),
                                ]),
                              );
                            }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:2 ,
                              childAspectRatio: 3.5),),
                                         );
                                 }),
                     ),
                   ksizedbox40
                ],
              ),
            ],
          ),
    );
  }
}