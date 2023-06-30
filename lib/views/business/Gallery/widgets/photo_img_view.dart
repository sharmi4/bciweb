import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';



class PhotoImageView extends StatefulWidget {
  String image;
   PhotoImageView({super.key,required this.image});

  @override
  State<PhotoImageView> createState() => _PhotoImageViewState();
}

class _PhotoImageViewState extends State<PhotoImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView(
      imageProvider: AssetImage(widget.image),
    ),
    );
  }
  
}



