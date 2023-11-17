import 'dart:io';

import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/models/category_model.dart';
import 'package:bciweb/registerhomescreen/business_common_reg_bottom.dart';
import 'package:bciweb/views/business/services_screens/addservice_timeslot_screen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../../constant/constans.dart';
import '../../../controller/business_controller/business_service_controller.dart';
import '../../../models/business_model/createservice_model.dart';
import '../../../models/service_model.dart' as ss;
import '../../../registerhomescreen/business_comm_homecontainer.dart';
import '../../members/common_widget/business_common_screen.dart';

class UpdateServicesView extends StatefulWidget {
  ss.ServiceData serviceData;
  UpdateServicesView({super.key, required this.serviceData});

  @override
  State<UpdateServicesView> createState() => _AddServicesViewState();
}

class _AddServicesViewState extends State<UpdateServicesView> {
  final authController = Get.find<AuthController>();
  final serviceController = Get.find<BusinessServiceController>();
  List<String>? initialTags = [];

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
  var shareOptionController = TextEditingController();
  var unitController = TextEditingController();
  var quantityController = TextEditingController();
  var cGstController = TextEditingController();
  var sGstController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
    checkIfCategory();
    // authController.getSubCategoryList();
    setDefault();
  }

  checkIfCategory() async {
    await authController.getCategoryList();
    for (int i = 0; i < authController.categoryData.length; i++) {
      if (widget.serviceData.categoryId.toString() ==
          authController.categoryData[i].id.toString()) {
        print("----->> available");
        print(authController.categoryData[i].title);
        setState(() {
          merchantCategory = authController.categoryData[i];
        });
      }
    }
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

  var productImage;

  String productCategoryHint = 'Product Category Name';

  bool available = true;

  List<Widget> itemPhotosWidgetList = <Widget>[];

  List<Uint8List>? images = [];

  Future<void> loadAssets() async {
    try {
      List<Uint8List>? bytesFromPicker =
          await ImagePickerWeb.getMultiImagesAsBytes();

      bytesFromPicker!.forEach((element) {
        setState(() {
          images!.add(element);
        });
      });

      print("---------------->> ");

      print(images!.length);
    } on Exception catch (e) {
      // Handle exception
    }

    if (!mounted) return;
  }

  setDefault() {
    serviceTitleController.text = widget.serviceData.title;
    saleAmountController.text = widget.serviceData.saleAmount;
    actualAmountController.text = widget.serviceData.actualAmount;
    // bvcAmountController.text = widget.serviceData.bvcAmount;
    descriptionController.text = widget.serviceData.description;
    couponAmountController.text = widget.serviceData.couponAmount ?? "";
    offerAmountController.text = widget.serviceData.offerUptoAmount ?? "";
    offerPercentageController.text = widget.serviceData.offerPercentage ?? "";
    unitController.text = widget.serviceData.unit ?? "";
    quantityController.text = widget.serviceData.quantity ?? "";
    cGstController.text = widget.serviceData.cgst ?? "";
    sGstController.text = widget.serviceData.sgst ?? "";
    // productCategoryHint =  widget.serviceData.categoryId;
    //  _controller!. = "updated";
    // setState(() {
    //   cgstPercentage = widget.serviceData.cgst != null
    //       ? int.parse(widget.serviceData.cgst)
    //       : null;
    //   sgstPercentage = widget.serviceData.sgst != null
    //       ? int.parse(widget.serviceData.sgst)
    //       : null;
    // productImage = widget.serviceData.images;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(
          "------------------>> is recomended = ${widget.serviceData.isRecomended}");
      setState(() {
        available = widget.serviceData.isRecomended == "0" ? true : false;
      });
    });
    // });
  }

  //List share = ["fixed","percentage"];

  //var shareValue;

  var shareValue;

  List<int> gstPercentageList = [5, 12, 18, 28];

  var cgstPercentage;
  var sgstPercentage;
  var gstPercentage;

  var productNetworkImage;

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
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                  height: 205,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                      'assets/images/businesscreatecouponhomescreen.png',
                      fit: BoxFit.cover)),
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: Center(
                  child: Text('UPDATE SERVICE',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: kwhite)),
                ),
              )
            ],
          ),
          ksizedbox40,

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.25,
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
                            labelText: "Service title",
                            hintStyle: TextStyle(
                              color: kblue,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                    ksizedbox30,
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: GetBuilder<AuthController>(builder: (_) {
                        return Container(
                          height: 50,
                          width: size.width * 0.25,
                          child: DropdownSearch<CategoryData>(
                            itemAsString: (CategoryData u) => u.title,
                            selectedItem: merchantCategory,
                            popupProps: PopupProps.menu(
                              showSelectedItems: false,
                              showSearchBox: true,
                              menuProps: MenuProps(
                                  borderRadius: BorderRadius.circular(15)),
                              searchFieldProps: const TextFieldProps(),
                            ),
                            items: authController.categoryData,
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  // labelText: "Department *",
                                  hintText: productCategoryHint,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xff707070)),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xff707070)),
                                      borderRadius: BorderRadius.circular(5)),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xff707070)),
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
                        );
                      }),
                    ),
                    ksizedbox30,
                    ksizedbox20,
                    Container(
                      height: 55,
                      width: size.width * 0.25,
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
                            labelText: "Actual Amount",
                            hintStyle: TextStyle(
                              color: kblue,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                ),
                child: InkWell(
                  onTap: loadAssets,
                  child: Container(
                    height: 235,
                    width: 250,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 232, 232, 232)),
                    child: images!.isNotEmpty
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemCount: images!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: StreamBuilder<Object>(
                                          stream: null,
                                          builder: (context, snapshot) {
                                            return Stack(
                                              children: [
                                                Image.memory(
                                                  images![index],
                                                  height: 100,
                                                  width: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ],
                                            );
                                          }),
                                    ),
                                    Positioned(
                                        left: 70,
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                images?.removeAt(index);
                                              });
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                color: kwhite,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(8),
                                                        bottomLeft:
                                                            Radius.circular(8)),
                                              ),
                                              child: const Icon(
                                                CupertinoIcons.delete,
                                                color: Colors.grey,
                                              ),
                                            ))),
                                  ],
                                ),
                              );
                            })

                        // GridView.builder(
                        //     shrinkWrap: true,
                        //     gridDelegate:
                        //         SliverGridDelegateWithFixedCrossAxisCount(
                        //       crossAxisCount: 3,
                        //     ),
                        //     itemCount: images!.length,
                        //     itemBuilder: (context, index) {
                        //       return Image.memory(
                        //         images![index],
                        //         width: 300,
                        //         height: 300,
                        //       );
                        //     },
                        //   )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ksizedbox10,
                              Image.asset(
                                'assets/images/photouploadimage.png',
                                height: 100,
                                fit: BoxFit.fitHeight,
                                color: kgrey,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Product Imagee',
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
            ],
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

          ksizedbox30,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Container(
                  height: 40,
                  width: size.width * 0.25,
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
                        labelText: "Sale Amount",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
              GetBuilder<AuthController>(builder: (_) {
                return Container(
                  height: 40,
                  width: size.width * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                          color: const Color.fromARGB(255, 5, 5, 5)
                              .withOpacity(0.8))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: DropdownButton<int>(
                      value: gstPercentage,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      elevation: 0,
                      itemHeight: 50,
                      isDense: true,
                      dropdownColor: Colors.grey[250],
                      style: const TextStyle(color: Colors.black54),
                      hint: Text(
                        "GST",
                        style: TextStyle(fontSize: 16, color: kblue),
                      ),
                      onChanged: (int? value) {
                        setState(() {
                          gstPercentage = value;
                          cgstPercentage = value! / 2;
                          sgstPercentage = value / 2;
                          cGstController.text = cgstPercentage.toString();
                          sGstController.text = sgstPercentage.toString();
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
                );
              }),
            ],
          ),
          ksizedbox20,

          Padding(
            padding: const EdgeInsets.only(left: 190, right: 15),
            child: Row(
              children: [
                Container(
                  width: 300,
                  child: InkWell(
                    onTap: () {
                      Get.to(TimeSlotScreen());
                    },
                    child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.25,
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
                                'Time Slot',
                                style: TextStyle(fontSize: 16, color: kwhite),
                              ),
                            ),
                            ksizedbox10,
                            kwidth10,
                            Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.add_circle_outline,
                                  color: kwhite,
                                ))
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),

          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(left: 190, right: 15),
            child: Row(
              children: [
                Text(
                  "Service Available",
                  style: TextStyle(
                      color: kblue, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Switch(
                  activeColor: kOrange,
                  activeTrackColor: kblue,
                  value: available,
                  onChanged: (bool value) {
                    setState(() {
                      available = value;
                    });
                  },
                ),
              ],
            ),
          ),

          ksizedbox10,

          ksizedbox10,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Container(
                  height: 55,
                  width: size.width * 0.25,
                  child: TextFormField(
                    controller: cGstController,
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
                        labelText: "CGST",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
              Container(
                height: 55,
                width: size.width * 0.25,
                child: TextFormField(
                  controller: sGstController,
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
                          borderSide:
                              const BorderSide(color: Color(0xff707070))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: Color(0xff707070))),
                      isCollapsed: false,
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: Color(0xff707070))),
                      labelText: "SGST",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
            ],
          ),

          ksizedbox30,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Container(
                  height: 55,
                  width: size.width * 0.25,
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
                        labelText: "Quantity",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
              Container(
                height: 55,
                width: size.width * 0.25,
                child: TextFormField(
                  controller: unitController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Unit Can't be Empty";
                    }
                    return null;
                  },
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
                      contentPadding:
                          const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: Color(0xff707070))),
                      labelText: "Unit",
                      hintStyle: TextStyle(
                        color: kblue,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
            ],
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
          ksizedbox30,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Container(
                  height: 60,
                  width: size.width * 0.27,
                  child: TextFieldTags(
                    textfieldTagsController: _controller,
                    initialTags: const [],
                    textSeparators: const [','],
                    letterCase: LetterCase.normal,
                    validator: (String tag) {
                      if (tag == 'php') {
                        return 'No, please just no';
                      } else if (_controller!.getTags!.contains(tag)) {
                        return 'you already entered that';
                      }
                      return null;
                    },
                    inputfieldBuilder:
                        (context, tec, fn, error, onChanged, onSubmitted) {
                      return ((context, sc, tags, onTagDelete) {
                        if (tags.isEmpty) {
                          widget.serviceData.amenties!.forEach((element) {
                            tags.add(element.value);
                          });
                        }
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            controller: tec,
                            focusNode: fn,
                            decoration: InputDecoration(
                              isDense: true,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 74, 137, 92),
                                  width: 3.0,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 74, 137, 92),
                                  width: 3.0,
                                ),
                              ),
                              labelText: 'Enter Amenties',
                              helperStyle: TextStyle(
                                color: kblue,
                              ),
                              hintText: _controller!.hasTags
                                  ? ''
                                  : "Enter Amenties...",
                              errorText: error,
                              prefixIconConstraints:
                                  BoxConstraints(maxWidth: 300),
                              prefixIcon: tags.isNotEmpty
                                  ? SingleChildScrollView(
                                      controller: sc,
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                          children: tags.map((String tag) {
                                        return Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                            color: Color.fromARGB(
                                                255, 74, 137, 92),
                                          ),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                child: Text(
                                                  '$tag',
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onTap: () {
                                                  print("$tag selected");
                                                },
                                              ),
                                              const SizedBox(width: 4.0),
                                              InkWell(
                                                child: const Icon(
                                                  Icons.cancel,
                                                  size: 14.0,
                                                  color: Color.fromARGB(
                                                      255, 233, 233, 233),
                                                ),
                                                onTap: () {
                                                  onTagDelete(tag);
                                                },
                                              )
                                            ],
                                          ),
                                        );
                                      }).toList()),
                                    )
                                  : null,
                            ),
                            onChanged: onChanged,
                            onSubmitted: onSubmitted,
                          ),
                        );
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Container(
                  height: 75,
                  width: size.width * 0.25,
                  child: TextFormField(
                    controller: descriptionController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Description can't be empty";
                      }
                      return null;
                    },
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
                        labelText: "Description",
                        hintStyle: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
            ],
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
                        hintText: "Offer Percentage",
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
                        hintText: "Offer Upto Amount",
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
                    hintText: "Coupon Amount",
                    hintStyle: TextStyle(
                      color: kblue,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ),
          ksizedbox20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 54,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(color: kgrey.withOpacity(0.5)),
                    child: Center(
                        child: Text(
                      'CANCEL',
                      style: TextStyle(
                          fontSize: 18,
                          color: kblue,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: serviceController.isLoading.isTrue
                      ? Container(
                          height: 54,
                          width: size.width * 0.25,
                          decoration: BoxDecoration(
                              //borderRadius: BorderRadius.circular(20),
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

                            CategoryData? categoryModel;
                            if (merchantCategory != null) {
                              categoryModel = merchantCategory as CategoryData;
                            }

                            CreateServiceModel createServiceModel =
                                CreateServiceModel(
                                    offerPercentage:
                                        offerPercentageController.text.isEmpty
                                            ? null
                                            : offerPercentageController.text,
                                    actualAmount: actualAmountController.text,
                                    amenities: listTags,
                                    // share: shareValue,
                                    booking:
                                        authController.isGstAvailable.isTrue
                                            ? "1"
                                            : "0",
                                    // bvcAmount: bvcAmountController.text,
                                    category: categoryModel == null
                                        ? widget.serviceData.categoryId
                                            .toString()
                                        : categoryModel.id.toString(),
                                    description: descriptionController.text,
                                    available: available ? "0" : "1",
                                    image: images,
                                    isCouponsAvailable:
                                        isCouponEligible ? "1" : "0",
                                    isOfferAvailable:
                                        isOfferEligible ? "1" : "0",
                                    saleAmount: saleAmountController.text,
                                    title: serviceTitleController.text,
                                    couponAmount:
                                        couponAmountController.text.isEmpty
                                            ? null
                                            : couponAmountController.text,
                                    offerAmount:
                                        offerAmountController.text.isEmpty
                                            ? null
                                            : offerAmountController.text,
                                    cgst: cgstPercentage,
                                    sgst: sgstPercentage);

                            serviceController.updateServices(
                                createServiceModel: createServiceModel,
                                id: widget.serviceData.id);
                          },
                          child: Container(
                            height: 55,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(20),
                                color: kblue),
                            alignment: Alignment.center,
                            child: Text(
                              "update",
                              style: primaryFont.copyWith(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),

          ksizedbox40,
          businessRegisterCommonBottom()
        ],
      ),
    );
  }
}
