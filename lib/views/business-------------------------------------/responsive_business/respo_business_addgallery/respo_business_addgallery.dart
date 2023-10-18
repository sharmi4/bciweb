import 'dart:io';

import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/profile_controller.dart';
import 'package:bciweb/views/business-------------------------------------/responsive_business/drawer_business.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

class RespoBusinessAddGallery extends StatefulWidget {

  final String userid;

  const RespoBusinessAddGallery({super.key, required this.userid});

  @override
  State<RespoBusinessAddGallery> createState() => _RespoBusinessAddGalleryState();
}

class _RespoBusinessAddGalleryState extends State<RespoBusinessAddGallery> {

  dynamic imagegallery;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    profileController.getInstance(userid: widget.userid);
    profileController.update();
  }

  final profileController = Get.find<ProfileController>();

  

  Future profileimage() async {
    try {
      var imageprofile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageprofile == null) return;


    var tempCont = await imageprofile!.readAsBytes();
      // setState(() {
      //   imagegallery = tempCont;
      // });


     
      

   await   profileController.addgalleryApiServices(
          imageprofiletemp:  tempCont);
   setState(() {
    this.    imagegallery = tempCont;
      });

          
           profileController.getInstance(userid: widget.userid);
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: PreferredSize(
        child: AppBarMob(),
        preferredSize: Size(double.infinity, 40),
      ),
      drawer: DrawerBusiness(),
      
      


      
    body: GetBuilder<ProfileController>(builder: (_) {
        return profileController.galleryListData.isEmpty
            ? Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/imgess.jpeg'),
                      ksizedbox20,
                      Text('Empty Gallery',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: kblue
                      ),
                      )
                    ],
                  ),
                ),
              )
            : Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: profileController.galleryListData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          profileController.galleryListData[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 10),
                ),
              );
      }),  

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          profileimage();
           
        },
        child: Icon(
          Icons.add_a_photo,
          color: kwhite,
        ),
        backgroundColor: kblue,
      ),
      
      );
  }
}