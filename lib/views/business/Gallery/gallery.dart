import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/views/business/Gallery/widgets/photo_img_view.dart';
import 'package:bciweb/views/business/Gallery/widgets/stagerdgridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../../../registerhomescreen/common_reg_appbar';
import '../../../registerhomescreen/common_reg_bottom.dart';
import '../../../registerhomescreen/common_reg_homescreen.dart';
import '../../members/common_widget/common.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonScreen(),
              RegisterCommonContainer(),
            ],
          ), preferredSize:const Size(double.infinity, 110)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //RegisterCommonContainer(),
            ksizedbox40,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: galleryImage.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 2.0,
                  ),
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(PhotoImageView(
                          image: galleryImage[index],
                        ));
                      },
                      child: Container(
                          height: 100,
                          width: 200,
                          child: Image.asset(
                            galleryImage[index],
                            fit: BoxFit.fitHeight,
                          )),
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
