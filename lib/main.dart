import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/default_screen.dart';
import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';
import 'package:movies_app_2024/presentation/categories_screen/categories_screen.dart';
import 'package:movies_app_2024/presentation/home/home_screen.dart';
import 'package:movies_app_2024/presentation/movie_details/movie_details_widget.dart';
import 'package:movies_app_2024/presentation/search_screen/search_screen.dart';
import 'package:movies_app_2024/presentation/watch_list_screen/watch_list_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:DefaultScreen.routeName,
        routes: {
          DefaultScreen.routeName: (_) => DefaultScreen(),
          CategoriesScreen.routeName: (_) => CategoriesScreen(),
          HomeScreen.routeName: (_) => HomeScreen(),
          SearchScreen.routeName: (_) => SearchScreen(),
          WatchListScreen.routeName: (_) => WatchListScreen(),
          MovieDetailsWidget.routeName: (_) => MovieDetailsWidget()
        },
        theme: MyThemeData.darkTheme,
    );
  }
}
