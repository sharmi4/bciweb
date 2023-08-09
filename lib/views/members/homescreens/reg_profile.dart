
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/reg_profile_controller.dart';
import 'package:bciweb/views/authentication/landing_screen.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controller/auth_controller/auth_profile_controller.dart';
import '../../../controller/profile_controller.dart';
import '../../../controller/profile_show_controller.dart';
//import '../../../registerhomescreen/common_reg_appbar';
import '../../../controller/setting_controller/setting_controller.dart';
import '../../../controller/subscription_controller/subscription_controller.dart';
import '../../../models/create_account_model.dart';
import '../../../models/member profileupdate.dart';
import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../../registerhomescreen/common_reg_homescreen.dart';
import '../common_widget/common.dart';
import 'package:share_plus/share_plus.dart';

import '../subscribe/views/payment.dart';

class RegisterProfileScreen extends StatefulWidget {
  const RegisterProfileScreen({super.key});

  @override
  State<RegisterProfileScreen> createState() => _RegisterProfileScreenState();
}

class _RegisterProfileScreenState extends State<RegisterProfileScreen> {

   final subscriptionapiController = Get.find<SubscriptionApiController>();
  final reghomeController = Get.find<RegisterProfileController>();
  final regshowController = Get.find<ProfileShowController>();
  final authprofileController = Get.find<AuthProfileController>();
  final profileController = Get.find<ProfileController>();
  final subscripeController = Get.find<SubscriptionApiController>();

  var nameController = TextEditingController();
  var dobController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();
  var occupationController = TextEditingController();
  var fathernameController = TextEditingController();
  var mothernameController = TextEditingController();
  var wedingnameController = TextEditingController();
  var spousenameController = TextEditingController();
  var dateofbirthController = TextEditingController();
  var childrensController = TextEditingController();
  var referalCOntroller = TextEditingController();
  var subNameController = TextEditingController();
  var subMobileController = TextEditingController();
  var subEmailController = TextEditingController();
  var subDescriptionController = TextEditingController();
  var subtitleController = TextEditingController();
  var adharController = TextEditingController();
  var gstnoController = TextEditingController();
  var pannoController = TextEditingController();
  var branchController = TextEditingController();
  var qualificationController = TextEditingController();
  var officebnameController = TextEditingController();
  var officedoornoController = TextEditingController();
  var officeaddressController = TextEditingController();
  var officeaddresController = TextEditingController();
  var officecityController = TextEditingController();
  var officestateController = TextEditingController();

  var resibnameController = TextEditingController();
  var residoornumberController = TextEditingController();
  var resibcityController = TextEditingController();
  var resistateController = TextEditingController();
  var resiperidController = TextEditingController();
  var resiadaridController = TextEditingController();
  var resiaddressController = TextEditingController();
  dynamic imageprofile;

  List colors = [
    const Color(0xffFCE2E2),
    const Color(0xffE4E4E4),
    const Color(0xffF8AC61),
    const Color(0xff8DC6FF),
    const Color(0xffEDD076),
    const Color(0xff90E79C),
    const Color(0xff00D8E0),
    const Color(0xff396DB4),
    const Color(0xffD9908A),
  ];
  String cardimgae='';
  int temindex=0;
  @override
  void initState() {
    super.initState();
    setDefauld();
    subscripeController.getcouponsList();
    authprofileController.getProfile();
    apisettingController.getwalletList();
    apisettingController.generateReferralCode();  
    apisettingController.ourPartner();
    // plansController.getPlanDetails(id: int.parse(authprofileController.planId.value));

  }
 final plansController=Get.find<SubscriptionApiController>();
 
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobController.text =
            '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
      });
    }
  }

  DateTime selectedDate2 = DateTime.now();
  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobController.text =
            '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
      });
    }
  }

  bool isMarried = false;
  bool isUnmarried = false;
  int offersindex = 0;
  bool isLoading = false;
  List partnerimage = [
    'assets/images/partnerimage1.png',
    'assets/images/partnerimage2.png',
    'assets/images/partnerimage3.png',
    'assets/images/partnerimage4.png',
    'assets/images/partnerimage5.png',
    'assets/images/partnerimage6.png'
  ];
// @override
// void initState() {

//   super.initState();
//     setDefauld();
// }
  setDefauld() async {
    await authprofileController.getProfile();
    subNameController.text = authprofileController.profileData.first.name;
    subEmailController.text = authprofileController.profileData.first.email;
    subMobileController.text = authprofileController.profileData.first.mobile;

    if (authprofileController.profileData.isNotEmpty) {
      nameController.text = authprofileController.profileData.first.name;
      numberController.text = authprofileController.profileData.first.mobile;
      emailController.text = authprofileController.profileData.first.email;
      occupationController.text =
          authprofileController.profileData.first.occupation;
          qualificationController.text = authprofileController.profileData.first.qualification;
      fathernameController.text =
          authprofileController.profileData.first.fatherName;
          gstnoController.text = authprofileController.profileData.first.gstNo;
          pannoController.text = authprofileController.profileData.first.panNo;
      mothernameController.text =
          authprofileController.profileData.first.motherName;
          spousenameController.text =authprofileController.profileData.first.spouse;
            dateofbirthController.text = authprofileController.profileData.first.dob;
      officedoornoController.text =
          authprofileController.profileData.first.officialAddress.doorNo;
      officebnameController.text =
          authprofileController.profileData.first.officialAddress.buildingName;
      officeaddresController.text =
          authprofileController.profileData.first.officialAddress.address;

      officeaddresController.text =
          authprofileController.profileData.first.officialAddress.city;
      officestateController.text =
          authprofileController.profileData.first.officialAddress.state;

      setState(() {
        isMarried = authprofileController.profileData.first.isMarried == "0"
            ? false
            : true;
        isUnmarried = authprofileController.profileData.first.isMarried == "0"
            ? false
            : true;
      });
      
    }
  }
  
