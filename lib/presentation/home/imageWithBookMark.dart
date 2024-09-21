import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/utilities.dart';

import '../basic_files/my_theme/my_theme_data.dart';

class imageWithBookMarkWidget extends StatelessWidget {
   imageWithBookMarkWidget(
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
        Image.asset(getFullPathImage(imageName)),
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
