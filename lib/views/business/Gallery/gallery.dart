import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/business/Gallery/widgets/photo_img_view.dart';
import 'package:bciweb/views/business/Gallery/widgets/stagerdgridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../registerhomescreen/common_reg_appbar';
import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../../registerhomescreen/common_reg_homescreen.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

   

    List<String> galleryImage = [
      
      "assets/images/gallery/20180327_194900.jpg",
      "assets/images/gallery/20180501_181108.jpg",
      "assets/images/gallery/IMG_7703.jpg",
      "assets/images/gallery/IMG_7735.jpg",
      "assets/images/gallery/IMG_7727.jpg",
      "assets/images/gallery/IMG_7711.jpg",
      "assets/images/gallery/IMG_7708.jpg",
    "assets/images/gallery/20180327_194857.jpg",];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: RegisterCommonAppbar(),
          preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterCommonContainer(),
            ksizedbox40,

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                shrinkWrap:  true,
                itemCount: galleryImage.length,
                physics: NeverScrollableScrollPhysics(),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 2.0,
                ), itemBuilder: ((context, index) {
                return InkWell(
                  onTap: (){
                    Get.to(PhotoImageView(
image: galleryImage[index],
                    ));
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image.asset(galleryImage[index],fit: BoxFit.fitHeight,)),
                );
              })),
            ),
          
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}
