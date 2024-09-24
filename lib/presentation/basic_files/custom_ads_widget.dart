import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movies_app_2024/data/api_model/Results.dart';
import 'package:movies_app_2024/data/api_model/popular_movies/popular_response.dart';
import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';
import 'package:movies_app_2024/presentation/basic_files/popular_movies_ads_widget.dart';
import 'package:movies_app_2024/presentation/home/home_screen.dart';

import '../home/imageWithBookMark.dart';
import 'movie_main_text.dart';

class CustomAdsWidget extends StatelessWidget {
  List<Results> popularResults;
  //final List<AdsMovie> ads;
  final int currentIndex;
  final Timer timer;

   CustomAdsWidget(
       {required this.popularResults,
    super.key,
   // required this.ads,
    required this.currentIndex,
    required this.timer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 2500),
            child:PopularMoviesAdsWidget(adsMovie: popularResults[currentIndex],
              key:  ValueKey<int>(currentIndex),)
          ),
        ],
      ),
    );
  }
}
