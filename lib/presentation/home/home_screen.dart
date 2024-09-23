import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/movie_main_text.dart';
import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';
import 'package:movies_app_2024/presentation/basic_files/poster_with_play.dart';
import 'package:movies_app_2024/presentation/home/imageWithBookMark.dart';
import 'package:movies_app_2024/presentation/home/poster_with_some_details.dart';

import '../basic_files/utilities.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  List imagesList=[
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png"
  ];

  static const String routeName = "HomeScreen";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Column(
                    children: [
                      PosterWithPlay(imageName: "FilmPlay.png"),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 5,),
                          MovieMainText(),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 15,horizontal:15 ),
                   child: ImageWithBookMarkWidget(imageName: "posterFilm.png", addWatchList: false),
                 )
                ],
              ),
      
            ],
          ),
      
          Container(
            margin: EdgeInsets.only(top: 8,bottom: 8),
            padding:EdgeInsets.all(10),
            color: MyThemeData.listBackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("New Releases",style: MyThemeData.darkTheme.textTheme.titleSmall,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 150,
                        child: ListView.builder(itemCount:imagesList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return Container(
                              padding: EdgeInsets.all(5),
                                child: ImageWithBookMarkWidget(
                                  imageName: imagesList[index],
                                  addWatchList: false,));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8,bottom: 8),
            padding:EdgeInsets.all(10),
            color: MyThemeData.listBackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Recommended",style: MyThemeData.darkTheme.textTheme.titleSmall,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        child: ListView.builder(itemCount:imagesList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return PosterWithSomeDetails(imageName: imagesList[index],addWatchList: false,);
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
