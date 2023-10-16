
import 'dart:typed_data';

import 'package:bciweb/controller/auth_controller/auth_profile_controller.dart';
import 'package:bciweb/routes/app_pages.dart';
import 'package:date_format/date_format.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../../constant/constans.dart';
import '../../../controller/auth_controller/auth_controller.dart';
import '../../../controller/business_controller/business_service_controller.dart';
import '../../../models/business_model/createservice_model.dart';
import '../../../models/category_model.dart';
import '../../../registerhomescreen/business_comm_homecontainer.dart';
import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../members/common_widget/business_common_screen.dart';

class BusinessAddAvailabilityScreen extends StatefulWidget {
  const BusinessAddAvailabilityScreen({super.key});

  @override
  State<BusinessAddAvailabilityScreen> createState() => _BusinessAddAvailabilityScreenState();
}

class _BusinessAddAvailabilityScreenState extends State<BusinessAddAvailabilityScreen> {
   List<int> gstPercentageList = [5, 12, 18, 28];

  var gstPercentage;
   var cgstPercentage;
  var sgstPercentage;

   bool isOfferEligible = false;
  bool isCouponEligible = false;

   double? _distanceToField;
  TextfieldTagsController? _controller;
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
  var startdateController =TextEditingController();
  var enddateController = TextEditingController();
  var cgstController = TextEditingController();
  var sgstController = TextEditingController();
  var gstController = TextEditingController();
  var amentiesController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _controller = TextfieldTagsController();
    authController.getCategoryList();
   authController.getSubCategoryList();
   
  }
  

  DateTime date1 = DateTime.now();
  DateTime date = DateTime.now();

  String selectdt = formatDate(DateTime.now(), [
    yyyy,
    "-",
    mm,
    "-",
    dd,
  ]);
  dynamic imageprofile;
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

   final authController = Get.find<AuthController>();
   final businessserviceController = Get.find<BusinessServiceController>();
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
                     Stack(
                    children: [
                       Container(
                        height: 205,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset('assets/images/availabilitybackgroundimage.png',fit: BoxFit.cover)),
                    Positioned(
                      top: 0,
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Center(
                        child: Text('SERVICE CREATE', style: displayfont),
                      ),
                    )
                    ],
                  ),
                  ksizedbox10,
      //             Stack(
      //               children: [
      //                   Container(
      //             height: 240,
      //             width: MediaQuery.of(context).size.width,
      //             child: Image.asset('assets/images/bservicehomebackground.png',
      //             fit: BoxFit.fill,
      //             ),
      //           ),
      //           Positioned(
      //             top: 0,
      //             left: 0,
      //             right: 0,
      //             child:Container(
      //               height: 200,
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                 children: [
      //                   Text('New Coupons Create',
      //                   style: TextStyle(
      //                     color: kblue,
      //                   fontSize: 30,
      //                   fontWeight: FontWeight.bold
      //                   ),),
      //                    Container(
      //                     height: 9,
      //                     width: 60,
      //                     color: kOrange,
      //                   ),
      //                   Text('Create a coupon online with our powerful coupon generator.Coustomizable\n coupons.Make life esier by just selecting the best temple to\n personalize.Get access..',
      //                   maxLines: 3,
      //                   style: TextStyle(
                          
      //                     fontSize: 18,
                          
                  
      //                   ),)
      //                 ],
      //               ),
      //             ) 
      // )
      //               ],
      //             ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Row(
                      children: [
                        Text('Add Service',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: kblue
                        ),)
                      ],
                    ),
                  ),
                  ksizedbox40,
                  Padding(
                    padding: const EdgeInsets.only(left: 110),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 54,
                              width: MediaQuery.of(context).size.width*0.25,
                              decoration: BoxDecoration(
                  
                              ),
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
                                  hintText: 'Product Title',
                                  
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
                  )
                                ),
                              ),
                            ),ksizedbox40,
                             Container(
                              height: 54,
                              width: MediaQuery.of(context).size.width*0.25,
                              decoration: BoxDecoration(
                              ),
                              child:  DropdownSearch<CategoryData>(
                    itemAsString: (CategoryData u) => u.title,
                    selectedItem: merchantCategory,
                    popupProps: PopupProps.menu(
                      showSelectedItems: false,
                      showSearchBox: true,
                      menuProps:
                          MenuProps(borderRadius: BorderRadius.circular(15)),
                      searchFieldProps: const TextFieldProps(),
                    ),
                    items: authController.categoryData,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          // labelText: "Department *",
                          hintText: "Product Category Name",
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
                            ),ksizedbox40,
                             Container(
                              height: 54,
                              width: MediaQuery.of(context).size.width*0.25,
                              decoration: BoxDecoration(
                  
                              ),
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
                                  hintText: 'Sale Amount',
                                  
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
                  )
                                ),
                              ),
                            ),
                            ksizedbox20,
                          
                           
                          ],
                        ),
                         Padding(
              padding: const EdgeInsets.only(left: 150,),
              child: InkWell(
                onTap: () async {
                 PickedFile? pickedFile =
                                await ImagePicker().getImage(
                              source: ImageSource.gallery,
                            );

                            var tempCont = await pickedFile!.readAsBytes();
                            setState(
                              () {
                                imageprofile = tempCont;
                              },
                            );
                },
                child: Container(
                  height: 235,
                  width: 250,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 232, 232, 232)),
                  child: imageprofile != null
                      ? Image.memory(imageprofile!,
                      fit: BoxFit.cover,)
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
                                    'Product Image',
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
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 150),
                        //   child: Container(
                        //     height: 235,
                        //     width: 250,
                        //     decoration: BoxDecoration(
                        //       color: kgrey.withOpacity(0.1)
                        //     ),
                        //   ),
                        // ),
                        ksizedbox30,
                         
                      ],
                    ),
                  ),
                ksizedbox30,
                Padding(
                  padding: const EdgeInsets.only(left: 0,right:0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Container(
                                  height: 54,
                                  width: MediaQuery.of(context).size.width*0.25,
                                  decoration: BoxDecoration(
                                   
                                  ),
                                  child: Column(
                           children: [
                             TextFormField(
                              
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
                                labelText: 'Actual Amount*',
                                 hintStyle: TextStyle(
                    color: kblue,
                    fontWeight: FontWeight.w400,
                  )
                               ),
                             ),
                           ],
                                  ),
                                ),
                        ),
                             
                               ksizedbox30,
                              Padding(
                                padding: const EdgeInsets.only(right: 60),
                                child: 
                                   Container(
                                           height: 54,
                                            width: MediaQuery.of(context).size.width*0.25,
                                            decoration: BoxDecoration(
                                                  
                                                                   ),
                                                                   child: TextField(
                                    controller: startdateController,
                                    decoration: InputDecoration(
                                      hintText: selectdt,
                                      suffixIcon: InkWell(
                                        onTap: (){
                                            _showDatePicker(context);
                                        },
                                        child: Icon(Icons.date_range)),
                                      border: OutlineInputBorder(
                                        
                                        
                                        borderSide: BorderSide(
                                          color: kblue
                                        )
                                      )

                                    ),
                                                                   ),

                                                                 )
                                  
                              ),
                                 
                    ],
                  ),
                ),
                ksizedbox30,
                 Padding(
                  padding: const EdgeInsets.only(left: 0,right:0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                                  height: 54,
                                  width: MediaQuery.of(context).size.width*0.25,
                                  decoration: BoxDecoration(
                                   
                                  ),
                                  child: TextField(
                                    controller: enddateController,
                                    decoration: InputDecoration(
                                     suffixIcon: InkWell(
                                             onTap: (){
                                                 _showDatePicker1(context);
                                             },
                                             child: Icon(Icons.date_range)),
                                         hintText: selectdt1,
                                      border: OutlineInputBorder(
                                        
                                        
                                        borderSide: BorderSide(
                                          color: kblue
                                        )
                                      )
                                    ),
                                  ),
                                ),
                        ),
                             
                               ksizedbox30,
                              Padding(
                                padding: const EdgeInsets.only(right: 60),
                                child: 
                                 GetBuilder<AuthProfileController>(
                                   builder: (_) {
                                     return Container(
                height: 54,
                width: MediaQuery.of(context).size.width*0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                        color: const Color.fromARGB(255, 5, 5, 5)
                            .withOpacity(0.8))
                            ),
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
              );
                                   }
                                 ),
                                  
                              ),
                                 
                    ],
                  ),
                ),
                ksizedbox30,
                 Padding(
                  padding: const EdgeInsets.only(left: 0,right:0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                                  height: 54,
                                  width: MediaQuery.of(context).size.width*0.25,
                                  decoration: BoxDecoration(
                                   
                                  ),
                                  child: Column(
                           children: [
                             TextFormField(
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
                  )
                               ),
                             ),
                           ],
                                  ),
                                ),
                        ),
                             
                               ksizedbox30,
                              Padding(
                                padding: const EdgeInsets.only(right: 60),
                                child: 
                                   Container(
                                           height: 54,
                                            width: MediaQuery.of(context).size.width*0.25,
                                            decoration: BoxDecoration(
                                                  
                                                                   ),
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
                  )

                                    ),
                                                                   ),

                                                                 )
                                  
                              ),
                                 
                    ],
                  ),
                ),
                ksizedbox30,
                 Padding(
                  padding: const EdgeInsets.only(left: 0,right:0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                                  height: 54,
                                  width: MediaQuery.of(context).size.width*0.25,
                                  decoration: BoxDecoration(
                                   
                                  ),
                                  child: Column(
                           children: [
                             TextFormField(
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
                  )
                               ),
                             ),
                           ],
                                  ),
                                ),
                        ),
                             
                               ksizedbox30,
                              Padding(
                                padding: const EdgeInsets.only(right: 60),
                                child: 
                                   Container(
                                           height: 54,
                                            width: MediaQuery.of(context).size.width*0.25,
                                            decoration: BoxDecoration(
                                                  
                                                                   ),
                                    child: TextFormField(
                                    controller: unitController,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  )

                                    ),
                                                                   ),

                                                                 )
                                  
                              ),
                                 
                    ],
                  ),
                ),
                ksizedbox30,
                  Padding(
                  padding: const EdgeInsets.only(left: 0,right:0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                                  height: 49,
                                  width: MediaQuery.of(context).size.width*0.25,
                                    color: kwhite,
                                  child:TextFieldTags(
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
                  return TextField(
                    controller: tec,
                    focusNode: fn,
                    decoration: InputDecoration(
                      isDense: true,
                      fillColor: kwhite,
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
                          BoxConstraints(maxWidth:300),
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
                  );
                });
              },
            ),
                                ),
                        ),
                             
                               ksizedbox20,
                              Padding(
                                padding: const EdgeInsets.only(right: 60),
                                child: 
                                   Container(
                                           height: 53,
                                            width: MediaQuery.of(context).size.width*0.25,
                                            decoration: BoxDecoration(
                                                  
                                                                   ),
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
                  )

                                    ),
                                                                   ),

                                                                 )
                                  
                              ),
                                 
                    ],
                  ),
                ),
                ksizedbox30,
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
                  ksizedbox40,
                  Padding(
                    padding: const EdgeInsets.only(right: 55),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      InkWell(
                        onTap: (){
                          Get.toNamed(Routes.BusinessLastCouponAddedScreen);
                        },
                        child: Container(
                          height: 54,
                          width: MediaQuery.of(context).size.width*0.31,
                          decoration: BoxDecoration(
                            color: kgrey.withOpacity(0.5)
                          ),
                          child: Center(
                            child: Text('LAST COUPON',
                            style: TextStyle(
                                   fontSize: 18,
                                   color: kblue,
                                   fontWeight: FontWeight.bold
                            ),)),
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.only(left: 33),
                          child:   Obx(
            () => businessserviceController.isLoading.isTrue
                ? Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width*0.31,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                      print('::::::::::::here.category data:::::');
                      print(merchantCategory);

                      CategoryData categoryModel =
                          merchantCategory as CategoryData;
                           print('values::::::::::::::::');
                           print('actualamount');
                          print(actualAmountController.text);
                          print('listtag');
                          print(listTags);
                          print('category');
                          print(categoryModel);
                          print('description');
                          print(descriptionController.text);
                          print('serviceimage');
                          print(imageprofile);
                          print('saleamount');
                          print(saleAmountController.text);
                          print('servicetitle');
                          print(serviceTitleController.text);
                          print('gst');
                          print(gstController.text);
                          print('cgst');
                          print(cgstController.text);
                          print('unit');
                          print(unitController.text);
                          print('sgst');
                          print(sgstController.text);
                          print('start');
                          print(selectdt);
                          print('end');
                          print(selectdt1);
                          print('quantity');
                          print(quantityController.text);
                          print('amenties');
                          print(amentiesController.text);

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
                              image: imageprofile,
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
                              endTime: selectdt,
                              startTime: selectdt1,
                              quantity: quantityController.text);


                        print('nosucherror');

                      businessserviceController.addServices(
                          createServiceModel: createServiceModel);
                    },
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width*0.31,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                        )
                      ],
                    ),
                  ),
                      ksizedbox40 
                ],
              ),
                    ksizedbox30,
            RegisterCommonBottom()
            ],
          ),
    );
  }
}