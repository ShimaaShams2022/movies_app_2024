import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_2024/presentation/basic_files/box_movie_type.dart';
import 'package:movies_app_2024/presentation/basic_files/movie_main_text_large.dart';
import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';
import 'package:movies_app_2024/presentation/basic_files/poster_with_play.dart';
import 'package:movies_app_2024/presentation/basic_files/utilities.dart';
import 'package:movies_app_2024/presentation/home/image_with_book_mark_widget.dart';
import 'package:movies_app_2024/presentation/home/network_poster_with_book_mark.dart';
import 'package:movies_app_2024/presentation/home/popular_poster_with_book_mark_widget.dart';

import 'package:movies_app_2024/presentation/movie_details/similar_view_model.dart';

import '../../data/api_model/Results.dart';
import '../../di.dart';
import '../basic_files/ErrorStateWidget.dart';
import '../basic_files/loading_widget.dart';
import '../home/poster_with_some_details.dart';

class MovieDetailsWidget extends StatefulWidget {
   MovieDetailsWidget({super.key});

  static const String routeName = "MovieDetailsWidget";

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  List imagesList=[
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


//field injection
  var similarViewModel = getIt.get<SimilarViewModel>();

  @override
  Widget build(BuildContext context) {
    final Results? filmInformation=ModalRoute.of(context)?.settings.arguments as Results?;
    similarViewModel.loadSimilarHomeScreen((filmInformation?.id).toString());
    return BlocProvider(
      create: (BuildContext context) =>similarViewModel ,
      child: Scaffold(
        appBar: AppBar(
          title: Text(filmInformation?.title??"",style: MyThemeData.darkTheme.textTheme.titleLarge,),
            backgroundColor: MyThemeData.appbarBackground,
            iconTheme: IconThemeData(color: Colors.white)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network('https://image.tmdb.org/t/p/w500${filmInformation!.backdropPath}'),
              MovieMainTextLarge(filmInformation),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 PopularPosterWithBookMarkWidget(addWatchList: false, imageName:filmInformation.posterPath??"",),
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
                         filmInformation.overview??"",
                          softWrap: true,
                          style: MyThemeData.darkTheme.textTheme.bodyLarge,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Icon(Icons.star,color: MyThemeData.darkPrimary,size: 25,),
                            Text(roundedNumber(filmInformation.voteAverage??0), style: MyThemeData.darkTheme.textTheme.titleMedium),
                          ],
                        ),
                      )
                    ],
          
                  )
                ],
              ),
              BlocBuilder<SimilarViewModel, SimilarHomeState>(
                builder: (context, state) {
                  switch (state) {
                    case SimilarLoadingState():
                      return LoadingStateWidget();
                    case SimilarSuccessState():
                      {
                        var similarMoviesList = state.movieResults ?? [];
                        return Container(
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
                                  child: ListView.builder(itemCount:similarMoviesList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context,index){
                                      return PosterWithSomeDetails(
                                          filmInformation:similarMoviesList[index]);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    case SimilarErrorState():
                      return ErrorStateWidget(state.exception);
                  }
                },
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
