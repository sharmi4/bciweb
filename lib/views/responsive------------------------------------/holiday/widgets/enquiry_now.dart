
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../constant/constans.dart';
import '../../../../controller/holiday_controller.dart';
import '../../../../controller/holiday_package_controller.dart';
import '../../../../models/holiday_packages_models/get_package_details_model.dart';
import '../../mobile_wdgets/comomappbar.dart';
import '../../mobile_wdgets/drawer.dart';


class EnquiryNowWidget extends StatefulWidget {
  String packageId;
  GetPackageDetailsData getPackageDetailsData;
   EnquiryNowWidget({super.key,
   required this.packageId,required this.getPackageDetailsData});

  @override
  State<EnquiryNowWidget> createState() => _EnquiryNowWidgetState();
}

class _EnquiryNowWidgetState extends State<EnquiryNowWidget> {
   final packageNameController = TextEditingController();
  final cityOfDepController = TextEditingController();
  final dateOfDepController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

   final holidayPackageController = Get.find<HolidayPackageController>();
    final mobileholidaysController=Get.find<HolidayController>();
    final mobileholidays2Controller=Get.find<Holiday2Controller>();
    final mobileholidays3Controller=Get.find<Holiday3Controller>();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setdefault();
  }
  setdefault(){
    packageNameController.text = widget.getPackageDetailsData.title;
  }
    DateTime date = DateTime.now();

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime.now(),
      locale: const Locale('en', 'IN'),
      lastDate: DateTime.now().add(const Duration(days: 6570)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: kblue, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: kblue, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null)
      setState(() {
        date = picked;
        dateOfDepController.text = formatDate(date, [dd, "/", mm, "/", yyyy]);
      });
  }
  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;
    return Scaffold(
       appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      drawer: MobileDrawer(),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: kgrey,
                      blurRadius: 2.5
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: size.width,
                      color: korange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Want to go for a memorable holidays?',
                              style: TextStyle(
                                fontSize: 19, 
                                color: Colors.white,
                              fontWeight: FontWeight.w500),
                            ),ksizedbox10,
                            Text('Provide your details to know best holidays deals',
                              style: TextStyle(
                                fontSize: 13, 
                                color: Colors.white,
                              fontWeight: FontWeight.w400),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Package Name',
                                    style: TextStyle(
                                      fontSize: 20, 
                                      color: kblue,
                                    fontWeight: FontWeight.w500),
                                  ),
                                  ksizedbox10,
                                  Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(),
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      controller: packageNameController,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                         // hintText: "Your Name",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                ksizedbox20,
                Text('City of Departure',
                                    style: TextStyle(
                                      fontSize: 20, 
                                      color: kblue,
                                    fontWeight: FontWeight.w500),
                                  ),
                                  ksizedbox10,
                                  Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(),
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      controller: cityOfDepController,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                         // hintText: "Your Name",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                ksizedbox20,
                Text('Date of Departure',
                                    style: TextStyle(
                                      fontSize: 20, 
                                      color: kblue,
                                    fontWeight: FontWeight.w500),
                                  ),
                                  ksizedbox10,
                   Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(),
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      onTap: (){
                        _selectDate(context);
                      },
                      controller:dateOfDepController,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                         // hintText: "Your Name",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                ksizedbox20,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('Adult',
                            style: TextStyle(
                            fontSize: 20, 
                            color: kblue,
                            fontWeight: FontWeight.w500),
                    ),
                    ksizedbox10,
                    Obx(()=> Container(
                        height: 25,
                        width: 107,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: (){
                             if(mobileholidaysController.cout!=0){
                                     mobileholidaysController.cout--;
                             }
                             else{
                              return null;
                             }
                            }, 
                            icon: Icon(Icons.remove,
                            size: 12,)),
                            Container(
                              height: 25,
                              width: 25,
                              color: Colors.orange,
                              child: Center(
                                  child: Text('${mobileholidaysController.cout.value}',style: TextStyle(color: Colors.white),),
                              ),
                            ),
                             IconButton(onPressed: (){
                              mobileholidaysController.increament();
                              mobileholidaysController.update();
                            }, 
                            icon: Icon(Icons.add,
                            size: 12,)),
                          ],
                        ),
                      ),
                    ),
                        ],
                      ),
                      kwidth10,
                      Column(
                        children: [
                          Text('Child',
                            style: TextStyle(
                            fontSize: 20, 
                            color: kblue,
                            fontWeight: FontWeight.w500),
                    ),
                    ksizedbox10,
                    Obx(()=>
                               Container(
                        height: 25,
                        width: 107,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: (){
                              if(mobileholidays2Controller.cout!=0){
                                mobileholidays2Controller.cout--;
                              }else{
                                return null;
                              }
                            }, 
                            icon: Icon(Icons.remove,
                            size: 12,)),
                            Container(
                              height: 25,
                              width: 25,
                              color: Colors.orange,
                              child: Center(
                                  child: Text('${mobileholidays2Controller.cout.value}',style: TextStyle(color: Colors.white),),
                              ),
                            ),
                              IconButton(onPressed: (){
                              mobileholidays2Controller.increament();
                              mobileholidays2Controller.update();
                            }, 
                            icon: Icon(Icons.add,
                            size: 12,)),
                          ],
                        ),
                      ),
                    ),
                        ],
                      ),
                      kwidth10,
                      Column(
                        children: [
                          Text('Infant',
                            style: TextStyle(
                            fontSize: 20, 
                            color: kblue,
                            fontWeight: FontWeight.w500),
                    ),
                    ksizedbox10,
                    Obx(()=>
                       Container(
                        height: 25,
                        width: 115,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: (){
                            if(mobileholidays3Controller.cout!=0){
                              mobileholidays3Controller.cout--;
                            }
                            else{
                              return null;
                            }
                            }, 
                            icon: Icon(Icons.remove,
                            size: 12,)),
                            Container(
                              height: 25,
                              width: 25,
                              color: Colors.orange,
                              child: Center(
                                  child: Text('${mobileholidays3Controller.cout.value}',style: TextStyle(color: Colors.white),),
                              ),
                            ),
                             Padding(
                               padding: const EdgeInsets.only(right: 5),
                               child: IconButton(onPressed: (){
                                mobileholidays3Controller.increament();
                                mobileholidays3Controller.update();
                                                       }, 
                                                       icon: Icon(Icons.add,
                                                       size: 12,)),
                             ),
                          ],
                        ),
                      ),
                    ),
                        ],
                      ),
                    ],
                  ),
                ),
                ksizedbox20,
                Text('Contact Details',
                          style: TextStyle(
                          fontSize: 20, 
                          color: kblue,
                          fontWeight: FontWeight.w500),
                  ),
                  ksizedbox10,
                   Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(),
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Your Name",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                ksizedbox20,
                 Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(),
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                    controller: emailController,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                ksizedbox20,
                Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(),
                      color:const Color.fromARGB(255, 254, 252, 252)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                        FilteringTextInputFormatter.deny(RegExp(r'/s'))
                      ],
                      controller:mobileController,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                            color: Color(0xff6E6D6E),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                ksizedbox30,
                GestureDetector(
                  onTap: (){
                    print("---------testing enquiry--------------");
                              print(widget.packageId);
                              print(cityOfDepController.text);
                              print(dateOfDepController.text);
                              print(nameController.text);
                              print(emailController.text);
                              print(mobileController.text);
                              if (emailController.text.isEmail) {
                                holidayPackageController.createEnquiry(
                                  packageid: widget.packageId,
                                  cityofdeparture: cityOfDepController.text,
                                  dateofdeparture: dateOfDepController.text,
                                  adultcount: holidayPackageController
                                      .adult.value
                                      .toString(),
                                  childcount: holidayPackageController
                                      .child.value
                                      .toString(),
                                  infantcount: holidayPackageController
                                      .infant.value
                                      .toString(),
                                  name: nameController.text,
                                  email: emailController.text,
                                  mobile: mobileController.text,
                                  status: "pending",
                                );
                              } else {
                                Get.rawSnackbar(
                                    message: "Enter a valid email id",
                                    backgroundColor: Colors.red);
                              }
                            },
                  child: Container(
                            height: 35,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: kOrange,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child:const Center(
                                child: Text("Send Query",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                ),
                        ksizedbox20,
                        Row(
                          children: [
                            Icon(Icons.punch_clock_sharp,color: kOrange,),
                            holidayPackageController.getPackageDetailsData.isEmpty?Text(''):
                            Text(holidayPackageController.getPackageDetailsData.first.duration,
                          style: TextStyle(
                          fontSize: 18, 
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                  ),
                          ],
                        ),
                        ksizedbox10,
                         Row(
                          children: [
                            Icon(Icons.location_city,color: kOrange,),
                            Text('Places to Visit :06N Mauritius',
                          style: TextStyle(
                          fontSize: 18, 
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                  ),
                          ],
                        ),
                        ksizedbox30,
                        Text('Packages Include',
                          style: TextStyle(
                          fontSize: 20, 
                          color: kblue,
                          fontWeight: FontWeight.w500),
                         ),
                         ksizedbox10,
                         Row(
                          children: [
                            Column(
                              children: [
                                Icon(Icons.flight_outlined,color: kgrey,),
                                Text('Flights',
                          style: TextStyle(
                          fontSize: 10, 
                          color: kgrey,
                          fontWeight: FontWeight.w500),
                         ),
                              ],
                            ),
                            kwidth5,
                            Column(
                              children: [
                                Icon(Icons.hotel,color: kgrey,),
                                Text('Hotels',
                          style: TextStyle(
                          fontSize: 10, 
                          color: kgrey,
                          fontWeight: FontWeight.w500),
                         ),
                              ],
                            ),
                            kwidth5,
                            Column(
                              children: [
                                Icon(Icons.car_rental,color: kgrey,),
                                Text('Travel',
                          style: TextStyle(
                          fontSize: 10, 
                          color: kgrey,
                          fontWeight: FontWeight.w500),
                         ),
                              ],
                            ),
                            kwidth5,
                            Column(
                              children: [
                                Icon(Icons.food_bank,color: kgrey,),
                                Text('Meals',
                          style: TextStyle(
                          fontSize: 10, 
                          color: kgrey,
                          fontWeight: FontWeight.w500),
                         ),
                              ],
                            ),
                          ],
                         ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}