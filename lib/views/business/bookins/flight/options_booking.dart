import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/business/bookins/flight/seat_booking.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../../../controller/flaibooking_option.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';
import '../../../members/common_widget/common_buttom.dart';
import 'package:get/get.dart';

class BookingOptionsScreen extends StatefulWidget {
  const BookingOptionsScreen({super.key});

  @override
  State<BookingOptionsScreen> createState() => _BookingOptionsScreenState();
}

class _BookingOptionsScreenState extends State<BookingOptionsScreen> {
  var countrynumberController=TextEditingController();
  var mobilenumberController=TextEditingController();
  var emailController=TextEditingController();
  var firstnameController=TextEditingController();
  var lastnameController=TextEditingController();
  var genderController=TextEditingController();
  var dateController=TextEditingController();
  var monthController=TextEditingController();
  var yearController=TextEditingController();
   var passportnumberController=TextEditingController();
    var nationalityController=TextEditingController();
     var issuedcountryController=TextEditingController();
     var issuedmonthController=TextEditingController();
     var issueddayController=TextEditingController();
     var issuedyearController=TextEditingController();
 
  var passnumber=['123456','123456','1324567'];
  var nationality=['India','American','British'];
  var items=['+91','+1','+54','+44'];
  var gender=['Male','Female'];
  var issuedcountry=['Albania','Algeria'];
  DateTime bookingselectedDate = DateTime.now();
  Future<void> _bookingselectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: bookingselectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != bookingselectedDate) {
      setState(() {
        bookingselectedDate = picked;
    dateController.text = '${bookingselectedDate.day}';
      });
    }
  }
  DateTime bookingselected2Date = DateTime.now();
  Future<void> _bookingselect2Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: bookingselected2Date,
      initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != bookingselected2Date) {
      setState(() {
        bookingselected2Date = picked;
    monthController.text = '${bookingselected2Date.month}';
      });
    }
  }
  DateTime bookingselected3Date = DateTime.now();
  Future<void> _bookingselect3Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: bookingselected3Date,
       initialDatePickerMode: DatePickerMode.year,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != bookingselected3Date) {
      setState(() {
        bookingselected3Date = picked;
    yearController.text = '${bookingselected3Date.year}';
      });
    }
  }
   DateTime issuedselectedDate = DateTime.now();
  Future<void> _issuedselectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: issuedselectedDate,
       initialDatePickerMode: DatePickerMode.year,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != issuedselectedDate) {
      setState(() {
        issuedselectedDate = picked;
    issuedyearController.text = '${issuedselectedDate.year}';
      });
    }
  }
   DateTime issuedselected2Date = DateTime.now();
  Future<void> _issuedselect2Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: issuedselected2Date,
       initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != issuedselected2Date) {
      setState(() {
        issuedselected2Date = picked;
  issuedmonthController.text = '${issuedselected2Date.month}';
      });
    }
  }
  
  DateTime issuedselected3Date = DateTime.now();
  Future<void> _issuedselect3Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: issuedselected3Date,
       initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != issuedselected3Date) {
      setState(() {
        issuedselected3Date = picked;
  issueddayController.text = '${issuedselected3Date.day}';
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final flaightOptionController=Get.find<FlaightBookingOptionController>();
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
          body:Obx(()=> ListView(
              children:[ Column(
                children: [
                    RegisterCommonContainer(),
                    GestureDetector(
                      onTap:(){
                        flaightOptionController.booptionindex(0);
                        flaightOptionController.update();
                      },
                      child: Container(
                         height: 405,
                                width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(image:AssetImage('assets/images/Group 39747.png',
                          ),fit: BoxFit.cover )
                        ),
                            child:Center(
                              child: Text('Flight Book Options',
                              style: TextStyle(
                                fontSize: 40,
                                color: kwhite,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2
                              ),),
                            )),
                    ),
                          if(flaightOptionController.booptionindex.value==0)
                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 40),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundColor: kblue,
                                            child: Text('01',
                                            style: TextStyle(
                                              color: kwhite,
                                              fontSize: 25
                                            ),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Text('Review your itinerary',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: kblue
                                            )),
                                          ),
                                          
                                         
                                        ],
                                      ),
                                    ),
                                    Padding(
                                    padding: const EdgeInsets.only(right: 100),
                                    child: Column(
                                      children: [
                                        Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                         children:[
                                         Image.asset('assets/images/dropicon.png',
                                         height: 30,
                                        fit: BoxFit.fitHeight,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Container(
                                             height: MediaQuery.of(context).size.width*0.1,
                                             width: MediaQuery.of(context).size.width*0.18,
                                            decoration: BoxDecoration(
                                              color: kwhite,
                                              border: Border.all(
                                                color: kgrey,
                                              ),
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                    Text('Total Price'),
                                                    Text('₹ 13,521',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: kblue
                                                    ),)
                                                  ],),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10,top: 5),
                                                  child: Row(
                                                    children: [
                                                      Text('1 adult',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: kgrey
                                                      ),),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top:6,left: 10,right: 10),
                                                  child: Container(
                                                    height: 25,
                                                    width: MediaQuery.of(context).size.width*0.17,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: Colors.pink[50]
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 5,right: 5),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text('EMI from ₹649/mo',
                                                          style: TextStyle(
                                                            fontSize: 10
                                                          ),),
                                                          Text('Details',
                                                          style:TextStyle(
                                                            fontSize: 10
                                                          ))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:10,right:10,),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Base fare (1 traveller)',
                                                      style: TextStyle(
                                                        fontSize: 10.5
                                                      ),),
                                                       Text('₹11,599',
                                                       style: TextStyle(
                                                        fontSize: 10.5
                                                       ),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:10,right:10,top:5),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Taxes fees',
                                                      style: TextStyle(
                                                        fontSize: 10.5
                                                      ),),
                                                       Text('₹1,961',
                                                       style: TextStyle(
                                                        fontSize: 10.5
                                                       ),)
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                             ),
                                          )
                                           ]
                                          ),
                                      ],
                                    ),
                                     )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 100,top: 50),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                  
                                    children: [
                                      Container(
                                                      height: 30,
                                                      width: MediaQuery.of(context).size.width*0.18,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: kgrey
                                                        ),
                                                        borderRadius: BorderRadius.circular(10)
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          Text('NON REFUNDABLE',
                                                          style: TextStyle(
                                                            fontSize: 14
                                                          ),),
                                                          CircleAvatar(
                                                                  radius: 10,
                                                                  backgroundColor: kgrey,
                                                            child:Container(
                                                            height: 10,
                                                            width: 10,
                                                            
                                                            decoration: BoxDecoration(
                                                              color:kwhite,
                                                              shape: BoxShape.rectangle
                                                            ),
                                                          
                                                          ) ,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          if(flaightOptionController.booptionindex.value==0)
                          Padding(
                            padding: const EdgeInsets.only(left: 70,bottom: 50),
                            child: Row(
                              children: [
                                Text('Chennai → New Delhi Sun, 4 Jun,2023')
                              ],
                            ),
                          ),
                          if(flaightOptionController.booptionindex.value==0)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 70,bottom: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/bookingflaight.png',
                                    height: 35,
                                    fit: BoxFit.fitHeight,),
                                    Padding(
                                      padding: const EdgeInsets.only(top:4),
                                      child: Text('Indigo airline',
                                      style: TextStyle(
                                        fontSize: 12
                                      ),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:4),
                                      child: Text('Indigo-23',
                                      style: TextStyle(
                                        fontSize: 12
                                      ),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:4),
                                      child: Text('Economy',
                                      style: TextStyle(
                                        fontSize: 12
                                      ),),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            color: kgrey,
                                       boxShadow: <BoxShadow> [  
                                         BoxShadow(
                              offset: Offset(0.0, 0.75),
                              blurRadius: 0.5,
                              color: kgrey
                            )
                                            ],
                                             shape: BoxShape.circle,
                                                                      
                                          ),
                                        ),
                    Dash(
                        direction: Axis.vertical,
                        length: 70,
                        dashLength: 2,
                        dashColor: kgrey),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kgrey,
          
          
                          ),
                      child: Container(
                        height: 20,
                      ),
                    ),
          
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20,bottom: 5),
                                      child: Column(
                                        children: [
                                          Row(
                                           
                                            children: [
                                              Text('CHEENAI',
                                              style: TextStyle(
                                                   fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: kblue
                                              ),),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Text('10:34',
                                                style: TextStyle(
                                                     fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: kblue
                                                ),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Text('Terminal 2',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: kblue
                                                ),),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top:10),
                                                child: Column(
                                                 
                                                  children: [
                                                    Icon(Icons.schedule_outlined),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top:4),
                                                      child: Text('02 h 50 m',
                                                      style: TextStyle(
                                                        fontSize: 12
                                                      ),),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:15),
                                            child: Row(
                                              children: [
                                                Text('NEW DELHI',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: kblue
                                                ),),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: Text('01:25',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: kblue
                                                  ),),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: Text('Terminal 1',
                                                  style: TextStyle(
                                                    fontSize: 12
                                                  ),),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          if(flaightOptionController.booptionindex.value==0)
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    flaightOptionController.booptionindex(1);
                                    flaightOptionController.update();
                                  },
                                  child: Container(
                                    height: 35,
                                    width: MediaQuery.of(context).size.width*0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(colors: [
                                        kOrange,
                                        kyellow
                                      ])
                                    ),
                                  child: Center(
                                    child: Text('Continue',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: kwhite
                                    ),))),
                                )
                              ],
                            ),
                          ),
                          ksizedbox20,
                          if(flaightOptionController.booptionindex.value==0)
                          Row(
                           
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height*0.15,
                                width: MediaQuery.of(context).size.width*0.4,
                                decoration: BoxDecoration(
                                 
                                  border: BorderDirectional(
                                    top: BorderSide(
                                      color: kgrey,
                                      
                                    ),
                                    bottom: BorderSide(
                                      color: kgrey
                                    )
                                  )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 60),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: kgrey,
                                          shape: BoxShape.circle
                                        ),
                                        child: Center(
                                          child: Text('02',
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: kwhite
                                          ),),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 60),
                                        child: Row(
                                         
                                          children: [
                                            Text('Add contact details',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color:kgrey
                                                    ),),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 100),
                                                      child: Container(
                                                          height: 25,
                                                         width: 25,
                                                       decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: kgrey
                                                        ),
                                                        child: Center(
                                                        child: Icon(Icons.keyboard_arrow_down_outlined,
                                                        color: kwhite,),
                                                        ),
                                                        ),
                                                    )
                                          ],
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          if(flaightOptionController.booptionindex.value==0)
                          Row(
                           
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height*0.15,
                                width: MediaQuery.of(context).size.width*0.4,
                                decoration: BoxDecoration(
                                
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 60),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: kgrey,
                                          shape: BoxShape.circle
                                        ),
                                        child: Center(
                                          child: Text('03',
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: kwhite
                                          ),),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 60),
                                        child: Row(
                                         
                                          children: [
                                            Text('Add contact details',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color:kgrey
                                                    ),),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 100),
                                                      child: Container(
                                                          height: 25,
                                                         width: 25,
                                                       decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: kgrey
                                                        ),
                                                        child: Center(
                                                        child: Icon(Icons.keyboard_arrow_down_outlined,
                                                        color: kwhite,),
                                                        ),
                                                        ),
                                                    )
                                          ],
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
          
                           if(flaightOptionController.booptionindex.value==1)
                            Padding(
                            padding: const EdgeInsets.only(top: 20,left: 40),
                            child: Column(  
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*0.15,
                                        width: MediaQuery.of(context).size.width*0.6,
                                        decoration: BoxDecoration(
                                          border: BorderDirectional(
                                            top: BorderSide(
                                              color: kgrey
                                            ),
                                            bottom: BorderSide(
                                              color: kgrey
                                            )
                                          )
                                        ),
                                        child: Row(
                                          
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Image.asset('assets/images/flaightcorrect.png',
                                                  height: 40,fit: BoxFit.fitHeight,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Text('Review your itinerary',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: kblue
                                                    )),
                                                  ),
                                                  
                                                     
                                                ],
                                              ),
                                            ),
                                             Padding(
                                               padding: const EdgeInsets.only(left: 400),
                                               child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children:[
                                                           Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration: BoxDecoration(
                                                              color: kgrey,
                                                              shape: BoxShape.circle
                                                            ),
                                                            child: Center(
                                                              child: Icon(Icons.expand_more),
                                                            ),
                                                           )
                                                        ]
                                                      ),
                                             ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                    padding: const EdgeInsets.only(right: 100),
                                    child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                        
                                         children:[
                                     
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Container(
                                             height: MediaQuery.of(context).size.width*0.1,
                                             width: MediaQuery.of(context).size.width*0.18,
                                            decoration: BoxDecoration(
                                              color: kwhite,
                                              border: Border.all(
                                                color: kgrey,
                                              ),
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                    Text('Total Price'),
                                                    Text('₹ 13,521',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: kblue
                                                    ),)
                                                  ],),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10,top: 5),
                                                  child: Row(
                                                    children: [
                                                      Text('1 adult',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: kgrey
                                                      ),),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top:6,right:10,left:10),
                                                  child: Container(
                                                    height: 25,
                                                    width: MediaQuery.of(context).size.width*0.17,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: Colors.pink[50]
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 5,right: 5),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text('EMI from ₹649/mo',
                                                          style: TextStyle(
                                                            fontSize: 10
                                                          ),),
                                                          Text('Details',
                                                          style:TextStyle(
                                                            fontSize: 10
                                                          ))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:10,right:10,),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Base fare (1 traveller)',
                                                      style: TextStyle(
                                                        fontSize: 10.5
                                                      ),),
                                                       Text('₹11,599',
                                                       style: TextStyle(
                                                        fontSize: 10.5
                                                       ),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:10,right:10,top:5),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Taxes fees',
                                                      style: TextStyle(
                                                        fontSize: 10.5
                                                      ),),
                                                       Text('₹1,961',
                                                       style: TextStyle(
                                                        fontSize: 10.5
                                                       ),)
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                             ),
                                          )
                                           ]
                                          ),
                                      ],
                                    ),
                                     )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 130,top: 50),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                  
                                    children: [
                                      Container(
                                                      height: 30,
                                                      width: MediaQuery.of(context).size.width*0.18,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: kgrey
                                                        ),
                                                        borderRadius: BorderRadius.circular(10)
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          Text('NON REFUNDABLE',
                                                          style: TextStyle(
                                                            fontSize: 14
                                                          ),),
                                                          CircleAvatar(
                                                                  radius: 10,
                                                                  backgroundColor: kgrey,
                                                            child:Container(
                                                            height: 10,
                                                            width: 10,
                                                            
                                                            decoration: BoxDecoration(
                                                              color:kwhite,
                                                              shape: BoxShape.rectangle
                                                            ),
                                                          
                                                          ) ,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                    ],
                                  ),
                                ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 60),
                                 child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                   CircleAvatar(
                                     radius: 20,
                                     backgroundColor: kblue,
                                     child: Center(
                                       child: Text('02',
                                       style:TextStyle(
                                         fontSize: 20,
                                         color:kwhite
                                       )),
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 20),
                                     child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text('Add contact details',
                                         style: TextStyle(
                                          fontSize: 20,
                                          color: kblue,
                                          fontWeight: FontWeight.bold
                                         ),),
                                         Padding(
                                           padding: const EdgeInsets.only(top:5),
                                           child: Text('E-ticket will be sent to this email address and phone number',
                                           
                                           style: TextStyle(
                                            height: 2.5,
                                            fontSize: 14.5,
                                            color: kblue
                                           ),),
                                         )
                                       ],
                                     ),
                                   )

                                   ],
                                 ),
                               ),
                                 Padding(
                                   padding: const EdgeInsets.only(left:60,top:20),
                                   child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Mobile number',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: kblue,
                                          fontWeight: FontWeight.bold
                                        ),),

                                        
                                      ],
                                    ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 60,top:20),
                                   child: Row(
                                     children: [
                                       Column(
                                         children: [
                                           Container(
                                            height: 50,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              color: kwhite,
                                              // border: Border.all(
                                              //   color: kgrey
                                              // )
                                            ),
                                            child: TextField(
                                              controller: countrynumberController,
                                              decoration:InputDecoration(
                                               
                                                suffixIcon: PopupMenuButton<String>(
                                                  icon: Icon(Icons.arrow_drop_down,
                                                  color:kgrey),
                                                  onSelected: (value){
                                                    setState(() {
                                                      countrynumberController.text=value;
                                                    });
                                                    
                                                  },
                                                  itemBuilder: (contex){
                                                    return items.map<PopupMenuItem<String>>((String value){
                                                      return PopupMenuItem(child: Text(value,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: kgrey
                                                      ),),value: value,);
                                                    }
                                                    ).toList();
                                                }),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: kgrey
                                                  )
                                                ),
                                                   
                                              ) ,
                                            ),
                                           ),
                                         ],
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(left:20),
                                         child: Column(
                                           children: [
                                             Container(
                                              height: 50,
                                              width: MediaQuery.of(context).size.width*0.3,
                                              decoration: BoxDecoration(
                                                color:kwhite
                                              ),
                                              child: TextField(
                                                controller: mobilenumberController,
                                                
                                                decoration: InputDecoration(
                                                  hintText: 'Mobile Number',
                                                   hintStyle: TextStyle(
                                                    color:kgrey
                                                   ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: kgrey
                                                    )
                                                  )
                                                ),
                                              ),
                                             ),
                                           ],
                                         ),
                                       )
                                     ],
                                   ),
                                 ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 60,top:20),
                                     child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text('OTP(Optional)',
                                         style: TextStyle(
                                           fontSize: 20,
                                           color:kblue
                                         ),),
                                        
                                       ],
                                     ),
                                   ),
                                       Padding(
                                         padding: const EdgeInsets.only(left: 60,top:20),
                                         child: OtpTextField(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                         
                                           numberOfFields: 4,
                                           borderColor:kgrey,
                                           //set to true to show as box or false to show as dash
                                           showFieldAsBox: true, 
                                           //runs when a code is typed in
                                           onCodeChanged: (String code) {
                                               //handle validation or checks here           
                                           },
                                           //runs when every textfield is filled
                                           // onSubmit: (String verificationCode){
                                           //     showDialog(
                                           //         context: context,
                                           //         builder: (context){
                                           //         return AlertDialog(
                                           //             title: Text("Verification Code"),
                                           //             content: Text('Code entered is $verificationCode'),
                                           //         );
                                           //         }
                                               // );
                                           // }, // end onSubmit
                                           ),

                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(left:60,top:20),
                                         child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text('Resend OTP',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: kblue
                                            ),)
                                          ],
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(top:0,left:60),
                                         child: Row(
                                          children:[
                                            Text('Email address',
                                            style:TextStyle(
                                              fontSize: 20,
                                              height: 3,
                                              color: kblue,
                                              fontWeight: FontWeight.bold
                                            ))
                                          ]
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(top:10,left: 60),
                                         child: Container(
                                          height: 50,
                                          width: MediaQuery.of(context).size.width*0.39,
                                          decoration: BoxDecoration(
                                            color:kwhite,
                                            
                                          ),
                                          child:TextField(
                                            controller: emailController,
                                            decoration: InputDecoration(
                                              hintText: 'Email address',
                                              border:OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: kgrey
                                                )
                                              ) ),
                                          )
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(top:20,left:60),
                                         child: Row(
                                          children:[
                                            GestureDetector(
                                              onTap:() {
                                                flaightOptionController.booptionindex(2);
                                                flaightOptionController.update();
                                              },
                                              child: Container(
                                                height: 38,
                                                width:MediaQuery.of(context).size.width*0.13,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [
                                                    kOrange,
                                                    kyellow
                                                  ]),
                                                  borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: Center(
                                                  child:Text('Continue',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color:kwhite
                                                  ),)
                                                ),
                                              ),
                                            )
                                          ]
                                         ),
                                       ),


                                        
                              ],
                            ),
                          ),
                    
                         if(flaightOptionController.booptionindex.value==1)
                                                                Padding(
                                                                  padding: const EdgeInsets.only(top:20),
                                                                  child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            Container(
                            height: MediaQuery.of(context).size.height*0.15   ,
                            width: MediaQuery.of(context).size.width*0.6,
                            decoration: BoxDecoration(
                             color: kwhite,
                            border: BorderDirectional(
                            top:BorderSide(
                            color: kgrey,
                             )
                             )
                             ),
                             child:Padding(
                               padding: const EdgeInsets.only(left: 80),
                               child: Row(
                                            
                                            children: [
                                              Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                   CircleAvatar(
                                       radius: 20,
                                       backgroundColor: kgrey,
                                       child: Center(
                                         child: Text('03',
                                         style:TextStyle(
                                           fontSize: 20,
                                           color:kwhite
                                         )),
                                       ),
                                     ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Text('Add traveller details',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: kblue
                                                    )),
                                                  ),
                                                  
                                                     
                                                ],
                                              ),
                                               Padding(
                                                 padding: const EdgeInsets.only(left: 400),
                                                 child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children:[
                                                             Container(
                                                              height: 30,
                                                              width: 30,
                                                              decoration: BoxDecoration(
                                                                color: kgrey,
                                                                shape: BoxShape.circle
                                                              ),
                                                              child: Center(
                                                                child: Icon(Icons.expand_more,
                                                                color: kwhite,),
                                                              ),
                                                             )
                                                          ]
                                                        ),
                                               ),
                                            ],
                                          ),
                             ),
                             )
                            ],
                             ),
                            ),

                            if(flaightOptionController.booptionindex.value==2)
                             Padding(
                            padding: const EdgeInsets.only(top: 20,left: 40),
                            child: Column(  
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*0.15,
                                        width: MediaQuery.of(context).size.width*0.6,
                                        decoration: BoxDecoration(
                                          border: BorderDirectional(
                                            top: BorderSide(
                                              color: kgrey
                                            ),
                                            bottom: BorderSide(
                                              color: kgrey
                                            )
                                          )
                                        ),
                                        child: Row(
                                          
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Image.asset('assets/images/flaightcorrect.png',
                                                  height: 40,fit: BoxFit.fitHeight,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Text('Review your itinerary',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: kblue
                                                    )),
                                                  ),
                                                  
                                                     
                                                ],
                                              ),
                                            ),
                                             Padding(
                                               padding: const EdgeInsets.only(left: 400),
                                               child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children:[
                                                           Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration: BoxDecoration(
                                                              color: kgrey,
                                                              shape: BoxShape.circle
                                                            ),
                                                            child: Center(
                                                              child: Icon(Icons.expand_more),
                                                            ),
                                                           )
                                                        ]
                                                      ),
                                             ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                    padding: const EdgeInsets.only(right: 100),
                                    child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                        
                                         children:[
                                     
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Container(
                                             height: MediaQuery.of(context).size.width*0.1,
                                             width: MediaQuery.of(context).size.width*0.18,
                                            decoration: BoxDecoration(
                                              color: kwhite,
                                              border: Border.all(
                                                color: kgrey,
                                              ),
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                    Text('Total Price'),
                                                    Text('₹ 13,521',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: kblue
                                                    ),)
                                                  ],),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10,top: 5),
                                                  child: Row(
                                                    children: [
                                                      Text('1 adult',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: kgrey
                                                      ),),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top:6,right:10,left:10),
                                                  child: Container(
                                                    height: 25,
                                                    width: MediaQuery.of(context).size.width*0.17,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: Colors.pink[50]
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 5,right: 5),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text('EMI from ₹649/mo',
                                                          style: TextStyle(
                                                            fontSize: 10
                                                          ),),
                                                          Text('Details',
                                                          style:TextStyle(
                                                            fontSize: 10
                                                          ))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:10,right:10,),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Base fare (1 traveller)',
                                                      style: TextStyle(
                                                        fontSize: 10.5
                                                      ),),
                                                       Text('₹11,599',
                                                       style: TextStyle(
                                                        fontSize: 10.5
                                                       ),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:10,right:10,top:5),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Taxes fees',
                                                      style: TextStyle(
                                                        fontSize: 10.5
                                                      ),),
                                                       Text('₹1,961',
                                                       style: TextStyle(
                                                        fontSize: 10.5
                                                       ),)
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                             ),
                                          )
                                           ]
                                          ),
                                      ],
                                    ),
                                     )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 130,top: 50),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                  
                                    children: [
                                      Container(
                                                      height: 30,
                                                      width: MediaQuery.of(context).size.width*0.18,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: kgrey
                                                        ),
                                                        borderRadius: BorderRadius.circular(10)
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          Text('NON REFUNDABLE',
                                                          style: TextStyle(
                                                            fontSize: 14
                                                          ),),
                                                          CircleAvatar(
                                                                  radius: 10,
                                                                  backgroundColor: kgrey,
                                                            child:Container(
                                                            height: 10,
                                                            width: 10,
                                                            
                                                            decoration: BoxDecoration(
                                                              color:kwhite,
                                                              shape: BoxShape.rectangle
                                                            ),
                                                          
                                                          ) ,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                    ],
                                  ),
                                ),
                                Row(
                                  
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 60,bottom:0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset('assets/images/flaightcorrect.png',
                                          height: 40,fit: BoxFit.fitHeight,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Text('tamilnadu635205@gmail.com, 9876543210.',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: kblue
                                            )),
                                          ),
                                          
                                             
                                        ],
                                      ),
                                    ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 190,bottom:0),
                                       child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children:[
                                                   Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      color: kgrey,
                                                      shape: BoxShape.circle
                                                    ),
                                                    child: Center(
                                                      child: Icon(Icons.expand_more),
                                                    ),
                                                   )
                                                ]
                                              ),
                                     ),
                                  ],
                                ),
                                 Padding(
                                   padding: const EdgeInsets.only(top:5,left:45),
                                   child: Container(
                                    height: 1,
                                   width: MediaQuery.of(context).size.width*0.6,
                                    decoration: BoxDecoration(
                                      border:BorderDirectional(
                                        bottom:BorderSide(
                                          color: kgrey
                                        )
                                      )
                                    ),
                                   ),
                                 ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 60,top:30),
                                 child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                   CircleAvatar(
                                     radius: 20,
                                     backgroundColor: kblue,
                                     child: Center(
                                       child: Text('03',
                                       style:TextStyle(
                                         fontSize: 20,
                                         color:kwhite
                                       )),
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 20),
                                     child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text('Add traveller details',
                                         style: TextStyle(
                                          fontSize: 20,
                                          color: kblue,
                                          fontWeight: FontWeight.bold
                                         ),),
                                         Padding(
                                           padding: const EdgeInsets.only(top:3),
                                           child: Text('NOTE Make sure the names you enter match the way they appear on your passport.',
                                           
                                           style: TextStyle(
                                            height: 2.5,
                                            fontSize: 14.5,
                                            color: kblue
                                           ),),
                                         )
                                       ],
                                     ),
                                   )

                                   ],
                                 ),
                               ),
                                 Padding(
                                   padding: const EdgeInsets.only(left:60,top:20),
                                   child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Adult 1',
                                    
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 20,
                                        
                                        fontWeight: FontWeight.bold,
                                        color: kblue,
                                        
                                      
                                      ),),
                                      Padding(
                                        padding: const EdgeInsets.only(top:15),
                                        child: Text('Traveller name and gender',
                                        style: TextStyle(
                                          fontSize: 15.5,
                                          color: kgrey
                                        ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 45,
                                              width:MediaQuery.of(context).size.width*0.16,
                                              decoration: BoxDecoration(
                                                color:kwhite,
                                              ),
                                              child: TextField(
                                                controller: firstnameController,
                                                decoration: InputDecoration(
                                                  hintText: 'First Name',
                                                  border: OutlineInputBorder()
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:40),
                                              child: Container(
                                                height: 45,
                                                width:MediaQuery.of(context).size.width*0.16,
                                                decoration: BoxDecoration(
                                                  color:kwhite,
                                                ),
                                                child: TextField(
                                                  controller: lastnameController,
                                                  decoration: InputDecoration(
                                                    hintText: 'last Name',
                                                    border: OutlineInputBorder()
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                   padding: const EdgeInsets.only(left: 60,top:0),
                                   child: Row(
                                     children: [
                                       Column(
                                         children: [
                                           Container(
                                            height: 45,
                                            width: MediaQuery.of(context).size.width*0.12,
                                            decoration: BoxDecoration(
                                              color: kwhite,
                                              // border: Border.all(
                                              //   color: kgrey
                                              // )
                                            ),
                                            child: TextField(
                                              controller: genderController,
                                              decoration:InputDecoration(
                                                hintText: 'Gender',
                                                suffixIcon: PopupMenuButton<String>(
                                                  icon: Icon(Icons.arrow_drop_down,
                                                  color:kgrey),
                                                  onSelected: (value){
                                                    setState(() {
                                                      genderController.text=value;
                                                    });
                                                    
                                                  },
                                                  itemBuilder: (contex){
                                                    return gender.map<PopupMenuItem<String>>((String value){
                                                      return PopupMenuItem(child: Text(value,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: kgrey
                                                      ),),value: value,);
                                                    }
                                                    ).toList();
                                                }),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: kgrey
                                                  )
                                                ),
                                                   
                                              ) ,
                                            ),
                                           ),
                                         ],
                                       ),
                                      
                                     ],
                                   ),
                                 ),
                                   
                                          ],
                                        ),
                                      )
                                    ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left:60,top:20),
                                   child: Row(
                                    children: [
                                      Text('Date of birth',
                                      style: TextStyle(
                                        fontSize: 14.5,
                                        color: kgrey
                                      ),)
                                    ],
                                   ),
                                 ),
                                          Padding(
                                   padding: const EdgeInsets.only(left: 60,top:20),
                                   child: Row(
                                     children: [
                                       Container(
                                        height: 45,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          color: kwhite,
                                          // border: Border.all(
                                          //   color: kgrey
                                          // )
                                        ),
                                        child: TextField(
                                          controller: dateController,
                                          decoration:InputDecoration(
                                            hintText: 'DD',
                                            suffixIcon: IconButton(
                                              onPressed: (){
                                                  _bookingselectDate(context);
                                              }, 
                                              icon: Icon(Icons.expand_more_outlined)),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: kgrey
                                              )
                                            ),
                                               
                                          ) ,
                                        ),
                                       ),
                                         Padding(
                                           padding: const EdgeInsets.only(left:40),
                                           child: Container(
                                             height: 45,
                                            width: 90,
                                            decoration: BoxDecoration(
                                            color: kwhite,
                                            // border: Border.all(
                                            //   color: kgrey
                                            // )
                                             ),
                                            child: TextField(
                                            controller: monthController,
                                            decoration:InputDecoration(
                                              hintText: 'MM',
                                              suffixIcon: IconButton(
                                                onPressed: (){
                                                    _bookingselect2Date(context);
                                                }, 
                                                icon: Icon(Icons.expand_more_outlined)),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: kgrey
                                                )
                                              ),
                                                 
                                            ) ,
                                             ),
                                           ),
                                         ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:40),
                                          child: Container(
                                          height: 45,
                                          width: 90,
                                          decoration: BoxDecoration(
                                            color: kwhite,
                                            // border: Border.all(
                                            //   color: kgrey
                                            // )
                                          ),
                                          child: TextField(
                                            controller: yearController,
                                            decoration:InputDecoration(
                                              hintText: 'yyyy',
                                              suffixIcon: IconButton(
                                                onPressed: (){
                                                    _bookingselect3Date(context);
                                                }, 
                                                icon: Icon(Icons.expand_more_outlined)),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: kgrey
                                                )
                                              ),
                                                 
                                            ) ,
                                          ),
                                                                               ),
                                        ),
                                     ],
                                   ),
                                 ),
                                   Padding(
                                         padding: const EdgeInsets.only(top:40,left: 60),
                                         child: Row(
                                          children: [
                                            Text('Passport Number and Nationality',
                                            style: TextStyle(
                                              fontSize: 14.5,
                                              color: kgrey
                                            ),)
                                          ],
                                         ),
                                       
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(top:10,left: 60),
                                         child: Row(
                                           children: [
                                             Container(
                                              height: 50,
                                              width: MediaQuery.of(context).size.width*0.25,
                                              decoration: BoxDecoration(
                                                color:kwhite,
                                                
                                              ),
                                              child:TextField(
                                                controller: passportnumberController,
                                                decoration: InputDecoration(
                                                  suffixIcon: PopupMenuButton<String>(
                                                  icon: Icon(Icons.arrow_drop_down,
                                                  color:kgrey),
                                                  onSelected: (value){
                                                    setState(() {
                                                      passportnumberController.text=value;
                                                    });
                                                    
                                                  },
                                                  itemBuilder: (contex){
                                                    return passnumber.map<PopupMenuItem<String>>((String value){
                                                      return PopupMenuItem(child: Text(value,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: kgrey
                                                      ),),value: value,);
                                                    }
                                                    ).toList();
                                                }),
                                                  hintText: 'Passport Number',
                                                  border:OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: kgrey
                                                    )
                                                  ) ),
                                              )
                                             ),
                                              Padding(
                                                padding: const EdgeInsets.only(left:40),
                                                child: Container(
                                                height: 50,
                                                width: MediaQuery.of(context).size.width*0.25,
                                                decoration: BoxDecoration(
                                                  color:kwhite,
                                                  
                                                ),
                                                child:TextField(
                                                  controller: nationalityController,
                                                  decoration: InputDecoration(
                                                    suffixIcon: PopupMenuButton<String>(
                                                  icon: Icon(Icons.arrow_drop_down,
                                                  color:kgrey),
                                                  onSelected: (value){
                                                    setState(() {
                                                      nationalityController.text=value;
                                                    });
                                                    
                                                  },
                                                  itemBuilder: (contex){
                                                    return nationality.map<PopupMenuItem<String>>((String value){
                                                      return PopupMenuItem(child: Text(value,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: kgrey
                                                      ),),value: value,);
                                                    }
                                                    ).toList();
                                                }),
                                                    hintText: 'Nationality (e.g. India)',
                                                    border:OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: kgrey
                                                      )
                                                    ) ),
                                                )
                                                                                           ),
                                              ),
                                             
                                         
                                           ],
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(left:60,top:20),
                                         child: Row(children: [
                                          Text('Issued Country and Expiry Date',
                                          style:TextStyle(
                                            fontSize: 14.5,
                                            color:kgrey
                                          ))
                                         ],),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(left:60,top:20),
                                         child: Row(
                                                                            children: [
                                                Container(
                                                height: 50,
                                                width: MediaQuery.of(context).size.width*0.25,
                                                decoration: BoxDecoration(
                                                  color:kwhite,
                                                  
                                                ),
                                                child:TextField(
                                                  controller: issuedcountryController,
                                                  decoration: InputDecoration(
                                                    suffixIcon: PopupMenuButton<String>(
                                                    icon: Icon(Icons.arrow_drop_down,
                                                    color:kgrey),
                                                    onSelected: (value){
                                                      setState(() {
                                                        issuedcountryController.text=value;
                                                      });
                                                      
                                                    },
                                                    itemBuilder: (contex){
                                                      return issuedcountry.map<PopupMenuItem<String>>((String value){
                                                        return PopupMenuItem(child: Text(value,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: kgrey
                                                        ),),value: value,);
                                                      }
                                                      ).toList();
                                                  }),
                                                    hintText: 'Issued country name',
                                                    border:OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: kgrey
                                                      )
                                                    ) ),
                                                )
                                               ),
                                                 Padding(
                                            padding: const EdgeInsets.only(left:40),
                                            child: Container(
                                            height: 45,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              color: kwhite,
                                              // border: Border.all(
                                              //   color: kgrey
                                              // )
                                            ),
                                            child: TextField(
                                              controller: yearController,
                                              decoration:InputDecoration(
                                                hintText: 'DD',
                                                suffixIcon: IconButton(
                                                  onPressed: (){
                                                      _issuedselectDate(context);
                                                  }, 
                                                  icon: Icon(Icons.expand_more_outlined)),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: kgrey
                                                  )
                                                ),
                                                   
                                              ) ,
                                            ),
                                                                                 ),
                                                                                 
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:40),
                                            child: Container(
                                            height: 45,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              color: kwhite,
                                              // border: Border.all(
                                              //   color: kgrey
                                              // )
                                            ),
                                            child: TextField(
                                              controller: yearController,
                                              decoration:InputDecoration(
                                                hintText: 'MM',
                                                suffixIcon: IconButton(
                                                  onPressed: (){
                                                      _issuedselect2Date(context);
                                                  }, 
                                                  icon: Icon(Icons.expand_more_outlined)),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: kgrey
                                                  )
                                                ),
                                                   
                                              ) ,
                                            ),
                                                                                 ),
                                          ),
                                          
                                           Padding(
                                            padding: const EdgeInsets.only(left:40),
                                            child: Container(
                                            height: 45,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              color: kwhite,
                                              // border: Border.all(
                                              //   color: kgrey
                                              // )
                                            ),
                                            child: TextField(
                                              controller: yearController,
                                              decoration:InputDecoration(
                                                hintText: 'yyyy',
                                                suffixIcon: IconButton(
                                                  onPressed: (){
                                                      _issuedselect3Date(context);
                                                  }, 
                                                  icon: Icon(Icons.expand_more_outlined)),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: kgrey
                                                  )
                                                ),
                                                   
                                              ) ,
                                            ),
                                                                                 ),
                                          ),
                                                                            ],
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(top:40,left:60),
                                         child: Row(
                                          children:[
                                            GestureDetector(
                                              onTap: (){
                                                Get.offAll(FlaightSeatsBookingScreen());
                                              },
                                              child: Container(
                                                height: 38,
                                                width:MediaQuery.of(context).size.width*0.13,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [
                                                    kOrange,
                                                    kyellow
                                                  ]),
                                                  borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: Center(
                                                  child:Text('Continue',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color:kwhite
                                                  ),)
                                                ),
                                              ),
                                            )
                                          ]
                                         ),
                                       ),
                                       
                                 
                              ],
                            ),
                          ),

                          ksizedbox20,
                         // RegisterCommonBottom()
                          CommonBottom()
                 
                ],
              ),
              ]
            ),
          ) ,
    );
  }
}