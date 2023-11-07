import 'dart:io';

import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/controller/business_controller/business_service_controller.dart';
import 'package:bciweb/controller/service_controller/home_controller.dart';
import 'package:bciweb/models/service_model.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/drawer_business.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/respo_business_offers/respo_business_last_offers.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:date_format/date_format.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RespoBusinessOffers extends StatefulWidget {
  const RespoBusinessOffers({super.key});

  @override
  State<RespoBusinessOffers> createState() => _RespoBusinessOffersState();
}

class _RespoBusinessOffersState extends State<RespoBusinessOffers> {
  final authController = Get.find<AuthController>();
final servicesController = Get.find<BusinessServiceController>();

  var merchantCategory;
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var bsValueController = TextEditingController();
  var claimUserController = TextEditingController();
  var discountValueController = TextEditingController();
  final startatController = TextEditingController();
  final endatController = TextEditingController();

  File? image;

  DateTime date1 = DateTime.now();
  DateTime date = DateTime.now();

  String selectdt = formatDate(DateTime.now(), [
    yyyy,
    "-",
    mm,
    "-",
    dd,
  ]);

  String selectdt1 = formatDate(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      [yyyy, "-", mm, "-", dd]);

  _showDatePicker(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        builder: ((context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: kblue,
                onPrimary: Colors.white,
                onSurface: Colors.blue,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: const Color.fromARGB(255, 42, 59, 158),
                ),
              ),
            ),
            child: child!,
          );
        }));

    if (picked != null) {
      setState(() {
        date1 = picked;
        selectdt = formatDate(date1, [
          yyyy,
          "-",
          mm,
          "-",
          dd,
        ]);
      });
      // serviceController.dateFilterBooking(
      //     fromdate: selectdt,
      //     todate: selectdt1);
    }
  }

  _showDatePicker1(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        builder: ((context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: kblue,
                onPrimary: Colors.white,
                onSurface: Colors.blue,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: const Color.fromARGB(255, 42, 59, 158),
                ),
              ),
            ),
            child: child!,
          );
        }));

    if (picked != null) {
      setState(() {
        date = picked;
        selectdt1 = formatDate(date, [
          yyyy,
          "-",
          mm,
          "-",
          dd,
        ]);
      });
      // serviceController.dateFilterBooking(
      //     fromdate: selectdt,
      //     todate: selectdt1);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.getCategoryList();
    servicesController.getServicesByVendor();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

    appBar: PreferredSize(
        child: AppBarMob(),
        preferredSize: Size(double.infinity, 40),
      ),
      drawer: DrawerBusiness(),


      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text(
                'Offer Title',
                style: TextStyle(
                    fontSize: 23, fontWeight: FontWeight.bold, color: kblue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: titleController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "Title Can't be Empty";
                //   }
                //   return null;
                // },

                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xff707070))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xff707070))),
                    isCollapsed: false,
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.only(top: 18, bottom: 18, left: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xff707070))),
                    hintText: "Your Offer Title",
                    hintStyle: TextStyle(
                      color: kblue,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ),
            ksizedbox10,
            // GetBuilder<AuthController>(builder: (_) {
            //   return Padding(
            //     padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
            //     child: Container(
            //       height: 44,
            //       width: size.width,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(3),
            //           border: Border.all(
            //               color: const Color.fromARGB(255, 5, 5, 5)
            //                   .withOpacity(0.8))),
            //       child: Padding(
            //         padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            //         child: DropdownButton<CategoryList>(
            //           value: merchantCategory,
            //           isExpanded: true,
            //           icon: const Icon(Icons.keyboard_arrow_down_outlined),
            //           elevation: 0,
            //           itemHeight: 55,
            //           isDense: true,
            //           dropdownColor: Colors.grey[250],
            //           style: const TextStyle(color: Colors.black54),
            //           hint: Text(
            //             "Product",
            //             style: TextStyle(fontSize: 16, color: kblue),
            //           ),
            //           onChanged: (CategoryList? value) {
            //             setState(() {
            //               merchantCategory = value!;
            //             });
            //           },
            //           items: authController.categoryList
            //               .map<DropdownMenuItem<CategoryList>>(
            //                   (CategoryList value) {
            //             return DropdownMenuItem<CategoryList>(
            //               value: value,
            //               child: Text(value.title),
            //             );
            //           }).toList(),
            //         ),
            //       ),
            //     ),
            //   );
            // }),
            GetBuilder<HomeServiceController>(builder: (_) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 55,
                  width: size.width,
                  child: DropdownSearch<ServiceData>(
                    itemAsString: (ServiceData u) => u.title,
                    popupProps: PopupProps.menu(
                      showSelectedItems: false,
                      showSearchBox: true,
                      menuProps:
                          MenuProps(borderRadius: BorderRadius.circular(15)),
                      searchFieldProps: const TextFieldProps(),
                    ),
                  //R  items: servicesController.serviceDataList,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          // labelText: "Department *",
                          hintText: "Products",
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff707070)),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff707070)),
                              borderRadius: BorderRadius.circular(5)),
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff707070)),
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    onChanged: (value) {
                      setState(() {
                        // authController
                        //     .isDesignationSelected(false);
                        merchantCategory = value!;
                        // requiremtsSelected = null;
                      });
                    },
                    // selectedItem: selectedState,
                  ),
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: TextFormField(
                controller: discountValueController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "Title Can't be Empty";
                //   }
                //   return null;
                // },
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xff707070))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xff707070))),
                    isCollapsed: false,
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.only(top: 18, bottom: 18, left: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xff707070))),
                    hintText: "Discount Value",
                    hintStyle: TextStyle(
                      color: kblue,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: TextFormField(
                controller: claimUserController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "Title Can't be Empty";
                //   }
                //   return null;
                // },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xff707070))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xff707070))),
                    isCollapsed: false,
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.only(top: 18, bottom: 18, left: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xff707070))),
                    hintText: "Claim User",
                    hintStyle: TextStyle(
                      color: kblue,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ),

            ksizedbox10,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Starts At",
                        style: TextStyle(
                            color: kblue,
                            fontSize: 15.9,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ksizedbox10,
                      InkWell(
                        onTap: () {
                          _showDatePicker(context);
                        },
                        child: Container(
                          height: 35,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0xff707070)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                selectdt,
                                style: TextStyle(color: kblue),
                              ),
                              Icon(
                                Icons.edit_calendar,
                                color: kgrey,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ends At",
                        style: TextStyle(
                            color: kblue,
                            fontSize: 15.9,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ksizedbox10,
                      InkWell(
                        onTap: () {
                          _showDatePicker1(context);
                        },
                        child: Container(
                          height: 35,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0xff707070)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                selectdt1,
                                style: TextStyle(color: kblue),
                              ),
                              Icon(
                                Icons.edit_calendar,
                                color: kgrey,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              child: InkWell(
                // onTap: () async {
                //   final ImagePicker picker = ImagePicker();
                //   // Pick an image
                //   final XFile? tempimage =
                //       await picker.pickImage(source: ImageSource.gallery);

                //   setState(() {
                //     image = File(tempimage!.path);
                //   });
                // },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.4,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 232, 232, 232)),
                  child: image != null
                      ? Image.file(image!)
                      : Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Image.asset(
                                      'assets/images/avaiimageupload.png',
                                      color: kgrey,
                                    ),
                                  ),
                                ]),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Upload Offer Banner',
                                    style:
                                        TextStyle(fontSize: 18, color: kblue),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: descriptionController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLines: 5,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xff707070))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xff707070))),
                    isCollapsed: false,
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xff707070))),
                    hintText: "Description",
                    hintStyle: TextStyle(
                      color: kblue,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ),
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kblue,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 50)),
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        merchantCategory != null &&
                        claimUserController.text.isNotEmpty &&
                        discountValueController.text.isNotEmpty &&
                        image != null) {
                      servicesController.addTodayOffers(
                        image: image!.path,
                        title: titleController.text,
                        category: merchantCategory.id.toString(),
                        startsat: selectdt,
                        endsat: selectdt1,
                        discountValue: discountValueController.text,
                        claimUser: claimUserController.text,
                      );
                    } else {
                      Get.rawSnackbar(
                          backgroundColor: Colors.red,
                          messageText: Text(
                            "Fill All the Fields",
                            style: primaryFont.copyWith(color: Colors.white),
                          ));
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 21, color: kwhite),
                  )),
            ),
            ksizedbox20,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kyellow,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.8, 50)),
                  onPressed: () {
                    Get.to(const LastOffers());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Last Offers',
                        style: TextStyle(fontSize: 21, color: kwhite),
                      ),
                     const Icon(Icons.arrow_forward)
                    ],
                  )),
            ),
            ksizedbox20
          ],
        ),
      ]),
    );
  }
}
