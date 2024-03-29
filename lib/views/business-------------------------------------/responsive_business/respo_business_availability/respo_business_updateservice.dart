import 'dart:io';

import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/controller/business_controller/business_service_controller.dart';
import 'package:bciweb/models/business_model/createservice_model.dart';
import 'package:bciweb/models/category_model.dart';
import 'package:bciweb/models/service_model.dart'as ss;
import 'package:bciweb/views/business-------------------------------------/responsive_business/drawer_business.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:date_format/date_format.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';


class ResUpdateServicesView extends StatefulWidget {
  ss .ServiceData serviceData;
  ResUpdateServicesView({super.key, required this.serviceData});

  @override
  State<ResUpdateServicesView> createState() => _AddServicesViewState();
}

class _AddServicesViewState extends State<ResUpdateServicesView> {
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
    checkIfCategory() ;
    // authController.getSubCategoryList();
    setDefault();
  }

  checkIfCategory() async{
    await authController.getCategoryList();
    for(int i =0;i< authController.categoryList.length;i++){
      if(widget.serviceData.categoryId.toString() == authController.categoryList[i].id.toString()){
        print("----->> available");
        print(authController.categoryList[i].title);
        setState(() {
          merchantCategory = authController.categoryList[i];
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
    cGstController.text = widget.serviceData.cgst.toString();
    sGstController.text = widget.serviceData.sgst.toString();
    // productCategoryHint =  widget.serviceData.categoryId;
    //  _controller!. = "updated";
    // setState(() {
    //   cgstPercentage = widget.serviceData.cgst != null
    //       ? int.parse(widget.serviceData.cgst)
    //       : null;
    //   sgstPercentage = widget.serviceData.sgst != null
    //       ? int.parse(widget.serviceData.sgst)
    //       : null;
          productImage = widget.serviceData.images;
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
                      const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  labelText: "Service title",
                  hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
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
                    menuProps:
                        MenuProps(borderRadius: BorderRadius.circular(15)),
                    searchFieldProps: const TextFieldProps(),
                  ),
                  items: authController.categoryList,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        // labelText: "Department *",
                        hintText: productCategoryHint,
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
                      const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  labelText: "Actual Amount",
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
                      const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  labelText: "Sale Amount",
                  hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          ksizedbox10,
          GetBuilder<AuthController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Container(
                height: 44,
                width: size.width,
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
                    itemHeight: 55,
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
              ),
            );
          }),
          ksizedbox10,
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
                      const EdgeInsets.only(top: 12, bottom: 12, left: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff707070))),
                  labelText: "Quantity",
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
                  productImage = null;
                });
              },
              child: Container(
                height: 130,
                width: size.width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 215, 215, 213),
                    borderRadius: BorderRadius.circular(3)),
                child: productImage != null
                    ? Image.network(productImage!)
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
                            "Service Image",
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
          TextFieldTags(
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
                      hintText: _controller!.hasTags ? '' : "Enter Amenties...",
                      errorText: error,
                      prefixIconConstraints:
                          BoxConstraints(maxWidth: _distanceToField! * 0.74),
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
                                    color: Color.fromARGB(255, 74, 137, 92),
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
                                booking: authController.isGstAvailable.isTrue
                                    ? "1"
                                    : "0",
                                // bvcAmount: bvcAmountController.text,
                                category: categoryModel == null
                                    ? widget.serviceData.categoryId.toString()
                                    : categoryModel.id.toString(),
                                description: descriptionController.text,
                                image: serviceImage == null
                                    ? "null"
                                    : serviceImage.path,
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
                                    cgst: cgstPercentage,
                                    sgst: sgstPercentage
                                    );

                        serviceController.updateServices(
                            createServiceModel: createServiceModel,
                            id: widget.serviceData.id);
                      },
                      child: Container(
                        height: 55,
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kblue),
                        alignment: Alignment.center,
                        child: Text(
                          "update",
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
        ],
      ),
    );
  }
}
