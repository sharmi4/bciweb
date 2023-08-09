import 'package:bciweb/models/create_account_model.dart';
import 'package:bciweb/views/authentication/widgets/formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../constant/constans.dart';
import '../../controller/auth_controller/auth_controller.dart';

class OfficeAddress extends StatefulWidget {
   AddressModel? addresModel;
   CreateAccountModel?tempMemberRegisterModel;
   OfficeAddress({super.key,this.addresModel,  this.tempMemberRegisterModel});

  @override
  State<OfficeAddress> createState() => _OfficeAddressState();
}

class _OfficeAddressState extends State<OfficeAddress> {
   bool isCheked = false;

    var officedoornumberController=TextEditingController();
   var officebuildingnameController=TextEditingController();
    var officeaddresController=TextEditingController();
    var officecityController=TextEditingController();
     var officestateController=TextEditingController();
   
    setOfficeAdreess(){
      officedoornumberController.text = widget.addresModel!.doorNo;
    officebuildingnameController.text = widget.addresModel!.buildingName;
    officeaddresController.text = widget.addresModel!.address;
    officecityController.text = widget.addresModel!.city;
    officestateController.text = widget.addresModel!.state;
    }
   
   clearOfficeAddres(){
    officeaddresController.clear();
  officebuildingnameController.clear();
  officecityController.clear();
  officestateController.clear();
  officedoornumberController.clear();
   }
    var _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
  //  bool isChecked = false;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        
        children: [
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ksizedbox30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Office Address',
                      style: TextStyle(
                          fontSize: 25, color: kblue, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 15,right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Please fill the details Address',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            //   decoration: TextDecoration.underline,
                            color: kblue),
                      ),
                    ],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                      width: size.width * 0.3,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                             Row(
                               children: [
                                                    Checkbox(
                        activeColor: kblue,
                        value: isCheked,
                        // onChanged: _handleRemeberme,
                        onChanged: (value) {
                          if (value!) {
                            setOfficeAdreess();
                          } else {
                            clearOfficeAddres();
                          }
                          setState(() {
                            isCheked = value;
                          });
                        }),
                   
                                 Text(
                      "Same as residential address",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: kblue),
                    ),
                               ],
                             ),
                            Formfield(
                              text: 'Door No',
                              controller: officedoornumberController,
                            ),
                            ksizedbox20,
                            Formfield(
                              text: 'Building Name',
                              controller: officebuildingnameController,
                            ),
                            ksizedbox20,
                            Formfield(
                              text: 'Address',
                              controller: officeaddresController,
                            ),
                            ksizedbox20,
                            Formfield(
                              text: 'City',
                              controller: officecityController,
                            ),
                            ksizedbox20,
                           Formfield(
                              text: 'State',
                              controller: officestateController,
                            ),
                          ],
                        ),
                      )),
                ),
                
             //   ksizedbox30,
                ksizedbox30,
                Obx(()=>authController.isLoading.isTrue?
                   Container(
                        height: 50,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xffFFBF7E)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFFF5C29),
                              blurRadius: 3.0,
                            )
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFFFF5C29),
                              Color.fromARGB(255, 255, 123, 34),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color:Color(0xFFFF5C29),
                          ),
                        ),
                      )
                   :InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                              AddressModel oficeaddressModel = AddressModel(
                                  doorNo: officedoornumberController.text,
                                  buildingName: officebuildingnameController.text,
                                  address: officeaddresController.text,
                                  city: officecityController.text,
                                  state: officecityController.text,
                                  personalId: "",
                                  aadhrId: ""
                                  );
                                  print("sharmi");
                              // authController.memberRegister(
                              //   isMobile: false,
                              //     memberRegisterModel: widget.tempMemberRegisterModel,
                              //     // officialAddress: oficeaddressModel,
                              //     // residentialAddress: widget.addresModel,
                              //     );
                            }
                    },
                    child: Container(
                      width: size.width * 0.25,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          4,
                        ),
                        border: Border.all(color: const Color(0xffFFBF7E)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFFF5C29),
                            blurRadius: 3.0,
                          )
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFFF5C29),
                            Color(0xFFFFCD38),
                          ],
                        ),
                      ),
                      child: Text(
                      "Create Account",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                ksizedbox10,
              
              ],
            ),
          )),
          Expanded(
            child: Container(
              color: kblue,
              child: Image.asset(
                'assets/images/6.png',
                height: size.height,
              ),
            ),
          )
        ],
      ),
    );
  }
}