AlertDialog mAlertItem2 = AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Confirmation", style:TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold
      )),
      content: Text(
        "Are you sure you want to logout?",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        TextButton(
          child: Text(
            "Yes",
            style: TextStyle(color: kblue),
          ),
          onPressed: () {
           Get.offAll(LandingScreen());
          },
        ),
        TextButton(
          child: Text("No", style: TextStyle(color: kblue)),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
    final apisettingController = Get.find <ApiSettingController>(); 
    
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
            final List<ChartData> chartData = [
            ChartData('David', 25, Color.fromRGBO(9,0,136,1)),
            ChartData('Steve', 38, Color.fromRGBO(147,0,119,1)),
            ChartData('Jack', 34, Color.fromRGBO(228,0,124,1)),
            ChartData('Others', 52, Color.fromRGBO(255,189,57,1))
        ];

    return Scaffold(
      appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonScreen(),
              RegisterCommonContainer(),
            ],
          ),
          preferredSize: const Size(double.infinity, 110)),
      body: Obx(
        () => ListView(children: [
          // RegisterCommonContainer(),

          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 900,
              width: 195,
              color: kyellow,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(0);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color: reghomeController.proindex == 0
                                    ? kblue
                                    : kyellow),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 20,
                                    color: kwhite,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'My Account',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(1);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color: reghomeController.proindex == 1
                                    ? kblue
                                    : kyellow),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/profiledashboard.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'Dashboard',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(2);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color: reghomeController.proindex == 2
                                    ? kblue
                                    : kyellow),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/profileoffers.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'Offers',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //  Padding(
                  //   padding: const EdgeInsets.only(top: 20),
                  //   child: Row(
                  //     children: [
                  //      InkWell(
                  //       onTap: (){
                  //          reghomeController.proindex(3);
                  //           reghomeController.update();
                  //       },
                  //        child: Container(
                  //            height: 40,
                  //            width: 195,
                  //              decoration: BoxDecoration(
                  //              border: BorderDirectional(
                  //             bottom: BorderSide(
                  //               color: kwhite
                  //             )
                  //           ),
                  //           color:reghomeController.proindex==3?kblue:kyellow
                  //                                      ),
                  //        child: Padding(
                  //          padding: const EdgeInsets.only(left: 20),
                  //          child: Row(
                  //            children: [
                  //             Image.asset('assets/icons/profilecuopons.png',
                  //             height: 15,fit: BoxFit.fitHeight,),
                  //              Padding(
                  //                padding: const EdgeInsets.only(left: 11),
                  //                child: Text('Your Coupons',
                  //                style: TextStyle(
                  //                 color: kwhite
                  //                ),),
                  //              ),
                  //            ],
                  //          ),
                  //        ),),
                  //      )
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(4);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color: reghomeController.proindex == 4
                                    ? kblue
                                    : kyellow),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/proaditionaloffer.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'My Subscription',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(5);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(color: kwhite)),
                              color: reghomeController.proindex == 5
                                  ? kblue
                                  : kyellow,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/profilerefferal.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'Your Referrals',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(6);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(color: kwhite)),
                              color: reghomeController.proindex == 6
                                  ? kblue
                                  : kyellow,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 11),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/profilepartner.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'Our Partner',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(7);
                            reghomeController.update();
                          },
                          child: Container(
                            height: 40,
                            width: 195,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color: reghomeController.proindex == 7
                                    ? kblue
                                    : kyellow),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/profileupgrade.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'Upgrade',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(8);
                            reghomeController.update();
                          },
                          child: Container(
                            width: 195,
                            height: 40,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color: reghomeController.proindex == 8
                                    ? kblue
                                    : kyellow),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/profilesubort.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'Support',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            reghomeController.proindex(9);
                            reghomeController.update();
                          showDialog(
                context: context,
                builder: (BuildContext context) {
                  return mAlertItem2;
                });
                            //Get.offAll(LandingScreen());
                          },
                          child: Container(
                            width: 195,
                            height: 40,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(color: kwhite)),
                                color: reghomeController.proindex == 9
                                    ? kblue
                                    : kyellow),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/profilelogout.png',
                                    height: 20,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text(
                                      'Logout',
                                      style: TextStyle(color: kwhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  
                ],
              ),
            ),
            if (reghomeController.proindex.value == 0)
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 195,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              'Profile Settting',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: kblue),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150, top: 20),
                            child: InkWell(
                              onTap: () {
                                profileController.profileindex(0);
                                profileController.update();
                              },
                              child: Image.asset(
                                'assets/icons/profiledropdown.png',
                                height: 10,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 1, left: 10, right: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      if (profileController.profileindex.value == 0)
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Column(
                            children: [
                              Stack(children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 60, left: 75),
                                  child: GetBuilder<AuthProfileController>(
                                      builder: (_) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(""),
                                        if (authprofileController
                                            .profileData.isNotEmpty)
                                          InkWell(
                                              onTap: () async {
                                                PickedFile? pickedFile =
                                                    await ImagePicker()
                                                        .getImage(
                                                  source: ImageSource.gallery,
                                                );

                                                var tempCont = await pickedFile!
                                                    .readAsBytes();
                                                setState(() {
                                                  imageprofile = tempCont;
                                                });
                                                authprofileController
                                                    .updateProfilePic(
                                                        imageprofile);
                                              },
                                              child: imageprofile != null
                                                  ? Image.memory(imageprofile!)
                                                  : authprofileController
                                                              .profileData
                                                              .first
                                                              .profilePicture ==
                                                          null
                                                      ? Image.asset(
                                                          'assets/images/profileimage.png')
                                                      : CircleAvatar(
                                                          radius: 60.0,
                                                          backgroundImage: NetworkImage(
                                                              authprofileController
                                                                  .profileData
                                                                  .first
                                                                  .profilePicture),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                        )
                                              //  Container(
                                              //     height: 60,
                                              //     width: 60,
                                              //     decoration: BoxDecoration(
                                              //         borderRadius:
                                              //             BorderRadius
                                              //                 .circular(
                                              //                     90),
                                              //         image: DecorationImage(
                                              //             image: NetworkImage(
                                              //                 authprofileController
                                              //                     .profileData
                                              //                     .first
                                              //                     .profilePicture,))),
                                              //   )
                                              ),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 40),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                                color: Color(0xffFF5003),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                )
                              ]),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40,
                                          right: 70,
                                          top: 30,
                                          bottom: 30),
                                      child: TextField(
                                           textInputAction: TextInputAction.next,
                                        controller: nameController,
                                        decoration: InputDecoration(
                                            hintText: 'User Name',
                                            suffixIcon: Icon(Icons.edit),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 70,
                                          right: 50,
                                          top: 30,
                                          bottom: 30),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            TextField(
                                                controller:
                                                    dateofbirthController,
                                                decoration: InputDecoration(
                                                    hintText:
                                                        'Enter Date Of Birth',
                                                    suffixIcon: IconButton(
                                                      onPressed: () {
                                                        _selectDate(context);
                                                      },
                                                      icon: Icon(Icons.edit),
                                                    ),
                                                    fillColor:
                                                        Color(0xffF9F8FD),
                                                    border:
                                                        OutlineInputBorder())),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40,
                                          right: 70,
                                          top: 0,
                                          bottom: 30),
                                      child: TextField(
                                           textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: emailController,
                                        decoration: InputDecoration(
                                            hintText: 'Enter Email',
                                            suffixIcon: Icon(Icons.edit),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 70,
                                          right: 50,
                                          top: 0,
                                          bottom: 30),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            TextField(
                                                 textInputAction: TextInputAction.next,
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: numberController,
                                                decoration: InputDecoration(
                                                    hintText:
                                                        'Enter Phone Number',
                                                    suffixIcon: IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(Icons.edit),
                                                    ),
                                                    fillColor:
                                                        Color(0xffF9F8FD),
                                                    border:
                                                        OutlineInputBorder())),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40,
                                          right: 70,
                                          top: 0,
                                          bottom: 30),
                                      child: TextField(
                                           textInputAction: TextInputAction.next,
                                        controller: occupationController,
                                        decoration: InputDecoration(
                                            hintText: 'Occupation',
                                            suffixIcon: Icon(Icons.edit),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 70,
                                          right: 50,
                                          top: 0,
                                          bottom: 30),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            TextField(
                                                 textInputAction: TextInputAction.next,
                                                controller:
                                                    fathernameController,
                                                decoration: InputDecoration(
                                                    hintText: 'Father Name',
                                                    suffixIcon: IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(Icons.edit),
                                                    ),
                                                    fillColor:
                                                        Color(0xffF9F8FD),
                                                    border:
                                                        OutlineInputBorder())),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40,
                                          right: 70,
                                          top: 0,
                                          bottom: 30),
                                      child: TextField(
                                           textInputAction: TextInputAction.next,
                                        controller: mothernameController,
                                        decoration: InputDecoration(
                                            hintText: 'Mother Name',
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 70,
                                          right: 50,
                                          top: 0,
                                          bottom: 30),
                                      child: Container(
                                        height: 50,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: kwhite,
                                            border: Border.all(color: kgrey)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5, left: 1),
                                              child: Row(
                                                children: [
                                                  Checkbox(
                                                      value: isMarried,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          isMarried = value!;
                                                        });
                                                      }),
                                                  Text('Married'),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 40),
                                                    child: Checkbox(
                                                        value: isUnmarried,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            isUnmarried =
                                                                value!;
                                                          });
                                                        }),
                                                  ),
                                                  Text('Unmarried')
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40,
                                          right: 70,
                                          top: 0,
                                          bottom: 30),
                                      child: TextField(
                                           textInputAction: TextInputAction.next,
                                          controller: wedingnameController,
                                          decoration: InputDecoration(
                                              hintText: 'Wedding Date',
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  // _selectDate2(context);
                                                },
                                                icon: Icon(Icons.edit),
                                              ),
                                              fillColor: Color(0xffF9F8FD),
                                              border: OutlineInputBorder())),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 70,
                                          right: 50,
                                          top: 0,
                                          bottom: 30),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            TextField(
                                                 textInputAction: TextInputAction.next,
                                              controller: spousenameController,
                                              decoration: InputDecoration(
                                                  hintText: 'Spouse Name',
                                                  suffixIcon: Icon(Icons.edit),
                                                  fillColor: Color(0xffF9F8FD),
                                                  border: OutlineInputBorder()),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40,
                                          right: 70,
                                          top: 0,
                                          bottom: 30),
                                      child: TextField(
                                           textInputAction: TextInputAction.next,
                                          controller: dobController,
                                          decoration: InputDecoration(
                                              hintText: 'Date of Birth',
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  _selectDate2(context);
                                                },
                                                icon: Icon(Icons.edit),
                                              ),
                                              fillColor: Color(0xffF9F8FD),
                                              border: OutlineInputBorder())),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 70,
                                          right: 50,
                                          top: 0,
                                          bottom: 30),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            TextField(
                                                 textInputAction: TextInputAction.next,
                                              controller: childrensController,
                                              decoration: InputDecoration(
                                                  hintText: 'No.Of.Children',
                                                  suffixIcon: Icon(Icons.edit),
                                                  fillColor: Color(0xffF9F8FD),
                                                  border: OutlineInputBorder()),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 40),
                              //   child: Row(
                              //     children: [
                              //       Container(
                              //         height: 49,
                              //         width: MediaQuery.of(context).size.width *
                              //             0.34,
                              //         decoration: BoxDecoration(
                              //             color: kwhite,
                              //             border: Border.all(color: kgrey)),
                              //         child: Column(
                              //           crossAxisAlignment:
                              //               CrossAxisAlignment.center,
                              //           children: [
                              //             Padding(
                              //               padding: const EdgeInsets.only(
                              //                   top: 5, left: 10),
                              //               child: Row(
                              //                 children: [
                              //                   Text('18 Yrs'),
                              //                   Checkbox(
                              //                       value: _value3,
                              //                       onChanged: (value) {
                              //                         setState(() {
                              //                           _value3 = value!;
                              //                         });
                              //                       }),
                              //                   Text('Above'),
                              //                   Padding(
                              //                     padding:
                              //                         const EdgeInsets.only(
                              //                             left: 40),
                              //                     child: Checkbox(
                              //                         value: _value4,
                              //                         onChanged: (value) {
                              //                           setState(() {
                              //                             _value4 = value!;
                              //                           });
                              //                         }),
                              //                   ),
                              //                   Text('Blow')
                              //                 ],
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Obx(
                                () => authprofileController.isLoading.isTrue
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            top: 50, left: 50),
                                        child: Row(
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: korange,
                                                    minimumSize: Size(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                        45)),
                                                onPressed: () {
                                                  MemberProfileUpdateModel
                                                      memberProfileUpdateModel =
                                                      MemberProfileUpdateModel(
                                                    name: nameController.text,
                                                    email: emailController.text,
                                                    dateOfBirth:
                                                        dateofbirthController
                                                            .text,
                                                    fatherName:
                                                        fathernameController
                                                            .text,
                                                    isMarried: isMarried == true
                                                        ? "1"
                                                        : "0",
                                                    mobile:
                                                        numberController.text,
                                                    motherName:
                                                        mothernameController
                                                            .text,
                                                    occupation:
                                                        occupationController
                                                            .text,
                                                             aadharno:adharController.text , 
                                                            branch: branchController.text , 
                                                            children: childrensController.text, 
                                                            gstno: gstnoController.text, 
                                                            marrigedate: wedingnameController.text, 
                                                            panNo: pannoController.text, 
                                                            qulification:qualificationController.text , 
                                                            spouse: spousenameController
                                                            .text,
                                                  );

                                                  authprofileController.updateProfile(
                                                      memberProfileUpdateModel:
                                                          memberProfileUpdateModel);
                                                },
                                                child:
                                                    CircularProgressIndicator(
                                                  color: kwhite,
                                                ))
                                          ],
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            top: 50, left: 50),
                                        child: Row(
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: korange,
                                                    minimumSize: Size(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                        45)),
                                                onPressed: () {
                                                  MemberProfileUpdateModel
                                                      memberProfileUpdateModel =
                                                      MemberProfileUpdateModel(
                                                    name: nameController.text,
                                                    email: emailController.text,
                                                    dateOfBirth:
                                                        dateofbirthController
                                                            .text,
                                                    fatherName:
                                                        fathernameController
                                                            .text,
                                                    isMarried: isMarried == true
                                                        ? "1"
                                                        : "0",
                                                    mobile:
                                                        numberController.text,
                                                    motherName:
                                                        mothernameController
                                                            .text,
                                                    occupation:
                                                        occupationController
                                                            .text, aadharno: null,
                                                             branch: null, 
                                                             children: null, 
                                                             gstno: null, 
                                                             marrigedate: null, 
                                                             panNo: null, 
                                                             qulification: null, 
                                                             spouse: null,
                                                  );

                                                  authprofileController.updateProfile(
                                                      memberProfileUpdateModel:
                                                          memberProfileUpdateModel);
                                                },
                                                child: Text('Update'))
                                          ],
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              'Office Address',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: kblue),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150, top: 20),
                            child: InkWell(
                              onTap: () {
                                profileController.profileindex(1);
                                profileController.update();
                              },
                              child: Image.asset(
                                'assets/icons/profiledropdown.png',
                                height: 10,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 1, left: 10, right: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              'Residential Address',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: kblue),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150, top: 20),
                            child: InkWell(
                              onTap: () {
                                profileController.profileindex(2);
                                profileController.update();
                              },
                              child: Image.asset(
                                'assets/icons/profiledropdown.png',
                                height: 10,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 1, left: 10, right: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      if (profileController.profileindex.value == 1)
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 50, top: 50),
                                      child: TextField(
                                           textInputAction: TextInputAction.next,
                                        controller: officedoornoController,
                                        decoration: InputDecoration(
                                            hintText: 'Door Number',
                                            suffixIcon: Icon(Icons.edit),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50, right: 50, top: 50),
                                    child: TextField(
                                         textInputAction: TextInputAction.next,
                                      controller: officebnameController,
                                      decoration: InputDecoration(
                                          hintText: 'Building Number',
                                          suffixIcon: Icon(Icons.edit),
                                          fillColor: Color(0xffF9F8FD),
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 50, top: 50),
                                      child: TextField(
                                           textInputAction: TextInputAction.next,
                                        controller: officeaddresController,
                                        decoration: InputDecoration(
                                            hintText: 'Address',
                                            suffixIcon: Icon(Icons.edit),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50, right: 50, top: 50),
                                    child: TextField(
                                         textInputAction: TextInputAction.next,
                                      controller: officecityController,
                                      decoration: InputDecoration(
                                          hintText: 'City',
                                          suffixIcon: Icon(Icons.edit),
                                          fillColor: Color(0xffF9F8FD),
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50, top: 50),
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: TextField(
                                         textInputAction: TextInputAction.next,
                                      controller: officestateController,
                                      decoration: InputDecoration(
                                          hintText: 'State',
                                          suffixIcon: Icon(Icons.edit),
                                          fillColor: Color(0xffF9F8FD),
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Obx(
                              () => authprofileController.isLoading.isTrue
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, top: 50),
                                      child: Row(
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: korange,
                                                  minimumSize: Size(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.36,
                                                      45)),
                                              onPressed: () {
                                                AddressModel addressModel =
                                                    AddressModel(
                                                  aadhrId: "",
                                                  address:
                                                      officeaddresController
                                                          .text,
                                                  buildingName:
                                                      officebnameController
                                                          .text,
                                                  city:
                                                      officecityController.text,
                                                  doorNo: officedoornoController
                                                      .text,
                                                  personalId: "",
                                                  state: officestateController
                                                      .text,
                                                );

                                                authprofileController
                                                    .updateOfficalAddress(
                                                        officialAddress:
                                                            addressModel);
                                              },
                                              child: CircularProgressIndicator(
                                                  color: kwhite))
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, top: 50),
                                      child: Row(
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: korange,
                                                  minimumSize: Size(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.36,
                                                      45)),
                                              onPressed: () {
                                                AddressModel addressModel =
                                                    AddressModel(
                                                  aadhrId: "",
                                                  address:
                                                      officeaddresController
                                                          .text,
                                                  buildingName:
                                                      officebnameController
                                                          .text,
                                                  city:
                                                      officecityController.text,
                                                  doorNo: officedoornoController
                                                      .text,
                                                  personalId: "",
                                                  state: officestateController
                                                      .text,
                                                );

                                                authprofileController
                                                    .updateOfficalAddress(
                                                        officialAddress:
                                                            addressModel);
                                              },
                                              child: Text(
                                                'Update',
                                                style: TextStyle(fontSize: 17),
                                              ))
                                        ],
                                      ),
                                    ),
                            ),
                          ],
                        )),
                      if (profileController.profileindex.value == 2)
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 50, right: 50, top: 50),
                                        child: TextField(
                                             textInputAction: TextInputAction.next,
                                          controller: residoornumberController,
                                          decoration: InputDecoration(
                                              hintText: 'Door Number',
                                              suffixIcon: Icon(Icons.edit),
                                              fillColor: Color(0xffF9F8FD),
                                              border: OutlineInputBorder()),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 50, top: 50),
                                      child: TextField(
                                           textInputAction: TextInputAction.next,
                                        controller: resibnameController,
                                        decoration: InputDecoration(
                                            hintText: 'Building Number',
                                            suffixIcon: Icon(Icons.edit),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 50, right: 50, top: 50),
                                        child: TextField(
                                             textInputAction: TextInputAction.next,
                                          controller: resiaddressController,
                                          decoration: InputDecoration(
                                              hintText: 'Address',
                                              suffixIcon: Icon(Icons.edit),
                                              fillColor: Color(0xffF9F8FD),
                                              border: OutlineInputBorder()),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 50, top: 50),
                                      child: TextField(
                                           textInputAction: TextInputAction.next,
                                        controller: resibcityController,
                                        decoration: InputDecoration(
                                            hintText: 'City',
                                            suffixIcon: Icon(Icons.edit),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 50, right: 50, top: 50),
                                        child: TextField(
                                             textInputAction: TextInputAction.next,
                                          controller: resistateController,
                                          decoration: InputDecoration(
                                              hintText: 'State',
                                              suffixIcon: Icon(Icons.edit),
                                              fillColor: Color(0xffF9F8FD),
                                              border: OutlineInputBorder()),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 50, top: 50),
                                      child: TextField(
                                           textInputAction: TextInputAction.next,
                                        controller: resiperidController,
                                        decoration: InputDecoration(
                                            hintText: 'Personal Id',
                                            suffixIcon: Icon(Icons.upload),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 50, top: 50),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: TextField(
                                           textInputAction: TextInputAction.next,
                                        controller: resiadaridController,
                                        decoration: InputDecoration(
                                            hintText: 'Adhaar Id',
                                            suffixIcon: Icon(Icons.upload),
                                            fillColor: Color(0xffF9F8FD),
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Obx(
                                () => Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 40),
                                  child: profileController.isLoading.isTrue
                                      ? InkWell(
                                          onTap: () {
                                            AddressModel addressModel =
                                                AddressModel(
                                                    aadhrId:
                                                        resiadaridController
                                                            .text,
                                                    address:
                                                        resiaddressController
                                                            .text,
                                                    buildingName:
                                                        resibnameController
                                                            .text,
                                                    city: resibcityController
                                                        .text,
                                                    doorNo:
                                                        residoornumberController
                                                            .text,
                                                    personalId:
                                                        resiperidController
                                                            .text,
                                                    state: resistateController
                                                        .text);
                                            authprofileController
                                                .updateRecidencyAddress(
                                                    residentialAddress:
                                                        addressModel);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 40),
                                            child: Container(
                                                height: 50,
                                                width: size.width * 0.36,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffFF9021)),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0xffFF5003),
                                                        blurRadius: 2.0,
                                                      ),
                                                    ]),
                                                child:
                                                    CircularProgressIndicator(
                                                        color: kwhite)),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            AddressModel addressModel =
                                                AddressModel(
                                                    aadhrId:
                                                        resiadaridController
                                                            .text,
                                                    address:
                                                        resiaddressController
                                                            .text,
                                                    buildingName:
                                                        resibnameController
                                                            .text,
                                                    city: resibcityController
                                                        .text,
                                                    doorNo:
                                                        residoornumberController
                                                            .text,
                                                    personalId:
                                                        resiperidController
                                                            .text,
                                                    state: resistateController
                                                        .text);
                                            authprofileController
                                                .updateRecidencyAddress(
                                                    residentialAddress:
                                                        addressModel);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 40),
                                            child: Container(
                                              height: 50,
                                              width: size.width * 0.36,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffFF9021)),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Color(0xffFF5003),
                                                      blurRadius: 2.0,
                                                    ),
                                                  ]),
                                              child: const Center(
                                                child: Text(
                                                  "Submit",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17),
                                                ),
                                              ),
                                            ),
                                          ),
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
            if (reghomeController.proindex.value == 1)
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: MediaQuery.of(context).size.width - 195,
                  child: GetBuilder<ApiSettingController>(
                    builder: (_) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child:authprofileController.profileData.isEmpty?Text(
                                  'Hello, Benze',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: kblue,
                                      fontWeight: FontWeight.w500),
                                ):Text('Hello ${authprofileController.profileData.first.name}'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 100),
                                child:authprofileController.profileData.isEmpty? Image.asset(
                                  'assets/images/profileimage.png',
                                  height: 75,
                                  fit: BoxFit.fitHeight,
                                ):Image.network(authprofileController.profileData.first.profilePicture),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Get.offAll(RegisterProfileController());
                                  },
                                  child: Text(
                                    'View Profile',
                                    style: TextStyle(color: kblue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: Row(
                              children: [
                                Container(
                                  height: 1,
                                  width: 80,
                                  color: kgrey,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100, top: 30),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * 0.68,
                                  decoration: BoxDecoration(
                                      color: kwhite,
                                      border: Border.all(color: kblue),
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            offset: Offset(0.0, 0.75),
                                            blurRadius: 5,
                                            color: kgrey)
                                      ]),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 30),
                                        child: Text(
                                          'Wallet Amount',
                                          style:
                                              TextStyle(fontSize: 17, color: kblue),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 580),
                                        child:apisettingController.getWalletData.isEmpty? Text(
                                          '',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: kblue,
                                          ),
                                        ):Text(''),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 13),
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: kblue,
                                          child: Icon(
                                            Icons.chevron_right,
                                            color: kwhite,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 100, top: 45),
                                child: Text(
                                  'Your Coupons',
                                  style: TextStyle(fontSize: 22, color: kblue),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 110, top: 45),
                                child: Text(
                                  'View',
                                  style: TextStyle(fontSize: 22, color: kyellow),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100, top: 35),
                            child: Row(
                              children: [
                                Container(
                                  height: 160,
                                  width: MediaQuery.of(context).size.width * 0.68,
                                  decoration: BoxDecoration(
                                      color: kwhite,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: kgrey,
                                            blurRadius: 5,
                                            offset: Offset(0.0, 0.75))
                                      ],
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 40, top: 10),
                                            child:Column(
                                              children: [
                                                Container(
                                                  height: 110,
                                                  width: 110,
                    child: SfCircularChart(
                        annotations: <CircularChartAnnotation>[
                         CircularChartAnnotation(
                           widget: Container(
                            height: 100,
                            width: 100,
           
)),
                                CircularChartAnnotation(
                                  widget: Container(
                                    
                                  child: apisettingController.getWalletData.isEmpty? 
                                  Text('')
                                  :Text(apisettingController.getWalletData.first.coupon.totalCouponCodes.toString(),
                                 style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 17))))
                                   ],
                        series: <CircularSeries>[
                            DoughnutSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                // Radius of doughnut
                                radius: '80%'
                            )
                        ]
                    )
                ),
                 Text(
                                              'Total',
                                              style: TextStyle(
                                                  fontSize: 17, color: kblue),
                                            ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 110,
                                                  width: 110,
                    child: SfCircularChart(
                        annotations: <CircularChartAnnotation>[
                         CircularChartAnnotation(
                           widget: Container(
                            height: 100,
                            width: 100,
           
)),
                                CircularChartAnnotation(
                                  widget: Container(
                                    
                                  child: apisettingController.getWalletData.isEmpty? 
                                  Text('')
                                  :Text(apisettingController.getWalletData.first.coupon.todayUsed.toString(),
                                 style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 17))))
                                   ],
                        series: <CircularSeries>[
                            DoughnutSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                // Radius of doughnut
                                radius: '80%'
                            )
                        ]
                    )
                ),
                 Text(
                                              'Used',
                                              style: TextStyle(
                                                  fontSize: 17, color: kblue),
                                            ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 60, top: 10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 110,
                                                  width: 110,
                    child: SfCircularChart(
                        annotations: <CircularChartAnnotation>[
                         CircularChartAnnotation(
                           widget: Container(
                            height: 100,
                            width: 100,
           
)),
                                CircularChartAnnotation(
                                  widget: Container(
                                    
                                  child: apisettingController.getWalletData.isEmpty? 
                                  Text('')
                                  :Text(apisettingController.getWalletData.first.coupon.thisMonthUsed.toString(),
                                 style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 17))))
                                   ],
                        series: <CircularSeries>[
                            DoughnutSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                // Radius of doughnut
                                radius: '80%'
                            )
                        ]
                    )
                ),
                 Text(
                                              'Pending',
                                              style: TextStyle(
                                                  fontSize: 17, color: kblue),
                                            ),
                                              ],
                                            ),
                                              ),
                                          
                                        
                                        ],
                                      ),
                                    
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 100, top: 45),
                                child: Text(
                                  'Your Referrals',
                                  style: TextStyle(fontSize: 22, color: kblue),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 110, top: 45),
                                child: Text(
                                  'Invite',
                                  style: TextStyle(fontSize: 22, color: kyellow),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100, top: 35),
                            child: Row(
                              children: [
                                Container(
                                  height: 160,
                                  width: MediaQuery.of(context).size.width * 0.68,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: kwhite,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            offset: Offset(0.0, 0.75),
                                            blurRadius: 5,
                                            color: kgrey)
                                      ]),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 40, top: 10),
                                            child:  Column(
                                              children: [
                                                Container(
                                                  height: 110,
                                                  width: 110,
                    child: SfCircularChart(
                        annotations: <CircularChartAnnotation>[
                         CircularChartAnnotation(
                           widget: Container(
                            height: 100,
                            width: 100,
           
)),
                                CircularChartAnnotation(
                                  widget: Container(
                                    
                                  child: apisettingController.getWalletData.isEmpty? 
                                  Text('')
                                  :Text(apisettingController.getWalletData.first.referrals.totalReferrals.toString(),
                                 style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 17))))
                                   ],
                        series: <CircularSeries>[
                            DoughnutSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                // Radius of doughnut
                                radius: '80%'
                            )
                        ]
                    )
                ),
                 Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, top: 0),
                                            child: Text(
                                              'Total',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(

                                                  fontSize: 17, color: kblue),
                                            ),
                                          ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child:  Column(
                                              children: [
                                                Container(
                                                  height: 110,
                                                  width: 110,
                    child: SfCircularChart(
                        annotations: <CircularChartAnnotation>[
                         CircularChartAnnotation(
                           widget: Container(
                            height: 100,
                            width: 100,
           
)),
                                CircularChartAnnotation(
                                  widget: Container(
                                    
                                  child: apisettingController.getWalletData.isEmpty? 
                                  Text('')
                                  :Text(apisettingController.getWalletData.first.referrals.todayReferrals.toString(),
                                 style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 17))))
                                   ],
                        series: <CircularSeries>[
                            DoughnutSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                // Radius of doughnut
                                radius: '80%'
                            )
                        ]
                    )
                ),
                           
                             Padding(
                                            padding: const EdgeInsets.only(top: 0),
                                            child: Text(
                                              'Used',
                                              style: TextStyle(
                                                  fontSize: 17, color: kblue),
                                            ),
                                          ),                     ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 60, top: 10),
                                            child:  Column(
                                              children: [
                                                Container(
                                                  height: 110,
                                                  width: 110,
                    child: SfCircularChart(
                        annotations: <CircularChartAnnotation>[
                         CircularChartAnnotation(
                           widget: Container(
                            height: 100,
                            width: 100,
           
)),
                                CircularChartAnnotation(
                                  widget: Container(
                                    
                                  child: apisettingController.getWalletData.isEmpty? 
                                  Text('')
                                  :Text(apisettingController.getWalletData.first.referrals.thisMonthReferrals.toString(),
                                 style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 17))))
                                   ],
                        series: <CircularSeries>[
                            DoughnutSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                // Radius of doughnut
                                radius: '80%'
                            )
                        ]
                    )
                ),
                 
                                         
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 0, top: 0),
                                            child: Text(
                                              'Pending',
                                              style: TextStyle(
                                                  fontSize: 17, color: kblue),
                                            ),
                                          )
                                                                    ],
                                            ),
                                          ),
                                        ],
                                      ),
                                     
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                ),
              ),
            if (reghomeController.proindex.value == 2)
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: MediaQuery.of(context).size.width - 195,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: [
                            Text('Member Offer',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: kblue)),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 30),
                            child: Container(
                              height: 130,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                  color: Color(0xff594A99),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Best Deals \nof Today',
                                      style: TextStyle(
                                          height: 1.7,
                                          fontSize: 19,
                                          color: kwhite),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset(
                                      'assets/images/offersimage.png',
                                      fit: BoxFit.fitHeight,
                                      height: 110,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 120, top: 30),
                            child: Container(
                              height: 130,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                  color: kyellow,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Best Deals \nof Today',
                                      style: TextStyle(
                                          height: 1.7,
                                          fontSize: 19,
                                          color: kwhite),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset(
                                      'assets/images/offersimage.png',
                                      fit: BoxFit.fitHeight,
                                      height: 110,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 30),
                            child: Container(
                              height: 130,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                  color: Color(0xff0A7A0D),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Best Deals \nof Today',
                                      style: TextStyle(
                                          height: 1.7,
                                          fontSize: 19,
                                          color: kwhite),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset(
                                      'assets/images/offersimage.png',
                                      fit: BoxFit.fitHeight,
                                      height: 110,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 120, top: 30),
                            child: Container(
                              height: 130,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                  color: kblue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Best Deals \nof Today',
                                      style: TextStyle(
                                          height: 1.7,
                                          fontSize: 19,
                                          color: kwhite),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset(
                                      'assets/images/offersimage.png',
                                      fit: BoxFit.fitHeight,
                                      height: 110,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            if (reghomeController.proindex.value == 3)
              Container(
                width: MediaQuery.of(context).size.width - 195,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width - 195,
                          decoration: BoxDecoration(color: kblue),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    regshowController.showindex(0);
                                    offersindex = 0;
                                    regshowController.update();
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    height: 30,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color:
                                            offersindex == 0 ? kyellow : kblue,
                                        borderRadius: BorderRadius.circular(5),
                                        border: offersindex == 0
                                            ? Border.all(color: kwhite)
                                            : null),
                                    child: Center(
                                        child: Text(
                                      'Other Coupons',
                                      style: TextStyle(
                                        color:
                                            offersindex == 0 ? kwhite : kwhite,
                                      ),
                                    )),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      regshowController.showindex(1);
                                      offersindex = 1;
                                      regshowController.update();
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: offersindex == 1
                                          ? Border.all(color: kwhite)
                                          : null,
                                      color: offersindex == 1 ? kyellow : kblue,
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Vendor Coupons',
                                      style: TextStyle(
                                        color:
                                            offersindex == 1 ? kwhite : kwhite,
                                      ),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (regshowController.showindex.value == 1)
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 30, right: 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 195,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 180,
                                    child: Column(children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Image.asset(
                                          'assets/images/vendorimage1.png',
                                          height: 84,
                                          width: 170,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Lorem Ipsum',
                                            style: TextStyle(
                                                color: kblue,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                              style: TextStyle(
                                                  height: 1.5, fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      ksizedbox20,
                                      Row(
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: kOrange),
                                              onPressed: () {},
                                              child: Text('BASISJWSW')),
                                        ],
                                      )
                                    ]),
                                  ),
                                  Container(
                                    width: 180,
                                    child: Column(children: [
                                      Image.asset(
                                        'assets/images/vendorimage2.png',
                                        fit: BoxFit.cover,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Lorem Ipsum',
                                            style: TextStyle(
                                                color: kblue,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                              style: TextStyle(
                                                  height: 1.5, fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      ksizedbox20,
                                      Row(
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: kOrange),
                                              onPressed: () {},
                                              child: Text('BASISJWSW')),
                                        ],
                                      )
                                    ]),
                                  ),
                                  Container(
                                    width: 180,
                                    child: Column(children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Image.asset(
                                          'assets/images/vendorimage1.png',
                                          height: 84,
                                          width: 170,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Lorem Ipsum',
                                            style: TextStyle(
                                                color: kblue,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                              style: TextStyle(
                                                  height: 1.5, fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      ksizedbox20,
                                      Row(
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: kOrange),
                                              onPressed: () {},
                                              child: Text('BASISJWSW')),
                                        ],
                                      )
                                    ]),
                                  ),
                                  Container(
                                    width: 180,
                                    child: Column(children: [
                                      Image.asset(
                                        'assets/images/vendorimage2.png',
                                        fit: BoxFit.cover,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Lorem Ipsum',
                                            style: TextStyle(
                                                color: kblue,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                              style: TextStyle(
                                                  height: 1.5, fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      ksizedbox20,
                                      Row(
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: kOrange),
                                              onPressed: () {},
                                              child: Text('BASISJWSW')),
                                        ],
                                      )
                                    ]),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 180,
                                      child: Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, right: 10),
                                          child: Image.asset(
                                            'assets/images/vendorimage3.png',
                                            height: 84,
                                            width: 170,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Lorem Ipsum',
                                              style: TextStyle(
                                                  color: kblue,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                style: TextStyle(
                                                    height: 1.5, fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                        ksizedbox20,
                                        Row(
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: kOrange),
                                                onPressed: () {},
                                                child: Text('BASISJWSW')),
                                          ],
                                        )
                                      ]),
                                    ),
                                    Container(
                                      width: 180,
                                      child: Column(children: [
                                        Image.asset(
                                          'assets/images/vendorimage4.png',
                                          fit: BoxFit.cover,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Lorem Ipsum',
                                              style: TextStyle(
                                                  color: kblue,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                style: TextStyle(
                                                    height: 1.5, fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                        ksizedbox20,
                                        Row(
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: kOrange),
                                                onPressed: () {},
                                                child: Text('BASISJWSW')),
                                          ],
                                        )
                                      ]),
                                    ),
                                    Container(
                                      width: 180,
                                      child: Column(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Image.asset(
                                            'assets/images/vendorimage3.png',
                                            height: 84,
                                            width: 170,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Lorem Ipsum',
                                              style: TextStyle(
                                                  color: kblue,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                style: TextStyle(
                                                    height: 1.5, fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                        ksizedbox20,
                                        Row(
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: kOrange),
                                                onPressed: () {},
                                                child: Text('BASISJWSW')),
                                          ],
                                        )
                                      ]),
                                    ),
                                    Container(
                                      width: 180,
                                      child: Column(children: [
                                        Image.asset(
                                          'assets/images/vendorimage4.png',
                                          fit: BoxFit.cover,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Lorem Ipsum',
                                              style: TextStyle(
                                                  color: kblue,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                style: TextStyle(
                                                    height: 1.5, fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                        ksizedbox20,
                                        Row(
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: kOrange),
                                                onPressed: () {},
                                                child: Text('BASISJWSW')),
                                          ],
                                        )
                                      ]),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    if (regshowController.showindex.value == 0)
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 30, right: 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 195,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 180,
                                    child: Column(children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Image.asset(
                                          'assets/images/offersimage.png',
                                          height: 84,
                                          width: 170,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Lorem Ipsum',
                                            style: TextStyle(
                                                color: kblue,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                              style: TextStyle(
                                                  height: 1.5, fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      ksizedbox20,
                                      Row(
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: kOrange),
                                              onPressed: () {},
                                              child: Text('BASISJWSW')),
                                        ],
                                      )
                                    ]),
                                  ),
                                  Container(
                                    width: 180,
                                    child: Column(children: [
                                      Image.asset(
                                        'assets/images/couponsimage.png',
                                        fit: BoxFit.cover,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Lorem Ipsum',
                                            style: TextStyle(
                                                color: kblue,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                              style: TextStyle(
                                                  height: 1.5, fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      ksizedbox20,
                                      Row(
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: kOrange),
                                              onPressed: () {},
                                              child: Text('BASISJWSW')),
                                        ],
                                      )
                                    ]),
                                  ),
                                  Container(
                                    width: 180,
                                    child: Column(children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Image.asset(
                                          'assets/images/offersimage.png',
                                          height: 84,
                                          width: 170,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Lorem Ipsum',
                                            style: TextStyle(
                                                color: kblue,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                              style: TextStyle(
                                                  height: 1.5, fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      ksizedbox20,
                                      Row(
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: kOrange),
                                              onPressed: () {},
                                              child: Text('BASISJWSW')),
                                        ],
                                      )
                                    ]),
                                  ),
                                  Container(
                                    width: 180,
                                    child: Column(children: [
                                      Image.asset(
                                        'assets/images/couponsimage.png',
                                        fit: BoxFit.cover,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Lorem Ipsum',
                                            style: TextStyle(
                                                color: kblue,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                              style: TextStyle(
                                                  height: 1.5, fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      ksizedbox20,
                                      Row(
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: kOrange),
                                              onPressed: () {},
                                              child: Text('BASISJWSW')),
                                        ],
                                      )
                                    ]),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 180,
                                      child: Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, right: 10),
                                          child: Image.asset(
                                            'assets/images/couponsimage2.png',
                                            height: 84,
                                            width: 170,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Lorem Ipsum',
                                              style: TextStyle(
                                                  color: kblue,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                style: TextStyle(
                                                    height: 1.5, fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                        ksizedbox20,
                                        Row(
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: kOrange),
                                                onPressed: () {},
                                                child: Text('BASISJWSW')),
                                          ],
                                        )
                                      ]),
                                    ),
                                    Container(
                                      width: 180,
                                      child: Column(children: [
                                        Image.asset(
                                          'assets/images/couponsimage3.png',
                                          fit: BoxFit.cover,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Lorem Ipsum',
                                              style: TextStyle(
                                                  color: kblue,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                style: TextStyle(
                                                    height: 1.5, fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                        ksizedbox20,
                                        Row(
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: kOrange),
                                                onPressed: () {},
                                                child: Text('BASISJWSW')),
                                          ],
                                        )
                                      ]),
                                    ),
                                    Container(
                                      width: 180,
                                      child: Column(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Image.asset(
                                            'assets/images/couponsimage2.png',
                                            height: 84,
                                            width: 170,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Lorem Ipsum',
                                              style: TextStyle(
                                                  color: kblue,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                style: TextStyle(
                                                    height: 1.5, fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                        ksizedbox20,
                                        Row(
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: kOrange),
                                                onPressed: () {},
                                                child: Text('BASISJWSW')),
                                          ],
                                        )
                                      ]),
                                    ),
                                    Container(
                                      width: 180,
                                      child: Column(children: [
                                        Image.asset(
                                          'assets/images/couponsimage3.png',
                                          fit: BoxFit.cover,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Lorem Ipsum',
                                              style: TextStyle(
                                                  color: kblue,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Reference site about Lorem \nIpsum,giving information on its \norigins, as well as a random \nLipsum generator.',
                                                style: TextStyle(
                                                    height: 1.5, fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                        ksizedbox20,
                                        Row(
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: kOrange),
                                                onPressed: () {},
                                                child: Text('BASISJWSW')),
                                          ],
                                        )
                                      ]),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            if (reghomeController.proindex.value == 4)
                               Container(
                               
                                             child: Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Container(
                                                   height: 180,
                                                   decoration: BoxDecoration(
                                                    image: DecorationImage(image: AssetImage('assets/images/subscriptionbackimage.png',
                                                  ), fit: BoxFit.cover,)
                                                   ),
                                                   width: MediaQuery.of(context).size.width*0.8471,
                                                   child:     Center(
                                                   child: Text(
                                                     'SUBSCRIBE',
                                                     style: TextStyle(
                                letterSpacing:1,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: kwhite),
                                                   ),
                                                 ),
                                                 ),
                                                 // Image.asset('assets/images/Group 39757.png'),
                                             
                                                   Padding(
                                                     padding: const EdgeInsets.only(left:30,right:30,top:40),
                                                     child: GetBuilder<SubscriptionApiController>(
                                                      builder: (_){
                                                       return Row(
                                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                         children: [
                                                           plansController.subscriptionplan.isEmpty?Image.asset('assets/images/si1.png',
                                                           height: 200,fit:BoxFit.fitHeight):Image.network(plansController.subscriptionplan.first.cardImg,
                                                            height: 200,fit:BoxFit.fitHeight),
                                                                                                        
                                                           Padding(
                                                             padding: const EdgeInsets.only(left:90),
                                                             child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                               children: [
                                                               plansController.subscriptionplan.isEmpty?Container():Text(plansController.subscriptionplan.first.title,
                                                                style:TextStyle(
                                                                  letterSpacing: 1,
                                                                 color: kblue,
                                                                 fontSize: 25,
                                                                  fontWeight: FontWeight.w700
                                                                 )),
                                                                 ksizedbox10,
                                                                 Text('Subscribe Details :',
                                                                 style:TextStyle(
                                                                  fontSize: 17,
                                                                  color:kblue,
                                                                  fontWeight: FontWeight.w500
                                                                 )),
                                                                 ksizedbox20,
                                                                 plansController.subscriptionplan.isEmpty?Container():Container(
                                                                  width: 420,
                                                                   child: Text(plansController.subscriptionplan.first.planDescription,
                                                                   style: TextStyle(
                                                                    
                                                                    fontSize: 18,
                                                                                                                                 
                                                                   ),),
                                                                 ),

                                                               ],
                                                             ),
                                                           ),
                                                           Padding(
                                                             padding: const EdgeInsets.only(left:30),
                                                             child: Container(
                                                              height: 40,
                                                              width: 120,
                                                              decoration: BoxDecoration(
                                                                color: kblue,
                                                             borderRadius: BorderRadius.circular(5)
                                                              ),
                                                              child:Center(
                                                                child:plansController.subscriptionplan.isEmpty?Container():Text(plansController.subscriptionplan.first.saleAmount,
                                                                style: TextStyle(
                                                                  fontSize: 17,
                                                                  color:kwhite,
                                                                  
                                                                ),)
                                                              )
                                                                                     
                                                             ),
                                                           )
                                                         ],
                                                       );
                                                      }
                                                     ),
                                                   )
                                                 
                                               ],
                                             ),
                                             
                                           ),

           

              //coupons here
              //   Coupones(
              // Padding(
              //   padding: const EdgeInsets.only(top: 50),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width - 195,
              //     child: Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(left: 55),
              //           child: Row(
              //             children: [
              //               Text(
              //                 'Additional Coupons',
              //                 style: TextStyle(
              //                     fontSize: 20,
              //                     color: kblue,
              //                     fontWeight: FontWeight.bold),
              //               )
              //             ],
              //           ),
              //         ),
              //         ksizedbox40,
              //         ksizedbox30,
              //         GetBuilder<SubscriptionApiController>(builder: (_) {
              //           return Column(
              //             children: [
              //               //    RegisterCommonContainer(),
              //               ksizedbox30,
              //               Container(
              //                 width: 1000,
              //                 child: GridView.builder(
              //                     shrinkWrap: true,
              //                     itemCount: subscripeController
              //                         .couponsdatalist.length,
              //                     gridDelegate:
              //                         SliverGridDelegateWithFixedCrossAxisCount(
              //                             childAspectRatio: 3.5,
              //                             crossAxisSpacing: 20,
              //                             mainAxisSpacing: 7,
              //                             crossAxisCount: 2),
              //                     itemBuilder: (context, index) {
              //                       return Padding(
              //                         padding: const EdgeInsets.only(
              //                             top: 30, left: 20, right: 20),
              //                         child: ClipPath(
              //                           clipper: TicketPassClipper(),
              //                           child: Container(
              //                             color: colors[Random().nextInt(9)],
              //                             child: Column(
              //                               children: [
              //                                 ksizedbox10,
              //                                 Padding(
              //                                   padding: const EdgeInsets.only(
              //                                       left: 10,
              //                                       right: 10,
              //                                       top: 5),
              //                                   child: Row(
              //                                     children: [
              //                                       Text(subscripeController
              //                                           .couponsdatalist[index]
              //                                           .createdAt
              //                                           .toString()),
              //                                       Padding(
              //                                         padding:
              //                                             const EdgeInsets.only(
              //                                                 left: 50),
              //                                         child: Text(
              //                                             subscripeController
              //                                                 .couponsdatalist[
              //                                                     index]
              //                                                 .name),
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //                                 ksizedbox10,
              //                                 Padding(
              //                                   padding: const EdgeInsets.only(
              //                                       top: 10,
              //                                       left: 10,
              //                                       right: 80),
              //                                   child: Row(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment
              //                                             .spaceBetween,
              //                                     children: [
              //                                       Text(subscripeController
              //                                           .couponsdatalist[index]
              //                                           .couponcode),
              //                                       Padding(
              //                                         padding:
              //                                             const EdgeInsets.only(
              //                                                 top: 0, left: 10),
              //                                         child: InkWell(
              //                                           onTap: () {
              //                                             FlutterClipboard.copy(
              //                                                     subscripeController
              //                                                         .couponsdatalist[
              //                                                             index]
              //                                                         .couponcode)
              //                                                 .then(
              //                                               (value) => Fluttertoast.showToast(
              //                                                   msg:
              //                                                       "Copy to clipboard",
              //                                                   toastLength: Toast
              //                                                       .LENGTH_SHORT,
              //                                                   gravity:
              //                                                       ToastGravity
              //                                                           .CENTER,
              //                                                   timeInSecForIosWeb:
              //                                                       1,
              //                                                   backgroundColor:
              //                                                       Colors
              //                                                           .white,
              //                                                   textColor:
              //                                                       Colors
              //                                                           .black,
              //                                                   fontSize: 16.0),
              //                                               //print("code copied")
              //                                             );
              //                                           },
              //                                           child: Icon(Icons.copy),
              //                                         ),
              //                                       )
              //                                     ],
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         ),
              //                       );
              //                     }),
              //               ),
              //               ksizedbox30,
              //               //   RegisterCommonBottom()
              //             ],
              //           );
              //         }),
              //       ],
              //     ),
              //   ),
              // ),
            if (reghomeController.proindex.value == 5)
              Container(
                width: MediaQuery.of(context).size.width - 195,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Center(
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.74,
                            width: MediaQuery.of(context).size.width * 0.29,
                            decoration: BoxDecoration(
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      blurRadius: 5,
                                      color: kgrey)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        'assets/images/referalimage.png',
                                        height: 180,
                                        fit: BoxFit.fitHeight),
                                  ],
                                ),
                                ksizedbox10,
                                Text(
                                  'Referral Code',
                                  style: TextStyle(fontSize: 23, color: kblue),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 15),
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: kwhite,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              offset: Offset(0.0, 0.75),
                                              blurRadius: 2,
                                              color: kgrey)
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10,right:10),
                                      child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(apisettingController.referralCode.value,style: TextStyle(
                                                               fontSize: 16, color: kblue, fontWeight: FontWeight.w500),),
                                                            InkWell(
                                                              onTap: (){
                                                                FlutterClipboard.copy(apisettingController.referralCode.value).then(
                                                    (value) =>
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "Copy to clipboard",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity: ToastGravity
                                                                .CENTER,
                                                            timeInSecForIosWeb: 1,
                                                            backgroundColor:
                                                                kblue,
                                                            textColor:
                                                                Colors.white,
                                                            fontSize: 16.0),
                                                    //print("code copied")
                                                  );
                                                              },
                                                              child: Image.asset('assets/images/Icon awesome-copy.png',
                                                              height: 30,fit: BoxFit.fitHeight,)),
                                                          ],
                                                        ),
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.only(top: 25, left: 40),
                                //   child: Row(
                                //     children: [
                                //       Text('Referral Count :',
                                //           style: TextStyle(
                                //               fontSize: 24, color: kblue)),
                                //       Padding(
                                //         padding:
                                //             const EdgeInsets.only(left: 20),
                                //         child: Container(
                                //             height: 30,
                                //             width: 30,
                                //             decoration: BoxDecoration(
                                //                 color: kOrange,
                                //                 borderRadius:
                                //                     BorderRadius.circular(3)),
                                //             child: Center(
                                //               child: Text(
                                //                 '0',
                                //                 style: TextStyle(
                                //                     fontSize: 20,
                                //                     color: kwhite),
                                //               ),
                                //             )),
                                //       ),
                                //       Padding(
                                //         padding:
                                //             const EdgeInsets.only(left: 20),
                                //         child: Container(
                                //             height: 30,
                                //             width: 30,
                                //             decoration: BoxDecoration(
                                //                 color: kOrange,
                                //                 borderRadius:
                                //                     BorderRadius.circular(3)),
                                //             child: Center(
                                //               child: Text(
                                //                 '0',
                                //                 style: TextStyle(
                                //                     color: kwhite,
                                //                     fontSize: 20),
                                //               ),
                                //             )),
                                //       ),
                                //       Padding(
                                //         padding: const EdgeInsets.only(left: 8),
                                //         child: Container(
                                //             height: 30,
                                //             width: 30,
                                //             decoration: BoxDecoration(
                                //                 color: kOrange,
                                //                 borderRadius:
                                //                     BorderRadius.circular(3)),
                                //             child: Center(
                                //               child: Text(
                                //                 '0',
                                //                 style: TextStyle(color: kwhite),
                                //               ),
                                //             )),
                                //       )
                                //     ],
                                //   ),
                                // ),
                                ksizedbox40,
                                GestureDetector(
                                  onTap: (){
                                     String referralmsg = "Use my referral code ${apisettingController.referralCode.value} when you sign up, and we'll both receive fantastic rewards. Don't forget to click on the link below to download the app and start enjoying the perks right away!\n\n";
                                      
                 Share.share('$referralmsg');
                                  },
                                  child: Container(
                                      height: 45,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      decoration: BoxDecoration(
                                          color: korange,
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                offset: Offset(0.0, 0.75),
                                                blurRadius: 5,
                                                color: kyellow)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text('Share Now',
                                              style: TextStyle(
                                                  color: kwhite, fontSize: 20)))),
                                )
                              ]),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            if (reghomeController.proindex.value == 6)
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: GetBuilder<ApiSettingController>(
                  builder: (_) {
                    return Container(
                        width: MediaQuery.of(context).size.width - 195,
                        child: GridView.builder(
                            itemCount:apisettingController.ourPartnersData.length,
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 40,
                                crossAxisSpacing: 50,
                                childAspectRatio: 2),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 70, right: 70),
                                child:Container(
                                     height: 150,
                                     width: 150,
                                     decoration: BoxDecoration(
                                      border: Border.all(color: kblue),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                      image: NetworkImage(
                                      apisettingController.ourPartnersData[index].image)),
                                     ),
                              ),
                              );
                            }));
                  }
                ),
              ),
              if(reghomeController.proindex.value==7)
              Padding(padding: EdgeInsets.only(top:50),
              child: GetBuilder<SubscriptionApiController>(
          builder: (_){
            
            return Container(
              height:500 ,
                width: MediaQuery.of(context).size.width - 195,
              child: ListView(
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               // RegisterCommonContainer(),
                Container(
                  child: Stack(
                    children: [
                      Image.asset('assets/images/Group 39757.png'),
                      Positioned(
                        top: 0,
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: Center(
                          child: Text(
                            'Subscribe',
                            style: GoogleFonts.lato(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                color: kwhite),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ksizedbox30,
                Text(
                  'Select Membership',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff003366),
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                ksizedbox10,
                const Text(
                  "All Select Membership Cards Choose Anything",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                      color: Color(0xff003366)),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Container(
                       height: 500,
                       width:600,
                        child: GridView.builder(
                         shrinkWrap: true,
                         itemCount: subscriptionapiController.plansdataList.length,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 40,
                          crossAxisSpacing: 40,
                          childAspectRatio: 6,
                          crossAxisCount: 2), 
                        itemBuilder: (context,index){
                         return GestureDetector(
                          onTap: (){
                            print("------------------------------------------------${subscriptionapiController.plansdataList[index].cardImg}");
                            setState(() {
                              temindex= index;
                              cardimgae= subscriptionapiController.plansdataList[index].cardImg;
                            });
                          },
                           child: Container(
                            height: 30,
                             alignment: Alignment.center,
                            decoration: BoxDecoration(
                               color:temindex==index ?kOrange:kwhite,
                               borderRadius: BorderRadius.circular(10),
                               border: Border.all(
                                color:temindex== index?kwhite:kblue
                               )
                            ),
                             child: Text(
                              subscriptionapiController.plansdataList[index].title,
                              style: TextStyle(
                                fontSize: 18,
                                color:temindex==index? kwhite:kblue
                              ),
                              
                             ),
                                                     ),
                         );
                        }),
                      ),
                    ),
                    Column(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                
                  InkWell(
                      onTap: () {
                        Get.to(
                          Payment(image: subscriptionapiController.plansdataList[temindex].cardImg, 
                        htext: subscriptionapiController.plansdataList[temindex].title, 
                        text:subscriptionapiController.plansdataList[temindex].planDescription,
                        id: subscriptionapiController.plansdataList[temindex].id));
                      },
                      child: subscriptionapiController.plansdataList.isEmpty ? Container(
            
                      ): Image(
                        image: cardimgae == "" ? NetworkImage(subscriptionapiController.plansdataList.first.cardImg): NetworkImage(cardimgae),
                        height: 234,
                        
                      ),
                      
                      ),
                       
                  ],
                ),
                  ],
                ),
              
              ]
              
              ),
            );
            
          }
        ),),
            if (reghomeController.proindex.value == 8)
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: MediaQuery.of(context).size.width - 195,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                color: kgrey.withOpacity(0.3),
                              ),
                              child: TextField(
                                   textInputAction: TextInputAction.next,
                                controller: subNameController,
                                decoration: InputDecoration(
                                    hintText: 'Your Name',
                                    hintStyle: TextStyle(fontSize: 14.5),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150),
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                color: kgrey.withOpacity(0.3),
                              ),
                              child: TextField(
                                   textInputAction: TextInputAction.next,
                                controller: subMobileController,
                                decoration: InputDecoration(
                                    hintText: 'Mobile',
                                    hintStyle: TextStyle(fontSize: 14.5),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:50, top: 35),
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  color: kgrey.withOpacity(0.3),
                                ),
                                child: TextField(
                                     textInputAction: TextInputAction.next,
                                  controller: subEmailController,
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: TextStyle(fontSize: 14.5),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                            ),
                              Padding(
                              padding: const EdgeInsets.only(right: 150, top: 35),
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  color: kgrey.withOpacity(0.3),
                                ),
                                child: TextField(
                                     textInputAction: TextInputAction.next,
                                  controller: subtitleController,
                                  decoration: InputDecoration(
                                      hintText: 'Title',
                                      hintStyle: TextStyle(fontSize: 14.5),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50, top: 35),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.69,
                                decoration: BoxDecoration(
                                  color: kgrey.withOpacity(0.3),
                                ),
                                child: TextField(
                                    
                                  maxLines: 4,
                                  controller: subDescriptionController,
                                  decoration: InputDecoration(
                                      hintText: 'Description',
                                      hintStyle: TextStyle(fontSize: 14.5),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                            )
                          ]),
                      ksizedbox30,
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: profileController.isLoading.isTrue
                              ? Container(
                                  height: 50,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      border: Border.all(
                                          color: const Color(0xffFF9021)),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0xffFF5003),
                                          blurRadius: 2.0,
                                        ),
                                      ]),
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : Row(
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: Size(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                45),
                                            backgroundColor: kblue),
                                        onPressed: () {
                                          // AddressModel addressModel =
                                          //     AddressModel(
                                          //         aadhrId:
                                          //             resiadaridController.text,
                                          //         address: resiaddressController
                                          //             .text,
                                          //         buildingName:
                                          //             resibnameController.text,
                                          //         city:
                                          //             resibcityController.text,
                                          //         doorNo:
                                          //             residoornumberController
                                          //                 .text,
                                          //         personalId:
                                          //             resiperidController.text,
                                          //         state:
                                          //             resistateController.text);
                                          // authprofileController
                                          //     .updateRecidencyAddress(
                                          //         residentialAddress:
                                          //             addressModel);
                                             apisettingController.createSupport(
                                              title: subtitleController.text, 
                                              message: subDescriptionController.text
                                              );         
                                        },
                                        child: Text(
                                          'Submit',
                                          style: TextStyle(
                                              fontSize: 17, color: kwhite),
                                        )),
                                  ],
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 50),
                        child: Row(
                          children: [
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                  color: kwhite,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      blurRadius: 5,
                                      color: kgrey,
                                    )
                                  ],
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3))),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Contact Admin :',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Text(
                                                authprofileController
                                                    .profileData.first.name,
                                                style: TextStyle(
                                                    color: kblue, fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, right: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Admin Email :',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Text(
                                                authprofileController
                                                    .profileData.first.email,
                                                style: TextStyle(
                                                    color: kblue, fontSize: 16),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  ksizedbox20,
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Head Office Address :',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Text(
                                                authprofileController
                                                    .profileData.first.address,
                                                style: TextStyle(
                                                    color: kblue, fontSize: 16),
                                              ),
                                            )
                                          ],
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
                ),
              ),
          ]),

          RegisterCommonBottom()
        ]),
      ),
    );
  }
   

}
  class ChartData {
        ChartData(this.x, this.y, this.color);
            final String x;
            final double y;
            final Color color;
    }

 


