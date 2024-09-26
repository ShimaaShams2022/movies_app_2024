import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/utilities.dart';
import 'package:movies_app_2024/presentation/movie_details/movie_details_widget.dart';

import '../basic_files/my_theme/my_theme_data.dart';

class NetworkPosterWithBookmark extends StatelessWidget {
  NetworkPosterWithBookmark(
       {
         required this.imageName,
         required this.addWatchList,
         super.key});

  String? imageName;
  bool? addWatchList=false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, MovieDetailsWidget.routeName);
          },
            child:  Image.network('https://image.tmdb.org/t/p/w500${imageName}',
              width: 100,
              fit: BoxFit.fill,

            )
        ),
        Positioned(
          top:-5,
          left: -8,
          child: const Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Opacity(
                opacity:0.8,
                  child: Icon(Icons.bookmark,color: MyThemeData.bookMarkBackground,size:40)),
              Icon(Icons.add, color: Colors.white, size: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
