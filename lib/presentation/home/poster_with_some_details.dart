import 'package:flutter/material.dart';
import 'package:movies_app_2024/data/api_model/Results.dart';
import 'package:movies_app_2024/presentation/basic_files/chech_adult.dart';
import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';
import 'package:movies_app_2024/presentation/basic_files/utilities.dart';
import 'package:movies_app_2024/presentation/home/network_poster_with_book_mark.dart';

class PosterWithSomeDetails extends StatelessWidget {
  PosterWithSomeDetails(
      {required this.filmInformation,
        super.key});


  Results filmInformation;



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyThemeData.posterDetailsBackground,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
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
              width:MediaQuery.of(context).size.width*0.22,
              height: MediaQuery.of(context).size.height*0.14,
              child: NetworkPosterWithBookmark(addWatchList:false , filmInformation: filmInformation ,)),
          Container(
            margin:const EdgeInsets.all(3) ,
            padding: const EdgeInsets.all(3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star,color: MyThemeData.darkPrimary,size: 12,),
                    Text(roundedNumber(filmInformation.voteAverage!), style: MyThemeData.darkTheme.textTheme.bodyMedium,),
                  ],
                ),
                Text(filmInformation.title??"",softWrap: true, style: MyThemeData.darkTheme.textTheme.bodyMedium,),
                Row(
                  children: [
                    Text(
                      splitYear(filmInformation.releaseDate??""),
                      style: MyThemeData.darkTheme.textTheme.bodySmall,
                    ),
                    SizedBox(width:MediaQuery.of(context).size.width*0.01,),
                    Text(
                      checkAdult(filmInformation.adult?? false),
                      style: MyThemeData.darkTheme.textTheme.bodySmall,
                    ),
                    SizedBox(width:MediaQuery.of(context).size.width*0.01,),
                    Text(
                      "2h 52m",
                      style: MyThemeData.darkTheme.textTheme.bodySmall,
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
