import 'package:bciweb/routes/app_pages.dart';
import 'package:bciweb/views/members/services/views/widgets/containors.dart';
import 'package:date_format/date_format.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import '../../../constant/constans.dart';
import '../../../controller/auth_controller/auth_controller.dart';
import '../../../controller/business_controller/business_service_controller.dart';
import '../../../models/category_model.dart';
import '../../../models/service_model.dart';
import '../../../registerhomescreen/business_comm_homecontainer.dart';
import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../members/common_widget/business_common_screen.dart';

class BusinessOffersScreen extends StatefulWidget {
  const BusinessOffersScreen({super.key});

  @override
  State<BusinessOffersScreen> createState() => _BusinessOffersScreenState();
}

class _BusinessOffersScreenState extends State<BusinessOffersScreen> {
  var offertitleController = TextEditingController();
  var discountvalueController = TextEditingController();
  var claimuserController = TextEditingController();
  var startdateController = TextEditingController();
  var enddateController = TextEditingController();
  var discriptionController = TextEditingController();

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.getCategoryList();
    businessserviceController.getServicesByVendor();
  }

  var merchantCategory;
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
                      child: Image.asset(
                          'assets/images/couponredemtionbackgroundimage.png',
                          fit: BoxFit.cover)),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Center(
                      child: Text('OFFERS', style: displayfont),
                    ),
                  )
                ],
              ),
              ksizedbox10,
              Stack(
                children: [
                  Container(
                    height: 240,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/bservicehomebackground.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Offers Creates',
                              style: TextStyle(
                                  color: kblue,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 9,
                              width: 60,
                              color: kOrange,
                            ),
                            Text(
                              ' Create a coupon online with our powerful coupon generator.Coustomizable\n coupons.Make life esier by just selecting the best temple to\n personalize.Get access..',
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 18,
                                height:1.8,
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Row(
                  children: [
                    Text(
                      'Offer Title',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: kblue),
                    )
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
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(),
                          child: TextField(
                            controller: offertitleController,
                            decoration: InputDecoration(
                                hintText: 'Your Offer Title',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: kblue))),
                          ),
                        ),
                        ksizedbox40,
                        GetBuilder<BusinessServiceController>(
                          builder: (_) {
                            return Container(
                              height: 54,
                              width: MediaQuery.of(context).size.width * 0.25,
                              decoration: BoxDecoration(),
                              child: DropdownSearch<ServiceData>(
                                itemAsString: (ServiceData u) => u.title,
                                //selectedItem: businessserviceController.serviceDataList,
                                popupProps: PopupProps.menu(
                                  showSelectedItems: false,
                                  showSearchBox: true,
                                  menuProps: MenuProps(
                                      borderRadius: BorderRadius.circular(15)),
                                  searchFieldProps: const TextFieldProps(),
                                ),
                                items: businessserviceController.serviceDataList,
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      // labelText: "Department *",
                                      hintText: "Products",
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
                          }
                        ),
                        ksizedbox40,
                        Container(
                          height: 54,
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(),
                          child: TextField(
                            controller: discountvalueController,
                            decoration: InputDecoration(
                                hintText: 'Discount Value',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: kblue))),
                          ),
                        ),
                        ksizedbox40,
                        Container(
                          height: 54,
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(),
                          child: TextField(
                            controller: claimuserController,
                            decoration: InputDecoration(
                                hintText: 'Claim Users',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: kblue))),
                          ),
                        ),
                        ksizedbox20,
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 150,
                      ),
                      child: InkWell(
                        onTap: () async {
                          PickedFile? pickedFile = await ImagePicker().getImage(
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
                              ? Image.memory(
                                  imageprofile!,
                                  fit: BoxFit.cover,
                                )
                              : Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Upload Coupon Image',
                                            style: TextStyle(
                                                fontSize: 18, color: kblue),
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
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Starts At',
                            style: TextStyle(
                                color: kblue,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          ksizedbox20,
                          Container(
                            height: 54,
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                TextField(
                                  controller: startdateController,
                                  decoration: InputDecoration(
                                      hintText: selectdt1,
                                      suffixIcon: InkWell(
                                          onTap: () {
                                            _showDatePicker1(context);
                                          },
                                          child: Icon(Icons.date_range)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: kblue))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ksizedbox20,
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'End At',
                            style: TextStyle(
                                fontSize: 20,
                                color: kblue,
                                fontWeight: FontWeight.w500),
                          ),
                          ksizedbox20,
                          Container(
                            height: 54,
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(),
                            child: TextField(
                              //controller: enddateController,
                              decoration: InputDecoration(
                                  hintText: selectdt,
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        _showDatePicker(context);
                                      },
                                      child: Icon(Icons.date_range)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: kblue))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ksizedbox30,
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                          color: kblue,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    ksizedbox20,
                    Container(
                      height: 54,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(),
                      child: TextField(
                        controller: discriptionController,
                        decoration: InputDecoration(
                            hintText: 'Type something',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: kblue))),
                      ),
                    ),
                  ],
                ),
              ),
              ksizedbox40,
              Padding(
                padding: const EdgeInsets.only(right: 55),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                         Get.toNamed(Routes.BusinessLastOffersScreen);
                      },
                      child: Container(
                        height: 54,
                        width: MediaQuery.of(context).size.width * 0.31,
                        decoration:
                            BoxDecoration(color: kgrey.withOpacity(0.5)),
                        child: Center(
                            child: Text(
                          'LAST OFFER',
                          style: TextStyle(
                              fontSize: 18,
                              color: kblue,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 33),
                      child: GestureDetector(
                        onTap: () {
                          if (offertitleController.text.isNotEmpty &&
                              merchantCategory != null &&
                              claimuserController.text.isNotEmpty &&
                              discriptionController.text.isNotEmpty&&
                              discountvalueController.text.isNotEmpty) {
                            businessserviceController.addTodayOffers(
                                image: imageprofile,
                                title: offertitleController.text,
                                category: merchantCategory.id.toString(),
                                startsat: selectdt,
                                endsat: selectdt1,
                                discountValue: discountvalueController.text,
                                claimUser: claimuserController.text);
                          } else {
                            Get.rawSnackbar(
                                backgroundColor: Colors.red,
                                messageText: Text(
                                  "Fill All the Fields",
                                  style:
                                      primaryFont.copyWith(color: Colors.white),
                                ));
                          }
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.31,
                          decoration: BoxDecoration(
                              gradient:
                                  LinearGradient(colors: [kOrange, kyellow])),
                          child: Center(
                              child: Text(
                            'SUBMIT',
                            style: TextStyle(
                                fontSize: 18,
                                color: kwhite,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
             ksizedbox30,
            RegisterCommonBottom()
        ],
      ),
    );
  }
}
