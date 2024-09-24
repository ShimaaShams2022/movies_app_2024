

import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/poster_with_play.dart';
import 'package:movies_app_2024/presentation/basic_files/utilities.dart';
import 'package:movies_app_2024/presentation/home/imagePosterWithBookMarkWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/api_model/Results.dart';
import '../home/home_screen.dart';
import '../home/imageWithBookMark.dart';
import 'movie_main_text.dart';

class PopularMoviesAdsWidget extends StatelessWidget {
   PopularMoviesAdsWidget(
       {super.key,required this.adsMovie});

   Results adsMovie;
  //AdsMovie adsMovie;
  @override
  Widget build(BuildContext context) {
    return
      Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Column(
            children: [
              Container(
                width: 400,
                height:200 ,
                child: Image.network('https://image.tmdb.org/t/p/w500${adsMovie.backdropPath}')
                //CachedNetworkImage(imageUrl:"https://api.themoviedb.org/3/movie/popular${adsMovie.posterPath}?api_key=d49838b72c2fc06981e4118b96840f7c"??"",scale: 1,)
                 // fit: BoxFit.cover ,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 5,),
                  MovieMainText(
                    adsMovie: adsMovie,
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal:15 ),
            child:  ImagePosterWithBookMarkWidget(
              imageName: adsMovie.posterPath ?? "",
              addWatchList: false,

            ),
          )
        ],
      );
  }
}
