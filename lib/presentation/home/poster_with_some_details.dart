import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';
import 'package:movies_app_2024/presentation/home/imageWithBookMark.dart';
import 'package:movies_app_2024/presentation/home/networkPosterWithBookMark.dart';

class PosterWithSomeDetails extends StatelessWidget {
  PosterWithSomeDetails(
      {required this.imageName,
        required this.addWatchList,
        super.key});

  String? imageName;
  bool addWatchList=false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyThemeData.posterDetailsBackground,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius:1,
            blurRadius: 3,
            offset: Offset.zero, // changes position of shadow
          ),
        ],

      ),
      margin: EdgeInsets.all(8),

      child: Column(
        children: [
          SizedBox(
              width: 100,
              height: 120,
              child: NetworkPosterWithBookmark(imageName: imageName, addWatchList: addWatchList)),
          Container(
            margin:EdgeInsets.all(3) ,
            padding: EdgeInsets.all(3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.star,color: MyThemeData.darkPrimary,size: 12,),
                    Text("7.7"),
                  ],
                ),
                Text("Narcos"),
                Row(
                  children: [
                    Text(
                      "2018",
                      style: MyThemeData.darkTheme.textTheme.bodyMedium,
                    ),
                    Text(
                      "R",
                      style: MyThemeData.darkTheme.textTheme.bodyMedium,
                    ),
                    Text(
                      "1h 59m",
                      style: MyThemeData.darkTheme.textTheme.bodyMedium,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
