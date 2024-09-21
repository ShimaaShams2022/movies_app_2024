import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';
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
    return Column(
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
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset(getFullPathImage("FilmPlay.png")),
                        ImageIcon(
                          AssetImage(getFullPathImage("playButton.png")),
                          color: Colors.white,
                          size: 60,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.end ,

                      children: [
                        Text(
                          "Dora and the lost city of gold",
                          style: MyThemeData.darkTheme.textTheme.bodyLarge,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,

                          children: [
                            Text(
                              "2019",
                              style: MyThemeData.darkTheme.textTheme.bodyMedium,
                            ),
                            Text(
                              "PG-13",
                              style: MyThemeData.darkTheme.textTheme.bodyMedium,
                            ),
                            Text(
                              "2h 7m",
                              style: MyThemeData.darkTheme.textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
               imageWithBookMarkWidget(imageName: "posterFilm.png", addWatchList: false)
              ],
            ),

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
                Text("New Releases",style: MyThemeData.darkTheme.textTheme.titleSmall,
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(itemCount:imagesList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return Container(
                        padding: EdgeInsets.all(5),
                          child: imageWithBookMarkWidget(
                            imageName: imagesList[index],
                            addWatchList: false,));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8,bottom: 8),
          padding:EdgeInsets.all(10),
          color: MyThemeData.listBackground,
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Recommended",style: MyThemeData.darkTheme.textTheme.titleSmall,
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
    );
  }
}
