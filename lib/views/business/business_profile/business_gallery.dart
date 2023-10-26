import 'dart:io';

import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constant/constans.dart';
import '../../../controller/profile_controller.dart';

class BusinessAddGallery extends StatefulWidget {
  final String userid;
  const BusinessAddGallery({super.key, required this.userid});

  @override
  State<BusinessAddGallery> createState() => _BusinessAddGalleryState();
}

class _BusinessAddGalleryState extends State<BusinessAddGallery> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    profileController.getInstance(userid: widget.userid);
  }

  final profileController = Get.find<ProfileController>();

  File? imageprofile;

  Future profileimage() async {
    try {
      PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
      );

      var tempCont = await pickedFile!.readAsBytes();

      await profileController.addgalleryApiServices(imageprofiletemp: tempCont);
      profileController.getInstance(userid: widget.userid);
    } catch (e) {
      print('Failed to pick image:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(
      () => profileController.isLoading.isTrue
          ? Container( width: size.width,
                    height: size.height,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                   
                    child: Container(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
          )
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        profileimage();
                      },
                      child: Container(
                        height: 45,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Add Images",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ksizedbox30,
              GetBuilder<ProfileController>(builder: (_) {
                return profileController.galleryListData.isEmpty
                    ? Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/imgess.jpeg'),
                              ksizedbox20,
                              Text(
                                'Empty Gallery',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: kblue),
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(
                        height: size.height,
                        width: size.width * 0.7,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: profileController.galleryListData.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 100,
                                  width: 250,
                                  child: Image.network(
                                    profileController
                                        .galleryListData[index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio: 2,
                                  mainAxisSpacing: 10),
                        ),
                      );
              }),
              // floatingActionButton: FloatingActionButton(
              //   onPressed: () {
              //     profileimage();

              //   },
              //   child: Icon(
              //     Icons.add_a_photo,
              //     color: kwhite,
              //   ),
              //   backgroundColor: kblue,
              // ),

              IconButton(
                  onPressed: () async {
                    PickedFile? pickedFile = await ImagePicker().getImage(
                      source: ImageSource.gallery,
                    );

                    var tempCont = await pickedFile!.readAsBytes();

                    await profileController.addgalleryApiServices(
                        imageprofiletemp: tempCont);
                    profileController.getInstance(userid: widget.userid);
                  },
                  icon: Icon(Icons.add_a_photo_outlined))
            ]),
    );
  }
}
