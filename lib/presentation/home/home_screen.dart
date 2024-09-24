import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_2024/presentation/basic_files/ErrorStateWidget.dart';
import 'package:movies_app_2024/presentation/basic_files/loading_widget.dart';
import 'package:movies_app_2024/presentation/basic_files/movie_main_text.dart';
import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';
import 'package:movies_app_2024/presentation/basic_files/poster_with_play.dart';
import 'package:movies_app_2024/presentation/home/home_view_model.dart';
import 'package:movies_app_2024/presentation/home/imageWithBookMark.dart';
import 'package:movies_app_2024/presentation/home/poster_with_some_details.dart';

import '../basic_files/custom_ads_widget.dart';
import '../basic_files/utilities.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imagesList=[
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png",
    "posterSmall.png"
  ];

  int _currentIndex = 0;
  late Timer _timer;


  // final List<AdsMovie> ads = [
  //   AdsMovie(movieYear:"2019",imageName: 'FilmPlay.png', adult: 'PG-13', movieDuration: '2h 7m', movieName: 'Dora and the lost city', posterName: 'posterFilm.png'),
  //   AdsMovie(movieYear:"2020",imageName: 'categoryImage.png', adult: '+18', movieDuration: '1h 45m', movieName: 'the New Movie', posterName: 'categoryImage.png'),
  //   AdsMovie(movieYear:"2018",imageName: 'searchResultImage.png', adult: 'PG-13', movieDuration: '2h 7m', movieName: 'Dora and the lost city', posterName: 'searchResultImage.png'),
  //   AdsMovie(movieYear:"2023",imageName: 'categoryImage.png', adult: '+18', movieDuration: '1h 5m', movieName: 'Film new castle', posterName: 'categoryImage.png'),
  // ];


  @override
  void initState() {
    super.initState();
    _startImageSwitching();
    viewModel.loadHomeScreen();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  var viewModel=HomeViewModel();


  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeViewModel>(
      create: (context)=>viewModel,
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<HomeViewModel,HomeState>(
              builder: (context,state){
                switch(state) {
                  case LoadingState():
                    return LoadingStateWidget();
                  case SuccessState():{
                    var ads=state.movieResults ??[];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),
                        CustomAdsWidget( popularResults: ads, currentIndex: _currentIndex, timer: _timer,),
                      ],
                    );
                  }
                  case ErrorState():
                    return ErrorStateWidget(state.exception);
                }

              },

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
      ),
    );
  }
}

class AdsMovie{
  String? imageName;
  String? posterName;
  String? movieName;
  String? adult;
  String? movieDuration;
  String? movieYear;

  AdsMovie( {required this.movieYear,required this.imageName,required this.adult,required this.movieDuration,required this.movieName,required this.posterName});
}