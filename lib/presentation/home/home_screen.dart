import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_2024/di.dart';
import 'package:movies_app_2024/presentation/basic_files/ErrorStateWidget.dart';
import 'package:movies_app_2024/presentation/basic_files/loading_widget.dart';

import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';

import 'package:movies_app_2024/presentation/home/home_view_model.dart';
import 'package:movies_app_2024/presentation/home/imageWithBookMark.dart';
import 'package:movies_app_2024/presentation/home/poster_with_some_details.dart';

import '../basic_files/custom_ads_widget.dart';


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



  @override
  void initState() {
    super.initState();
    _startImageSwitching(10);
    viewModel.loadHomeScreen();
  }

void _startImageSwitching(int lengthOfList) {

    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % lengthOfList;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

//field injection
  var viewModel=getIt.get<HomeViewModel>();


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
                        SizedBox(height:MediaQuery.of(context).size.height*0.04),
                        CustomAdsWidget( popularResults: ads, currentIndex: _currentIndex, timer: _timer,),
                      ],
                    );
                  }
                  case ErrorState():
                    return ErrorStateWidget(state.exception);
                }

              },

            ),
            SizedBox(height:MediaQuery.of(context).size.height*0.01),
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
                        child: SizedBox(
                          height: 150,
                          child: ListView.builder(itemCount:imagesList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return Padding(
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
                        child: SizedBox(
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

