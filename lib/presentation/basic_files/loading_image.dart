import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/utilities.dart';

class LoadingImage extends StatelessWidget {
   LoadingImage({required this.imageName,required this.width,required this.height,super.key});

  String? imageName;
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    if ( imageName != null){
     return SizedBox(
         height:height ,
         width:width ,
         child: Image.network('https://image.tmdb.org/t/p/w500$imageName',
       fit: BoxFit.fill,
     )
    );
    }
    else {
      return SizedBox(
          height:height ,
          width:width ,
          child: Image.asset(getFullPathImage("no_poster_available.jpg"),
          fit: BoxFit.fill,
          ),
      );
    }
  }
}
