import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/utilities.dart';
import 'package:movies_app_2024/presentation/movie_details/movie_details_widget.dart';

import '../basic_files/my_theme/my_theme_data.dart';

class ImageWithBookMarkWidget extends StatelessWidget {
   ImageWithBookMarkWidget(
       {
         required this.imageName,
         required this.addWatchList,
         super.key});

  String imageName;
  bool addWatchList=false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, MovieDetailsWidget.routeName);
          },
            child: Image.asset(getFullPathImage(imageName))
        ),
        const Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Icon(Icons.bookmark,color: MyThemeData.bookMarkBackground,size: 30),
            Icon(Icons.add, color: Colors.white, size: 10,
            )
          ],
        ),
      ],
    );
  }
}
