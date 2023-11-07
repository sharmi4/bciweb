import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/controller/auth_controller/auth_controller.dart';
import 'package:bciweb/views/responsive------------------------------------/mobile_wdgets/comomappbar.dart';
import 'package:bciweb/views/members/Gallery/widgets/photo_img_view.dart';
import 'package:bciweb/views/members/Gallery/widgets/stagerdgridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

//import '../../../registerhomescreen/common_reg_appbar';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../mobile_wdgets/drawer.dart';
import '../mobile_wdgets/mobile_common_bottom/bottom.dart';
//import '../../members/common_widget/common.dart';

class RespoGallery extends StatefulWidget {
  const RespoGallery({super.key});

  @override
  State<RespoGallery> createState() => _GalleryState();
}

class _GalleryState extends State<RespoGallery> {

  final authController = Get.find<AuthController>();

   List<String> galleryImage = [
    "assets/images/gallery/20180327_194900.jpg",
    "assets/images/gallery/20180501_181108.jpg",
    "assets/images/gallery/IMG_7703.jpg",
    "assets/images/gallery/IMG_7735.jpg",
    "assets/images/gallery/IMG_7727.jpg",
    "assets/images/gallery/IMG_7711.jpg",
    "assets/images/gallery/IMG_7708.jpg",
    "assets/images/gallery/20180327_194857.jpg",
    'assets/images/gallery/IMG-20230602-WA0001.jpg',
    'assets/images/gallery/IMG-20230602-WA0002.jpg',
    'assets/images/gallery/IMG-20230602-WA0003.jpg',
    'assets/images/gallery/IMG-20230602-WA0004.jpg',
    'assets/images/gallery/IMG-20230602-WA0007.jpg',
    'assets/images/gallery/IMG-20230602-WA0006.jpg',
    'assets/images/gallery/IMG-20230602-WA0008.jpg',
    'assets/images/gallery/IMG-20230602-WA0009.jpg',
    'assets/images/gallery/IMG-20230602-WA0010.jpg',
    'assets/images/gallery/IMG-20230602-WA0011.jpg',
    'assets/images/gallery/IMG-20230602-WA0012.jpg',
    'assets/images/gallery/IMG-20230602-WA0013.jpg',
     'assets/images/gallery/IMG-20230602-WA0014.jpg',
    'assets/images/gallery/IMG-20230602-WA0015.jpg',
    'assets/images/gallery/IMG-20230602-WA0016.jpg',
    'assets/images/gallery/IMG-20230602-WA0017.jpg',
    'assets/images/gallery/IMG-20230602-WA0018.jpg',
    'assets/images/gallery/IMG-20230602-WA0019.jpg',
    'assets/images/gallery/IMG-20230602-WA0020.jpg',
    'assets/images/gallery/IMG-20230602-WA0021.jpg',
    'assets/images/gallery/IMG-20230602-WA0022.jpg',
    'assets/images/gallery/IMG-20230602-WA0023.jpg',
    'assets/images/gallery/IMG-20230602-WA0024.jpg',
    'assets/images/gallery/IMG-20230602-WA0025.jpg',
     'assets/images/gallery/IMG-20230602-WA0026.jpg',
    'assets/images/gallery/IMG-20230602-WA0027.jpg',
    'assets/images/gallery/IMG-20230602-WA0028.jpg',
    'assets/images/gallery/IMG-20230602-WA0029.jpg',
  ];

    // List<String> galleryImage = [
      
    //   "assets/images/gallery/20180327_194900.jpg",
    //   "assets/images/gallery/20180501_181108.jpg",
    //   "assets/images/gallery/IMG_7703.jpg",
    //   "assets/images/gallery/IMG_7735.jpg",
    //   "assets/images/gallery/IMG_7727.jpg",
    //   "assets/images/gallery/IMG_7711.jpg",
    //   "assets/images/gallery/IMG_7708.jpg",
    //   "assets/images/gallery/20180327_194857.jpg",];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MobileDrawer() ,
      appBar: PreferredSize(
          child: AppBarMob(),
          preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: Column(
          children: [
           // RegisterCommonContainer(),
            ksizedbox40,

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                shrinkWrap:  true,
                itemCount: galleryImage.length,
                physics: NeverScrollableScrollPhysics(),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 2.0,
                ), itemBuilder: ((context, index) {
                return InkWell(
                  onTap: (){
                    setState(() {
                          authController.imageIndex(index);
                        });
                        showDialog(
                         context: context,
                         builder: (BuildContext context) {
                         return AlertDialog(
                          title: Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child:const Icon(Icons.close_sharp)),
                            ],
                          ),
                          content: Obx( () =>
                            Container(
                              height: 300,
                              width: 300,
                              color: Colors.white,
                              child: Center(
                                child: PhotoView(
                                      imageProvider: AssetImage(galleryImage[authController.imageIndex.value]),
                                      backgroundDecoration:const BoxDecoration(color: Colors.white),
                              ),
                            ),
                            ),
                          ),
                          actions: [
                            Obx( () =>
                               Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 authController.imageIndex.value != 0 ? InkWell(
                                    onTap: (){
                                      setState(() {
                                        if(authController.imageIndex.value != 0){
                                          authController.imageIndex.value --;
                                        }
                                      });
                                    },
                                    child:const Icon(Icons.arrow_back_ios)) : const Icon(Icons.arrow_back_ios,color: Colors.grey,),
                                    kwidth10,
                                    kwidth10,
                                  galleryImage.length != authController.imageIndex.value +1 ?
                                  InkWell(
                                    onTap: (){
                                       setState(() {
                                        {if(galleryImage.length != authController.imageIndex.value +1)
                                           authController.imageIndex.value ++;
                                        }
                                       
                                      });
                                    },
                                    child:const Icon(Icons.arrow_forward_ios)) : const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                                ],
                              ),
                            ),
                          ],
                           );
                          
                              },
                          );
//                     Get.to(PhotoImageView(
// image: galleryImage[index],
//                     ));
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image.asset(galleryImage[index],fit: BoxFit.fitHeight,)),
                );
              })),
            ),
          MobileCommonBottom()
        //    RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}
