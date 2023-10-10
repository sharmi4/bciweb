import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/holiday_package_controller.dart';
import 'package:bciweb/views/responsive------------------------------------/holiday/holidaybookings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HolidayHomeScreen extends StatefulWidget {
  const HolidayHomeScreen({super.key});

  @override
  State<HolidayHomeScreen> createState() => _HolidayHomeScreenState();
}

class _HolidayHomeScreenState extends State<HolidayHomeScreen> {
  int index = 0;

  final holidayPackageController = Get.find<HolidayPackageController>();

  final searchController = TextEditingController();

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPackageList();
    searchController.addListener(searchUsers);
    holidayPackageController.recomended(); 
     }

     getPackageList() async {
    await holidayPackageController.getPackageCategory();
    holidayPackageController.getPackage(
        categoryId: holidayPackageController.packageCategoryData.first.id.toString());
    holidayPackageController
        .searchInt(holidayPackageController.packageCategoryData.first.id);
  }

  searchUsers() {
    if (searchController.text.trim().isNotEmpty) {
      holidayPackageController.searchPackageList(
        name: searchController.text,
        categoryid: holidayPackageController.searchInt.value.toString()
        );
    } else {
      holidayPackageController.getPackage(
        categoryId: holidayPackageController.packageCategoryData.first.id.toString());
      holidayPackageController.update();
    }
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HolidayPackageController>(builder: (_) {
      return Scaffold(
          backgroundColor: const Color(0xFFF9F8FD),
          appBar:PreferredSize(
            preferredSize: const Size.fromHeight(340),
            child: Column(children: [
              Stack(
                children:[ 
                Container(
                  height: size.height*0.39,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Container(
                      height: size.height*0.34,
                      width: size.width,
                      child: Image.asset("assets/images/Group 6977 (4).png",
                      //height: size.height*0.34,
                      width: size.width,
                      fit: BoxFit.fill,)),
                  ),
                ),
                  InkWell(
            onTap: () {
              Get.back();
            },
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: kOrange,
                        borderRadius: BorderRadius.circular(7)
                      ),
                      child: Center(
                        child: Icon(Icons.arrow_back_ios_new,color: kwhite,size: 16,))),
                        kwidth10,
                        Text(
                  'Plan your trip with us.',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700,color: kwhite),
                ),
                  ],
                ),
              ))),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                 padding: const EdgeInsets.only(top: 10,left: 10,right: 10,),
                 child: Container(
                   height: 50,
                   width: size.width,
                   child: TextFormField(
                       controller: searchController,
                       decoration: InputDecoration(
                         hintText: 'Search',
                         fillColor: const Color(0xFFFFFFFF),
                         focusColor: Colors.grey[200],
                         isDense: true,
                         filled: true,
                         border: OutlineInputBorder(
                           borderSide: BorderSide(
                               width: 0.5,
                               color: Colors.grey.withOpacity(0.2)),
                           borderRadius: BorderRadius.circular(10.0),
                         ),
                         prefixIcon: const Icon(
                           Icons.search,
                           color: Colors.grey,
                         ),
                       )),
                 ),
                           ),
              ),
              ]),
             
              // AppBar(
              //   backgroundColor:const Color(0xFFF9F8FD),
              //   elevation: 0,
              //   leading: InkWell(
              //       onTap: () {
              //         Get.back();
              //       },
              //       child: Image.asset('assets/images/Icon awesome-arrow-right.png')),
              //   title: Text(
              //     'Plan your trip with us.',
              //     style: TextStyle(
              //         fontSize: 25, fontWeight: FontWeight.w600, color: kblue),
              //   ),
              // ),
            ])),
          body: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 20 ),
            child: SingleChildScrollView(
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Text(
                                     'Categories',
                                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                                   ),
                   ),
                   ksizedbox10,
                  Container(
                    height: 60,
                    width: size.width,
                    child: GetBuilder<HolidayPackageController>(builder: (_) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: holidayPackageController.packageCategoryData
                            .length, // Replace witsh your desired number of items
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                holidayPackageController.tripindex(index);
                                 holidayPackageController.getPackage(
                                categoryId: holidayPackageController
                                    .packageCategoryData[index].id
                                    .toString());
                               holidayPackageController.searchInt(
                                holidayPackageController
                                    .getPackageDetailsData[index].id);
                                holidayPackageController.update();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: holidayPackageController.tripindex.value ==
                                            index
                                        ? kyellow
                                        : kwhite,
                                    borderRadius: BorderRadius.circular(15)),
                                height: 50,
                                width: 110,
                  
                                // Replace with your desired color
                                child: Center(
                                  child: Text(
                                    holidayPackageController
                                        .packageCategoryData[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: holidayPackageController.tripindex.value ==
                                              index
                                          ? kwhite
                                          : kyellow,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        // separatorBuilder: (BuildContext context, int index) {
                        //   return Divider(
                        //     height: 2,
                        //   );
                        // },
                      );
                    }),
                  ),
                  ksizedbox10,
                  Container(
                    child: holiday_listview()),ksizedbox30,
                ],
              ),
            ),
          )

          // TabBarView(
          //   children: [
          //     holiday_listview(),
          //     holiday_listview(),
          //     holiday_listview(),
          // ]),
          );
    });
  }

  Column holiday_listview() {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ksizedbox10,
        Row(
          children: [
            kwidth10,
            Text(
              'Populars',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            kwidth10,
          ],
        ),
        ksizedbox20,
        // InkWell(onTap: (){
        //   Get.to( HolidayScreen());
        //   },
        //   child:
        // ),
        Container(
          height: 260,
          child: holidayPackageController.packageListData.isEmpty
              ? const Center(
                  child: Text("No Data Found"),
                )
              : ListView.builder(
                  itemCount: holidayPackageController.packageListData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(HolidayScreen(
                              packageId: holidayPackageController
                                  .packageListData[index].id
                                  .toString()));
                          //packageId: holidayPackageController.packageListData[index].id.toString(),
                        },
                        child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(19)),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(19),
                                child: Image.network(
                                  holidayPackageController
                                      .packageListData[index].images.first,
                                  height: 150,
                                  width: 165,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        holidayPackageController
                                            .packageListData[index].title,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    //Image.asset('assets/images/location-svgrepo-com (1).png'),kwidth5,
                                    Text(
                                      'Jordan',
                                      style:
                                          TextStyle(fontSize: 13, color: kgrey),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
        ),
        ksizedbox30,
        Row(
          children: [
            kwidth10,
            Text(
              'Recommended',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        ksizedbox30,
        Container(
          height: 70,
          child: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              kwidth10,
              holiday_widget2(),
              kwidth10,
              holiday_widget2(),
              kwidth10,
              holiday_widget2(),
              kwidth10,
              holiday_widget2(),
            ],
          ),
        )
      ],
    );
  }

  Container holiday_widget2() {
    return Container(
      decoration:
          BoxDecoration(color: kwhite, borderRadius: BorderRadius.circular(25)),
      width: 200,
      height: 69,
      child: Row(
        children: [
          kwidth5,
          Image.asset('assets/images/pexels-senuscape-1658967.png'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Grindelwald',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    //Image.asset( 'assets/images/location-svgrepo-com (1).png'),kwidth5,
                    Text(
                      'Jordan',
                      style: TextStyle(fontSize: 13, color: kgrey),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
