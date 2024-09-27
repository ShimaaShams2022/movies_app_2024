import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/utilities.dart';

class LoadingImage extends StatelessWidget {
   LoadingImage({required this.imageName,super.key});

  String? imageName;

  @override
  Widget build(BuildContext context) {
    if ( imageName != null){
     return SizedBox(
         height:80 ,
         width:120 ,
         child: Image.network('https://image.tmdb.org/t/p/w500$imageName',
       fit: BoxFit.fill,
     )
    );
    }
    else {
      return SizedBox(
          height:80 ,
          width:120 ,
          child: Image.asset(getFullPathImage("no_poster_available.jpg"),
          fit: BoxFit.fill,
          ),
      );
    }
  }
}
