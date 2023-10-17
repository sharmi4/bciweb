import 'dart:io';
import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/controller/service_controller/home_controller.dart';
import 'package:bciweb/models/business_model/createservice_model.dart';
import 'package:bciweb/models/category_model.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/drawer_business.dart';
import 'package:bciweb/views/profile_register_page/my_account/wigits.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:date_format/date_format.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

class RespoBusinessAddServices extends StatefulWidget {
  const RespoBusinessAddServices({super.key});

  @override
  State<RespoBusinessAddServices> createState() =>
      _RespoBusinessAddServicesState();
}

class _RespoBusinessAddServicesState extends State<RespoBusinessAddServices> {
  String? _setTime, _setDate;

  String? _hour, _minute, _time;

  String? dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _endtimeController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();

  dynamic startTime, endTime;

  Future<Null> _startTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour! + ' : ' + _minute!;
        // _startTimeController.text = _time!;
        _startTimeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
        print(_hour);
        startTime = "${_hour}:${_minute}";
      });
  }

  Future<Null> _endtime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour! + ' : ' + _minute!;
        _endtimeController.text = _time!;
        _endtimeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
        endTime = "${_hour}:${_minute}";
      });
  }

  final authController = Get.find<AuthController>();
  final serviceController = Get.find<HomeServiceController>();

  var merchantCategory;
  var serviceImage;
  var serviceTitleController = TextEditingController();
  var saleAmountController = TextEditingController();
  var actualAmountController = TextEditingController();
  var bvcAmountController = TextEditingController();
  var descriptionController = TextEditingController();
  var couponAmountController = TextEditingController();
  var offerAmountController = TextEditingController();
  var offerPercentageController = TextEditingController();
  var unitController = TextEditingController();
  var quantityController = TextEditingController();

  var cgstController = TextEditingController();
  var sgstController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authController.getCategoryList();
    authController.getSubCategoryList();
    _controller = TextfieldTagsController();
    _startTimeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    _endtimeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
  }

  double? _distanceToField;
  TextfieldTagsController? _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  bool isOfferEligible = false;
  bool isCouponEligible = false;

  // List share = ["fixed","percentage"];

  var shareValue;
  List<int> gstPercentageList = [5, 12, 18, 28];

  var gstPercentage;
  var cgstPercentage;
  var sgstPercentage;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarMob(),
        preferredSize: Size(double.infinity, 40),
      ),
      drawer: DrawerBusiness(),
  
  
  
  
  
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: TextFormField(
              controller: serviceTitleController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Title Can't be Empty";
                }
                return null;
              },
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
                  labelText: "Product title *",
                  hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          ksizedbox10,
        const SizedBox(
          height: 15,
         ),
          // GetBuilder<AuthController>(builder: (_) {
          //   return Padding(
          //     padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          //     child: Container(
          //       height: 44,
          //       width: 330,
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
          //             "Product Category Name",
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

          GetBuilder<AuthController>(builder: (_) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 55,
                  width: size.width,
                  child: DropdownSearch<CategoryData>(
                    itemAsString: (CategoryData u) => u.title,
                    selectedItem: merchantCategory,
                    popupProps: PopupProps.menu(
                      showSelectedItems: false,
                      showSearchBox: true,
                      menuProps: MenuProps(borderRadius: BorderRadius.circular(15)),
                      searchFieldProps: const TextFieldProps(),
                    ),
                    items: authController.categoryList,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          // labelText: "Department *",
                          hintText: "Product Category Name *",
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
            }
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: TextFormField(
              controller: actualAmountController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Actual amount Can't be Empty";
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
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
                  labelText: "Actual Amount *",
                  hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: TextFormField(
              controller: saleAmountController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Sale Amount Can't be Empty";
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
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
                  labelText: "Sale Amount *",
                  hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          ksizedbox10,
          GetBuilder<AuthController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
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
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ksizedbox10,
                      InkWell(
                        onTap: () {
                          _startTime(context);
                        },
                        child: Container(
                            height: 32,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: const Color(0xff707070)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(_startTimeController.text),
                            )),
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
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ksizedbox10,
                      InkWell(
                        onTap: () {
                          _endtime(context);
                        },
                        child: Container(
                            height: 32,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: const Color(0xff707070)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(_endtimeController.text),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          ksizedbox10,
          GetBuilder<AuthController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Container(
                height: 55,
                width: 330,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                        color: const Color.fromARGB(255, 5, 5, 5)
                            .withOpacity(0.8))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: DropdownButton<int>(
                    value: gstPercentage,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    elevation: 0,
                    itemHeight: 55,
                    isDense: true,
                    dropdownColor: Colors.grey[250],
                    style: const TextStyle(color: Colors.black54),
                    hint: Text(
                      "GST *",
                      style: TextStyle(fontSize: 16, color: kblue),
                    ),
                    onChanged: (int? value) {
                      setState(() {
                        gstPercentage = value!;
                        cgstPercentage = gstPercentage/2;
                        sgstPercentage = gstPercentage/2;
                        cgstController.text = cgstPercentage.toString();
                        sgstController.text = cgstPercentage.toString();
                      });
                    },
                    items: gstPercentageList
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text("$value%"),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }),
          ksizedbox10,
          // GetBuilder<AuthController>(builder: (_) {
          //   return Padding(
          //     padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          //     child: Container(
          //       height: 44,
          //       width: 330,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(3),
          //           border: Border.all(
          //               color: const Color.fromARGB(255, 5, 5, 5)
          //                   .withOpacity(0.8))),
          //       child: Padding(
          //         padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          //         child: DropdownButton<int>(
          //           value: sgstPercentage,
          //           isExpanded: true,
          //           icon: const Icon(Icons.keyboard_arrow_down_outlined),
          //           elevation: 0,
          //           itemHeight: 55,
          //           isDense: true,
          //           dropdownColor: Colors.grey[250],
          //           style: const TextStyle(color: Colors.black54),
          //           hint: Text(
          //             "SGST",
          //             style: TextStyle(fontSize: 16, color: kblue),
          //           ),
          //           onChanged: (int? value) {
          //             setState(() {
          //               sgstPercentage = value!;
          //             });
          //           },
          //           items: gstPercentageList
          //               .map<DropdownMenuItem<int>>((int value) {
          //             return DropdownMenuItem<int>(
          //               value: value,
          //               child: Text("$value%"),
          //             );
          //           }).toList(),
          //         ),
          //       ),
          //     ),
          //   );
          // }),
           // ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: TextFormField(
              controller: cgstController,
              readOnly: true,
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "CGST Can't be Empty";
                }
                return null;
              },
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
                  labelText: "CGST",
                  hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
           ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: TextFormField(
              controller: sgstController,
              readOnly: true,
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "SGST Can't be Empty";
                }
                return null;
              },
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
                  labelText: "SGST",
                  hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: TextFormField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Quantity Can't be Empty";
                }
                return null;
              },
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
                  labelText: "Quantity *",
                  hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: TextFormField(
              controller: unitController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return "Unit Can't be Empty";
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
                  labelText: "Unit",
                  hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),

          // ksizedbox10,
          // Padding(
          //     padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          //     child: Container(
          //       height: 44,
          //       width: 330,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(3),
          //           border: Border.all(
          //               color: const Color.fromARGB(255, 5, 5, 5)
          //                   .withOpacity(0.8))),
          //       child: Padding(
          //         padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          //         child: DropdownButton<dynamic>(
          //           value: shareValue,
          //           isExpanded: true,
          //           icon: const Icon(Icons.keyboard_arrow_down_outlined),
          //           elevation: 0,
          //           itemHeight: 55,
          //           isDense: true,
          //           dropdownColor: Colors.grey[250],
          //           style: const TextStyle(color: Colors.black54),
          //           hint: Text(
          //             "Share Options",
          //             style: TextStyle(fontSize: 16, color: kblue),
          //           ),
          //           onChanged: (dynamic value) {
          //             setState(() {
          //               shareValue = value!;
          //             });
          //           },
          //           items: share
          //               .map<DropdownMenuItem<dynamic>>(
          //                   (dynamic value) {
          //             return DropdownMenuItem<dynamic>(
          //               value: value,
          //               child: Text(value),
          //             );
          //           }).toList(),
          //         ),
          //       ))),
          //       ksizedbox10,
          // Padding(
          //   padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          //   child: TextFormField(
          //     controller: bvcAmountController,
          //     autovalidateMode: AutovalidateMode.onUserInteraction,
          //     validator: (value) {
          //       if (value!.isEmpty) {
          //         return "BCI amount Can't be Empty";
          //       }
          //       return null;
          //     },
          //     keyboardType: TextInputType.phone,
          //     inputFormatters: [
          //       LengthLimitingTextInputFormatter(10),
          //       FilteringTextInputFormatter.digitsOnly,
          //       FilteringTextInputFormatter.deny(RegExp(r'\s')),
          //     ],
          //     decoration: InputDecoration(
          //         fillColor: Colors.white,
          //         filled: true,
          //         enabledBorder: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(5),
          //             borderSide: const BorderSide(color: Color(0xff707070))),
          //         focusedBorder: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(5),
          //             borderSide: const BorderSide(color: Color(0xff707070))),
          //         isCollapsed: false,
          //         isDense: true,
          //         contentPadding:
          //             const EdgeInsets.only(top: 12, bottom: 12, left: 15),
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(5),
          //             borderSide: const BorderSide(color: Color(0xff707070))),
          //         hintText: "BCI Amount",
          //         hintStyle: TextStyle(
          //           color: kblue,
          //           fontWeight: FontWeight.w400,
          //         )),
          //   ),
          // ),
          //ksizedbox20,
          // Obx(
          //   () => Row(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(left: 20, right: 20),
          //         child: Text(
          //           "Booking Available",
          //           style: primaryFont.copyWith(color: kblue),
          //         ),
          //       ),
          //       InkWell(
          //         onTap: () {
          //           authController.isGstAvailable(true);
          //         },
          //         child: Container(
          //           height: 17,
          //           width: 17,
          //           decoration: BoxDecoration(
          //               border: Border.all(color: kblue),
          //               color: authController.isGstAvailable.isTrue
          //                   ? kblue
          //                   : Colors.white,
          //               borderRadius: BorderRadius.circular(10)),
          //         ),
          //       ),
          //       const SizedBox(
          //         width: 7,
          //       ),
          //       InkWell(
          //         onTap: () {
          //           authController.isGstAvailable(true);
          //         },
          //         child: Text(
          //           "Yes",
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //               fontSize: 17,
          //               fontWeight: FontWeight.w400,
          //               color: kblue),
          //         ),
          //       ),
          //       const SizedBox(
          //         width: 15,
          //       ),
          //       InkWell(
          //         onTap: () {
          //           authController.isGstAvailable(false);
          //         },
          //         child: Container(
          //           height: 17,
          //           width: 17,
          //           decoration: BoxDecoration(
          //               color: authController.isGstAvailable.isFalse
          //                   ? kblue
          //                   : Colors.white,
          //               border: Border.all(color: kblue),
          //               borderRadius: BorderRadius.circular(10)),
          //         ),
          //       ),
          //       const SizedBox(
          //         width: 7,
          //       ),
          //       InkWell(
          //         onTap: () {
          //           authController.isGstAvailable(false);
          //         },
          //         child: Text(
          //           "No",
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //               fontSize: 17,
          //               fontWeight: FontWeight.w400,
          //               color: kblue),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: InkWell(
              onTap: () async {
                final ImagePicker _picker = ImagePicker();
                // Pick an image
                final XFile? tempimage =
                    await _picker.pickImage(source: ImageSource.gallery);

                setState(() {
                  serviceImage = File(tempimage!.path);
                });
              },
              child: Container(
                height: 130,
                width: size.width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 215, 215, 213),
                    borderRadius: BorderRadius.circular(3)),
                child: serviceImage != null
                    ? Image.file(serviceImage!)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Icon(
                              Icons.cloud_upload,
                              color: Colors.grey,
                              size: 45,
                            ),
                          ),
                          ksizedbox10,
                          Text(
                            "Product Image",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: kblue),
                          ),
                        ],
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 7),
          //   child: TextFieldTags(
          //     textfieldTagsController: _controller,
          //     initialTags: const [],
          //     textSeparators: const [','],
          //     letterCase: LetterCase.normal,
          //     validator: (String tag) {
          //       if (tag == 'php') {
          //         return 'No, please just no';
          //       } else if (_controller!.getTags!.contains(tag)) {
          //         return 'you already entered that';
          //       }
          //       return null;
          //     },
          //     inputfieldBuilder:
          //         (context, tec, fn, error, onChanged, onSubmitted) {
          //       return ((context, sc, tags, onTagDelete) {
          //         return Padding(
          //           padding: const EdgeInsets.all(10.0),
          //           child: TextField(
          //             controller: tec,
          //             focusNode: fn,
          //             decoration: InputDecoration(
          //               isDense: true,
          //               border: const OutlineInputBorder(
          //                 borderSide: BorderSide(
          //                   color: Color.fromARGB(255, 74, 137, 92),
          //                   width: 3.0,
          //                 ),
          //               ),
          //               focusedBorder: const OutlineInputBorder(
          //                 borderSide: BorderSide(
          //                   color: Color.fromARGB(255, 74, 137, 92),
          //                   width: 3.0,
          //                 ),
          //               ),
          //               labelText: 'Enter Amenties',
          //               helperStyle: TextStyle(
          //                 color: kblue,
          //               ),
          //               hintText: _controller!.hasTags ? '' : "Enter Amenties...",
          //               errorText: error,
          //               prefixIconConstraints:
          //                   BoxConstraints(maxWidth: _distanceToField! * 0.74),
          //               prefixIcon: tags.isNotEmpty
          //                   ? SingleChildScrollView(
          //                       controller: sc,
          //                       scrollDirection: Axis.horizontal,
          //                       child: Row(
          //                           children: tags.map((String tag) {
          //                         return Container(
          //                           decoration: const BoxDecoration(
          //                             borderRadius: BorderRadius.all(
          //                               Radius.circular(20.0),
          //                             ),
          //                             color: Color.fromARGB(255, 74, 137, 92),
          //                           ),
          //                           margin: const EdgeInsets.symmetric(
          //                               horizontal: 5.0),
          //                           padding: const EdgeInsets.symmetric(
          //                               horizontal: 10.0, vertical: 5.0),
          //                           child: Row(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceBetween,
          //                             children: [
          //                               InkWell(
          //                                 child: Text(
          //                                   '$tag',
          //                                   style: const TextStyle(
          //                                       color: Colors.white),
          //                                 ),
          //                                 onTap: () {
          //                                   print("$tag selected");
          //                                 },
          //                               ),
          //                               const SizedBox(width: 4.0),
          //                               InkWell(
          //                                 child: const Icon(
          //                                   Icons.cancel,
          //                                   size: 14.0,
          //                                   color: Color.fromARGB(
          //                                       255, 233, 233, 233),
          //                                 ),
          //                                 onTap: () {
          //                                   onTagDelete(tag);
          //                                 },
          //                               )
          //                             ],
          //                           ),
          //                         );
          //                       }).toList()),
          //                     )
          //                   : null,
          //             ),
          //             onChanged: onChanged,
          //             onSubmitted: onSubmitted,
          //           ),
          //         );
          //       });
          //     },
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: TextFormField(
              controller: descriptionController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Description can't be empty";
                }
                return null;
              },
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
                  labelText: "Description",
                  hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          ksizedbox20,
          // Padding(
          //   padding: const EdgeInsets.only(left: 15),
          //   child: Row(
          //     children: [
          //       Container(
          //         width: 150,
          //         child: Text(
          //           "Offers Available: ",
          //           style: primaryFont.copyWith(
          //               color: kblue,
          //               fontSize: 17,
          //               fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //       Checkbox(
          //         checkColor: Colors.white,
          //         fillColor: MaterialStateProperty.all(kblue),
          //         value: isOfferEligible,
          //         onChanged: (bool? value) {
          //           setState(() {
          //             isOfferEligible = value!;
          //             isCouponEligible = !value;
          //           });
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          // ksizedbox20,
          // Padding(
          //   padding: const EdgeInsets.only(left: 15),
          //   child: Row(
          //     children: [
          //       Container(
          //         width: 150,
          //         child: Text(
          //           "Coupons Available: ",
          //           style: primaryFont.copyWith(
          //               color: kblue,
          //               fontSize: 17,
          //               fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //       Checkbox(
          //         checkColor: Colors.white,
          //         fillColor: MaterialStateProperty.all(kblue),
          //         value: isCouponEligible,
          //         onChanged: (bool? value) {
          //           setState(() {
          //             isCouponEligible = value!;
          //             isOfferEligible = !value;
          //           });
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          if (isOfferEligible)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: TextFormField(
                    // controller: emailIdController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Offer Percentage can't be empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Color(0xff707070))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Color(0xff707070))),
                        isCollapsed: false,
                        isDense: true,
                        contentPadding: const EdgeInsets.only(
                            top: 12, bottom: 12, left: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Color(0xff707070))),
                        labelText: "Offer Percentage",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                ksizedbox10,
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
                  child: TextFormField(
                    // controller: emailIdController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Offer Upto Amount can't be empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(7),
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Color(0xff707070))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Color(0xff707070))),
                        isCollapsed: false,
                        isDense: true,
                        contentPadding: const EdgeInsets.only(
                            top: 12, bottom: 12, left: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Color(0xff707070))),
                        labelText: "Offer Upto Amount",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ],
            ),

          if (isCouponEligible)
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: TextFormField(
                // controller: emailIdController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Coupon Amount can't be empty";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
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
                    labelText: "Coupon Amount",
                    hintStyle: TextStyle(
                      color: kblue,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ),
          ksizedbox20,
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: serviceController.isLoading.isTrue
                  ? Container(
                      height: 55,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kblue),
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        List<Amenty> listTags = [];

                        var tagsList = _controller!.getTags;

                        for (var i = 0; i < tagsList!.length; i++) {
                          listTags.add(Amenty(value: tagsList[i]));
                        }

                        CategoryData categoryModel =
                            merchantCategory as CategoryData;

                        CreateServiceModel createServiceModel =
                            CreateServiceModel(
                                offerPercentage:
                                    offerPercentageController.text.isEmpty
                                        ? null
                                        : offerPercentageController.text,
                                actualAmount: actualAmountController.text,
                                amenities: listTags,
                                // share: shareValue,
                                booking: authController.isGstAvailable.isTrue
                                    ? "1"
                                    : "0",
                                // bvcAmount: bvcAmountController.text,
                                category: categoryModel.id.toString(),
                                description: descriptionController.text,
                                image: serviceImage.path,
                                isCouponsAvailable:
                                    isCouponEligible ? "1" : "0",
                                isOfferAvailable: isOfferEligible ? "1" : "0",
                                saleAmount: saleAmountController.text,
                                title: serviceTitleController.text,
                                couponAmount:
                                    couponAmountController.text.isEmpty
                                        ? null
                                        : couponAmountController.text,
                                offerAmount: offerAmountController.text.isEmpty
                                    ? null
                                    : offerAmountController.text,
                                unit: unitController.text,
                                cgst: cgstPercentage,
                                sgst: sgstPercentage,
                                endTime: endTime,
                                startTime: startTime,
                                quantity: quantityController.text);

                        serviceController.addServices(
                            createServiceModel: createServiceModel);
                      },
                      child: Container(
                        height: 55,
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kblue),
                        alignment: Alignment.center,
                        child: Text(
                          "Submit",
                          style: primaryFont.copyWith(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
            ),
          ),
          ksizedbox20,
          // SizedBox(
          //   height: MediaQuery.of(context).viewInsets.bottom ,
          // )
        ],
      ),  );
  }
}
