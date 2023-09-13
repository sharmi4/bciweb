
import 'package:bciweb/models/create_account_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constans.dart';
import '../../../controller/auth_controller/auth_controller.dart';
import '../otp_verification/otp_verification.dart';

class OfficeAddressScreen extends StatefulWidget {
   AddressModel? addresModel;
   CreateAccountModel?tempMemberRegisterModel;
   OfficeAddressScreen({super.key, this. addresModel, this. tempMemberRegisterModel});

  @override
  State<OfficeAddressScreen> createState() => _OfficeAddressScreenState();
}

class _OfficeAddressScreenState extends State<OfficeAddressScreen> {

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF9F8FD),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Text(
                      "Office Address",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: kblue),
                    ),
                    ksizedbox10,
                     Text(
                      "Please fill the details address",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: kblue),
                    ),
                    ksizedbox30,
                    const Image(
                      height: 200,
                      image: AssetImage("assets/images/Group -1.png")),
                      ksizedbox30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                                isCheked = !isCheked;
                                              });
                                            }
                                            ),
                                            Text(
                      "Same as residential address",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: kblue),
                                      ),
                        ],
                      ),
                      Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: Container(
                               height: 40,
                               width: size.width,
                               decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(2),
                               border: Border.all(color:const Color(0xff707070)),
                               color:Colors.white),
                               alignment: Alignment.center,
                               child: Padding(
                                padding:const EdgeInsets.only(left: 15, right: 10),
                                child: TextFormField(
                                      controller: officedoornumberController,
                                //controller: usernamecontroller,
                                decoration: InputDecoration(
                                isCollapsed: true,
                                isDense: true,
                                border: InputBorder.none,
                                hintText: "Door No",
                                 hintStyle: TextStyle(
                                 color: kblue,
                                 fontWeight: FontWeight.w400,
                               )),
                            ),
                         ),
                    ),
                 ),
                 Padding(
                             padding: const EdgeInsets.only(top: 15),
                             child: Container(
                               height: 40,
                               width: size.width,
                               decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(2),
                               border: Border.all(color:const Color(0xff707070)),
                               color:Colors.white),
                               alignment: Alignment.center,
                               child: Padding(
                                padding:const EdgeInsets.only(left: 15, right: 10),
                                child: TextFormField(
                                  controller: officebuildingnameController,
                                //controller: usernamecontroller,
                                decoration: InputDecoration(
                                isCollapsed: true,
                                isDense: true,
                                border: InputBorder.none,
                                hintText: "Building name",
                                 hintStyle: TextStyle(
                                 color: kblue,
                                 fontWeight: FontWeight.w400,
                               )),
                            ),
                         ),
                    ),
                 ),
                 Padding(
                             padding: const EdgeInsets.only(top: 15),
                             child: Container(
                               height: 40,
                               width: size.width,
                               decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(2),
                               border: Border.all(color:const Color(0xff707070)),
                               color:Colors.white),
                               alignment: Alignment.center,
                               child: Padding(
                                padding:const EdgeInsets.only(left: 15, right: 10),
                                child: TextFormField(
                                  controller: officeaddresController,
                                //controller: usernamecontroller,
                                decoration: InputDecoration(
                                isCollapsed: true,
                                isDense: true,
                                border: InputBorder.none,
                                hintText: "Address",
                                 hintStyle: TextStyle(
                                 color: kblue,
                                 fontWeight: FontWeight.w400,
                               )),
                            ),
                         ),
                    ),
                 ),
                  Padding(
                             padding: const EdgeInsets.only(top: 15),
                             child: Container(
                               height: 40,
                               width: size.width,
                               decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(2),
                               border: Border.all(color:const Color(0xff707070)),
                               color:Colors.white),
                               alignment: Alignment.center,
                               child: Padding(
                                padding:const EdgeInsets.only(left: 15, right: 10),
                                child: TextFormField(
                                  controller: officecityController,
                                //controller: usernamecontroller,
                                decoration: InputDecoration(
                                isCollapsed: true,
                                isDense: true,
                                border: InputBorder.none,
                                hintText: "City",
                                 hintStyle: TextStyle(
                                 color: kblue,
                                 fontWeight: FontWeight.w400,
                               )),
                            ),
                         ),
                    ),
                 ),
                  Padding(
                             padding: const EdgeInsets.only(top: 15),
                             child: Container(
                               height: 40,
                               width: size.width,
                               decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(2),
                               border: Border.all(color:const Color(0xff707070)),
                               color:Colors.white),
                               alignment: Alignment.center,
                               child: Padding(
                                padding:const EdgeInsets.only(left: 15, right: 10),
                                child: TextFormField(
                                  controller: officestateController,
                                //controller: usernamecontroller,
                                decoration: InputDecoration(
                                isCollapsed: true,
                                isDense: true,
                                border: InputBorder.none,
                                hintText: "State",
                                 hintStyle: TextStyle(
                                 color: kblue,
                                 fontWeight: FontWeight.w400,
                               )),
                            ),
                         ),
                    ),
                 ),
                 
                 ksizedbox40,
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
                                    aadhrId: "", pincode: ''
                                    );
                                    print("sharmi");
                                // authController.memberRegister(
                                //     isMobile: true,
                                //     memberRegisterModel: widget.tempMemberRegisterModel,
                                //     referalcode: 
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
          ),
        ),
    );
  }
}