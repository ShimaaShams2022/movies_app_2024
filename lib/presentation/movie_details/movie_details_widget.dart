import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/box_movie_type.dart';
import 'package:movies_app_2024/presentation/basic_files/movie_main_text.dart';
import 'package:movies_app_2024/presentation/basic_files/movie_main_text_large.dart';
import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';
import 'package:movies_app_2024/presentation/basic_files/poster_with_play.dart';
import 'package:movies_app_2024/presentation/home/imageWithBookMark.dart';

import '../home/poster_with_some_details.dart';

class MovieDetailsWidget extends StatelessWidget {
   MovieDetailsWidget({super.key});

  List imagesList=[
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png"
  ];

  static const String routeName = "MovieDetailsWidget";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: MyThemeData.appbarBackground,
          iconTheme: IconThemeData(color: Colors.white)),
      body: Column(
        children: [
          PosterWithPlay(imageName: "FilmPlay.png"),
          MovieMainTextLarge(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageWithBookMarkWidget(
                  imageName: "posterFilm.png", addWatchList: false),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BoxMovieType(),
                      BoxMovieType(),
                      BoxMovieType(),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    width: 250,
                    child: Text(
                      "Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school. ",
                      softWrap: true,
                      style: MyThemeData.darkTheme.textTheme.bodyLarge,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(Icons.star,color: MyThemeData.darkPrimary,size: 25,),
                        Text("7.7", style: MyThemeData.darkTheme.textTheme.titleMedium),
                      ],
                    ),
                  )
                ],

              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8,bottom: 8),
            padding:EdgeInsets.all(10),
            color: MyThemeData.listBackground,
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("More Like This",style: MyThemeData.darkTheme.textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 210,
                    child: ListView.builder(itemCount:imagesList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return PosterWithSomeDetails(imageName: imagesList[index],addWatchList: false,);
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
